Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAECF013D4
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28962.1773582108948342332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OqBB1NGk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cemv7lxm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb8947-66d16b2d-55c6-4a0e-afb7-c7d9cd5f8a21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FHijo3Ne5zUgZk8L3YyolE47OqfyQfiVQd0nQWFwj0g=;
	b=OqBB1NGkZLacbrvYdw4O1aAZbp4yoTDxpEkzn5UfozWZ+ha8hkPz27oxLdYkC+rS
	EBtOEtHFx9a8CgZLvSZ389Gjo283tHRqZlxujGyfIxKwrlxoFS9KlR7SYnbc4u7GUmz
	RUrD1wFkW6bFDnhcfI0Dcb7egwpBTodlF7BK3z9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FHijo3Ne5zUgZk8L3YyolE47OqfyQfiVQd0nQWFwj0g=;
	b=Cemv7lxmS1XwSx6rw9FRo6rYyas4pPPOTDrtD7zVn2txousWxg07rNkiP+vDDePf
	HiLN15NvYXuRxCPCOuwNOTBvZKuGdKBRbjc4gOfSqTUFQdUx+lRMjNnQdim9jqWClg6
	2XGbPgpmveEluaQXtYm2bkfQWZcU9w9O+2xIOKUY=
Content-Type: multipart/mixed; boundary="===============4222160715511264839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkeyboard-config: upgrading to 2.47 SUCCEEDED
Message-ID: <0101019cf1bb8947-66d16b2d-55c6-4a0e-afb7-c7d9cd5f8a21-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233179

--===============4222160715511264839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkeyboard-config* to *2.47* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkeyboard-config-upgrade-2.46-2.47.patch
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
From f87e52cc17295bbb2cfd37c1ff6bc663dde6b1f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 11:01:12 +0000
Subject: [PATCH] xkeyboard-config: upgrade 2.46 -> 2.47

---
 .../{xkeyboard-config_2.46.bb => xkeyboard-config_2.47.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.46.bb => xkeyboard-config_2.47.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
index cfefa53a0f..cbca31fd62 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "10c58218fb60d08fb1f7b30304deb3ba47613195aa8a08a81f1972775ccc3640"
+SRC_URI[sha256sum] = "e59984416a72d58b46a52bfec1b1361aa7d84354628227ee2783626c7a6db6b6"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.47.1


--===============4222160715511264839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xkeyboard-config: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config: SRC_URI changed from "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.46.tar.xz" to "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.47.tar.xz"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dev: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dev: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-doc: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGSIZE changed from 219508 to 220840 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGSIZE changed from 227964 to 229392 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGSIZE changed from 179328 to 179538 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGSIZE changed from 189544 to 189826 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGSIZE changed from 189606 to 189870 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fa: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fa: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGSIZE changed from 190486 to 190708 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGSIZE changed from 181466 to 182590 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGSIZE changed from 179416 to 181096 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGSIZE changed from 203588 to 203808 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGSIZE changed from 175954 to 176830 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGSIZE changed from 258428 to 260466 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGSIZE changed from 192072 to 193280 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGSIZE changed from 182686 to 182890 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGSIZE changed from 179428 to 179640 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGSIZE changed from 186254 to 186462 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGSIZE changed from 185496 to 185688 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGSIZE changed from 178838 to 179570 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGSIZE changed from 219206 to 220338 (+1%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGSIZE changed from 181840 to 182046 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGSIZE changed from 181770 to 181990 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGSIZE changed from 223106 to 223312 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGSIZE changed from 184790 to 185004 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-src: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-src: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PKGV changed from 2.46 [default] to 2.47 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PV changed from "2.46" to "2.47"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PKGSIZE changed from 3320515 to 3332718 (+0%)

--===============4222160715511264839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkeyboard-config-upgrade-2.46-2.47.patch"

RnJvbSBmODdlNTJjYzE3Mjk1YmJiMmNmZDM3YzFmZjZiYzY2M2RkZTZiMWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTE6MDE6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2V5Ym9hcmQtY29uZmlnOiB1cGdyYWRlIDIuNDYgLT4gMi40NwoKLS0tCiAuLi4ve3hrZXlib2Fy
ZC1jb25maWdfMi40Ni5iYiA9PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDcuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi40Ni5iYiA9
PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDcuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3hrZXlib2FyZC1jb25maWdfMi40Ni5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5Ym9hcmQtY29uZmlnXzIuNDcuYmIKc2ltaWxhcml0
eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hr
ZXlib2FyZC1jb25maWdfMi40Ni5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3hrZXlib2FyZC1jb25maWdfMi40Ny5iYgppbmRleCBjZmVmYTUzYTBmLi5jYmNhMzFm
ZDYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGtleWJvYXJk
LWNvbmZpZ18yLjQ2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5
Ym9hcmQtY29uZmlnXzIuNDcuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5TRSA9ICJNSVQgJiBN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mYWE3NTZlMDQwNTMw
MjlkZGM2MDJjYWY5OWU1ZWYxZCIKIAogU1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlk
dWFsL2RhdGEveGtleWJvYXJkLWNvbmZpZy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjEwYzU4MjE4ZmI2MGQwOGZiMWY3YjMwMzA0ZGViM2JhNDc2MTMxOTVhYThh
MDhhODFmMTk3Mjc3NWNjYzM2NDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTU5OTg0NDE2YTcy
ZDU4YjQ2YTUyYmZlYzFiMTM2MWFhN2Q4NDM1NDYyODIyN2VlMjc4MzYyNmM3YTZkYjZiNiIKIAog
U0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAidXRpbC1tYWNyb3MgbGlieHNsdC1uYXRp
dmUiCi0tIAoyLjQ3LjEKCg==

--===============4222160715511264839==--

