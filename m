Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517D8C25B74
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1092.1714579214826057697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PejnJf6N;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pOGt9WY1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e290b7-aa1278a2-083f-490b-8a7c-a8611d46ed9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WTRf4T+VDXdDg865d9qY8KmZ3CsR7k3I1mYWLO8c+kQ=;
	b=PejnJf6NnmhTeY+9xuzqs3WjvFwnV0vrWjOdfAC2qhk9KH9fKs4tr5C5P1wvAKG1
	Ze/BdfOXeWHX1DJqL4ZS+J/VAlIKPMTJne6354ID1Nal5xmWmvYQ+uA0Bp3YW6GxXwC
	O6y4Coj+AUVlHRo0Ax6FBpKilzRlzBl1zyXdfXoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WTRf4T+VDXdDg865d9qY8KmZ3CsR7k3I1mYWLO8c+kQ=;
	b=pOGt9WY1n2Jlr+Z/DHvBsvIp6ZwYt2ne2re7110GqefqaoHNobBE+gJk6y+iGhXd
	klEJmWuW/vKMFAfRJk+cgsTxf7LKPighxR8zzrF2qzhd2mwOeppz44O35xjwjgLyNfR
	iezOdorsHSvRYqjH+IZMUmwZKK36SvksC/eA7odM=
Content-Type: multipart/mixed; boundary="===============4398606011022590538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.80.0 SUCCEEDED
Message-ID: <0101018f34e290b7-aa1278a2-083f-490b-8a7c-a8611d46ed9a-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198793

--===============4398606011022590538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.80.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.78.1-2.80.0.patch
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
From 05d8eaea3211fc8c8cedc5a41059c03d769e7228 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:28:57 +0000
Subject: [PATCH] glib-networking: upgrade 2.78.1 -> 2.80.0

---
 meta/recipes-core/glib-networking/glib-networking/eagain.patch  | 2 +-
 .../{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb => glib-networking_2.80.0.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index 6c2e3c634b..33e2f02aee 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,4 @@
-From 5604707bed4b4a4bc4658c7158a18c1774775775 Mon Sep 17 00:00:00 2001
+From 2d53d7abc9a4b7b613c6103c1d93d0f5735fd33a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 12:18:50 +0100
 Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
index 5060d9fd7a..c8a1355548 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "e48f2ddbb049832cbb09230529c5e45daca9f0df0eda325f832f7379859bf09f"
+SRC_URI[archive.sha256sum] = "d8f4f1aab213179ae3351617b59dab5de6bcc9e785021eee178998ebd4bb3acf"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
-- 
2.44.0


--===============4398606011022590538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)

--===============4398606011022590538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 840336 to 840520 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 8462 to 8914 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGSIZE changed from 7631 to 8085 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8338 to 8452 (+1%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGSIZE changed from 4443 to 7344 (+65%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 7261 to 7753 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 7951 to 8379 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 7652 to 8106 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGSIZE changed from 9523 to 10017 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGSIZE changed from 5360 to 6010 (+12%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8335 to 8877 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8313 to 8780 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGSIZE changed from 9064 to 9530 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8124 to 8600 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7414 to 7832 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 8047 to 8523 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGSIZE changed from 11868 to 12595 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9719 to 10296 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 8342 to 8805 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 7830 to 8264 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGSIZE changed from 7953 to 8489 (+7%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8173 to 8616 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 8219 to 8699 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGSIZE changed from 8060 to 8248 (+2%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 10411 to 10968 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 8193 to 8607 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 7752 to 8181 (+6%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7403 to 7805 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11136 to 11741 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGSIZE changed from 6775 to 7146 (+5%)
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 744568 to 744834 (+0%)
packages/core2-64-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]
packages/core2-64-poky-linux/glib-networking: PV changed from "2.78.1" to "2.80.0"
packages/core2-64-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.1.tar.xz;name=archive file://run-ptest file://eagain.patch" to "https://download.gnome.org/sources//glib-networking/2.80/glib-networking-2.80.0.tar.xz;name=archive file://run-ptest file://eagain.patch"
packages/core2-64-poky-linux/glib-networking: PKGV changed from 2.78.1 [default] to 2.80.0 [default]

--===============4398606011022590538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.78.1-2.80.0.patch"

RnJvbSAwNWQ4ZWFlYTMyMTFmYzhjOGNlZGM1YTQxMDU5YzAzZDc2OWU3MjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNToyODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjc4LjEgLT4gMi44MC4wCgotLS0KIG1ldGEvcmVjaXBl
cy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmcvZWFnYWluLnBhdGNoICB8IDIg
Ky0KIC4uLi97Z2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi44
MC4wLmJifSAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy97Z2xp
Yi1uZXR3b3JraW5nXzIuNzguMS5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi44MC4wLmJifSAoOTUl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcvZWFnYWluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5n
L2dsaWItbmV0d29ya2luZy9lYWdhaW4ucGF0Y2gKaW5kZXggNmMyZTNjNjM0Yi4uMzNlMmYwMmFl
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZy9lYWdhaW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3Jr
aW5nL2dsaWItbmV0d29ya2luZy9lYWdhaW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU2
MDQ3MDdiZWQ0YjRhNGJjNDY1OGM3MTU4YTE4YzE3NzQ3NzU3NzUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDJkNTNkN2FiYzlhNGI3YjYxM2M2MTAzYzFkOTNkMGY1NzM1ZmQzM2EgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFNhdCwgNiBNYXkgMjAyMyAxMjoxODo1MCAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBJbiBhdXRvYnVpbGRlciB0ZXN0aW5nIHdlIHJlZ3VsYXJs
eSBzZWUgZ2xpYi1uZXR3b3JraW5nIHB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYiBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi44MC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmdfMi43OC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYgppbmRleCA1MDYwZDlmZDdh
Li5jOGExMzU1NTQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtp
bmcvZ2xpYi1uZXR3b3JraW5nXzIuNzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGli
LW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuODAuMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEw
NzkwMDhiMzY0NTE2YyBcCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0gImdsaWItMi4wLW5h
dGl2ZSBnbGliLTIuMCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTQ4ZjJkZGJi
MDQ5ODMyY2JiMDkyMzA1MjljNWU0NWRhY2E5ZjBkZjBlZGEzMjVmODMyZjczNzk4NTliZjA5ZiIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImQ4ZjRmMWFhYjIxMzE3OWFlMzM1MTYxN2I1
OWRhYjVkZTZiY2M5ZTc4NTAyMWVlZTE3ODk5OGViZDRiYjNhY2YiCiAKICMgVXBzdHJlYW0gbm90
ZSB0aGF0IGZvciB0aGUgb3BlbnNzbCBiYWNrZW5kLCBoYWxmIHRoZSB0ZXN0cyB3aGVyZSB0aGlz
IGJhY2tlbmQgZG9uJ3QgcmV0dXJuCiAjIHRoZSBleHBlY3RlZCBlcnJvciBjb2RlIG9yIGRvbid0
IHdvcmsgYXMgZXhwZWN0ZWQgc28gZGVmYXVsdCB0byBnbnV0bHMKLS0gCjIuNDQuMAoK

--===============4398606011022590538==--

