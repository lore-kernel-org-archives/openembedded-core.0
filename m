Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D7ECCD1AD
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18098.1759325550117191871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WbTq4eco;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R2caDn+c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff97425-6e1698f1-24df-4190-b016-786715784e8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GBkoW2q3KiDKe4+H9k7KoptW3ZPDOI9pQNIsveMiUOI=;
	b=WbTq4eco2C+4JjJcFkLWYXjAl7QdkzSFBXjP81/MdliZrdW46UaXBLJpJ0cGjw6Y
	ddfYdZSZ0iFSq7nrHAGOom3IDGIEJtH86hKzx87flVIMyMBTqC3CdQXPX4decSSOZg2
	aEIVkLVBeBec/rsFZU6zMTotQWlcZZ5dNOvWW0U0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GBkoW2q3KiDKe4+H9k7KoptW3ZPDOI9pQNIsveMiUOI=;
	b=R2caDn+cwyM+r51cPuIe41NeN9GEA1QXDutnonmA/9Oq9VemHtN/V5AQX4BGM7Jy
	OZgipFaeTyN/3LBTjhCsmuWEpgJTeUEwNZYdebYPXXFeiBB/kmT4SWiPmrWHdZBF6Mv
	f254aPoDxkqj2o6i2Gn7Za/4BDOv3WfgRe1YZamA=
Content-Type: multipart/mixed; boundary="===============1917784765738195353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-glib: upgrading to 1.10.8 SUCCEEDED
Message-ID: <010101999ff97425-6e1698f1-24df-4190-b016-786715784e8f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224273

--===============1917784765738195353==
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
From b544694282e042a4907c18e2f89ecb00441c12aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 11:27:32 +0000
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


--===============1917784765738195353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/json-glib/json-glib-bin: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-bin: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: FILELIST: removed "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/.debug/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PKGSIZE changed from 1097624 to 1097640 (+0%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-dbg: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-dev: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-dev: PKGSIZE changed from 469616 to 470052 (+0%)
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
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hi: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-hi: PKGSIZE changed from 7674 to 7818 (+2%)
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
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PKGSIZE changed from 5770 to 5829 (+1%)
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ro: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ru: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-ru: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sk: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib-locale-sk: PKGSIZE changed from 5535 to 5623 (+2%)
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
packages/x86-64-v3-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib/json-glib: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib: PV changed from "1.10.6" to "1.10.8"
packages/x86-64-v3-poky-linux/json-glib: PKGV changed from 1.10.6 [default] to 1.10.8 [default]
packages/x86-64-v3-poky-linux/json-glib: PACKAGES: added "json-glib-locale-uz"
packages/x86-64-v3-poky-linux/json-glib: SRC_URI changed from "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.6.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//json-glib/1.10/json-glib-1.10.8.tar.xz;name=archive file://run-ptest"
Changes to packages/x86-64-v3-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.6 to libjson-glib-1.0.so.0.1000.8
  /usr/lib/libjson-glib-1.0.so.0.1000.6 moved to /usr/lib/libjson-glib-1.0.so.0.1000.8

--===============1917784765738195353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-glib-upgrade-1.10.6-1.10.8.patch"

RnJvbSBiNTQ0Njk0MjgyZTA0MmE0OTA3YzE4ZTJmODllY2IwMDQ0MWMxMmFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMToyNzozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpz
b24tZ2xpYjogdXBncmFkZSAxLjEwLjYgLT4gMS4xMC44CgotLS0KIC4uLi9qc29uLWdsaWIve2pz
b24tZ2xpYl8xLjEwLjYuYmIgPT4ganNvbi1nbGliXzEuMTAuOC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9qc29uLWdsaWIve2pzb24tZ2xpYl8xLjEwLjYuYmIgPT4ganNvbi1nbGli
XzEuMTAuOC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1n
bGliL2pzb24tZ2xpYl8xLjEwLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL2pz
b24tZ2xpYl8xLjEwLjguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2pzb24tZ2xpYi9qc29uLWdsaWJfMS4xMC42LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ25vbWUvanNvbi1nbGliL2pzb24tZ2xpYl8xLjEwLjguYmIKaW5kZXggOGIwMDli
YzE3Yi4uMWY2OGZiOGM1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2pzb24tZ2xp
Yi9qc29uLWdsaWJfMS4xMC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9qc29uLWdsaWIv
anNvbi1nbGliXzEuMTAuOC5iYgpAQCAtMTksNyArMTksNyBAQCBHSURPQ0dFTl9NRVNPTl9FTkFC
TEVfRkxBRyA9ICdlbmFibGVkJwogR0lET0NHRU5fTUVTT05fRElTQUJMRV9GTEFHID0gJ2Rpc2Fi
bGVkJwogCiBTUkNfVVJJICs9ICIgZmlsZTovL3J1bi1wdGVzdCIKLVNSQ19VUklbYXJjaGl2ZS5z
aGEyNTZzdW1dID0gIjc3ZjRiY2JmOTMzOTUyOGYxNjZiODA3MzQ1ODY5M2YwYTIwYjc3YjcwNTlk
YmMyZGI2MTc0NmExOTI4YjAyOTMiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1NWM1
YzE0MWE1NjQyNDViOGY4ZmJlNzY5ODY2M2M4N2E0NWE3MzMzYzJhMmM1NmYwNmY4MTFhYjczYjIx
MmRkIgogCiBQQUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VO
QUJMRUQnLCAnMScsICd0ZXN0cycsICcnLCBkKX0iCiBQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9
ICItRG1hbj10cnVlLC1EbWFuPWZhbHNlLGxpYnhzbHQtbmF0aXZlIHhtbHRvLW5hdGl2ZSBweXRo
b24zLWRvY3V0aWxzLW5hdGl2ZSIKLS0gCjIuNDcuMQoK

--===============1917784765738195353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/json-glib/json-glib: FILELIST: removed "/usr/lib/libjson-glib-1.0.so.0.1000.6", added "/usr/lib/libjson-glib-1.0.so.0.1000.8"
packages/x86-64-v3-poky-linux/json-glib: PACKAGES: added "json-glib-locale-uz"
Changes to packages/x86-64-v3-poky-linux/json-glib (sysroot):
  /usr/lib/libjson-glib-1.0.so.0 changed symlink target from libjson-glib-1.0.so.0.1000.6 to libjson-glib-1.0.so.0.1000.8
  /usr/lib/libjson-glib-1.0.so.0.1000.6 moved to /usr/lib/libjson-glib-1.0.so.0.1000.8

--===============1917784765738195353==--

