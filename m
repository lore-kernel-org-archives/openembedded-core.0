Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1D4C001DB
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8661.1698848704882857423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MUr4bHAf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OYTDq6lz;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460f60-1a70b6e9-b729-4b40-8995-6268359056e3-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9B/whyOCOlfWYhRsTHl1k1ohZNGq4tvhyLUkvrV1xQ0=;
	b=MUr4bHAfYyKo7C0WNXfegtGcOs9fTl+rp2rq/tdQeMrC+UtTkg/HnAc0Yr7qf0et
	18IEZqpGhy51TuaKIVLqrR0Yvai7MQDDfd6NbTZLQ0bIWNQjXJrR7QcwZZL57+AASQC
	1xt0u4ufuCl2x5GdNmZwSZYbv7yUYPZX00fwHs/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9B/whyOCOlfWYhRsTHl1k1ohZNGq4tvhyLUkvrV1xQ0=;
	b=OYTDq6lzbUbI5jWwexfGO+l5yhcu8F9Px9/rOlJC3UAZSXJUJVSIjrHBcQaZ2xML
	l41zSbK3Ah9+oYrzWbZQ7ZRNpISgLfxz6VCQE9ituxjfMcaDDGRa3BpLZd7/F/QDqAE
	QmUL/LWPgK8/DcFnU8up3a5hAJVRezzGezxSRLR0=
Content-Type: multipart/mixed; boundary="===============7194911522128142415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.4.4 SUCCEEDED
Message-ID: <0101018b8b460f60-1a70b6e9-b729-4b40-8995-6268359056e3-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190038

--===============7194911522128142415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.4.2-3.4.4.patch
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
From f03db61e5fa31d4ed2e69e14f604008d94bed6d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:14:47 +0000
Subject: [PATCH] libsoup: upgrade 3.4.2 -> 3.4.4

---
 .../libsoup/{libsoup_3.4.2.bb => libsoup_3.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.4.2.bb => libsoup_3.4.4.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.2.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.4.2.bb
rename to meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 3996ae6836..6d382a7852 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3"
+SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.39.2


--===============7194911522128142415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsoup: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.2.tar.xz" to "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.4.tar.xz"
packages/core2-64-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-dbg: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 2191048 to 2197872 (+0%)
packages/core2-64-poky-linux/libsoup/libsoup-dbg: FILELIST: removed "/usr/lib/.debug/libsoup-3.0.so.0.7.0", added "/usr/lib/.debug/libsoup-3.0.so.0.7.1"
packages/core2-64-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-dev: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-doc: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-eo: PKGSIZE changed from 2241 to 3945 (+76%)
packages/core2-64-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-tr: PKGSIZE changed from 4076 to 4074 (-0%)
packages/core2-64-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-src: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-src: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1770462 to 1778841 (+0%)
packages/core2-64-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup: PKGV changed from 3.4.2 [default] to 3.4.4 [default]
packages/core2-64-poky-linux/libsoup/libsoup: PV changed from "3.4.2" to "3.4.4"
packages/core2-64-poky-linux/libsoup/libsoup: PKGSIZE changed from 671112 to 675208 (+1%)
packages/core2-64-poky-linux/libsoup/libsoup: FILELIST: removed "/usr/lib/libsoup-3.0.so.0.7.0", added "/usr/lib/libsoup-3.0.so.0.7.1"
Changes to packages/core2-64-poky-linux/libsoup (sysroot):
  /usr/lib/libsoup-3.0.so.0 changed symlink target from libsoup-3.0.so.0.7.0 to libsoup-3.0.so.0.7.1
  /usr/lib/libsoup-3.0.so.0.7.0 moved to /usr/lib/libsoup-3.0.so.0.7.1

--===============7194911522128142415==
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
DISTRO_VERSION       = "4.3+snapshot-68a9df13f33b782acb2fea875f616f460c72ce8d"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:68a9df13f33b782acb2fea875f616f460c72ce8d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 35 Mirrors 0 Missed 31 Current 553 (53% match, 94% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1368 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 1387 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_recipe_qa)
NOTE: Running task 1410 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa)
NOTE: Running task 1431 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 1462 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa)
NOTE: Running task 1534 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: Running task 1618 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1620 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: Running task 1621 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_fetch)
NOTE: Running task 1622 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1623 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 1680 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1681 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_unpack)
NOTE: Running task 1682 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 1683 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: Running task 1685 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 1686 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: Running task 1687 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1688 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_unpack: Succeeded
NOTE: Running task 1689 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_patch)
NOTE: Running task 1690 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_collect_spdx_deps)
NOTE: Running task 1694 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 1698 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1699 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1700 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_lic)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_patch: Succeeded
NOTE: Running task 1701 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_generate_toolchain_file)
NOTE: Running task 1702 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: Running task 1704 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1705 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1706 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.57.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1707 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 1711 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1712 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1714 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 1715 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe nghttp2-1.57.0-r0: task do_configure: Succeeded
NOTE: Running task 1716 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe nghttp2-1.57.0-r0: task do_compile: Started
NOTE: Running task 1717 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_install)
NOTE: recipe nghttp2-1.57.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_package)
NOTE: Running task 1720 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe nghttp2-1.57.0-r0: task do_package: Succeeded
NOTE: Running task 1722 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 1723 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1724 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_create_spdx)
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1724 tasks of which 1674 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata
Summary: There were 79 ERROR messages, returning a non-zero exit code.
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-src went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-dbg went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-ptest went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-staticdev went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-dev went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-doc went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ab went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-an went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ar went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-as went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-be went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bg went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bn-in went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-bs went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ca+valencia went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-cs went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-da went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-de went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-el went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-ca went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-en-gb went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eo went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-es went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-et went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-eu went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fa went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fi went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fr went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-fur went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gd went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gl went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-gu went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-he went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hi went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hr went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-hu went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-id went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-it went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ja went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ka went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kk went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-km went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-kn went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ko went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lt went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-lv went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ml went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-mr went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ms went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nb went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ne went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-nl went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-oc went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-or went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pa went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pl went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-pt-br went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ro went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ru went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sk went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sl went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sr+latin went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-sv went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ta went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-te went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tg went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-th went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-tr went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-ug went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-uk went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-vi went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-cn went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-hk went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: QA Issue: Package version for package glib-networking-locale-zh-tw went backwards which would break package feeds (from 0:2.78.0-r0 to 0:2.76.1-r0) [version-going-backwards]
ERROR: glib-networking-2.76.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-networking/2.76.1/temp/log.do_packagedata.3983537
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============7194911522128142415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libsoup/libsoup-locale-eo: PKGSIZE changed from 2241 to 3945 (+76%)
packages/core2-64-poky-linux/libsoup/libsoup: FILELIST: removed "/usr/lib/libsoup-3.0.so.0.7.0", added "/usr/lib/libsoup-3.0.so.0.7.1"
Changes to packages/core2-64-poky-linux/libsoup (sysroot):
  /usr/lib/libsoup-3.0.so.0 changed symlink target from libsoup-3.0.so.0.7.0 to libsoup-3.0.so.0.7.1
  /usr/lib/libsoup-3.0.so.0.7.0 moved to /usr/lib/libsoup-3.0.so.0.7.1

--===============7194911522128142415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.4.2-3.4.4.patch"

RnJvbSBmMDNkYjYxZTVmYTMxZDRlZDJlNjllMTRmNjA0MDA4ZDk0YmVkNmQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDoxNDo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvdXA6IHVwZ3JhZGUgMy40LjIgLT4gMy40LjQKCi0tLQogLi4uL2xpYnNvdXAve2xpYnNvdXBf
My40LjIuYmIgPT4gbGlic291cF8zLjQuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlic291cC97bGlic291cF8zLjQuMi5iYiA9PiBsaWJzb3VwXzMuNC40LmJi
fSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291
cF8zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjQuNC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNvdXAvbGlic291cF8zLjQuNC5iYgppbmRleCAzOTk2YWU2ODM2Li42ZDM4MmE3ODUyIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy40LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuNC40LmJiCkBAIC0xMiw3
ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxpYnhtbDIgc3Fs
aXRlMyBsaWJwc2wgbmdodHRwMiIKIFNIUlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19IgogCiBTUkNfVVJJID0g
IiR7R05PTUVfTUlSUk9SfS9saWJzb3VwLyR7U0hSVF9WRVJ9L2xpYnNvdXAtJHtQVn0udGFyLnh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4YzhmYTM3Y2IxNTJkNDBlYzhjNGExNDhkNjE1NWUy
ZjY5NDdmM2YxNjAyYTdjZGEzYTMxYWQ0MGY1ZWUyZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjkxYzY3NzI1ZjM2ZWQ5MGVhNDNlZmZmMjUwNjRiNjljNWEyZDE5ODE0ODg0NzdjMDVjNDgxYTNi
NGIwYzVhYSIKIAogUFJPVklERVMgPSAibGlic291cC0zLjAiCiBDVkVfUFJPRFVDVCA9ICJsaWJz
b3VwIgotLSAKMi4zOS4yCgo=

--===============7194911522128142415==--

