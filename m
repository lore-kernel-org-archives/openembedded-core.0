Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D31EE9A04F
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1406.1771440093880767134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aWO0atgv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q+Zu8BA1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720efb38-0e0ae483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7dTdg1tl74mRx0Cj4EA42/YsJgjbROFqdfcZ1BPNEh0=;
	b=aWO0atgvhiPv1CpYyIRDKuS3+3AUCm7mMNau2mH6fckc4Fhxm1/eOv+wZUQ5stOL
	zvfJuDByvAVwCXfnHaAeWybMgUHFqpGdgr3vsyhx1kLUOXGx+tAc9MNxaba9ryz6Io3
	vQ6CO0EOQpafLUHyF3MwU18oxo2FiH3a7iVxYC8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7dTdg1tl74mRx0Cj4EA42/YsJgjbROFqdfcZ1BPNEh0=;
	b=Q+Zu8BA1JlnMq1EGT4xatjcYjK6kgn4qtfrgUah0ot42chhAA4KGQEZWA/YiemyS
	8L1uZ7RC+Q70GHyRZA+2yo6l5rNOrowZBxOvw70e3NOTaqqguWIkmcQexpEPWzbUiAK
	MveaHC15kRkrG514ZBmSmDCDzx5GrtSGNFsyb7+Y=
Content-Type: multipart/mixed; boundary="===============0757124602169970099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.20.3 SUCCEEDED
Message-ID: <0101019c720efb38-0e0ae483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231383

--===============0757124602169970099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.2-4.20.3.patch
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
From f3186e74cffb87dff7cc3e8db08e19a9484ba2dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:57:44 +0000
Subject: [PATCH] gtk4: upgrade 4.20.2 -> 4.20.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index 92791db169..ef9a05f7fe 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============0757124602169970099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============0757124602169970099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2000.2", added "/usr/lib/.debug/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 73475656 to 73512320 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23794509 to 23802810 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 121534 to 122638 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGSIZE changed from 113168 to 115169 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 122561 to 122565 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGSIZE changed from 115522 to 121144 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 141246 to 148230 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.20.2/gtk/media -> /usr/src/debug/gtk4/4.20.3/gtk/media, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.20.3/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/x11 -> /usr/src/debug/gtk4/4.20.3/gdk/x11, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/timsort -> /usr/src/debug/gtk4/4.20.3/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/css -> /usr/src/debug/gtk4/4.20.3/gtk/css, directory renamed /usr/src/debug/gtk4/4.20.2/testsuite/reftests -> /usr/src/debug/gtk4/4.20.3/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.20.2/gtk -> /usr/src/debug/gtk4/4.20.3/gtk, directory renamed /usr/src/debug/gtk4/4.20.2/tools -> /usr/src/debug/gtk4/4.20.3/tools, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/loaders -> /usr/src/debug/gtk4/4.20.3/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print -> /usr/src/de
 bug/gtk4/4.20.3/gtk/print, directory renamed /usr/src/debug/gtk4/4.20.2/gsk -> /usr/src/debug/gtk4/4.20.3/gsk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/inspector -> /usr/src/debug/gtk4/4.20.3/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y -> /usr/src/debug/gtk4/4.20.3/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/deprecated -> /usr/src/debug/gtk4/4.20.3/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/deprecated -> /usr/src/debug/gtk4/4.20.3/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu -> /usr/src/debug/gtk4/4.20.3/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.20.2/gdk -> /usr/src/debug/gtk4/4.20.3/gdk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/roaring -> /usr/src/debug/gtk4/4.20.3/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gl -> /usr/src/debug/gtk4/4.20.3/gsk/gl, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print/backends -> /usr/src/debug/gtk4/4.20.3/gtk/print/backen
 ds, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.20.3/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/wayland -> /usr/src/debug/gtk4/4.20.3/gdk/wayland
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 48648202 to 48660513 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 18779030 to 18833598 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.2.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.3.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============0757124602169970099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0fac39723ba2c35fd2062ea0fa5ee78f7c82e77c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:0fac39723ba2c35fd2062ea0fa5ee78f7c82e77c"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 966 Local 672 Mirrors 0 Missed 294 Current 464 (69% match, 79% complete)
done.
Removing 11 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 468 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 469 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 490 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 492 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 512 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 565 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 600 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 612 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 624 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 659 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 680 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 687 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_recipe_qa_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 700 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 736 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.93.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 804 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 807 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 809 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 819 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.93.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 834 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 862 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 864 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 888 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-native-3.24.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 890 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 918 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 921 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 929 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-native-3.24.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 959 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.93.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 966 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 969 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 980 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 982 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 993 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 996 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1000 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1005 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1020 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-native-2.58.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1022 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1024 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1031 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1039 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1040 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1059 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-native-2.58.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1062 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1067 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1070 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1077 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1079 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe icu-78.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1081 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1086 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1088 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1089 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1103 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1104 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1107 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1430 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1112 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1123 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1126 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1131 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-native-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1138 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-native-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1142 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1145 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1146 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1148 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1150 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1161 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1164 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1168 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1172 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package_setscene)
NOTE: Running setscene task 1173 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1174 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1177 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1178 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1179 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1185 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1186 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1191 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1192 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1195 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1199 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1200 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1203 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1207 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1209 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1214 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1216 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1217 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1219 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1220 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1226 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1229 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1230 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1232 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1234 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1236 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1238 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running task 970 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1010 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1012 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_fetch)
NOTE: Running task 1015 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1239 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1059 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: Running task 1075 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1094 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Started
NOTE: Running task 1100 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_fetch: Started
NOTE: Running task 1106 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_write_config)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_package_setscene: Started
NOTE: Running task 1107 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_fetch: Succeeded
NOTE: Running task 1108 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1109 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_unpack)
NOTE: Running task 1111 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: Running task 1112 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: Running task 1126 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: Running task 1143 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1244 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_write_config: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: Running setscene task 1245 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1246 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1247 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: Running setscene task 1248 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1249 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1250 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1252 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1253 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1150 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1152 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running setscene task 1258 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1260 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 1263 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running task 1221 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_patch)
NOTE: Running task 1229 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1265 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1267 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1268 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1269 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1270 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1271 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1272 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1254 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1258 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: Running task 1259 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa)
NOTE: Running task 1262 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: recipe freetype-2.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_unpack)
NOTE: Running task 1264 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe freetype-2.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: Running setscene task 1275 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1265 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1277 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1279 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1268 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running setscene task 1280 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_package_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1269 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1271 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1273 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.54-r0: task do_package_setscene: Started
NOTE: Running task 1280 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 1286 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: Running task 1297 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 1299 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe freetype-2.14.1-r0: task do_fetch: Started
NOTE: recipe freetype-2.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_unpack)
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1303 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_fetch)
NOTE: recipe freetype-2.14.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch unihash changed to 6a4475f06882380a44febcabc2ca80e2943490ce4efa213da59b705b22ec2f64
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1df1ec2229889134f06f2b01e7573c9abd696cb88199b6b4afe253101f054656', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 1df1ec2229889134f06f2b01e7573c9abd696cb88199b6b4afe253101f054656 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '87fe81179129e38bdbeaf70562201839c569ced27079f68185e6a5c85a431916', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 87fe81179129e38bdbeaf70562201839c569ced27079f68185e6a5c85a431916 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch unihash changed to 77c11bfabcbdeab15657e3932df82c21aec1592b1dc9af3c7f4a48af2468cbd5
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f3edd0f8bdb1c9e3440adbdae0ecbe808df4df52db7808b350023648689c9a00', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed f3edd0f8bdb1c9e3440adbdae0ecbe808df4df52db7808b350023648689c9a00 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '30659e5bb025d2e3b7d733377465191ed320fb662b43b07dad1e36e70447ac76', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 30659e5bb025d2e3b7d733377465191ed320fb662b43b07dad1e36e70447ac76 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1235 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1314 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: Running task 1331 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: Running task 1334 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running task 1335 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: Running task 1336 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: Running task 1345 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: Running task 1357 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: Running task 1361 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa)
NOTE: Running task 1391 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1419 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_fetch)
NOTE: Running task 1425 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_fetch)
NOTE: recipe libpng-1.6.54-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: Running task 1426 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpng-1.6.54-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1282 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1429 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1431 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: Running task 1433 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa)
NOTE: Running setscene task 1283 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpng-1.6.54-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_fetch: Started
NOTE: Running setscene task 1284 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1285 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1286 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1287 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1288 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1292 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1437 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1438 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: Running task 1448 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-setuptools/80.9.0/temp/log.do_packagedata_setscene.1076996
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1293 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1294 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1296 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1299 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1300 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1301 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1303 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch unihash changed to 4f87b95c7a8ad4b919a32427c5c185814d24cbb2811eb8ef8144c7d471e28818
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '99dd6e99f5aca68e2badcb8f1da8e131be45a03f33bc4e6fddb306c415fca088', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 99dd6e99f5aca68e2badcb8f1da8e131be45a03f33bc4e6fddb306c415fca088 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ea070c09638cbffd92c74c7083fd5478297e7427dd2023641ad4e0c83d098940', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed ea070c09638cbffd92c74c7083fd5478297e7427dd2023641ad4e0c83d098940 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1252 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1253 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1254 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1265 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1266 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1268 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1293 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: Running task 1461 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: recipe libpng-1.6.54-r0: task do_fetch: Succeeded
NOTE: Running task 1462 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_unpack)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1473 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 1474 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1477 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_unpack: Started
NOTE: Running task 1489 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_unpack: Succeeded
NOTE: Running task 1492 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1498 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: Running task 1504 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: Running task 1505 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: Running setscene task 1324 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 1325 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1326 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1327 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch unihash changed to a6396debd7fb3fbdf8532a8d3ecee0ca7de077650671e6aa00cecf8b2e8506b0
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9e6cdf5978d755f883281fd870f8ffbae520d9ca1aa15acba1fe9153c5d964b7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 9e6cdf5978d755f883281fd870f8ffbae520d9ca1aa15acba1fe9153c5d964b7 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7864f3422f2edefd4142e316a63df5bb57f81ceac91ccb839f1d04697962dda5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 7864f3422f2edefd4142e316a63df5bb57f81ceac91ccb839f1d04697962dda5 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1300 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '503b5e27562be514789cea0171f31db93f72b1399301dcef9335e332d9267ab5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 503b5e27562be514789cea0171f31db93f72b1399301dcef9335e332d9267ab5 -> c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '00f45aeb23250954394575c8c57389602cd00ae6f0d802b1716bccacc9b2b65a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 00f45aeb23250954394575c8c57389602cd00ae6f0d802b1716bccacc9b2b65a -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'cc9d206dc7ba843fb32dbed0ab2d2d27a1d8164eb3cd51d0fd61a0941c9af340', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed cc9d206dc7ba843fb32dbed0ab2d2d27a1d8164eb3cd51d0fd61a0941c9af340 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1297 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1292 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1293 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1298 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1300 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1304 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1306 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1313 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1315 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1316 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1318 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1333 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1340 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1341 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1348 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1356 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1358 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1366 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1368 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1379 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1380 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1382 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1538 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: Running task 1541 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1543 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1545 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1551 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1556 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1386 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1387 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1389 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1390 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1582 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: Running task 1583 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1650 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1651 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: Running setscene task 1392 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: Running setscene task 1394 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1657 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_unpack)
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1660 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_unpack)
NOTE: Running setscene task 1395 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.0-r0: task do_recipe_qa: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1397 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a7fa36fb2668fefb60fc31426dc12ade116e6d55f07ab5a99a46e2138508c2f1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed a7fa36fb2668fefb60fc31426dc12ade116e6d55f07ab5a99a46e2138508c2f1 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5248d4ab3d7087963b29b08129ed312ae7f789de42f1e5017c9860bcd360e0dc', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 5248d4ab3d7087963b29b08129ed312ae7f789de42f1e5017c9860bcd360e0dc -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_26.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch unihash changed to 66162152275d4d00e1507c398cfb40a19256a828e574051913476ae0a30aa314
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5e403bff255d860d474b32fd3ba72b2fd9bc65ce1eddf679dbe572b76682b4a8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 5e403bff255d860d474b32fd3ba72b2fd9bc65ce1eddf679dbe572b76682b4a8 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c97864ce658bb2fca329a113430b4711250c236bfe2e11ea87b22c5560941e64', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed c97864ce658bb2fca329a113430b4711250c236bfe2e11ea87b22c5560941e64 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1371 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1382 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1671 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: Running task 1672 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_unpack)
NOTE: Running task 1673 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: Running task 1674 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1675 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_patch)
NOTE: Running task 1676 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_patch)
NOTE: Running task 1677 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 1678 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Running task 1683 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1712 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 1762 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_patch: Succeeded
NOTE: Running task 1765 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1769 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1775 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1784 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1404 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1785 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1786 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1787 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: Running task 1788 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: Running setscene task 1406 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: Running task 1789 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1790 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1791 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1792 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1793 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: Running task 1794 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 1409 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1410 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1411 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch unihash changed to 8479bb1972e513200c6209bd0a25590133fdf26dc9d3921b11b55a26f01c9cad
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '461fbca45ce34239a7710b60a77d0793971d53dab19e4f75ac50adf71140ba01', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 461fbca45ce34239a7710b60a77d0793971d53dab19e4f75ac50adf71140ba01 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '83ed14ed52cbb4c71dee73460d8e7f3dae8ac3337d090dd30ffa05c07a2e317f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 83ed14ed52cbb4c71dee73460d8e7f3dae8ac3337d090dd30ffa05c07a2e317f -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: Running setscene task 1378 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1384 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1386 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1387 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running task 1809 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_unpack)
NOTE: Running task 1810 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_patch)
NOTE: Running task 1811 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Running task 1817 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: Running task 1818 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch)
NOTE: Running task 1819 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_write_config)
NOTE: Running task 1823 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1824 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_write_config)
NOTE: Running task 1825 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1826 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1844 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.131-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1866 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1867 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1427 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1428 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1868 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Started
NOTE: Running task 1870 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1890 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_generate_toolchain_file)
NOTE: Running task 1891 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libdrm-2.4.131-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_deploy_source_date_epoch unihash changed to 7a777afe2b2bd2ec4761efac747a1fff1264ccf631ba01527187b017f3332641
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '149e26e68b45c546c64b43dcb23ed6230f828e3ebcde9abfa67dd35c959931d5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 149e26e68b45c546c64b43dcb23ed6230f828e3ebcde9abfa67dd35c959931d5 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'e6765cf105a0e53b37072973794433dcbc7aa0241d9641bd93e285c7e6b35f29', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed e6765cf105a0e53b37072973794433dcbc7aa0241d9641bd93e285c7e6b35f29 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 81de8e60a1bf2846df8c4c458d533515b1a6589dc61c6b298c0be1d3418b4ebb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch unihash changed to a2ac6d6f10409de31aa12966f1d633a87337dc428638fb96e18bbb0f0577e93f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch unihash changed to 259e1a68594b203d41d05858b12399825ddf0278e969b5b5c970186445d2322c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3fa1cdc5ace1a201a59d0702b25e3ea4b69ddaf16479c67b7ac567465112c0ce', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 3fa1cdc5ace1a201a59d0702b25e3ea4b69ddaf16479c67b7ac567465112c0ce -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '07647331855bed073ec918c1d7c41448359426b61013981e6537830216563340', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 07647331855bed073ec918c1d7c41448359426b61013981e6537830216563340 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2203 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2204 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2205 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2253 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2271 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_patch)
NOTE: Running task 2322 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2324 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2326 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2333 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2341 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2345 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_patch: Started
NOTE: Running task 2355 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2359 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2367 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2369 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_configure)
NOTE: recipe mesa-2_26.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_generate_toolchain_file)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: Running task 2373 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: Running task 2386 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: Running task 2388 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: Running task 2389 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2390 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2391 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: Running task 2392 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: Running task 2394 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 2395 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: Running task 2396 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2397 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: Running task 2399 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_compile)
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_install)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_install: Succeeded
NOTE: Running task 2401 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2409 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2412 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_patch: Succeeded
NOTE: Running task 2414 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: Running task 2513 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2515 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2518 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 2530 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.46-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_fetch: Succeeded
NOTE: Running task 2533 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 2534 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: Running task 2536 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2538 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2539 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 2540 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to c6da990740b278d4e71e1b61d28976c22527c9e6c0436def79f58ecb2686c7ef
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2cfe9e16acd1616203e9a0f93649c26a4a0eba9f29d76b37eb34e99499279d18', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 2cfe9e16acd1616203e9a0f93649c26a4a0eba9f29d76b37eb34e99499279d18 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0177aa320ed9b8fb5d6d6dc6d123b2339e166c0f87e3622e75c2359195cb1385', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 0177aa320ed9b8fb5d6d6dc6d123b2339e166c0f87e3622e75c2359195cb1385 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2541 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: Running task 2542 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: Running task 2543 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2544 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: Running task 2576 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2577 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2578 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2579 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot unihash changed to f8c922af7a0b132e51bb5451d4bfcbbd5d8dac597c6d5154d304ee812d46e505
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5b9a3eb185b6980ada585b6d187282fadf6d4bb265a3a3403eaf2e3bb96fc7b8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 5b9a3eb185b6980ada585b6d187282fadf6d4bb265a3a3403eaf2e3bb96fc7b8 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '80e4d1a1ce0ce66b57302781ef46e72c9239ae93aef47f867612d592c09c8863', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 80e4d1a1ce0ce66b57302781ef46e72c9239ae93aef47f867612d592c09c8863 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libdrm-2.4.131-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2580 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: Running task 2581 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot)
NOTE: Running task 2582 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: Running task 2583 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_configure)
NOTE: Running task 2584 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_configure_ptest_base)
NOTE: Running task 2610 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2622 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2623 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile)
NOTE: recipe xkeyboard-config-2.46-r0: task do_unpack: Succeeded
NOTE: Running task 2627 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2628 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure)
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot unihash changed to 71e2234b5937c9bcffea080db935067d577890738f98039944b64eafb40f3772
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7ad888a20a4349523ae9a6a8964ed912151e0701e8680b1a9855037952fd2c31', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 7ad888a20a4349523ae9a6a8964ed912151e0701e8680b1a9855037952fd2c31 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '002ef822091dbb65c1775fadac75725130bcd39cb1022ff439202b63b1409d27', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 002ef822091dbb65c1775fadac75725130bcd39cb1022ff439202b63b1409d27 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2629 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_patch)
NOTE: Running task 2632 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_patch: Succeeded
NOTE: Running task 2633 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2634 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2635 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: Running task 2636 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2638 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: Running task 2639 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: recipe mesa-2_26.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 2640 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2642 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2643 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe mesa-2_26.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2654 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe mesa-2_26.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2657 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 2658 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe mesa-2_26.0.0-r0: task do_write_config: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_write_config: Succeeded
NOTE: Running task 2660 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.131-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: Running task 2661 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2662 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: Running task 2665 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: Running task 2666 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch unihash changed to eacb331d9d5e419a6a0e22481adfd54328191ccc169530c082682382abd64f0f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '219e050a405e9cf291918054072eab4628e8f6fa2df6e0506a54249efd812ba6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 219e050a405e9cf291918054072eab4628e8f6fa2df6e0506a54249efd812ba6 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'aed4fcefa57b8feb4e802cde2cc5db86d167f4e72a00dead65a4329ce5eb7402', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed aed4fcefa57b8feb4e802cde2cc5db86d167f4e72a00dead65a4329ce5eb7402 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2667 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_configure)
NOTE: Running task 2668 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: Running task 2669 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: Running task 2670 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: Running task 2671 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: Running task 2672 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: Running task 2673 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: Running task 2674 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 2677 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2678 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 2679 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot unihash changed to ac3c01ab18b5f6ecd7944656be51921461c9bb4bdc515eac245864142fae2136
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '28d6abbb99a75908b9b0b6bf54f0401cc10013b026a156cb11513425126fba47', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 28d6abbb99a75908b9b0b6bf54f0401cc10013b026a156cb11513425126fba47 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9f78710133ba40500317085b2b6ff33f5b6b629f9b6d35e166273e6a243039d3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9f78710133ba40500317085b2b6ff33f5b6b629f9b6d35e166273e6a243039d3 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_compile: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2680 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: Running task 2681 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: Running task 2682 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_install)
NOTE: Running task 2683 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2684 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2685 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2686 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: Running task 2687 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2688 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2689 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: Running task 2691 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package: Succeeded
NOTE: Running task 2692 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot unihash changed to a28942f508517383a0cdf41c5ebb19544c48f11470fd4ad670ad14f23d644be6
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_install: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package unihash changed to 44f4e71923a3ffd21c67d0aa962b0e065eb0334090bf9abc39aeff36dc7bacbe
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2a363952f3affa4ac2633786c56cd66cd29a585e030e4e55ff840bd38119772d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 2a363952f3affa4ac2633786c56cd66cd29a585e030e4e55ff840bd38119772d -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 1423 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running task 2694 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2695 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_compile)
NOTE: Running task 2696 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot)
NOTE: Running task 2697 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2698 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2699 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata)
NOTE: Running task 2700 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_configure)
NOTE: Running task 2705 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_compile: Started
NOTE: Running task 2723 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.4-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Started
NOTE: Running task 2726 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2729 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: Running task 2731 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_configure_ptest_base)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot unihash changed to 645c0ece5a191640cb55980778276fe8813471f488051f5d03f83a8269346173
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6f48b481923d5ab59f8b59656e246a58d67e10a9ff77525e42820dc5193650a1', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 6f48b481923d5ab59f8b59656e246a58d67e10a9ff77525e42820dc5193650a1 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c05ae0ff38e39657a47fd5c69c93e3059b18aa254320d23793fb158d68df2376', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed c05ae0ff38e39657a47fd5c69c93e3059b18aa254320d23793fb158d68df2376 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot unihash changed to cfe33783d385b5c10aefeacc07c50302da7c5c87a7e932b08f71cc73db213aee
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c5ca3d0bdebab5165543a05a92c03db12ab9642b1ebed2cd54e9a5243add1a02', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed c5ca3d0bdebab5165543a05a92c03db12ab9642b1ebed2cd54e9a5243add1a02 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '8e2fed79ca8b01461a02b9f144a98069e51c73e345d525d1feb71d2657b6a351', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 8e2fed79ca8b01461a02b9f144a98069e51c73e345d525d1feb71d2657b6a351 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libusb1-1.0.29-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2732 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_compile)
NOTE: Running task 2733 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_configure)
NOTE: Running task 2735 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: Running task 2736 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: Running task 2737 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: Running task 2738 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2739 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2743 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2744 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: Running task 2761 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2765 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2766 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2767 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2768 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2769 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2770 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: Running task 2776 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2777 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2778 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Succeeded
NOTE: Running task 2779 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 2780 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 2781 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_compile)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2790 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2792 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2794 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package unihash changed to c5637b569c80652c49a2d9a2ca181e1babe8fe4b1443eba158fe8eec01e4d076
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata became valid
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running task 2796 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2797 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_write_config)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_write_config: Succeeded
NOTE: Running task 2798 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2802 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package)
NOTE: recipe xkeyboard-config-2.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_deploy_source_date_epoch unihash changed to a69919535a2e7f9cdd057a2cc379d94043f49d39a13cd3522c797850392fe5fe
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '377d6c768422e55cb32ef0f4280b6e111a1d4161c4caa76f2095ac02180c3968', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 377d6c768422e55cb32ef0f4280b6e111a1d4161c4caa76f2095ac02180c3968 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '46b61da77d02ea559edfa935dceb6ac110fb1e372f2c463da156b6176375ae12', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 46b61da77d02ea559edfa935dceb6ac110fb1e372f2c463da156b6176375ae12 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe xrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 39fb8c98e93d0d1b50a76db5f4ac51f9584a9661c965d865e2bc2bc700eb50fc
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7320ad73299daf3fd451fadac9f44f147b06987ac074257a93d4c1ed885774c6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 7320ad73299daf3fd451fadac9f44f147b06987ac074257a93d4c1ed885774c6 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libusb1-1.0.29-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 2803 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_install)
NOTE: Running task 2804 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_install)
NOTE: Running task 2805 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_compile_ptest_base)
NOTE: Running task 2806 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_configure)
NOTE: Running task 2808 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2809 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2811 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package)
NOTE: Running task 2812 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install)
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2813 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_compile)
NOTE: recipe libdrm-2.4.131-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_install: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2814 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2815 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot)
NOTE: Running task 2816 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 2817 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Running task 2821 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_package)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: Running task 2822 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package unihash changed to 7cedcdb93d18de879459e1b94ebd958aa9df1cd4809fe652de635abe826eb5e4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b2956ca22b3dee998b94256937f34c3104e8e648bb70c23effb6b2a9a0de0e6f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed b2956ca22b3dee998b94256937f34c3104e8e648bb70c23effb6b2a9a0de0e6f -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata became valid
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running task 2823 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.46-r0: task do_configure: Succeeded
NOTE: Running task 2824 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2825 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_compile)
NOTE: Running task 2829 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: Running task 2839 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2840 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Succeeded
NOTE: Running task 2841 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2842 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 2844 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: Running task 2845 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 2853 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2854 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Succeeded
NOTE: Running task 2855 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Started
NOTE: Running task 2856 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 2857 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2859 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.1-r0: task do_fetch: Started
NOTE: Running task 2860 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe sbc-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2861 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2866 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2867 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe xkeyboard-config-2.46-r0: task do_compile: Succeeded
NOTE: Running task 2868 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2869 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2870 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe xkeyboard-config-2.46-r0: task do_install: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2873 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Started
NOTE: Running task 2874 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Succeeded
NOTE: Running task 2880 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: Running task 2882 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: Running task 2883 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package)
NOTE: recipe libpng-1.6.54-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_package: Succeeded
NOTE: Running task 2887 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2888 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe libpng-1.6.54-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package unihash changed to efff9298fb49775f183a6a3387f928cf04dfe3b91a7cf191eb2413dcb5e14d12
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '21d8912997363a8dbc31cd01a434fb3a78303eab257e13e68778cbf973a40e95', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 21d8912997363a8dbc31cd01a434fb3a78303eab257e13e68778cbf973a40e95 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata became valid
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_26.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running task 2889 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 2890 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_install)
NOTE: Running task 2891 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_create_spdx)
NOTE: Running task 2892 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2893 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: Running task 2894 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_install_ptest_base)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Started
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2897 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: Running task 2898 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.46-r0: task do_install: Succeeded
NOTE: Running task 2899 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot: Started
NOTE: Running task 2900 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_create_spdx: Succeeded
NOTE: Running task 2901 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot)
NOTE: Running task 2903 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package unihash changed to 5e8ce1ab319939b0a2baa7f3bd3fba28a2b2736a52e08583de9d27330627be64
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot unihash changed to 4e7d36d1243bb5ebc54fdacdc06f001bbc1194b89b401cc9ce0b3b38ee420691
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ecc907e70f5d1c62d57e30acaa24ee97408c59efa037fcec7792e153c4923d07', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed ecc907e70f5d1c62d57e30acaa24ee97408c59efa037fcec7792e153c4923d07 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ac69748f5e7b51520398c2aad667ac8fdab479639d34a8b4295652efab9db8e4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed ac69748f5e7b51520398c2aad667ac8fdab479639d34a8b4295652efab9db8e4 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata became valid
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running task 2904 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: Running task 2905 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: Running task 2906 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 2907 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package unihash changed to 356b0c2cca71a503d55fcac9c8e4e8cf6b5362bbb90c193cd537e3c055ea477b
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3119fbe26ba178937ee75245edfb995d79b7a1531414ee07985c3ea3ff18df48', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 3119fbe26ba178937ee75245edfb995d79b7a1531414ee07985c3ea3ff18df48 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch unihash changed to 736755b861dbf7577e92993c54603a9b8791e85ab3444fc737147dd073400d6e
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running setscene task 1423 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 2908 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2910 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata)
NOTE: Running task 2916 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: Running task 2917 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: Running task 2918 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2919 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_install_ptest_base)
NOTE: Running task 2920 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: Running task 2921 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2922 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 2923 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Started
NOTE: Running task 2926 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2931 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package)
NOTE: Running task 2933 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2935 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Started
NOTE: recipe freetype-2.14.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe freetype-2.14.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2936 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2a8811836ab9fd15c9e44b94bd6f8bf3c990cd45084c345705f836199a72f2ee', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 2a8811836ab9fd15c9e44b94bd6f8bf3c990cd45084c345705f836199a72f2ee -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '296bf3aa4596b51c68a9663ab3fa8d93fec71e448dfd1a5586793f5b8a4a9c6f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 296bf3aa4596b51c68a9663ab3fa8d93fec71e448dfd1a5586793f5b8a4a9c6f -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot unihash changed to 52ce08d8367d78504cd7f8598b619cb73761d6722938263a865e23afa7cf92ca
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to fcfae92861c540c02e28d9020521f5a0f167eb52c649ab01f2adf514d84d3805
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b025b090b8903b667842ec41378efa7d02e11542ab9ee629de81d59743f79ea3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed b025b090b8903b667842ec41378efa7d02e11542ab9ee629de81d59743f79ea3 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe freetype-2.14.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2937 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: Running task 2938 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: Running task 2939 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: Running task 2940 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: Running task 2941 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_unpack)
NOTE: Running task 2942 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_unpack)
NOTE: Running task 2943 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2946 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_compile_ptest_base)
NOTE: Running task 2952 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa)
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe sbc-2.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2953 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe sbc-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2954 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2958 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe sbc-2.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2959 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2960 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_patch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2961 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_fetch)
NOTE: Running task 2962 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_fetch)
NOTE: recipe libusb1-1.0.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2963 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Succeeded
NOTE: Running task 2977 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: recipe libusb1-1.0.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: Running task 2984 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2986 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 2987 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2988 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_install: Succeeded
NOTE: Running task 2994 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 2996 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2997 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata)
NOTE: Running task 2998 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_deploy_source_date_epoch unihash changed to fb2ab53d7793a2dd75d2667134f572e99bbe50e94a431d21480d0b3064884c31
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b22e5aa220995b6f1ee24c436cbe6a0369481dd621619aad9deb50fad58a532d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed b22e5aa220995b6f1ee24c436cbe6a0369481dd621619aad9deb50fad58a532d -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2e911a32e51942c883b2f33a830a76593fcd113b6b3c906c714b6684bab5ef99', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 2e911a32e51942c883b2f33a830a76593fcd113b6b3c906c714b6684bab5ef99 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'cbb787ec77b3fdc4ab296d86300ea5efe0299f5af73e7765db0f3959b3473841', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed cbb787ec77b3fdc4ab296d86300ea5efe0299f5af73e7765db0f3959b3473841 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f18d937f991cb57b526ca7cabbb79fe7205fd277d9b3e4ffc75d7e21df46353f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed f18d937f991cb57b526ca7cabbb79fe7205fd277d9b3e4ffc75d7e21df46353f -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe mesa-2_26.0.0-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3005 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: Running task 3007 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 3008 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3009 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: Running task 3030 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 3031 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3032 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3036 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3037 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 3038 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 3039 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3051 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3056 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: Running task 3057 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: Running task 3058 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '06bec151bf84b75e253cc9052d20ecc2c6468e6787a98112df5fcbc1840c1789', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 06bec151bf84b75e253cc9052d20ecc2c6468e6787a98112df5fcbc1840c1789 -> c59d1588f06daba7cd48a1e66d46ffd584e4dafe5b7f5e1f626d4a16009865f9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3059 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: Running task 3060 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: Running task 3061 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: Running task 3063 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3064 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_unpack)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 3065 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 3066 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 3067 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3068 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_patch)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Started
NOTE: recipe tiff-4.7.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 3069 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_package)
NOTE: Running task 3070 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 3091 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: Running task 3094 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package unihash changed to f249c29f58305ffe8c8769b8ba864a3c4617b7923aca065e999350e971564a4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata became valid
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to eeaa6f6c906e01bd21eb16e59cd57324853c023fad6194e034fecc149ae8c700
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running task 3095 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package)
NOTE: Running task 3102 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: Running task 3124 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 3125 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3126 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to ac7756db6836583e070d78f3a78cf018cf33cf1493bb0684abe9f8ed18ee9e86
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot unihash changed to df2cee8748c5a689c5f986ae9e42ce0f65a608bb93bd5419080d4570ae665812
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3127 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: Running task 3128 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: Running task 3129 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: Running task 3130 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: Running task 3131 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: Running task 3132 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 3133 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe sbc-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch unihash changed to 187b589db7dbee2bf45409cbd9f9aa8a1a11489566baba5f929f1ae5237fd86d
NOTE: recipe sbc-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_deploy_source_date_epoch unihash changed to d5b69be3ebb8ca5396b5fc03b0f61d3d328005fc164d15e8a9cda402fc49a82b
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_package unihash changed to 9569fe10c3ef50871e9cee08cd72dd65ee4dcf15fb4c71ac85463436227c7b1f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3b00d94b2189a5faa85c2cb3b635bf068c7f3a835892919f19bb5938544cdc7c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 3b00d94b2189a5faa85c2cb3b635bf068c7f3a835892919f19bb5938544cdc7c -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata became valid
NOTE: Running setscene task 1427 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata_setscene)
NOTE: Running task 3134 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3135 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: Running task 3136 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: Running task 3137 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 3138 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: Running task 3146 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3147 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3149 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 3150 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3151 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot unihash changed to 79dfb88e22231ac3023d652936596d1cc21922aa12775fa652c314dc173cbad9
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3152 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_configure)
NOTE: Running task 3153 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: Running task 3154 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: Running task 3155 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3156 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_write_config)
NOTE: Running task 3157 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3158 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_configure: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3159 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3160 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3161 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3163 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3164 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: Running task 3165 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: Running task 3166 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: Running task 3167 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_configure)
NOTE: recipe libusb1-1.0.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3180 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_fetch)
NOTE: Running task 3181 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 3183 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_package)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata unihash changed to af0c50e0ac6c2fbd15ae107074b1d54fccfa9a18f748d53960549c82ed69f327
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3185 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: Running task 3186 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: Running task 3187 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: Running task 3188 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package unihash changed to a7a232325d2a7afccbce046aa4b093c9ea96b1d4fe81df462c99e03b6ce328c1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata unihash changed to 18d17bcde69219c4073d67ac93345a4ade45a227bc8d6462d218d0508aa7b7c9
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '079b23c809cf199406d919f556bcd2c7d5ee5fec5921ce70a9cbca653aac6519', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 079b23c809cf199406d919f556bcd2c7d5ee5fec5921ce70a9cbca653aac6519 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: Running task 3199 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3200 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3202 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: Running task 3203 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: Running task 3204 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3211 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3212 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3224 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot unihash changed to 97857189c58bc8f1fab77e0bb7dc35933440161c910f9b4464f1e41c05c8ec56
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package unihash changed to f2f3508d6178bb1a750e06feee3834a613fed17017e72ae1f297d391ddd0d1ff
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot unihash changed to 855794093534d3a47ff8c43def26dfb1a7bd2b02d664361ff8cdf93bca70fa7c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot unihash changed to 6a4825866a9f62d1874e2d0b6d2fb2ca3bce456847ce96cd7c1690a14befd900
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'b41cc7edf5a75d1064fe34ea2d8e769daa22d923d4747ef59a57d923717fe2c0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed b41cc7edf5a75d1064fe34ea2d8e769daa22d923d4747ef59a57d923717fe2c0 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9c92dbd22a0f195865be4ba6166f8ca9d00aba40573c43fe117249d37184b283', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9c92dbd22a0f195865be4ba6166f8ca9d00aba40573c43fe117249d37184b283 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata became valid
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Running setscene task 1427 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: Running task 3225 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3226 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata)
NOTE: Running task 3227 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: Running task 3228 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: Running task 3229 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: Running task 3230 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: Running task 3233 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3235 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3236 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libical-3.0.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3237 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_compile)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Succeeded
NOTE: Running task 3238 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_compile)
NOTE: recipe libical-3.0.20-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3239 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Started
NOTE: Running task 3240 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3241 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3242 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3243 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata unihash changed to 7514032c5950b9cebe40f84c2eee114db1585e56af27b3d011455db5e3db231f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package unihash changed to 7f18959fd692f78ae88e5c482ba2f4ffae89720dc6a8fe69d10ca4be4e9c38a8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch unihash changed to 542dc977ec38616f99b5b91e99709c7cfc53138c4f578c116b0c0b5c56769977
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch unihash changed to ae8f9c1d698c02d14600200efe944d143ed62bf5c6201151f57426fe04ed2278
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '2cac7f8dd2ce241c2d70b8248cc3d75e9607b952135e3828ac28a760e9c24655', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 2cac7f8dd2ce241c2d70b8248cc3d75e9607b952135e3828ac28a760e9c24655 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3244 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: Running task 3245 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3248 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3249 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3250 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3251 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3252 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Started
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3266 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 3267 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_patch)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Started
NOTE: Running task 3268 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Succeeded
NOTE: Running task 3269 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata unihash changed to aa6d232488f4ef68b56dd0b68d4f6266b29620d23dec6ab0042543d89d9878c1
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package unihash changed to a28fdba29e6ca70dffedc136754af202128348e10ac8615706785036dc498e57
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch unihash changed to 9f281ae700dd469b716e59a81d556f783b322f5e26b0182948194491eff91d5f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'cfa166ef924d5e4296965225c780222f103b5d33f733f6602b9114c947b97fc2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed cfa166ef924d5e4296965225c780222f103b5d33f733f6602b9114c947b97fc2 -> d3959ecb388a14d81fa3d32a6cc12fc6ca84661bcccfa03c97635e139c17ab74 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '9a6c3a08f99d39d6656ed5848ba2e299a2e6db78ee5b18b0d21288557502c061', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 9a6c3a08f99d39d6656ed5848ba2e299a2e6db78ee5b18b0d21288557502c061 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata became valid
NOTE: Running setscene task 1425 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running task 3271 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: Running task 3272 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 3273 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: Running task 3281 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: Running task 3318 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 3319 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3322 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: Setscene tasks completed
NOTE: Running task 3323 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: Running task 3325 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3326 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3327 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3330 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3331 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3332 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_install)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 3344 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3346 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3348 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3370 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3371 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libogg-1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Started
NOTE: recipe libogg-1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3372 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3406 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Succeeded
NOTE: Running task 3418 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: Running task 3419 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3420 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_package)
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch unihash changed to 7b94c73379dda396cb166024bfb60c1e4cb90e1aff2ef555469e29f201796ed5
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3421 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Succeeded
NOTE: Running task 3422 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_install)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_package: Succeeded
NOTE: Running task 3423 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3424 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3425 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.131-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package unihash changed to c10e3b67455cf5d258a38ce1c0d2a86d07536375399d1a85b0815d52ec6e851f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.131-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running task 3426 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: Running task 3427 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata unihash changed to b0835fe642bd745511c767f8115024f193324c32b1688ce78bc9e01c51d64769
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3428 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_configure)
NOTE: Running task 3430 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 3431 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 3435 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe pango-1.57.0-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 3436 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3437 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_package)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3438 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3439 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Started
NOTE: Running task 3449 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 3459 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3460 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.29-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 163e928cdeea6848621bb8f3bb8c08e1de4d2d3ed2492c5f9808372bf6871652
NOTE: recipe libical-3.0.20-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3461 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_install)
NOTE: Running task 3462 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata)
NOTE: Running task 3463 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 3468 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx)
NOTE: Running task 3483 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_write_config)
NOTE: Running task 3487 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 3495 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_install: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 3496 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-12.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 3503 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3504 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 3509 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-12.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Started
NOTE: Running task 3516 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3517 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3519 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata unihash changed to 3e7448b65b13391c2ba653e8d4a8edd336bd5787e0775ee9cde22a618a41d9c1
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3520 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot)
NOTE: Running task 3521 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_package)
NOTE: Running task 3522 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: Running task 3523 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3528 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: Running task 3530 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx)
NOTE: recipe libical-3.0.20-r0: task do_package: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 3531 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: Running task 3536 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3537 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3545 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3546 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: Running task 3547 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3548 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3549 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: Running task 3550 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 3556 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.86-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3557 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 3570 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3583 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3584 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3585 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3586 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3588 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3589 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: Running task 3590 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_configure)
NOTE: Running task 3591 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.86-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 3592 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3593 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata)
NOTE: Running task 3594 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3598 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3599 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3620 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3621 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 51778725f194616169f7bd986fe6a210102aab443a45fbba5c1fe4f7017cc1bc
NOTE: recipe xkeyboard-config-2.46-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3622 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_spdx)
NOTE: Running task 3626 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.46-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3627 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_create_spdx)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 3629 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx)
NOTE: Running task 3630 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3631 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3637 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3638 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3640 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.20-r0: task do_package: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3641 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.46-r0: task do_create_spdx: Succeeded
NOTE: Running task 3642 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: Running task 3643 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_collect_spdx_deps)
NOTE: Running task 3648 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.57.0-r0: task do_configure: Succeeded
NOTE: Running task 3649 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_compile)
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3658 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3660 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_compile: Started
NOTE: Running task 3661 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3662 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Started
NOTE: Running task 3696 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 3697 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3698 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3699 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 3702 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3703 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3704 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 3705 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3706 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3707 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.7.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3708 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot unihash changed to 6f5f904612b5fc2408bde31b60b3db1f4b0aa9166231fba76fffa148b627711e
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3709 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3710 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3711 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: Running task 3725 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 3727 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.20-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3728 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3731 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx)
NOTE: Running task 3733 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3734 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx)
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3736 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Started
NOTE: Running task 3737 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3739 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3740 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 3742 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: Running task 3743 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3744 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: recipe libusb1-1.0.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3745 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Succeeded
NOTE: Running task 3746 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Started
NOTE: Running task 3747 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3748 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.86-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3772 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3773 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 3774 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata)
NOTE: Running task 3775 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.86-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3776 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx: Succeeded
NOTE: Running task 3785 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Succeeded
NOTE: Running task 3786 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_packagedata)
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic unihash changed to 491cb3088b2b5e733ec0272edb69954776d4eccc2a3eaaaf9ba2826ffe8c75ec
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3787 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package unihash changed to fb3e402d0c996fd85181952570255a6d7ce742eb34c28314a4ca6879bfc034d3
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3788 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: Running task 3789 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3790 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_packagedata unihash changed to 496bae96b017f518aa7c312148631c167eb4bc595baea73fb21e61981bd7cf68
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5f13f47fe0ab3d09a93c98e5d2e7e59b3324cb4ae3cb69046ea03eec22e2d951', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 5f13f47fe0ab3d09a93c98e5d2e7e59b3324cb4ae3cb69046ea03eec22e2d951 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3791 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata unihash changed to 603954c726d17eb850996334038ee811b3faa8753d122a71a804282faeb553c0
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 6ebf86e9fa8ebc11372dbdcfa9f41a1776ef59aa5b4ed5c89dc669534fb24a1e
NOTE: Setscene tasks completed
NOTE: Running task 3792 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx)
NOTE: Running task 3793 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3794 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: Running task 3795 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to 197ae3d0942d7f23cb0c4cebf56614f9bf5acc01744543f5b6917b713074b5b6
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa unihash changed to 996db5236af6f9180ac3652894ae73822b5ce9842266e4e61529b0b5bfa4deba
NOTE: Running task 3796 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3797 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 17b290acaac0b59eb0001bda1cf3182ef7985470be2375742020f7e0ea8f0d02
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to cbdfd793856b25035591e37cd1f6572fc57569f56cfab9a9d55f22849ca45229
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_configure_ptest_base)
NOTE: Running task 3799 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe bluez5-5.86-r0: task do_configure_ptest_base: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3800 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_compile)
NOTE: Running task 3801 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3802 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.86-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot unihash changed to c47737ac1e7b627963fb2c86d153eba724bdf5f9ddd4c546c77ac9e4c8ad37fc
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3803 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3804 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe sbc-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe sbc-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3805 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to f78ca19c3022f4dc00de613783b271d5617180c6b44d92d4be125330c8f861f9
NOTE: recipe sbc-2.1-r0: task do_configure: Started
NOTE: recipe tiff-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 3806 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3807 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3808 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3809 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to 9412219b4603b3e7ec4dc2e49db1352219567bb1e39dcd91667453ccfcf923e2
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3810 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_ipk)
NOTE: Running task 3811 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_deb)
NOTE: Running task 3812 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_rpm)
NOTE: Running task 3813 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa)
NOTE: Running task 3814 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk)
NOTE: Running task 3815 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb)
NOTE: Running task 3816 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm)
NOTE: Running task 3817 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3818 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_compile: Succeeded
NOTE: Running task 3819 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_install)
NOTE: recipe pango-1.57.0-r0: task do_install: Started
NOTE: recipe pango-1.57.0-r0: task do_install: Succeeded
NOTE: Running task 3820 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot)
NOTE: Running task 3821 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_package)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.57.0-r0: task do_package: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3822 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk unihash changed to cbffb4410cc5f3d89ff314d6aa446a82947cce3d12a0fcd306ea8b30ddafc4e1
NOTE: recipe tiff-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 3823 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package)
NOTE: Running task 3824 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3825 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_create_wrappers)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.7.1-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm unihash changed to ad46a21d88dc97d02bb139e0457c0786cb7af907b40b79002078a8a3f5d5581c
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa unihash changed to 1d5b5a0c0c4913b1e99227b5a76e83db5c4dd19127f1f39cc7c2cc2e050f4fba
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3826 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure)
NOTE: recipe sbc-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3827 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Started
NOTE: recipe sbc-2.1-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot unihash changed to fe4107fc536f140b5fc25f7684dcac142d638a4fd9f9c03ae28088704836a3f5
NOTE: Setscene tasks completed
NOTE: recipe pango-1.57.0-r0: task do_package: Succeeded
NOTE: Running task 3828 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata)
NOTE: recipe pango-1.57.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb unihash changed to c330fb242329b16dbe197475cb216b8832346d4eccde7a057ea3a52a16a19f8f
NOTE: recipe pango-1.57.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3830 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_install)
NOTE: recipe sbc-2.1-r0: task do_install: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3831 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.1-r0: task do_install: Succeeded
NOTE: Running task 3832 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot)
NOTE: Running task 3833 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_package)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.1-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot unihash changed to c4df95a971aec445f70e7b0848dd7c442cfa467e830c05e779746a1f90ecc828
NOTE: recipe bluez5-5.86-r0: task do_compile: Succeeded
NOTE: Running task 3834 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_compile_ptest_base)
NOTE: recipe tiff-4.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package unihash changed to ad6e1bd4a6145774c8201abaf98119fb7a44a3f0e128b1a7952bd687be7762c6
NOTE: recipe bluez5-5.86-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 3835 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Succeeded
NOTE: Running task 3836 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure_ptest_base)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata unihash changed to 98a722018614b712409a806d2e03804b3e06e6d8419be3c6ffab9add95f61545
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 3837 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3838 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Started
NOTE: recipe sbc-2.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_package unihash changed to d1c6b93c95056c7e90c43a0347984bd6e71daa8c560e92db911c72410270581f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata became valid
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1430 of 1430 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3840 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx)
NOTE: recipe sbc-2.1-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa unihash changed to c29dd29b06d1d71c4c9671703c0a34e518437eb18fb518aa8d0b62e1ee6433a5
NOTE: recipe mesa-2_26.0.0-r0: task do_compile: Succeeded
NOTE: Running task 3841 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_26.0.0-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_install: Succeeded
NOTE: Running task 3842 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 3843 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_26.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_package: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3844 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3845 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3846 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3847 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3848 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3849 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_package: Succeeded
NOTE: Running task 3850 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_26.0.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3851 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe mesa-2_26.0.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3852 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3853 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3854 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3855 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3856 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3857 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3858 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3859 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3860 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3861 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3862 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3863 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3864 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3865 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3866 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3867 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 3868 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to ccbea6d9ee51a96c5090726c76dd1321d27dc8dccd3937556707a4fba223a1ed
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '84e378d012a5b2e009802c2172086b538038ee4c3b3c2df3d2add2cbcaa56a40', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 84e378d012a5b2e009802c2172086b538038ee4c3b3c2df3d2add2cbcaa56a40 -> 6e7a0d73b5066f4df09d37c67beb8f38ad159d1af9ad44eb4aa5dc3f2cc73a35 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3869 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3871 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_compile)
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3872 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3873 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot)
NOTE: Running task 3874 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Succeeded
NOTE: Running task 3875 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3876 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Succeeded
NOTE: Running task 3877 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_install)
NOTE: recipe gtk+3-3.24.51-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_install: Succeeded
NOTE: Running task 3878 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_package)
NOTE: recipe gtk+3-3.24.51-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_package: Succeeded
NOTE: Running task 3885 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.51-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3895 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_install)
NOTE: recipe bluez5-5.86-r0: task do_install: Started
NOTE: recipe bluez5-5.86-r0: task do_install: Succeeded
NOTE: Running task 3896 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.86-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.86-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3897 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_populate_sysroot)
NOTE: Running task 3898 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_package)
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.86-r0: task do_package: Started
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_package: Succeeded
NOTE: Running task 3899 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_packagedata)
NOTE: recipe bluez5-5.86-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.86-r0: task do_packagedata: Succeeded
NOTE: Running task 3900 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_spdx)
NOTE: recipe bluez5-5.86-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.86-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Succeeded
NOTE: Running task 3901 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_cargo)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Succeeded
NOTE: Running task 3902 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3903 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install)
NOTE: recipe librsvg-2.61.3-r0: task do_install: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install: Succeeded
NOTE: Running task 3904 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3905 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot)
NOTE: Running task 3906 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_cargo)
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Succeeded
NOTE: Running task 3907 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package)
NOTE: recipe librsvg-2.61.3-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3908 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3909 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package: Succeeded
NOTE: Running task 3910 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata)
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3911 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3912 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3913 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3914 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3915 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_package)
NOTE: Running task 3916 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3917 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3918 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_configure)
NOTE: recipe gtk4-4.20.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.20.3-r0: task do_configure: Succeeded
NOTE: Running task 3919 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_compile)
NOTE: recipe gtk4-4.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_package: Succeeded
NOTE: Running task 3920 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3921 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3922 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.20.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.20.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_compile: Succeeded
NOTE: Running task 3923 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_install)
NOTE: recipe gtk4-4.20.3-r0: task do_install: Started
NOTE: recipe gtk4-4.20.3-r0: task do_install: Succeeded
NOTE: Running task 3924 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_package)
NOTE: Running task 3925 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.20.3-r0: task do_package: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_package: Succeeded
NOTE: Running task 3926 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_packagedata)
NOTE: recipe gtk4-4.20.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3927 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_create_spdx)
NOTE: Running task 3928 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_package_write_ipk)
NOTE: Running task 3929 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_package_write_deb)
NOTE: Running task 3930 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_package_write_rpm)
NOTE: recipe gtk4-4.20.3-r0: task do_create_spdx: Started
NOTE: Running task 3931 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_package_qa)
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.20.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.20.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3932 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_create_package_spdx)
NOTE: recipe gtk4-4.20.3-r0: task do_create_package_spdx: Started
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3933 of 3933 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3933 tasks of which 3135 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:82.0.0-r0 to 0:80.9.0-r0) [version-going-backwards]
ERROR: python3-setuptools-80.9.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0757124602169970099==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.2-4.20.3.patch"

RnJvbSBmMzE4NmU3NGNmZmI4N2RmZjdjYzNlOGRiMDhlMTlhOTQ4NGJhMmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6NTc6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjAuMiAtPiA0LjIwLjMKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4yMC4yLmJiID0+IGd0azRfNC4yMC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMjAuMi5iYiA9PiBndGs0XzQuMjAuMy5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMy5iYgppbmRleCA5Mjc5MWRiMTY5Li5l
ZjlhMDVmN2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMy5iYgpAQCAtMzMs
NyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rlc3Rn
dGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBcCiAi
CiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVlODI0MGVkZWNhZmFmZjJiOGJhZjQ2
NjNiZGNlYWE2NjhlZjEwYTIwN2JlZTRkN2Y5MGUwMTBlMTBiZGRjNWMiCitTUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICIyODczZjI5MDMwODhhNjZjNzExNzNlYTJlZDg1ZmZhZTI2NmE2NmI5
NzJjM2E0ODQyYmJiMmY2ZjE4N2VjMTUzIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01FQk59
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============0757124602169970099==--

