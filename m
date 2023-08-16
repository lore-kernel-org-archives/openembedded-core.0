Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6B5C2FC20
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.173806.1692224344387589699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TI+HjfZE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QVgdy169;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e672a-00522951-5eeb-451a-b6aa-92e880676b37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lZ6uUp7QFY0SdctZJtWiYPOG5dKvpaLVBXuK8YFmH2Y=;
	b=TI+HjfZEXr9Z5EvkOvEK/ufMQVm6C0naTZRIK1O57kMBcILtgr92D7jTBwZXT6Au
	mULizozP1M02gxub/E1/Q2GlMsT2Z0BFO5N9T74dFCZvTvZ5EaowudsIf2RL/w1bwGF
	lYN8Rh7trKmUMiaZa/JhhF8P9BqPHAxyMfzE4YcQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lZ6uUp7QFY0SdctZJtWiYPOG5dKvpaLVBXuK8YFmH2Y=;
	b=QVgdy169grlaryubzu+WG28uxGMmCROILw1IcSjnKiBhPaNfzNI0GHFdObQ5Byl1
	V/SsHV3YzSKUj6VEPtBqSu5bgTBiVTZaJXLs5kQ6yofdyqLzyPalKnGrE7FaLpvMUmf
	MLVQ/UvPo/F04TYJrclL6DzhjzirISQWyGnCN/Xg=
Content-Type: multipart/mixed; boundary="===============7808859641148856997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsecret: upgrading to 0.21.0 SUCCEEDED
Message-ID: <0101018a006e672a-00522951-5eeb-451a-b6aa-92e880676b37-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186210

--===============7808859641148856997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsecret* to *0.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsecret-upgrade-0.20.5-0.21.0.patch
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
From f9a2c76b97b3077e276697828958b5c8f2236c86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 12:07:33 +0000
Subject: [PATCH] libsecret: upgrade 0.20.5 -> 0.21.0

---
 .../libsecret/{libsecret_0.20.5.bb => libsecret_0.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.5.bb => libsecret_0.21.0.bb} (91%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
similarity index 91%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
index 9b09c3bee4..8f560f9f39 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.0.bb
@@ -14,7 +14,7 @@ inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI[archive.sha256sum] = "3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d"
+SRC_URI[archive.sha256sum] = "2735b29d1cc0e5b12ba90bee88bd21774ac8db4ae1a4b716f46c409c19a14613"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.39.2


--===============7808859641148856997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsecret: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret: PACKAGES: added "libsecret-locale-ie libsecret-locale-ka"
packages/core2-32-poky-linux/libsecret: SRC_URI changed from "https://download.gnome.org/sources//libsecret/0.20/libsecret-0.20.5.tar.xz;name=archive" to "https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.0.tar.xz;name=archive"
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-dbg: PKGSIZE changed from 834796 to 834416 (-0%)
packages/core2-32-poky-linux/libsecret/libsecret-dev: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-dev: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-dev: PKGSIZE changed from 669692 to 669619 (-0%)
packages/core2-32-poky-linux/libsecret/libsecret-doc: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-doc: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ab: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ab: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-an: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-an: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ar: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ar: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-as: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-as: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-be: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PKGSIZE changed from 1574 to 1740 (+11%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-bs: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-bs: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca+valencia: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca+valencia: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ca: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ckb: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ckb: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-cs: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-cs: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-da: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-de: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-de: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-el: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-el: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-en-gb: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-en-gb: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-eo: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-eo: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-es: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-es: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-eu: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-eu: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fa: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fa: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fi: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fi: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fr: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fr: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-fur: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-fur: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-gl: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-he: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-he: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-hr: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-hr: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-hu: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-hu: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-id: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-id: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-it: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ja: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ja: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-kk: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-kk: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ko: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ko: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-lt: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-lt: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-lv: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-lv: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ml: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ml: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ms: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ms: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-nb: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-nb: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ne: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ne: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ne: PKGSIZE changed from 1961 to 2030 (+4%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-nl: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-nl: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-oc: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-oc: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pa: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pa: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pl: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pl: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt-br: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt-br: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-pt: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ro: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ro: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-ru: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-ru: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sk: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sk: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sl: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sl: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr+latin: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr+latin: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sr: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-sv: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-sv: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-tg: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-tg: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-tr: PKGSIZE changed from 1519 to 1517 (-0%)
packages/core2-32-poky-linux/libsecret/libsecret-locale-uk: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-uk: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-vi: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-vi: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-cn: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-cn: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-hk: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-hk: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-locale-zh-tw: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-src: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-src: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret-src: PKGSIZE changed from 1133217 to 1136026 (+0%)
packages/core2-32-poky-linux/libsecret/libsecret-staticdev: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret-staticdev: PKGV changed from 0.20.5 [default] to 0.21.0 [default]
packages/core2-32-poky-linux/libsecret/libsecret: PV changed from "0.20.5" to "0.21.0"
packages/core2-32-poky-linux/libsecret/libsecret: PKGV changed from 0.20.5 [default] to 0.21.0 [default]

--===============7808859641148856997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsecret: PACKAGES: added "libsecret-locale-ka libsecret-locale-ie"
packages/core2-32-poky-linux/libsecret/libsecret-locale-bg: PKGSIZE changed from 1574 to 1740 (+11%)

--===============7808859641148856997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsecret-upgrade-0.20.5-0.21.0.patch"

RnJvbSBmOWEyYzc2Yjk3YjMwNzdlMjc2Njk3ODI4OTU4YjVjOGYyMjM2Yzg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTI6MDc6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZWNyZXQ6IHVwZ3JhZGUgMC4yMC41IC0+IDAuMjEuMAoKLS0tCiAuLi4vbGlic2VjcmV0L3ts
aWJzZWNyZXRfMC4yMC41LmJiID0+IGxpYnNlY3JldF8wLjIxLjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L3tsaWJzZWNyZXRfMC4yMC41LmJiID0+IGxpYnNlY3Jl
dF8wLjIxLjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNl
Y3JldC9saWJzZWNyZXRfMC4yMC41LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9s
aWJzZWNyZXRfMC4yMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0XzAuMjAuNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRfMC4yMS4wLmJiCmluZGV4IDliMDlj
M2JlZTQuLjhmNTYwZjlmMzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNy
ZXQvbGlic2VjcmV0XzAuMjAuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0
L2xpYnNlY3JldF8wLjIxLjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgaW5oZXJpdCBnbm9tZWJhc2Ug
Z2ktZG9jZ2VuIHZhbGEgZ29iamVjdC1pbnRyb3NwZWN0aW9uIG1hbnBhZ2VzCiAKIERFUEVORFMg
Kz0gImdsaWItMi4wIGxpYmdjcnlwdCBnZXR0ZXh0LW5hdGl2ZSIKIAotU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiM2ZiM2NlMzQwZmNkN2RiNTRkODdjODkzZTY5YmZjMmIxZjZlNGQ0YjI3
OTA2NWZmZTY2ZGFjOWYwZmQxMmI0ZCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjI3
MzViMjlkMWNjMGU1YjEyYmE5MGJlZTg4YmQyMTc3NGFjOGRiNGFlMWE0YjcxNmY0NmM0MDljMTlh
MTQ2MTMiCiAKIEdUS0RPQ19NRVNPTl9PUFRJT04gPSAnZ3RrX2RvYycKIAotLSAKMi4zOS4yCgo=

--===============7808859641148856997==--

