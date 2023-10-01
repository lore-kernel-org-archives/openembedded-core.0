Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF22E7848B
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.65012.1696183989899449159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ECQ9Ap67;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=igox75RA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018aec71bf81-94a71a90-4a12-4cbe-9a06-1ebc1365f4c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=17Za2RZF9f9yVZcU5nN14uO9buMjUYAMPyg4iEcpN6I=;
	b=ECQ9Ap67Z6Bq7CliMCoe9+PKdBhFjl7qmBmc/u7OW2UbpzHzx+Ka0g94e1FgVB2e
	rBR3rl4JlkXlD6MtOAkwDBJv78tobDqa+i8xYQKnK/aDgraVJfoe3O3MK1xcn1EY/JR
	YoS1tPOmNoYIgcnjIe2iagIQCqrgrbvXNg0px414=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=17Za2RZF9f9yVZcU5nN14uO9buMjUYAMPyg4iEcpN6I=;
	b=igox75RAoPWO4A0htoF/4QPvzUAnJU8kwdTKWQiA/FVUP90RTRuhlbUnlgBVAQvF
	01lA6/8b1jdjMxB/7scxAbBAZzkUROgEDosnHjZbRxsoQLApsz6tPDuP6AYJGE8MmI3
	Z+bs8bgwY3TYhH1fEJSpzyDOgof5+au7v8FNzeTg=
Content-Type: multipart/mixed; boundary="===============0649207548315228354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.4.3 SUCCEEDED
Message-ID: <0101018aec71bf81-94a71a90-4a12-4cbe-9a06-1ebc1365f4c2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188585

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.4.2-3.4.3.patch
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
From 64386a1909e839732707ba2bff6e23f8b4effed6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 18:06:00 +0000
Subject: [PATCH] libsoup: upgrade 3.4.2 -> 3.4.3

---
 .../libsoup/{libsoup_3.4.2.bb => libsoup_3.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.4.2.bb => libsoup_3.4.3.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.2.bb b/meta/recipes-support/libsoup/libsoup_3.4.3.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.4.2.bb
rename to meta/recipes-support/libsoup/libsoup_3.4.3.bb
index 3996ae6836..4e0d651a27 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3"
+SRC_URI[sha256sum] = "b7f1bbaeeb43f5812daba3ee258a72e1b4b14c2fd91f4a1a75d4eea10dcf288f"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.39.2


--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.2.tar.xz" to "https://download.gnome.org/sources//libsoup/3.4/libsoup-3.4.3.tar.xz"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1756744 to 1762380 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGSIZE changed from 4076 to 4074 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1770462 to 1780396 (+1%)
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.4.2" to "3.4.3"
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.4.2 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.4.2" to "3.4.3"

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 42 Mirrors 0 Missed 23 Current 664 (64% match, 96% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 1481 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 1512 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_recipe_qa)
NOTE: Running task 1574 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1575 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: Running task 1576 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_fetch)
NOTE: Running task 1706 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_write_config)
NOTE: Running task 1750 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1986 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_unpack)
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Started
NOTE: Running task 1987 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: Running task 1988 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 1989 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: Running task 1990 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_patch)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1992 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1995 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1996 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: Running task 1997 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: Running task 1998 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4efe0923fdf84ab962f1d152997314acb2fb28e00680a8149c544bc5fdcd305a
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5339aca9e47bec61a99da666aee686851063e3a76b9253d6a6c82553ae0f493a
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2021 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2023 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2026 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_compile)
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2029 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2031 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2033 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-networking/2.76.1/temp/log.do_packagedata.2931176
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 55 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 42 Mirrors 0 Missed 23 Current 664 (64% match, 96% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 1481 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 1512 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_recipe_qa)
NOTE: Running task 1574 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1575 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: Running task 1576 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_fetch)
NOTE: Running task 1706 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_write_config)
NOTE: Running task 1750 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Started
NOTE: Running task 1986 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 1987 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: Running task 1988 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 1989 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: Running task 1990 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: Running task 1993 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1995 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1996 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Started
NOTE: Running task 1997 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ca904cc12661e9ff90c127b846ed13e446994b8ea6f02608921a9a3e91322e85
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 211e462a1e5567354a6419194e4f8bd8b7dae95ee7ba36a440d71779fe8aacbc
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2021 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2023 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2026 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_compile)
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2029 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2031 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2033 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-networking/2.76.1/temp/log.do_packagedata.2905698
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 42 Mirrors 0 Missed 23 Current 664 (64% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 1481 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 1512 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_recipe_qa)
NOTE: Running task 1576 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1577 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: Running task 1578 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_fetch)
NOTE: Running task 1706 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_write_config)
NOTE: Running task 1750 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1986 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_unpack)
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Started
NOTE: Running task 1987 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: Running task 1988 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 1989 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: Running task 1990 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_patch)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1992 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1995 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Started
NOTE: Running task 1996 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1997 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: Running task 1998 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1643135a7ed0ef8842c7f0dd405511415ac6e09e1ea0798ace5d702873f40c92
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2014 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b61b8c6b9f8fe2512f1b067fc9acff065964ed495736da2a7319057949c65276
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2022 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2023 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2026 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_compile)
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2029 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2031 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 2032 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2033 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-networking/2.76.1/temp/log.do_packagedata.2895304
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 147 recipes from the core2-32 sysroot...done.
Removing 168 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 335 Local 312 Mirrors 0 Missed 23 Current 284 (93% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 298 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 872 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 891 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 896 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_recipe_qa)
NOTE: Running task 912 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_write_config)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.56.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 376 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 942 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 953 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_fetch)
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 954 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: recipe nghttp2-1.56.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.56.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 956 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 957 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 420 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 960 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.56.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Started
NOTE: Running setscene task 435 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 993 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 999 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1000 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_patch)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 446 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1001 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 449 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 451 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 455 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1007 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1009 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running setscene task 458 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1021 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: Running task 1032 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 492 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1035 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic unihash changed to 33b9adcb23dcf764bfabf49908d9c2099a4c8e958dd0c5b58ab4cfdf69a2b6d2
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 502 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1074 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1151 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 588 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1197 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 609 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7351db59a76fe6687e6c58aac56fb00a612739e07148a4d24158e8e0ce78924c
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 619 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1537 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1571 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1669 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_collect_spdx_deps)
NOTE: Running task 1711 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1715 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1716 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 1717 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1718 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 1719 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1720 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 1721 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1722 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 1723 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1744 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1724 tasks of which 1685 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-networking/2.76.1/temp/log.do_packagedata.2951932
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============0649207548315228354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 65 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 44 Mirrors 0 Missed 23 Current 662 (65% match, 96% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_recipe_qa)
NOTE: Running task 1481 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_write_config)
NOTE: Running task 1512 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_recipe_qa)
NOTE: Running task 1574 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1575 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_fetch)
NOTE: Running task 1576 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_fetch)
NOTE: Running task 1706 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_write_config)
NOTE: Running task 1749 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1986 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_unpack)
NOTE: recipe glib-networking-2.76.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Started
NOTE: Running task 1987 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_unpack)
NOTE: Running task 1988 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libsoup-3.4.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 1989 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_patch)
NOTE: Running task 1990 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Started
NOTE: Running task 1992 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1993 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1994 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1995 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1996 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: Running task 1997 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libsoup-3.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1b8ac91861a0f2c5c171540a5748a6ed90e24a5891f0a487d79f02ad63ce0770
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2013 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2014 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0d4103f1bca9844c30c64cd0a758b174d707f3ff7e833e2ec3ed74f2386b5c0e
NOTE: recipe libsoup-3.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2021 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2023 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2024 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-networking-2.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2026 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2027 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_compile)
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile: Succeeded
NOTE: Running task 2028 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2029 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2031 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_package)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Started
NOTE: recipe libsoup-3.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_install)
NOTE: recipe glib-networking-2.76.1-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata)
NOTE: recipe libsoup-3.4.3-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.3-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_package)
NOTE: Running task 2035 of 2043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.3.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.3-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.1-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.3-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2035 tasks of which 1996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-networking/2.76.1/temp/log.do_packagedata.2916077
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb:do_packagedata) failed with exit code '1'

--===============0649207548315228354==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.4.2-3.4.3.patch"

RnJvbSA2NDM4NmExOTA5ZTgzOTczMjcwN2JhMmJmZjZlMjNmOGI0ZWZmZWQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxODowNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvdXA6IHVwZ3JhZGUgMy40LjIgLT4gMy40LjMKCi0tLQogLi4uL2xpYnNvdXAve2xpYnNvdXBf
My40LjIuYmIgPT4gbGlic291cF8zLjQuMy5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlic291cC97bGlic291cF8zLjQuMi5iYiA9PiBsaWJzb3VwXzMuNC4zLmJi
fSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291
cF8zLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjQuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNvdXAvbGlic291cF8zLjQuMy5iYgppbmRleCAzOTk2YWU2ODM2Li40ZTBkNjUxYTI3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy40LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuNC4zLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxpYnhtbDIgc3Fs
aXRlMyBsaWJwc2wgbmdodHRwMiIKIFNIUlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19IgogCiBTUkNfVVJJID0g
IiR7R05PTUVfTUlSUk9SfS9saWJzb3VwLyR7U0hSVF9WRVJ9L2xpYnNvdXAtJHtQVn0udGFyLnh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4YzhmYTM3Y2IxNTJkNDBlYzhjNGExNDhkNjE1NWUy
ZjY5NDdmM2YxNjAyYTdjZGEzYTMxYWQ0MGY1ZWUyZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YjdmMWJiYWVlYjQzZjU4MTJkYWJhM2VlMjU4YTcyZTFiNGIxNGMyZmQ5MWY0YTFhNzVkNGVlYTEw
ZGNmMjg4ZiIKIAogUFJPVklERVMgPSAibGlic291cC0zLjAiCiBDVkVfUFJPRFVDVCA9ICJsaWJz
b3VwIgotLSAKMi4zOS4yCgo=

--===============0649207548315228354==--

