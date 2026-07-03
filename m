Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B085C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 05:34:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86951.1783056892652185111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 22:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fcg9Iup8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1OTBOjsi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f2678ff5c-e67381bc-bb35-4307-b198-cb1de5aa7579-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783056891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j6dYlYhQea7O8KPJZ/CqCUdlAxBDl+pHnU2gppKzEQc=;
	b=Fcg9Iup8Eb+ycvEyBSf3EU8sahc78QEAozaQ6MtTMZSVLDrt9HcnM4E61Z0d1JZK
	CZdz2+zoLLaWiZumSqzEfRLXuijSGvTiwYc3YWP1xkTQvv4lumeHL1E0rXC8+z2G25V
	pHhQE7YXo3GmNEOVt1z2Yk7L+bU4fMsIkNmS+N2s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783056891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j6dYlYhQea7O8KPJZ/CqCUdlAxBDl+pHnU2gppKzEQc=;
	b=1OTBOjsipMoRDfnF83/l/gOA30bKJdRTKwdoyohgS+zol8AKK0w4zgaYdEoDjS+F
	klRcE+5TFmDFybg3GFS4YpVSYmk3czZGmgZZjeDcg5Iw5QoOS0CzwgAeWa2QDwrUj0k
	FHThiALaUBTzEnb0IvmEWcCW02zBsG0OFg+NuUGQ=
Content-Type: multipart/mixed; boundary="===============0464139690885295573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.9.2 SUCCEEDED
Message-ID: <0101019f2678ff5c-e67381bc-bb35-4307-b198-cb1de5aa7579-000000@us-west-2.amazonses.com>
Date: Fri, 3 Jul 2026 05:34:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 05:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240074

--===============0464139690885295573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.9.1-1.9.2.patch
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
From b53f06cd3d179e96a147c130b8fb6d3eba9bfd76 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Jul 2026 05:31:40 +0000
Subject: [PATCH] libadwaita: upgrade 1.9.1 -> 1.9.2

---
 .../libadwaita/{libadwaita_1.9.1.bb => libadwaita_1.9.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.1.bb => libadwaita_1.9.2.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
index cf4fe6b45f..9a40c2e415 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "2ae34dbb3ea56d270925707cefa36050482ec88a741f1810b7619a5377c41a66"
+SRC_URI[archive.sha256sum] = "6920f813a76c4856591ca56ee842e94efbbe736e8ca2f445c9e9fc3b4e7076f0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============0464139690885295573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.1.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.2.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 6410696 to 6410824 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGSIZE changed from 2697223 to 2697225 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGSIZE changed from 9242 to 10098 (+9%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGSIZE changed from 9452 to 9731 (+3%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGSIZE changed from 10362 to 10166 (-2%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.9.1/src/stylesheet -> /usr/src/debug/libadwaita/1.9.2/src/stylesheet, directory renamed /usr/src/debug/libadwaita/1.9.1/src -> /usr/src/debug/libadwaita/1.9.2/src
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 7813255 to 7811796 (-0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.9.1 [default] to 1.9.2 [default]

--===============0464139690885295573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.9.1-1.9.2.patch"

RnJvbSBiNTNmMDZjZDNkMTc5ZTk2YTE0N2MxMzBiOGZiNmQzZWJhOWJmZDc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBKdWwgMjAyNiAwNTozMTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFkd2FpdGE6IHVwZ3JhZGUgMS45LjEgLT4gMS45LjIKCi0tLQogLi4uL2xpYmFkd2FpdGEve2xp
YmFkd2FpdGFfMS45LjEuYmIgPT4gbGliYWR3YWl0YV8xLjkuMi5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS45LjEuYmIgPT4gbGliYWR3YWl0
YV8xLjkuMi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3
YWl0YS9saWJhZHdhaXRhXzEuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEv
bGliYWR3YWl0YV8xLjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOS4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOS4yLmJiCmluZGV4IGNm
NGZlNmI0NWYuLjlhNDBjMmU0MTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS45LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjkuMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gIiBc
CiAKIGluaGVyaXQgZ25vbWViYXNlIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gdmFs
YSBmZWF0dXJlc19jaGVjawogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIyYWUzNGRi
YjNlYTU2ZDI3MDkyNTcwN2NlZmEzNjA1MDQ4MmVjODhhNzQxZjE4MTBiNzYxOWE1Mzc3YzQxYTY2
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjkyMGY4MTNhNzZjNDg1NjU5MWNhNTZl
ZTg0MmU5NGVmYmJlNzM2ZThjYTJmNDQ1YzllOWZjM2I0ZTcwNzZmMCIKIAogQU5ZX09GX0RJU1RS
T19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAib3BlbmdsIgotLSAKMi40Ny4xCgo=

--===============0464139690885295573==--

