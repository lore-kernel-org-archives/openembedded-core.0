Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B437FE748FE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.65036.1696183992670969353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GL36aKlo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DClpB3Jb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018aec71be0b-992bfb53-d616-4fd4-89c0-42aeb56e8866-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1sjdz5mmtKXvNIuAZZAXww/gfu+j563yNmW3AORDfh4=;
	b=GL36aKloPa4mSM6DiS8A+EFv9939zRiF2pR4XQ5/Geuo38NgMJdBLGCsMaI1GBq9
	l0lOQHyX8MSBt3pWH5A4vDT6SR5SK1H87Fepmab+AilQyZ7gt/e5An1hNggHAqzbltz
	aGN5cFsdtHxzhQipSfkPomgoL+fb/4+0GXQffL80=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1sjdz5mmtKXvNIuAZZAXww/gfu+j563yNmW3AORDfh4=;
	b=DClpB3Jb0FC0D1S9UrshTgjzHIkmk/vIcKFs5LdDxoOvm80O1bVH2JKYon4QHewh
	Mas+c57/ElPbCoRuFWKi4Y034ll26xTYCLwJBEIfNozyrmkcYuY6xNw1CDj7pgJJF/g
	z4MHHu6a7MvZ+mve7Vux8qxJRLMQI4nD3S1cCAqU=
Content-Type: multipart/mixed; boundary="===============7138822927690134254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.22.6 SUCCEEDED
Message-ID: <0101018aec71be0b-992bfb53-d616-4fd4-89c0-42aeb56e8866-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188582

--===============7138822927690134254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.22.5-1.22.6.patch
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
From dc22bfead5d4ad88dc3d79812e929d067507f151 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 17:31:36 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.22.5 -> 1.22.6

---
 ...ugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
index 29d705aaaf..77f79a630a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "2680473b218158f18467cac3e1c50291b7ff4e0710dd350a59eaacbc29c09a54"
+SRC_URI[sha256sum] = "3e31454c98cb2f7f6d2d355eceb933a892fa0f1dc09bc36c9abc930d8e29ca48"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.39.2


--===============7138822927690134254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.6.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.22.5 [default] to 1.22.6 [default]

--===============7138822927690134254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.22.5-1.22.6.patch"

RnJvbSBkYzIyYmZlYWQ1ZDRhZDg4ZGMzZDc5ODEyZTkyOWQwNjc1MDdmMTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNzozMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLXVnbHk6IHVwZ3JhZGUgMS4yMi41IC0+IDEuMjIuNgoKLS0tCiAu
Li51Z2lucy11Z2x5XzEuMjIuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIu
Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1wbHVnaW5zLXVnbHlfMS4yMi41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4y
Mi42LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuNS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjIuNi5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjIyLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjIuNi5iYgppbmRleCAyOWQ3MDVhYWFmLi43N2Y3OWE2MzBhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjIyLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLXVnbHlfMS4yMi42LmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ0VOU0VfRkxB
R1MgPSAiY29tbWVyY2lhbCIKIFNSQ19VUkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0
cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11
Z2x5LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjY4MDQ3M2IyMTgxNThmMTg0NjdjYWMzZTFjNTAyOTFiN2ZmNGUwNzEwZGQzNTBhNTllYWFjYmMy
OWMwOWE1NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZTMxNDU0Yzk4Y2IyZjdmNmQyZDM1NWVj
ZWI5MzNhODkyZmEwZjFkYzA5YmMzNmM5YWJjOTMwZDhlMjljYTQ4IgogCiBTID0gIiR7V09SS0RJ
Un0vZ3N0LXBsdWdpbnMtdWdseS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============7138822927690134254==--

