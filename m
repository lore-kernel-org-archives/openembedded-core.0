Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC98C54E71
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.36974.1709330716328812179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HfVXTC5S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LqfVPyoi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dfc0cd35f-87ffbb74-7f96-49aa-b181-5858ebdfb984-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4aTxUgypQ10ck7F8ucGUzHdp91prYHtGuAYbMu1Z24U=;
	b=HfVXTC5SFy2Vlb88sQXLezhI/b5SbQqb5dPaFb99KgWfmgBU+xSFef5egvpWcn9x
	L5pL2D7KE/n27tSTgD86jBKSfnWhZh47emVtWIKNjjkrYdgwwmUDltz7iuQwpoN2ns2
	8bx9PcSZtiJzGqldqljH5RNUrXOQ+7u1HaH2wACQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4aTxUgypQ10ck7F8ucGUzHdp91prYHtGuAYbMu1Z24U=;
	b=LqfVPyoimvxvbKJ32Mnv60j3KkCIqWY7MLvLt5UhX4/JKI288V66+b83FwkXiAmh
	UstQucVklVc7i9+8zF8GrXnT1BsJhS41sXNC6FchOT8rHqUdUevRXxoaqaGUqL3/vIC
	lrt6EAaBItDAWPjWs7mfhMOoPUA8bBZbz1WsMqF0=
Content-Type: multipart/mixed; boundary="===============2611627054177890165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.78.1 SUCCEEDED
Message-ID: <0101018dfc0cd35f-87ffbb74-7f96-49aa-b181-5858ebdfb984-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196471

--===============2611627054177890165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.78.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.78.0-2.78.1.patch
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
From 67359daf811251d82e4176c197f3baaff5477d2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 10:53:53 +0000
Subject: [PATCH] glib-networking: upgrade 2.78.0 -> 2.78.1

---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch | 3 +--
 .../{glib-networking_2.78.0.bb => glib-networking_2.78.1.bb}   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.0.bb => glib-networking_2.78.1.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 062fc0191b..6c2e3c634b 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 025bb39dfdb81dd2852deaefea228b197ef3cd8d Mon Sep 17 00:00:00 2001
+From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
@@ -15,7 +15,6 @@ The test should probably retry in this situation so test a patch which does this
 Upstream-Status: Pending [testing to see if patch resolves the issue]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  tls/tests/connection.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
index 68f9a2ed78..5060d9fd7a 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "52fe4ce93f7dc51334b102894599858d23c8a65ac4a1110b30920565d68d3aba"
+SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.42.0


--===============2611627054177890165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 837480 to 840240 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 6660 to 7525 (+13%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8260 to 8335 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9618 to 9719 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PKGSIZE changed from 8251 to 8337 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 11083 to 10411 (-6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGSIZE changed from 6716 to 6775 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 741879 to 744568 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking: PKGSIZE changed from 143288 to 147384 (+3%)
packages/core2-64-poky-linux/glib-networking/glib-networking: PV changed from "2.78.0" to "2.78.1"
packages/core2-64-poky-linux/glib-networking/glib-networking: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking: PKGV changed from 2.78.0 [default] to 2.78.1 [default]
packages/core2-64-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.0.tar.xz;name=archive file://run-ptest file://eagain.patch" to "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.1.tar.xz;name=archive file://run-ptest file://eagain.patch"
packages/core2-64-poky-linux/glib-networking: PV changed from "2.78.0" to "2.78.1"

--===============2611627054177890165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.78.0-2.78.1.patch"

RnJvbSA2NzM1OWRhZjgxMTI1MWQ4MmU0MTc2YzE5N2YzYmFhZmY1NDc3ZDJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMDo1Mzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjc4LjAgLT4gMi43OC4xCgotLS0KIG1ldGEvcmVjaXBl
cy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmcvZWFnYWluLnBhdGNoIHwgMyAr
LS0KIC4uLi97Z2xpYi1uZXR3b3JraW5nXzIuNzguMC5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43
OC4xLmJifSAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL3tnbGli
LW5ldHdvcmtpbmdfMi43OC4wLmJiID0+IGdsaWItbmV0d29ya2luZ18yLjc4LjEuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZy9lYWdhaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcv
Z2xpYi1uZXR3b3JraW5nL2VhZ2Fpbi5wYXRjaAppbmRleCAwNjJmYzAxOTFiLi42YzJlM2M2MzRi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3
b3JraW5nL2VhZ2Fpbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtp
bmcvZ2xpYi1uZXR3b3JraW5nL2VhZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDI1
YmIzOWRmZGI4MWRkMjg1MmRlYWVmZWEyMjhiMTk3ZWYzY2Q4ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNTYwNDcwN2JlZDRiNGE0YmM0NjU4YzcxNThhMThjMTc3NDc3NTc3NSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogU2F0LCA2IE1heSAyMDIzIDEyOjE4OjUwICsw
MTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEluIGF1dG9idWlsZGVyIHRlc3Rpbmcgd2UgcmVndWxhcmx5
IHNlZSBnbGliLW5ldHdvcmtpbmcgcHRlc3QKQEAgLTE1LDcgKzE1LDYgQEAgVGhlIHRlc3Qgc2hv
dWxkIHByb2JhYmx5IHJldHJ5IGluIHRoaXMgc2l0dWF0aW9uIHNvIHRlc3QgYSBwYXRjaCB3aGlj
aCBkb2VzIHRoaXMKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZyBbdGVzdGluZyB0byBzZWUgaWYg
cGF0Y2ggcmVzb2x2ZXMgdGhlIGlzc3VlXQogCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KLQogLS0tCiAgdGxzL3Rlc3Rz
L2Nvbm5lY3Rpb24uYyB8IDQgKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdv
cmtpbmdfMi43OC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWIt
bmV0d29ya2luZ18yLjc4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc4LjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtp
bmdfMi43OC4xLmJiCmluZGV4IDY4ZjlhMmVkNzguLjUwNjBkOWZkN2EgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43OC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdf
Mi43OC4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIFNFQ1RJT04gPSAi
bGlicyIKIERFUEVORFMgPSAiZ2xpYi0yLjAtbmF0aXZlIGdsaWItMi4wIgogCi1TUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICI1MmZlNGNlOTNmN2RjNTEzMzRiMTAyODk0NTk5ODU4ZDIzYzhh
NjVhYzRhMTExMGIzMDkyMDU2NWQ2OGQzYWJhIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiZTQ4ZjJkZGJiMDQ5ODMyY2JiMDkyMzA1MjljNWU0NWRhY2E5ZjBkZjBlZGEzMjVmODMyZjcz
Nzk4NTliZjA5ZiIKIAogIyBVcHN0cmVhbSBub3RlIHRoYXQgZm9yIHRoZSBvcGVuc3NsIGJhY2tl
bmQsIGhhbGYgdGhlIHRlc3RzIHdoZXJlIHRoaXMgYmFja2VuZCBkb24ndCByZXR1cm4KICMgdGhl
IGV4cGVjdGVkIGVycm9yIGNvZGUgb3IgZG9uJ3Qgd29yayBhcyBleHBlY3RlZCBzbyBkZWZhdWx0
IHRvIGdudXRscwotLSAKMi40Mi4wCgo=

--===============2611627054177890165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 6660 to 7525 (+13%)

--===============2611627054177890165==--

