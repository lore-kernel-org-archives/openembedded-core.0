Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA1DCAC5BF
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.30922.1757937279454211387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yV8JTBwH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nx12ZZzK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a4418-783b9989-56d1-490d-a98b-049c7b77df97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v8iYCs4L71gjGHIWxlIHDzpLe6Ha7gPtBtAjsQuQ3uk=;
	b=yV8JTBwH/RJSAgButflaIlb/lUUFICZ4CSWjh9e/Ey/aJixApBx2Ga5ieWstIoHb
	ILF/V+TVIZTts0vutzUMleZKCdeiNRnvwhrSt5AqNxgMbI3Jho3D3tEJx9QhItiZYNv
	uqDj8fQDmVSczQIf1MucFG7qHG+KLZUexeKzy+xs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v8iYCs4L71gjGHIWxlIHDzpLe6Ha7gPtBtAjsQuQ3uk=;
	b=nx12ZZzKVWQWgb5UhCjT2C1d2BkV4SbBey7tomWUuqR0bIkxe/pftQMbTdp8nBLT
	b1RFHLzLwgusCGbiCv88ysJOyHQ06EmKHXcSm56tzr8lBeKaDVDcnXEaR1ByY06ALzE
	jfcG/oecdNQQ67MLHDCEUxGSxzEYhfLwIEaTFkKY=
Content-Type: multipart/mixed; boundary="===============3845113488354805840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.10.8 SUCCEEDED
Message-ID: <010101994d3a4418-783b9989-56d1-490d-a98b-049c7b77df97-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223449

--===============3845113488354805840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *json-glib* to *1.10.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-glib-upgrade-1.10.6-1.10.8.patch
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
From c432c4b6a665d89b1609e95f01bf740be872c142 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 09:44:24 +0000
Subject: [PATCH] json-glib: upgrade 1.10.6 -> 1.10.8

---
 .../json-glib/{json-glib_1.10.6.bb => json-glib_1.10.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.10.6.bb => json-glib_1.10.8.bb} (93%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
similarity index 93%
rename from meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
index 8b009bc17b..1f68fb8c51 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293"
+SRC_URI[archive.sha256sum] = "55c5c141a564245b8f8fbe7698663c87a45a7333c2a2c56f06f811ab73b212dd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native python3-docutils-native"
-- 
2.47.1


--===============3845113488354805840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/json-glib/json-glib-bin: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 1097584 to 1097600 (+0%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: FILELIST: removed "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dev: PKGSIZE changed from 469616 to 470052 (+0%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-dev: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dev: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-doc: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-doc: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ab: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ab: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-as: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-as: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-be: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-be: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bg: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bg: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bn-in: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bn-in: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bs: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-bs: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ca+valencia: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ca+valencia: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ca: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ca: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-cs: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-cs: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-da: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-da: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-de: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-de: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-el: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-el: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-en-gb: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-en-gb: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-eo: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-eo: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-es: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-es: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-et: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-et: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-eu: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-eu: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fa: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fa: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fr: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fr: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fur: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-fur: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-gl: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-gl: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-he: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-he: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hi: PKGSIZE changed from 7674 to 7818 (+2%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hi: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hr: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hr: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hu: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hu: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-id: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-id: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-it: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-it: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ja: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ja: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ka: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ka: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-kab: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-kab: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ko: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ko: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ky: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ky: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-lt: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-lt: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-lv: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-lv: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ml: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ml: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ms: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ms: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-nb: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-nb: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ne: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ne: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-nl: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-nl: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-oc: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-oc: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-or: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-or: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pa: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pa: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pl: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pl: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pt-br: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pt-br: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pt: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-pt: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PKGSIZE changed from 5770 to 5829 (+1%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sk: PKGSIZE changed from 5535 to 5623 (+2%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sk: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sl: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sl: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sr+latin: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sr+latin: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sr: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sr: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sv: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sv: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-te: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-te: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-tg: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-tg: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-th: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-th: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-tr: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-tr: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ug: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ug: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-uk: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-uk: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-vi: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-vi: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-cn: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-cn: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-hk: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-hk: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-tw: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-zh-tw: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-ptest: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-ptest: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-src: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-src: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-staticdev: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-staticdev: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib: SRC_URI changed from "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.6.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.8.tar.xz;name=archive file://run-ptest"
packages/x86-64-v3-poky-linux/json-glib: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib: PACKAGES: added "json-glib-locale-uz"
Changes to packages/x86-64-v3-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.6 to libjson-glib-1.0.so.0.1000.8
  /usr/lib/libjson-glib-1.0.so.0.1000.6 moved to /usr/lib/libjson-glib-1.0.so.0.1000.8

--===============3845113488354805840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.10.6-1.10.8.patch"

RnJvbSBjNDMyYzRiNmE2NjVkODliMTYwOWU5NWYwMWJmNzQwYmU4NzJjMTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDk6NDQ6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
c29uLWdsaWI6IHVwZ3JhZGUgMS4xMC42IC0+IDEuMTAuOAoKLS0tCiAuLi4vanNvbi1nbGliL3tq
c29uLWdsaWJfMS4xMC42LmJiID0+IGpzb24tZ2xpYl8xLjEwLjguYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL3tqc29uLWdsaWJfMS4xMC42LmJiID0+IGpzb24tZ2xp
Yl8xLjEwLjguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2pzb24t
Z2xpYi9qc29uLWdsaWJfMS4xMC42LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9q
c29uLWdsaWJfMS4xMC44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1nbm9tZS9qc29uLWdsaWIvanNvbi1nbGliXzEuMTAuNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29uLWdsaWJfMS4xMC44LmJiCmluZGV4IDhiMDA5
YmMxN2IuLjFmNjhmYjhjNTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWds
aWIvanNvbi1nbGliXzEuMTAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1nbGli
L2pzb24tZ2xpYl8xLjEwLjguYmIKQEAgLTE5LDcgKzE5LDcgQEAgR0lET0NHRU5fTUVTT05fRU5B
QkxFX0ZMQUcgPSAnZW5hYmxlZCcKIEdJRE9DR0VOX01FU09OX0RJU0FCTEVfRkxBRyA9ICdkaXNh
YmxlZCcKIAogU1JDX1VSSSArPSAiIGZpbGU6Ly9ydW4tcHRlc3QiCi1TUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9ICI3N2Y0YmNiZjkzMzk1MjhmMTY2YjgwNzM0NTg2OTNmMGEyMGI3N2I3MDU5
ZGJjMmRiNjE3NDZhMTkyOGIwMjkzIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTVj
NWMxNDFhNTY0MjQ1YjhmOGZiZTc2OTg2NjNjODdhNDVhNzMzM2MyYTJjNTZmMDZmODExYWI3M2Iy
MTJkZCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9F
TkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IgogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10g
PSAiLURtYW49dHJ1ZSwtRG1hbj1mYWxzZSxsaWJ4c2x0LW5hdGl2ZSB4bWx0by1uYXRpdmUgcHl0
aG9uMy1kb2N1dGlscy1uYXRpdmUiCi0tIAoyLjQ3LjEKCg==

--===============3845113488354805840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib: PACKAGES: added "json-glib-locale-uz"
Changes to packages/x86-64-v3-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.6 to libjson-glib-1.0.so.0.1000.8
  /usr/lib/libjson-glib-1.0.so.0.1000.6 moved to /usr/lib/libjson-glib-1.0.so.0.1000.8

--===============3845113488354805840==--

