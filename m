Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB8CE65268
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29055.1769951567044872156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mZPRAzjl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=roiKMOHd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955c133-cf48f62a-c6d9-4a2d-83c3-7015804ae225-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hGm4/efdQz5/fWNJd9W5RhvUTdY1QsV43Ia258zNFG8=;
	b=mZPRAzjlN9jobkT+OKyxg2AXgIRwNvI0yT0DtgLbWhwkbGbBczuEuzjNrFewKKWW
	6T3Dx01TFKo/eneCDcono2I9Kmmh1c1dDxD0/3mvwJueObiEAc8BTipGPVBL1xFhhKd
	nLN3SnD2hq2kv/gfOVZY55B2nTpXZo4c9PM3iLQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hGm4/efdQz5/fWNJd9W5RhvUTdY1QsV43Ia258zNFG8=;
	b=roiKMOHdQF7HrJlMnMRAnEhHRju1YmkwO2Gp+3CJcO4MxEfSgBMuFkJeQ95hbmYe
	B90H/BeKc7sfy1/c+nWO33IlyOg4L3wl8/tqfvxgX7kfCB0G0F7RTvPdCuiBEMHAHIT
	xefzTY2MIK3psJBofLmcfaN3kRaLlGK1PyJlCtjM=
Content-Type: multipart/mixed; boundary="===============7284586861632040530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101019c1955c133-cf48f62a-c6d9-4a2d-83c3-7015804ae225-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230308

--===============7284586861632040530==
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
From 92377a04551b469257030ec5613594c06443bc3d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 11:15:13 +0000
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


--===============7284586861632040530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.8/libadwaita-1.8.2.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.8/libadwaita-1.8.3.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 4896320 to 4900624 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 9513 to 9965 (+5%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 9442561 to 9447402 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.8.2/src/stylesheet -> /usr/src/debug/libadwaita/1.8.3/src/stylesheet, directory renamed /usr/src/debug/libadwaita/1.8.2/src -> /usr/src/debug/libadwaita/1.8.3/src
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.8.2" to "1.8.3"

--===============7284586861632040530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.8.2-1.8.3.patch"

RnJvbSA5MjM3N2EwNDU1MWI0NjkyNTcwMzBlYzU2MTM1OTRjMDY0NDNiYzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMToxNToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFkd2FpdGE6IHVwZ3JhZGUgMS44LjIgLT4gMS44LjMKCi0tLQogLi4uL2xpYmFkd2FpdGEve2xp
YmFkd2FpdGFfMS44LjIuYmIgPT4gbGliYWR3YWl0YV8xLjguMy5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS44LjIuYmIgPT4gbGliYWR3YWl0
YV8xLjguMy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3
YWl0YS9saWJhZHdhaXRhXzEuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEv
bGliYWR3YWl0YV8xLjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOC4zLmJiCmluZGV4IGIy
ZTcwYTRjY2QuLjZmZGM0ZDVhOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS44LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjguMy5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gIiBc
CiAKIGluaGVyaXQgZ25vbWViYXNlIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gdmFs
YSBmZWF0dXJlc19jaGVjawogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1ODlhNmUw
ZjQxOTE3NDBlODY5MGE3ZDMyOThlMTZmYTBkNDA2MTM0MWI1NTFkYTdhYmIyZjAzMGI1NTBhZGIx
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYTM2MmZlNzJhOWI1OGFlNWU2NGU4NzZk
MmY1ZTExYzkwYTcyMzUxY2I2YzBkYWU3ZjRkMWE0MzYzNThhMjE3ZSIKIAogQU5ZX09GX0RJU1RS
T19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAib3BlbmdsIgotLSAKMi40Ny4xCgo=

--===============7284586861632040530==--

