Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01CCCDB466
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 05:20:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18752.1782019229937854265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 22:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kmQJkOpR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2q3mRZ1K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ee89f854b-1c093f0f-dd18-499d-b42d-1ee27afdf37d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782019229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OwbFVfDYRl39KzsKJYZk0IDu5QnutSTNB1wbD3OO5c8=;
	b=kmQJkOpREVuMS07P4Rer01DhUN39ifVhJD2Qs3W8YsqeeAgfgNxNm+m8unTcPyuV
	FkprJ+c7Ak+zL/g+9n5moicSchfgGj6PJU13AjvtOe20f2ByzfV1Xn6SfUX6JeHcrhf
	OseKyl6Ka4IIFjc8NtZlzTl71iLjl+DO1XjlFKhU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782019229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OwbFVfDYRl39KzsKJYZk0IDu5QnutSTNB1wbD3OO5c8=;
	b=2q3mRZ1Ke1yoAugB5ubVcMR3a67dtM8MeT4P3gmo6K/XTYyfJxaoZqtQrcvB7MEP
	bv92IYJnHXKmU+ubZ4zyQ6MDC0e2p4j7Y8J9JOX+D7yrLyHTRcYhbjrf4VYGIbo2zSU
	Lkb7V2btiPfXexxkxYubog+7/6AWwWsuqLYE5gzY=
Content-Type: multipart/mixed; boundary="===============4794837299102539482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkeyboard-config: upgrading to 2.48 SUCCEEDED
Message-ID: <0101019ee89f854b-1c093f0f-dd18-499d-b42d-1ee27afdf37d-000000@us-west-2.amazonses.com>
Date: Sun, 21 Jun 2026 05:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.21-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 05:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239252

--===============4794837299102539482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkeyboard-config* to *2.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkeyboard-config-upgrade-2.47-2.48.patch
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
From 6b396ec4756e260a64965b17cc78d321ae62377c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 21 Jun 2026 05:09:09 +0000
Subject: [PATCH] xkeyboard-config: upgrade 2.47 -> 2.48

---
 .../{xkeyboard-config_2.47.bb => xkeyboard-config_2.48.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.47.bb => xkeyboard-config_2.48.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
index cbca31fd62..dc0d1e1677 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e59984416a72d58b46a52bfec1b1361aa7d84354628227ee2783626c7a6db6b6"
+SRC_URI[sha256sum] = "b77041324f0109f77161ee43743fe04baa485866af8460d31e476ad3f7648fd5"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.47.1


--===============4794837299102539482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xkeyboard-config: SRC_URI changed from "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.47.tar.xz" to "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.48.tar.xz"
packages/x86-64-v3-poky-linux/xkeyboard-config: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-dev: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGSIZE changed from 42567 to 42674 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-doc: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGSIZE changed from 220840 to 221684 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGSIZE changed from 229392 to 230166 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGSIZE changed from 179538 to 180154 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGSIZE changed from 189826 to 190470 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGSIZE changed from 189870 to 190508 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fa: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fa: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGSIZE changed from 190708 to 191366 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGSIZE changed from 182590 to 183210 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGSIZE changed from 203808 to 204492 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGSIZE changed from 176830 to 177636 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGSIZE changed from 260466 to 261714 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGSIZE changed from 193280 to 193934 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGSIZE changed from 182890 to 183520 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGSIZE changed from 179640 to 180238 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGSIZE changed from 186462 to 187078 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGSIZE changed from 185688 to 186318 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGSIZE changed from 220338 to 220646 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGSIZE changed from 182046 to 182674 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGSIZE changed from 181990 to 182602 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGSIZE changed from 223312 to 224066 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGSIZE changed from 185004 to 185612 (+0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-src: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-src: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PV changed from "2.47" to "2.48"
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PKGV changed from 2.47 [default] to 2.48 [default]
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PKGSIZE changed from 3332718 to 3332372 (-0%)
packages/x86-64-v3-poky-linux/xkeyboard-config/xkeyboard-config: PV changed from "2.47" to "2.48"

--===============4794837299102539482==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkeyboard-config-upgrade-2.47-2.48.patch"

RnJvbSA2YjM5NmVjNDc1NmUyNjBhNjQ5NjViMTdjYzc4ZDMyMWFlNjIzNzdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjEgSnVuIDIwMjYgMDU6MDk6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2V5Ym9hcmQtY29uZmlnOiB1cGdyYWRlIDIuNDcgLT4gMi40OAoKLS0tCiAuLi4ve3hrZXlib2Fy
ZC1jb25maWdfMi40Ny5iYiA9PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDguYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi40Ny5iYiA9
PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDguYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3hrZXlib2FyZC1jb25maWdfMi40Ny5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5Ym9hcmQtY29uZmlnXzIuNDguYmIKc2ltaWxhcml0
eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hr
ZXlib2FyZC1jb25maWdfMi40Ny5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3hrZXlib2FyZC1jb25maWdfMi40OC5iYgppbmRleCBjYmNhMzFmZDYyLi5kYzBkMWUx
Njc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGtleWJvYXJk
LWNvbmZpZ18yLjQ3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5
Ym9hcmQtY29uZmlnXzIuNDguYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5TRSA9ICJNSVQgJiBN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mYWE3NTZlMDQwNTMw
MjlkZGM2MDJjYWY5OWU1ZWYxZCIKIAogU1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlk
dWFsL2RhdGEveGtleWJvYXJkLWNvbmZpZy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImU1OTk4NDQxNmE3MmQ1OGI0NmE1MmJmZWMxYjEzNjFhYTdkODQzNTQ2Mjgy
MjdlZTI3ODM2MjZjN2E2ZGI2YjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjc3MDQxMzI0ZjAx
MDlmNzcxNjFlZTQzNzQzZmUwNGJhYTQ4NTg2NmFmODQ2MGQzMWU0NzZhZDNmNzY0OGZkNSIKIAog
U0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAidXRpbC1tYWNyb3MgbGlieHNsdC1uYXRp
dmUiCi0tIAoyLjQ3LjEKCg==

--===============4794837299102539482==--

