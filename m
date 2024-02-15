Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEDCC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.20183.1708018346910558543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dw5voQRU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EjofeJmW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a7b6-f8aa59e9-4532-467f-b0b5-aef83fd955c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7zI21H4kEVb04vpazTNin5eoVwXTIz5387uihHojDvU=;
	b=dw5voQRUYkKhBWDAABbZkiiVi8veTEzxEL83i4nVXKwx8+DhWM1wK1aYzJLs7ZxT
	LOjFJdNLieUspE5h9f8CRdf7QkUjGSfHpyZ5fAPvpLLeK7263LjV1hV65LRjL3J0OuP
	C4HhPPXboDrfMePY5LRv7fh3G+IL/wqfhOMbWOJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7zI21H4kEVb04vpazTNin5eoVwXTIz5387uihHojDvU=;
	b=EjofeJmWi5xiZK6gp1J0MKD+89u+7bXBvc9BaKK93dB58XbdqcueObPjpegvqoKY
	LPiGJGqkdBWcLJtJ3rBrUYoJI5ctxCRpnlSyQViux10/rWeNEdoFbtTOMPv0JktysB1
	BflbT3tA8RJB+4dDdIqFnkiHehh2HBRfDXLhHAVc=
Content-Type: multipart/mixed; boundary="===============8782909506385475337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsecret: upgrading to 0.21.3 SUCCEEDED
Message-ID: <0101018dadd3a7b6-f8aa59e9-4532-467f-b0b5-aef83fd955c4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195647

--===============8782909506385475337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsecret* to *0.21.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.21.2-0.21.3.patch
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
From 8232cfe971ac0e2fad1fb336356022c818f1ebae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 13:00:25 +0000
Subject: [PATCH] libsecret: upgrade 0.21.2 -> 0.21.3

---
 .../libsecret/{libsecret_0.21.2.bb => libsecret_0.21.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.21.2.bb => libsecret_0.21.3.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.3.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.3.bb
index 2d8ea952c5..66c522021e 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.3.bb
@@ -13,7 +13,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "e4a341496a0815e64c8d3b8fabab33d7bae7efdeab77b843669731d5b181dcee"
+SRC_URI[archive.sha256sum] = "9a3e2571f1048035d80238f52c8760125884a43baf8a580fedb7250c1ad0a9e7"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.42.0


--===============8782909506385475337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsecret: SRC_URI changed from "https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.2.tar.xz;name=archive" to "https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.3.tar.xz;name=archive"
packages/core2-64-poky-linux/libsecret: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PKGSIZE changed from 1185368 to 1185240 (-0%)
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-dbg: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-dev: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-dev: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-doc: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-doc: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ab: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ab: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-an: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-an: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ar: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ar: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-as: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-as: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-be: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-be: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-bg: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-bg: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-bs: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-bs: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca+valencia: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca+valencia: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ca: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ckb: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ckb: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-cs: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-cs: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-da: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-da: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-de: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-de: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-el: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-el: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-en-gb: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-en-gb: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-eo: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-eo: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-es: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-es: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-eu: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-eu: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fa: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fa: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fi: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fi: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fr: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fr: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-fur: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-fur: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-gl: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-gl: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-he: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-he: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-hr: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-hr: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-hu: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-hu: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-id: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-id: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ie: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ie: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-it: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-it: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ja: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ja: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ka: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ka: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-kk: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-kk: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ko: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ko: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-lt: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-lt: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-lv: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-lv: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ml: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ml: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ms: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ms: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-nb: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-nb: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ne: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ne: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-nl: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-nl: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-oc: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-oc: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pa: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pa: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pl: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pl: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt-br: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt-br: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-pt: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ro: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ro: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-ru: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-ru: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sk: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sk: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sl: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sl: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr+latin: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr+latin: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sr: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-sv: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-sv: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-tg: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-tg: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-tr: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-tr: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-uk: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-uk: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-vi: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-vi: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-cn: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-cn: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-hk: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-hk: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-tw: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-locale-zh-tw: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-src: PKGSIZE changed from 1177829 to 1178066 (+0%)
packages/core2-64-poky-linux/libsecret/libsecret-src: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-src: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret-staticdev: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret-staticdev: PKGV changed from 0.21.2 [default] to 0.21.3 [default]
packages/core2-64-poky-linux/libsecret/libsecret: PV changed from "0.21.2" to "0.21.3"
packages/core2-64-poky-linux/libsecret/libsecret: PKGV changed from 0.21.2 [default] to 0.21.3 [default]

--===============8782909506385475337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.21.2-0.21.3.patch"

RnJvbSA4MjMyY2ZlOTcxYWMwZTJmYWQxZmIzMzYzNTYwMjJjODE4ZjFlYmFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTM6MDA6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZWNyZXQ6IHVwZ3JhZGUgMC4yMS4yIC0+IDAuMjEuMwoKLS0tCiAuLi4vbGlic2VjcmV0L3ts
aWJzZWNyZXRfMC4yMS4yLmJiID0+IGxpYnNlY3JldF8wLjIxLjMuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L3tsaWJzZWNyZXRfMC4yMS4yLmJiID0+IGxpYnNlY3Jl
dF8wLjIxLjMuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNl
Y3JldC9saWJzZWNyZXRfMC4yMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9s
aWJzZWNyZXRfMC4yMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0XzAuMjEuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRfMC4yMS4zLmJiCmluZGV4IDJkOGVh
OTUyYzUuLjY2YzUyMjAyMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNy
ZXQvbGlic2VjcmV0XzAuMjEuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0
L2xpYnNlY3JldF8wLjIxLjMuYmIKQEAgLTEzLDcgKzEzLDcgQEAgaW5oZXJpdCBnbm9tZWJhc2Ug
Z2ktZG9jZ2VuIHZhbGEgZ29iamVjdC1pbnRyb3NwZWN0aW9uIG1hbnBhZ2VzCiAKIERFUEVORFMg
Kz0gImdsaWItMi4wIGxpYmdjcnlwdCBnZXR0ZXh0LW5hdGl2ZSIKIAotU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiZTRhMzQxNDk2YTA4MTVlNjRjOGQzYjhmYWJhYjMzZDdiYWU3ZWZkZWFi
NzdiODQzNjY5NzMxZDViMTgxZGNlZSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjlh
M2UyNTcxZjEwNDgwMzVkODAyMzhmNTJjODc2MDEyNTg4NGE0M2JhZjhhNTgwZmVkYjcyNTBjMWFk
MGE5ZTciCiAKIEdUS0RPQ19NRVNPTl9PUFRJT04gPSAnZ3RrX2RvYycKIAotLSAKMi40Mi4wCgo=

--===============8782909506385475337==--

