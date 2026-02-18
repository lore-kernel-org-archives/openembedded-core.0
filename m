Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997A1E9A051
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1394.1771440106088151191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=B4bgRE8T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U9Ksgdc/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c720f0cef-41fcba72-3f31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/ykA6Kp+E7CNk4RMA/v33pfOXFQ+KnuscEGw7c0ZHa0=;
	b=B4bgRE8TNW/6Rr2ljoKuMwbsr3mPCgbuniytYBJ4Om9Ix/RHGMaM8SF9qEGmyJJp
	wiC1yPyyhPOaBHfh35mXGs/UN1y0rp7tiLpcnf2SQs9Qo69GxkwyNPS1392M2dZSaKJ
	mO9c9Z25ERJrFEKvnwjXls6/eOXK13R+NStc43Oc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/ykA6Kp+E7CNk4RMA/v33pfOXFQ+KnuscEGw7c0ZHa0=;
	b=U9Ksgdc/3CuZKtoQLiR6hjnj+0qig4rGXmiuaL0BaMfMkhewWyQyWBmK9wFXoIUT
	rQDp9Sa7fzHxIXcwZPFR+0MbaOS9fYppxLn6y7Fo5xUhf/m45ls5i0WHXPGhoHq46mk
	WETvlPPC3wuXRXrc5AeFid6fAj+i0OkeEriUXUwM=
Content-Type: multipart/mixed; boundary="===============3767054235067836806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsoup: upgrading to 3.6.6 SUCCEEDED
Message-ID: <0101019c720f0cef-41fcba72-3f31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231406

--===============3767054235067836806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsoup* to *3.6.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.6.5-3.6.6.patch
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
From 67b739cddc457b37f1fe4875e6bf561088c6d9d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:28:59 +0000
Subject: [PATCH] libsoup: upgrade 3.6.5 -> 3.6.6

---
 .../libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb} (95%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
similarity index 95%
rename from meta/recipes-support/libsoup/libsoup_3.6.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 549bbb7981..f9dd5311a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
-SRC_URI[archive.sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
+SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
 PROVIDES = "libsoup-3.0"
 
-- 
2.47.1


--===============3767054235067836806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libsoup: PACKAGES: added "libsoup-locale-kw libsoup-locale-uz libsoup-locale-kk"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PKGSIZE changed from 2454 to 4939 (+101%)

--===============3767054235067836806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsoup: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup: PACKAGES: added "libsoup-locale-kk libsoup-locale-uz libsoup-locale-kw"
packages/x86-64-v3-poky-linux/libsoup: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.6/libsoup-3.6.5.tar.xz;name=archive" to "https://download.gnome.org/sources//libsoup/3.6/libsoup-3.6.6.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 2194192 to 2203224 (+0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-dbg: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PKGSIZE changed from 1069992 to 1070595 (+0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-dev: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-doc: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kab: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kab: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PKGSIZE changed from 4245 to 4184 (-1%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tr: PKGSIZE changed from 4072 to 4069 (-0%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PKGSIZE changed from 2454 to 4939 (+101%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1797481 to 1808673 (+1%)
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup-src: FILELIST: directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/cache -> /usr/src/debug/libsoup/3.6.6/libsoup/cache, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup -> /usr/src/debug/libsoup/3.6.6/libsoup, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/websocket -> /usr/src/debug/libsoup/3.6.6/libsoup/websocket, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/content-decoder -> /usr/src/debug/libsoup/3.6.6/libsoup/content-decoder, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/server -> /usr/src/debug/libsoup/3.6.6/libsoup/server, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/http1 -> /usr/src/debug/libsoup/3.6.6/libsoup/http1, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/cookies -> /usr/src/debug/libsoup/3.6.6/libsoup/cookies, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/auth -> /usr/src/debug/libsoup/3.6.6/libsoup/auth, directory renamed /usr/src/debug/libsoup/3.6.5/libsou
 p/http2 -> /usr/src/debug/libsoup/3.6.6/libsoup/http2, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/hsts -> /usr/src/debug/libsoup/3.6.6/libsoup/hsts, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/content-sniffer -> /usr/src/debug/libsoup/3.6.6/libsoup/content-sniffer, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/server/http1 -> /usr/src/debug/libsoup/3.6.6/libsoup/server/http1, directory renamed /usr/src/debug/libsoup/3.6.5/libsoup/server/http2 -> /usr/src/debug/libsoup/3.6.6/libsoup/server/http2
packages/x86-64-v3-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.6.5" to "3.6.6"
packages/x86-64-v3-poky-linux/libsoup/libsoup: PKGV changed from 3.6.5 [default] to 3.6.6 [default]
packages/x86-64-v3-poky-linux/libsoup/libsoup: PKGSIZE changed from 687924 to 692020 (+1%)
packages/x86-64-v3-poky-linux/libsoup/libsoup: PV changed from "3.6.5" to "3.6.6"

--===============3767054235067836806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.6.5-3.6.6.patch"

RnJvbSA2N2I3MzljZGRjNDU3YjM3ZjFmZTQ4NzVlNmJmNTYxMDg4YzZkOWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6Mjg6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb3VwOiB1cGdyYWRlIDMuNi41IC0+IDMuNi42CgotLS0KIC4uLi9saWJzb3VwL3tsaWJzb3Vw
XzMuNi41LmJiID0+IGxpYnNvdXBfMy42LjYuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnNvdXAve2xpYnNvdXBfMy42LjUuYmIgPT4gbGlic291cF8zLjYuNi5i
Yn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNv
dXBfMy42LjUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy42LjYu
YmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlic291cC9saWJzb3VwXzMuNi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy42LjYuYmIKaW5kZXggNTQ5YmJiNzk4MS4uZjlkZDUzMTFhNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuNi41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjYuNi5iYgpAQCAtOSw3
ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWYzMGYwNzE2
ZGZkZDBkOTFlYjQzOWViZWM1MjJlYzIiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAt
bmF0aXZlIGxpYnhtbDIgc3FsaXRlMyBsaWJwc2wgbmdodHRwMiIKIAotU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiNjg5MTc2NWFhYzNlOTQ5MDE3OTQ1YzNlYWViZDhjYzgyMTZkZjc3MjQ1
NmRjOWY0NjA5NzZmYmRiN2FkYTIzNCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjUx
ZWQwYWUwNmY5ZDVhNDBmNDAxZmY0NTllMmU1ZjY1MmY5YTUxMGI3NzMwZTEzNTllZTY2ZDE0ZDQ4
NzI3NDAiCiAKIFBST1ZJREVTID0gImxpYnNvdXAtMy4wIgogCi0tIAoyLjQ3LjEKCg==

--===============3767054235067836806==--

