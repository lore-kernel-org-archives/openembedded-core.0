Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E030EC35FFE
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.115652.1726410842242067129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UUq2/goF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w0VZonKt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191f61ade04-1ad33353-8895-4e52-8743-6f344dbccbf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6rLqOrI6ytNmcE3voMLRFuyb2xUAAmv1XBpi2xdBab0=;
	b=UUq2/goF5dDEr7duNKtHieg3clu4oQO1F6QFTTK1fq2pWW9y0qTa92Jl5Jgt2aVz
	dKSd68ZuJVWEaHp0zlIQ7qzAbpmJtEvD4sCODbB5AT5Gef417qPLrlApJFVdCaZsZue
	soCXzAq4IKWoHbNOTEGwiDi5I7+Mk+MHlWTB1cs0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6rLqOrI6ytNmcE3voMLRFuyb2xUAAmv1XBpi2xdBab0=;
	b=w0VZonKtuCGS1b0hiCpPb6052YGobphQGa85LgluALS6bC2O8ZMVYytTNyBVj7TX
	s2psV80HHH7klBj1kvVY/DXfdLj68ny66y0fzCPXZOgjnZqS2oXcxHI/yPpLKCWkBgR
	ny57p5JeSLN+h5vCCXkNEiP5fTJQb7qhilenJiyg=
Content-Type: multipart/mixed; boundary="===============5314448977119974380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.17.0 SUCCEEDED
Message-ID: <01010191f61ade04-1ad33353-8895-4e52-8743-6f344dbccbf4-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204580

--===============5314448977119974380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iso-codes* to *4.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.16.0-4.17.0.patch
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
From 3cead51c45c907a6e9083dae5e15eeb79b3b2163 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 14:24:40 +0000
Subject: [PATCH] iso-codes: upgrade 4.16.0 -> 4.17.0

---
 .../iso-codes/{iso-codes_4.16.0.bb => iso-codes_4.17.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.16.0.bb => iso-codes_4.17.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
index f33cce1a9d..bba2cd9de1 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "c2fcaadc832ed9f858950a43994973442d85ef4f"
+SRCREV = "0640070a001ca6edfa8ab6b61fe3230e66b3963b"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.44.0


--===============5314448977119974380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: FILELIST: added "/usr/share/locale/ckb/LC_MESSAGES/iso_639_3.mo /usr/share/locale/ckb/LC_MESSAGES/iso_639-3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: FILELIST: added "/usr/share/locale/hi/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/hi/LC_MESSAGES/iso_4217.mo /usr/share/locale/hi/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/hi/LC_MESSAGES/iso_15924.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGSIZE changed from 53415 to 991188 (+1756%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 555373 to 1026293 (+85%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 198069 to 271007 (+37%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGSIZE changed from 898 to 7401 (+724%)

--===============5314448977119974380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 92636 to 93250 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: FILELIST: added "/usr/share/locale/ckb/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ckb/LC_MESSAGES/iso_639_3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGSIZE changed from 10442 to 10993 (+5%)
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 119403 to 119714 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 119170 to 119429 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 90579 to 90921 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: FILELIST: added "/usr/share/locale/hi/LC_MESSAGES/iso_15924.mo /usr/share/locale/hi/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/hi/LC_MESSAGES/iso_4217.mo /usr/share/locale/hi/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGSIZE changed from 53415 to 991188 (+1756%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 148792 to 148778 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 63315 to 64911 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 527478 to 532028 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 234162 to 236096 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 602379 to 602413 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGSIZE changed from 181848 to 182209 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGSIZE changed from 18189 to 18739 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGSIZE changed from 25456 to 26940 (+6%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 403900 to 416644 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 322751 to 319449 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGSIZE changed from 156437 to 156654 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 56274 to 56465 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 555373 to 1026293 (+85%)
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 213964 to 229165 (+7%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGSIZE changed from 31400 to 31552 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGSIZE changed from 36644 to 36920 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 198069 to 271007 (+37%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGSIZE changed from 898 to 7401 (+724%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.16.0 [default] to 4.17.0 [default]
packages/all-poky-linux/iso-codes: PV changed from "4.16.0" to "4.17.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.16.0 [default] to 4.17.0 [default]

--===============5314448977119974380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.16.0-4.17.0.patch"

RnJvbSAzY2VhZDUxYzQ1YzkwN2E2ZTkwODNkYWU1ZTE1ZWViNzliM2IyMTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTQ6MjQ6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
c28tY29kZXM6IHVwZ3JhZGUgNC4xNi4wIC0+IDQuMTcuMAoKLS0tCiAuLi4vaXNvLWNvZGVzL3tp
c28tY29kZXNfNC4xNi4wLmJiID0+IGlzby1jb2Rlc180LjE3LjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMve2lzby1jb2Rlc180LjE2LjAuYmIgPT4gaXNvLWNv
ZGVzXzQuMTcuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
c28tY29kZXMvaXNvLWNvZGVzXzQuMTYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1j
b2Rlcy9pc28tY29kZXNfNC4xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xNi4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTcuMC5iYgpp
bmRleCBmMzNjY2UxYTlkLi5iYmEyY2Q5ZGUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTcuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
c2Fsc2EuZGViaWFuLm9yZy9pc28tY29kZXMtdGVhbS9pc28tY29kZXMuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYWluOyIKLVNSQ1JFViA9ICJjMmZjYWFkYzgzMmVkOWY4NTg5NTBhNDM5OTQ5
NzM0NDJkODVlZjRmIgorU1JDUkVWID0gIjA2NDAwNzBhMDAxY2E2ZWRmYThhYjZiNjFmZTMyMzBl
NjZiMzk2M2IiCiAKICMgaW5oZXJpdCBnZXR0ZXh0IGNhbm5vdCBiZSB1c2VkLCBiZWNhdXNlIGl0
IGFkZHMgZ2V0dGV4dC1uYXRpdmUgdG8gQkFTRURFUEVORFMgd2hpY2gKICMgYXJlIGluaGliaXRl
ZCBieSBhbGxhcmNoCi0tIAoyLjQ0LjAKCg==

--===============5314448977119974380==--

