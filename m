Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B54C48BEE
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4631.1704114719615810150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fEtuhGz4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dbj9okiK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018cc52708d0-8167c016-85a3-4cef-9466-a2ddd5770d86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=py/bxsYJ4GQm2mVjrq4E8Z3z0J9b2ktr62rOiO4Hq1A=;
	b=fEtuhGz4zwPgW7rmH0Cf+K5gFxmHRyVgsKkikMgwSuNy5IIAaAyuX1ZklUuLR4y3
	pY/26lqw/jCck0drWCMeEgy8sxWk/ZH+StDjCs/+247RCYIzRDhtzU9rsA7P2Z53+JR
	82xclPrAkZqAMpe76tYjdvqLgBgPKfMLqm7uUpj4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=py/bxsYJ4GQm2mVjrq4E8Z3z0J9b2ktr62rOiO4Hq1A=;
	b=dbj9okiK7slclB4+TgMXjsNPhQFvbsJOqnzCLINW4HZWkZ9aghKLgv+zEuB4/Yrf
	3tUCDCPEcLvoW1D0xMTLdzFOTDNJqFg9WLPDRjhJrBLbIzQi3ReATYaW4fVJO1tQ2ai
	/u/kofmKI6nISv0mqMtCJBbXv4NLUj66YcJTLLUQ=
Content-Type: multipart/mixed; boundary="===============7252455944656322326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018cc52708d0-8167c016-85a3-4cef-9466-a2ddd5770d86-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193116

--===============7252455944656322326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.0.3-2.1.0.patch
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
From 088f4ac03ac72b03f62b5e7010647bf78ce916d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 06:41:11 +0000
Subject: [PATCH] pkgconf: upgrade 2.0.3 -> 2.1.0

---
 .../pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.0.3.bb => pkgconf_2.1.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
index 5aa5a191f2..1921f3a086 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.0.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "cabdf3c474529854f7ccce8573c5ac68ad34a7e621037535cbc3981f6b23836c"
+SRC_URI[sha256sum] = "266d5861ee51c52bc710293a1d36622ae16d048d71ec56034a02eb9cf9677761"
 
 inherit autotools
 
-- 
2.42.0


--===============7252455944656322326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.0.3-2.1.0.patch"

RnJvbSAwODhmNGFjMDNhYzcyYjAzZjYyYjVlNzAxMDY0N2JmNzhjZTkxNmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNjo0MToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMi4wLjMgLT4gMi4xLjAKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
Mi4wLjMuYmIgPT4gcGtnY29uZl8yLjEuMC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMi4wLjMuYmIgPT4gcGtnY29uZl8yLjEuMC5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzIuMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuMS4wLmJiCmluZGV4IDVhYTVhMTkxZjIuLjE5MjFmM2EwODYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4wLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEuMC5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNhYmRmM2M0NzQ1Mjk4NTRmN2NjY2U4NTczYzVhYzY4YWQzNGE3ZTYyMTAzNzUz
NWNiYzM5ODFmNmIyMzgzNmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjY2ZDU4NjFlZTUxYzUy
YmM3MTAyOTNhMWQzNjYyMmFlMTZkMDQ4ZDcxZWM1NjAzNGEwMmViOWNmOTY3Nzc2MSIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi40Mi4wCgo=

--===============7252455944656322326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.0.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 310288 to 314232 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24195 to 24354 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 269541 to 273448 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.0.3" to "2.1.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.0.3 [default] to 2.1.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 154025 to 154057 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.0.3" to "2.1.0"

--===============7252455944656322326==--

