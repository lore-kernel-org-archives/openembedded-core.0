Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45007C47DB7
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4577.1704114718934477994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OC5whlV6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FKbr0u41;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc5270d62-7abab1ea-390e-4313-860a-458e425c85e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tBk82gwR1jsMrIcxAbR9f2CbsL4KdSWEWHww1ExnEYA=;
	b=OC5whlV6mPeLVz9mYZ2g4OsKPThBQBTp7HGmQQuqlBeHYAQ5naRupJHGkI6IznXX
	wY28u5dK6NNRbNTIUGC23UE1SaNWG3OZ74nJLHF2v5cB92C+K/pfO0nCiBKgdzsLpn/
	Gy+sJqhNvhUZ825bziKjMxS8Qh2/gKGbZW0mN+mo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tBk82gwR1jsMrIcxAbR9f2CbsL4KdSWEWHww1ExnEYA=;
	b=FKbr0u41gRDfh3sBfTf7OnfWPub1kedgurDUBbcNzCD2R+EOmdyUyH1GgwWlQkYr
	rL3fghPQnHZFBbBGDJPWeVyEZlrp6Y3yOUsgdSg4Bc6vo76OFwCSe+5jzGwtllu7SFk
	Abag+4PWboVUcTTsQbp4i9GpGegAJrs5hYYx/+Uk=
Content-Type: multipart/mixed; boundary="===============3104480272594749573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsecret: upgrading to 0.21.2 SUCCEEDED
Message-ID: <0101018cc5270d62-7abab1ea-390e-4313-860a-458e425c85e8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193168

--===============3104480272594749573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsecret* to *0.21.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.21.1-0.21.2.patch
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
From 2496eb44e914f27885a6d59449d376a5c6264bfb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 09:21:23 +0000
Subject: [PATCH] libsecret: upgrade 0.21.1 -> 0.21.2

---
 .../libsecret/{libsecret_0.21.1.bb => libsecret_0.21.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.1.bb => libsecret_0.21.2.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
index f762d7c343..2d8ea952c5 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "674f51323a5f74e4cb7e3277da68b5afddd333eca25bc9fd2d820a92972f90b1"
+SRC_URI[archive.sha256sum] = "e4a341496a0815e64c8d3b8fabab33d7bae7efdeab77b843669731d5b181dcee"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.42.0


--===============3104480272594749573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsecret: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret: SRC_URI changed from "https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.1.tar.xz;name=archive" to "https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.2.tar.xz;name=archive"
packages/core2-64-poky-linux/libsecret: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PKGSIZE changed from 1175720 to 1185384 (+1%)
packages/core2-64-poky-linux/libsecret/libsecret-dev: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-dev: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-dev: PKGSIZE changed from 669619 to 673348 (+1%)
packages/core2-64-poky-linux/libsecret/libsecret-doc: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-doc: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ab: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ab: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-an: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-an: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ar: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ar: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-as: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-as: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-be: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-be: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-bg: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-bg: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-bs: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-bs: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca+valencia: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca+valencia: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ckb: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ckb: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-cs: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-cs: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-da: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-da: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-de: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-de: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-el: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-el: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-en-gb: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-en-gb: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-eo: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-eo: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-eo: PKGSIZE changed from 1528 to 1551 (+2%)
packages/core2-64-poky-linux/libsecret/libsecret-locale-es: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-es: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-eu: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-eu: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fa: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fa: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fi: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fi: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fr: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fr: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fur: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fur: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-gl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-gl: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-he: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-he: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-hr: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-hr: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-hu: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-hu: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-id: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-id: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ie: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ie: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-it: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-it: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ja: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ja: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ka: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ka: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-kk: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-kk: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ko: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ko: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-lt: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-lt: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-lv: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-lv: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ml: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ml: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ms: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ms: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-nb: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-nb: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ne: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ne: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-nl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-nl: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-oc: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-oc: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pa: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pa: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pl: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt-br: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt-br: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ro: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ro: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ru: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ru: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sk: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sk: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sl: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sl: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr+latin: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr+latin: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sv: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sv: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-tg: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-tg: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-tr: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-tr: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-uk: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-uk: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-vi: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-vi: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-cn: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-cn: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-hk: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-hk: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-tw: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-tw: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-src: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-src: FILELIST: directory renamed /usr/src/debug/libsecret/0.21.1/tool -> /usr/src/debug/libsecret/0.21.2/tool, directory renamed /usr/src/debug/libsecret/0.21.1/libsecret -> /usr/src/debug/libsecret/0.21.2/libsecret, removed "/usr/src/debug/libsecret/0.21.1/egg/egg-hkdf.h /usr/src/debug/libsecret/0.21.1/egg/egg-secure-memory.c /usr/src/debug/libsecret/0.21.1/egg/egg-dh.h /usr/src/debug/libsecret/0.21.1/egg/egg-dh.c /usr/src/debug/libsecret/0.21.1/egg/egg-hkdf.c /usr/src/debug/libsecret/0.21.1/egg/egg-secure-memory.h /usr/src/debug/libsecret/0.21.1/egg/egg-libgcrypt.h /usr/src/debug/libsecret/0.21.1/egg/egg-libgcrypt.c", added "/usr/src/debug/libsecret/0.21.2/egg/egg-hkdf.h /usr/src/debug/libsecret/0.21.2/egg/egg-secure-memory.c /usr/src/debug/libsecret/0.21.2/egg/egg-dh.h /usr/src/debug/libsecret/0.21.2/egg/egg-dh.c /usr/src/debug/libsecret/0.21.2/egg/egg-secure-memory.h /usr/src/debug/libsecret/0.21.2/egg/egg-keyring1-libgcrypt.c /usr
 /src/debug/libsecret/0.21.2/egg/egg-dh-libgcrypt.c /usr/src/debug/libsecret/0.21.2/egg/egg-libgcrypt.h /usr/src/debug/libsecret/0.21.2/egg/egg-hkdf-libgcrypt.c /usr/src/debug/libsecret/0.21.2/egg/egg-keyring1.h /usr/src/debug/libsecret/0.21.2/egg/egg-libgcrypt.c"
packages/core2-64-poky-linux/libsecret/libsecret-src: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret-src: PKGSIZE changed from 1165377 to 1177829 (+1%)
packages/core2-64-poky-linux/libsecret/libsecret-staticdev: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret-staticdev: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret: PKGV changed from 0.21.1 [default] to 0.21.2 [default]
packages/core2-64-poky-linux/libsecret/libsecret: PV changed from "0.21.1" to "0.21.2"
packages/core2-64-poky-linux/libsecret/libsecret: PKGSIZE changed from 435568 to 440068 (+1%)

--===============3104480272594749573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.21.1-0.21.2.patch"

RnJvbSAyNDk2ZWI0NGU5MTRmMjc4ODVhNmQ1OTQ0OWQzNzZhNWM2MjY0YmZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwOToyMToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNlY3JldDogdXBncmFkZSAwLjIxLjEgLT4gMC4yMS4yCgotLS0KIC4uLi9saWJzZWNyZXQve2xp
YnNlY3JldF8wLjIxLjEuYmIgPT4gbGlic2VjcmV0XzAuMjEuMi5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJzZWNyZXQve2xpYnNlY3JldF8wLjIxLjEuYmIgPT4gbGlic2VjcmV0
XzAuMjEuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2Vj
cmV0L2xpYnNlY3JldF8wLjIxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xp
YnNlY3JldF8wLjIxLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRfMC4yMS4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNlY3JldF8wLjIxLjIuYmIKaW5kZXggZjc2MmQ3
YzM0My4uMmQ4ZWE5NTJjNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3Jl
dC9saWJzZWNyZXRfMC4yMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQv
bGlic2VjcmV0XzAuMjEuMi5iYgpAQCAtMTMsNyArMTMsNyBAQCBpbmhlcml0IGdub21lYmFzZSBn
aS1kb2NnZW4gdmFsYSBnb2JqZWN0LWludHJvc3BlY3Rpb24gbWFucGFnZXMKIAogREVQRU5EUyAr
PSAiZ2xpYi0yLjAgbGliZ2NyeXB0IGdldHRleHQtbmF0aXZlIgogCi1TUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9ICI2NzRmNTEzMjNhNWY3NGU0Y2I3ZTMyNzdkYTY4YjVhZmRkZDMzM2VjYTI1
YmM5ZmQyZDgyMGE5Mjk3MmY5MGIxIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTRh
MzQxNDk2YTA4MTVlNjRjOGQzYjhmYWJhYjMzZDdiYWU3ZWZkZWFiNzdiODQzNjY5NzMxZDViMTgx
ZGNlZSIKIAogR1RLRE9DX01FU09OX09QVElPTiA9ICdndGtfZG9jJwogCi0tIAoyLjQyLjAKCg==

--===============3104480272594749573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (0 cached, 913 parsed). 1848 targets, 49 skipped, 0 masked, 0 errors.
Removing 95 recipes from the core2-64 sysroot...done.
Removing 100 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b2c69f8cab09d38c42f07f52ec1ec9372b7a33be"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b2c69f8cab09d38c42f07f52ec1ec9372b7a33be"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 302 Local 286 Mirrors 0 Missed 16 Current 242 (94% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 262 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 736 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_recipe_qa)
NOTE: Running task 746 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_write_config)
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe libsecret-0.21.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 327 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_recipe_qa unihash changed to c596c690deae016dfc1e0674016dfa300e89e425f8af1fb5603da28f41fa4dd8
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 349 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 362 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running task 782 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: Running task 783 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 786 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: Running setscene task 372 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 377 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.21.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 386 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 391 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 399 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 400 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 401 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 412 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 416 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 544 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.4/temp/log.do_packagedata_setscene.1697220
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: Running task 950 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: Running task 957 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 960 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.21.2-r0: task do_populate_lic: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_populate_lic unihash changed to 87da44e6e47bce51fcddc305484354fa5907d2d6c5db81bbb1fcca5381b200bc
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_deploy_source_date_epoch unihash changed to 761cab599161457a1f210b02a1ddf3bc09f41530ec5ac5aa3b686ecca028c172
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 445 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 475 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 499 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 535 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 544 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1436 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata)
NOTE: Running task 1512 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_collect_spdx_deps)
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_configure)
NOTE: recipe vala-0.56.13-r0: task do_configure: Started
NOTE: recipe vala-0.56.13-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_compile)
NOTE: recipe vala-0.56.13-r0: task do_compile: Started
NOTE: recipe vala-0.56.13-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_install)
NOTE: recipe vala-0.56.13-r0: task do_install: Started
NOTE: recipe vala-0.56.13-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package)
NOTE: Running task 1527 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.13-r0: task do_package: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1528 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_configure)
NOTE: recipe libsecret-0.21.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.13-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 1544 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb:do_compile)
NOTE: recipe libsecret-0.21.2-r0: task do_compile: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Failed
NOTE: recipe libsecret-0.21.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1531 tasks of which 1509 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101092012.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101092012.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata
Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.5-r0 to 0:5.4.4-r0) [version-going-backwards]
ERROR: xz-5.4.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata.1715181
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata) failed with exit code '1'

--===============3104480272594749573==--

