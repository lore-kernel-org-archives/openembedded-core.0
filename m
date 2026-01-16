Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803B4D4A5F6
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1482.1768526753429390058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xvVeS3HR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TpgOM9ES;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468aba5-c6a4c004-491e-4029-995a-fca08530f56b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yntYIU7h2QpfFv70MdhnP9q9wTOBg9nTazZXVZoFbLw=;
	b=xvVeS3HRqS2zC/dQQxlq9l+nNlwoFORdus6XgsTv3NoTWPW8YS/ucssp3FhSUC5/
	iy7gVEFmRgYaaasP4TkDK6+FvcWxvrG9IOTy5Lq3G/0mGnEzBgYbsDTr994jOcl1bOc
	6u/WtKHkn026EGPHENwc/psPIaGmZAi9zL51rxRs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yntYIU7h2QpfFv70MdhnP9q9wTOBg9nTazZXVZoFbLw=;
	b=TpgOM9ESZwVCU5HG9+/rJUejys3xhQGZUSHaHM2Qol4Za3EM9tQy0xMll52uJp+U
	B1QQSyCKs/4i7wzXqP5Mnp9YSw1GbOiuxAz3AvLZX/MGOH53hDWketJvHf/0OV8CU1E
	Le/gLM2OdFysx2+Fq+Sw/iem9IDilfncjJu+b+Hc=
Content-Type: multipart/mixed; boundary="===============8617425612844803451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101019bc468aba5-c6a4c004-491e-4029-995a-fca08530f56b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229486

--===============8617425612844803451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.8.2-1.8.3.patch
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
From a426ba3043bd64b2c8315ceeddc81fc606043485 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 23:30:49 +0000
Subject: [PATCH] libadwaita: upgrade 1.8.2 -> 1.8.3

---
 .../libadwaita/{libadwaita_1.8.2.bb => libadwaita_1.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.2.bb => libadwaita_1.8.3.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.8.3.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.3.bb
index b2e70a4ccd..6fdc4d5a99 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.3.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "589a6e0f4191740e8690a7d3298e16fa0d4061341b551da7abb2f030b550adb1"
+SRC_URI[archive.sha256sum] = "a362fe72a9b58ae5e64e876d2f5e11c90a72351cb6c0dae7f4d1a436358a217e"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============8617425612844803451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.8/libadwaita-1.8.2.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.8/libadwaita-1.8.3.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 4896320 to 4900624 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 9513 to 9965 (+5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.8.2/src/stylesheet -> /usr/src/debug/libadwaita/1.8.3/src/stylesheet, directory renamed /usr/src/debug/libadwaita/1.8.2/src -> /usr/src/debug/libadwaita/1.8.3/src
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 9442561 to 9447402 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.8.2 [default] to 1.8.3 [default]

--===============8617425612844803451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.8.2-1.8.3.patch"

RnJvbSBhNDI2YmEzMDQzYmQ2NGIyYzgzMTVjZWVkZGM4MWZjNjA2MDQzNDg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjM6MzA6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuOC4yIC0+IDEuOC4zCgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuOC4yLmJiID0+IGxpYmFkd2FpdGFfMS44LjMuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuOC4yLmJiID0+IGxpYmFkd2Fp
dGFfMS44LjMuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjguMi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjguMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjguMy5iYgppbmRleCBi
MmU3MGE0Y2NkLi42ZmRjNGQ1YTk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS44LjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTg5YTZl
MGY0MTkxNzQwZTg2OTBhN2QzMjk4ZTE2ZmEwZDQwNjEzNDFiNTUxZGE3YWJiMmYwMzBiNTUwYWRi
MSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImEzNjJmZTcyYTliNThhZTVlNjRlODc2
ZDJmNWUxMWM5MGE3MjM1MWNiNmMwZGFlN2Y0ZDFhNDM2MzU4YTIxN2UiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuNDcuMQoK

--===============8617425612844803451==--

