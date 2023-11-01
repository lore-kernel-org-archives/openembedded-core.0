Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20DDC072DD
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8671.1698848705851745322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GK0bjiUc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KDpZ818d;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460a21-1da3546a-a00f-470e-a717-4e6d4a859258-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gHVvEsP0T6IRRLf1Pf4h9/tRXBpTN/P1ngjyTXSs4Mw=;
	b=GK0bjiUcoBsIq3bB8oz/iwhwpXFpXdsEBJ+zUMkgyQvj8U3lCOU0dc8iLyiz3D1G
	7HK9OR5miWMTV/CGDtkp4oc+ZD/IF3BlbsOQhJqEaBKi3Q5cAZZ87JDAjYvZq3/rNs/
	K9WvriQcFQS766yL+VPQsdXsiyUp4l70fwzRDHG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gHVvEsP0T6IRRLf1Pf4h9/tRXBpTN/P1ngjyTXSs4Mw=;
	b=KDpZ818defYbIv167w4ueGbLARS7k6mgQFZNTcfCeMeZiYglyxbG1rZBd+HRz8ER
	fVxHDQzVWtFrJhGnhhcIGE3hgfjPe9quGafKZASIGZXMaEqgg7RVt0dTDtWva9+PNPz
	1wZtCvCXlPNPm3IHBYagHCciBb6csOZqf0hrjO38=
Content-Type: multipart/mixed; boundary="===============8735246718223083505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnewt: upgrading to 0.52.24 SUCCEEDED
Message-ID: <0101018b8b460a21-1da3546a-a00f-470e-a717-4e6d4a859258-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190008

--===============8735246718223083505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnewt* to *0.52.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnewt-upgrade-0.52.23-0.52.24.patch
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
From 86f7b6895226054085524277404c6f75559f3fd2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:39:02 +0000
Subject: [PATCH] libnewt: upgrade 0.52.23 -> 0.52.24

---
 .../newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/newt/{libnewt_0.52.23.bb => libnewt_0.52.24.bb} (94%)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.23.bb b/meta/recipes-extended/newt/libnewt_0.52.24.bb
similarity index 94%
rename from meta/recipes-extended/newt/libnewt_0.52.23.bb
rename to meta/recipes-extended/newt/libnewt_0.52.24.bb
index cd3731cf74..1e39a1c5ca 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.23.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.24.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://0001-detect-gold-as-GNU-linker-too.patch \
            "
 
-SRC_URI[sha256sum] = "caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a"
+SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.39.2


--===============8735246718223083505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnewt: SRC_URI changed from "https://releases.pagure.org/newt/newt-0.52.23.tar.gz file://cross_ar.patch file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch file://0001-detect-gold-as-GNU-linker-too.patch" to "https://releases.pagure.org/newt/newt-0.52.24.tar.gz file://cross_ar.patch file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch file://0001-detect-gold-as-GNU-linker-too.patch"
packages/core2-64-poky-linux/libnewt: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-dbg: FILELIST: removed "/usr/lib/.debug/libnewt.so.0.52.23", added "/usr/lib/.debug/libnewt.so.0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-dbg: PKGSIZE changed from 368480 to 368408 (-0%)
packages/core2-64-poky-linux/libnewt/libnewt-dbg: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-dbg: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-dev: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-dev: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-doc: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-doc: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ar: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ar: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-as: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-as: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ast: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ast: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-bal: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-bal: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-bg: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-bg: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-bn-in: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-bn-in: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-bn: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-bn: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-bs: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-bs: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ca: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ca: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-cs: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-cs: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-cy: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-cy: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-da: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-da: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-de: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-de: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-dz: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-dz: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-el: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-el: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-eo: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-eo: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-es: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-es: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-et: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-et: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-eu: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-eu: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-fa: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-fa: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-fi: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-fi: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-fr: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-fr: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ga: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ga: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-gl: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-gl: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-gu: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-gu: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-he: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-he: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-hi: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-hi: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-hr: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-hr: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-hu: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-hu: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ia: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ia: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-id: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-id: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-it: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-it: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ja: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ja: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ka: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ka: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-km: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-km: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-kn: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-kn: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ko: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ko: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ku: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ku: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-lt: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-lt: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-lv: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-lv: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-mg: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-mg: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-mk: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-mk: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ml: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ml: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-mr: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-mr: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ms: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ms: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-nb: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-nb: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-nds: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-nds: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ne: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ne: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-nl: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-nl: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-nn: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-nn: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-pa: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-pa: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-pl: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-pl: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-pt-br: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-pt-br: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-pt: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-pt: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ro: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ro: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ru: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ru: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sk: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sk: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sl: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sl: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sq: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sq: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sr+latin: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sr+latin: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sr: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sr: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-sv: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-sv: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-ta: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-ta: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-te: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-te: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-tg: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-tg: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-th: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-th: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-tl: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-tl: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-tr: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-tr: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-uk: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-uk: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-vi: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-vi: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-wo: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-wo: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-xh: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-xh: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-zh-cn: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-zh-cn: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-locale-zh-tw: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-locale-zh-tw: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-python: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-python: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-src: PKGSIZE changed from 261732 to 261733 (+0%)
packages/core2-64-poky-linux/libnewt/libnewt-src: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-src: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt-staticdev: PKGSIZE changed from 417170 to 417178 (+0%)
packages/core2-64-poky-linux/libnewt/libnewt-staticdev: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt-staticdev: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
packages/core2-64-poky-linux/libnewt/libnewt: FILELIST: removed "/usr/lib/libnewt.so.0.52.23", added "/usr/lib/libnewt.so.0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/libnewt: PKGV changed from 0.52.23 [default] to 0.52.24 [default]
Changes to packages/core2-64-poky-linux/libnewt (sysroot):
  /usr/lib/libnewt.so.0.52 changed symlink target from libnewt.so.0.52.23 to libnewt.so.0.52.24
  /usr/lib/libnewt.so.0.52.23 moved to /usr/lib/libnewt.so.0.52.24
packages/core2-64-poky-linux/libnewt/whiptail: PV changed from "0.52.23" to "0.52.24"
packages/core2-64-poky-linux/libnewt/whiptail: PKGV changed from 0.52.23 [default] to 0.52.24 [default]

--===============8735246718223083505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-53588672db65e8f337a19ca38397b28306e7019d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:53588672db65e8f337a19ca38397b28306e7019d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 40 Mirrors 0 Missed 25 Current 554 (61% match, 95% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 564 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libnsl2/2.0.0/temp/log.do_packagedata_setscene.995578
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 612 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 864 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_recipe_qa)
NOTE: Running task 1052 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_recipe_qa)
NOTE: Running task 1247 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_recipe_qa)
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa: Started
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa: Started
NOTE: Running task 1501 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnewt-0.52.24-r0: task do_recipe_qa: Started
NOTE: recipe libpcre-8.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1502 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 1503 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_fetch)
NOTE: Running task 1504 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_fetch)
NOTE: recipe libnewt-0.52.24-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe slang-2.3.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Started
NOTE: recipe libnewt-0.52.24-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_unpack)
NOTE: Running task 1649 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1650 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe slang-2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1651 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_unpack)
NOTE: recipe libnewt-0.52.24-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe slang-2.3.3-r0: task do_unpack: Started
NOTE: recipe libnewt-0.52.24-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 614 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnewt-0.52.24-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 1659 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 1660 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_collect_spdx_deps)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libtirpc/1.3.3/temp/log.do_packagedata_setscene.996181
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 617 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 1667 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1668 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_populate_lic)
NOTE: recipe libpcre-8.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_patch: Started
NOTE: Running task 1669 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnewt-0.52.24-r0: task do_populate_lic: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnewt-0.52.24-r0: task do_populate_lic: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1670 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 619 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe slang-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe slang-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1694 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe slang-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1700 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 1711 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1712 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1714 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1715 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1716 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1717 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1718 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe slang-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe slang-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_configure)
NOTE: recipe slang-2.3.3-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: Running task 1721 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_create_spdx)
NOTE: recipe libpcre-8.45-r0: task do_create_spdx: Started
NOTE: recipe libpcre-8.45-r0: task do_create_spdx: Succeeded
NOTE: Running task 1722 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_collect_spdx_deps)
NOTE: recipe slang-2.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe slang-2.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe slang-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_configure_ptest_base)
NOTE: recipe slang-2.3.3-r0: task do_configure_ptest_base: Started
NOTE: recipe slang-2.3.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1724 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_compile)
NOTE: recipe slang-2.3.3-r0: task do_compile: Started
NOTE: recipe slang-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_compile_ptest_base)
NOTE: recipe slang-2.3.3-r0: task do_compile_ptest_base: Started
NOTE: recipe slang-2.3.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1726 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_install)
NOTE: recipe slang-2.3.3-r0: task do_install: Started
NOTE: recipe slang-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 1727 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_install_ptest_base)
NOTE: recipe slang-2.3.3-r0: task do_install_ptest_base: Started
NOTE: recipe slang-2.3.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1728 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_package)
NOTE: Running task 1729 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_populate_sysroot)
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe slang-2.3.3-r0: task do_package: Started
NOTE: recipe slang-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1730 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnewt-0.52.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnewt-0.52.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1731 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_configure)
NOTE: recipe libnewt-0.52.24-r0: task do_configure: Started
NOTE: recipe slang-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 1732 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_packagedata)
NOTE: recipe slang-2.3.3-r0: task do_packagedata: Started
NOTE: recipe slang-2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1733 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/slang/slang_2.3.3.bb:do_create_spdx)
NOTE: recipe slang-2.3.3-r0: task do_create_spdx: Started
NOTE: recipe slang-2.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1734 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_collect_spdx_deps)
NOTE: recipe libnewt-0.52.24-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_compile)
NOTE: recipe libnewt-0.52.24-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnewt-0.52.24-r0: task do_compile: Started
NOTE: recipe libnewt-0.52.24-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_install)
NOTE: recipe libnewt-0.52.24-r0: task do_install: Started
NOTE: recipe libnewt-0.52.24-r0: task do_install: Succeeded
NOTE: Running task 1737 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_package)
NOTE: Running task 1738 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_populate_sysroot)
NOTE: recipe libnewt-0.52.24-r0: task do_populate_sysroot: Started
NOTE: recipe libnewt-0.52.24-r0: task do_package: Started
NOTE: recipe libnewt-0.52.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_package: Succeeded
NOTE: Running task 1739 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_packagedata)
NOTE: recipe libnewt-0.52.24-r0: task do_packagedata: Started
NOTE: recipe libnewt-0.52.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1740 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_create_spdx)
NOTE: Running task 1741 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_package_write_rpm)
NOTE: Running task 1742 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_package_qa)
NOTE: recipe libnewt-0.52.24-r0: task do_create_spdx: Started
NOTE: recipe libnewt-0.52.24-r0: task do_package_write_rpm: Started
NOTE: recipe libnewt-0.52.24-r0: task do_package_qa: Started
NOTE: recipe libnewt-0.52.24-r0: task do_create_spdx: Succeeded
NOTE: Running task 1743 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_create_runtime_spdx)
NOTE: recipe libnewt-0.52.24-r0: task do_package_qa: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_create_runtime_spdx: Started
NOTE: recipe libnewt-0.52.24-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libnewt-0.52.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1744 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/newt/libnewt_0.52.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1744 tasks of which 1686 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-src went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dbg went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-staticdev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-dev went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-doc went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2-locale went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package libnsl2 went backwards which would break package feeds (from 0:2.0.1-r0 to 0:2.0.0-r0) [version-going-backwards]
ERROR: libnsl2-2.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.4-r0 to 0:1.3.3-r0) [version-going-backwards]
ERROR: libtirpc-1.3.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8735246718223083505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libnewt/libnewt: FILELIST: removed "/usr/lib/libnewt.so.0.52.23", added "/usr/lib/libnewt.so.0.52.24"
Changes to packages/core2-64-poky-linux/libnewt (sysroot):
  /usr/lib/libnewt.so.0.52 changed symlink target from libnewt.so.0.52.23 to libnewt.so.0.52.24
  /usr/lib/libnewt.so.0.52.23 moved to /usr/lib/libnewt.so.0.52.24

--===============8735246718223083505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnewt-upgrade-0.52.23-0.52.24.patch"

RnJvbSA4NmY3YjY4OTUyMjYwNTQwODU1MjQyNzc0MDRjNmY3NTU1OWYzZmQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMTozOTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5ld3Q6IHVwZ3JhZGUgMC41Mi4yMyAtPiAwLjUyLjI0CgotLS0KIC4uLi9uZXd0L3tsaWJuZXd0
XzAuNTIuMjMuYmIgPT4gbGlibmV3dF8wLjUyLjI0LmJifSAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9uZXd0L3tsaWJuZXd0XzAuNTIuMjMuYmIgPT4gbGlibmV3dF8wLjUy
LjI0LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9uZXd0L2xp
Ym5ld3RfMC41Mi4yMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9uZXd0L2xpYm5ld3RfMC41
Mi4yNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbmV3dC9saWJuZXd0XzAuNTIuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9uZXd0L2xpYm5ld3RfMC41Mi4yNC5iYgppbmRleCBjZDM3MzFjZjc0Li4xZTM5YTFjNWNh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbmV3dC9saWJuZXd0XzAuNTIuMjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL25ld3QvbGlibmV3dF8wLjUyLjI0LmJiCkBA
IC0yMyw3ICsyMyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9yZWxlYXNlcy5wYWd1cmUub3JnL25l
d3QvbmV3dC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1kZXRlY3QtZ29s
ZC1hcy1HTlUtbGlua2VyLXRvby5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNhYTM3MjkwN2IxNGVjZWNmZTI5OGYwZDUxMmE2MmY0MWQzM2IyOTA2MTAyNDRh
NThhZWQwN2JiYzVhZGExMmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWRlZDdlMjIxZjg1ZjY0
MjUyMWM0OWIxODI2YzhkZTE5ODQ1YWEzNzJiYWY1ZDYzMGE1MTc3NGI1NDRmYmRiYiIKIAogUyA9
ICIke1dPUktESVJ9L25ld3QtJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============8735246718223083505==--

