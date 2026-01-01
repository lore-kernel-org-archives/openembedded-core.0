Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BB1EED620
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102967.1767267471970812570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E+YKjH+E;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gl7Cih/c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b79598f43-ee4a1d5a-0443-481f-a5e3-e50248a57856-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tCLvIZ/vl8Ub4QTdpWGaieQ4nG6+QqEFr9Y5FqZ3V3M=;
	b=E+YKjH+EFyWY54xAJDc4GFWbAAfjmLADMxxhrz0wVXg9xrm92lG7pkJok9f0qlPh
	wuPe41KI47dFFyCrHnbWYYQj2xPot6HYltd3S6ghRREh3BDm3LrFi9UKmEXvAdGJ4bO
	HC42wCqF2naZ7Wwr/yejdv9XWmq2RwLeRiDLurnc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tCLvIZ/vl8Ub4QTdpWGaieQ4nG6+QqEFr9Y5FqZ3V3M=;
	b=gl7Cih/cr4ESuXHj1oubYF3xp4SyUdjk9vXu+1c4Mi4f6fdbYE4N1TqxdLElUgB5
	pbi0rTW+WB7jNRzInxchx2USr6WLTwXNMuEkf2OQinmWHj48x7bdI8D+wP5xC7tliI1
	RnXam0vuVbCDJXJI5I9r+wQ1KaDICjNdjHONPcjw=
Content-Type: multipart/mixed; boundary="===============9145448259344925081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.2 SUCCEEDED
Message-ID: <0101019b79598f43-ee4a1d5a-0443-481f-a5e3-e50248a57856-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228764

--===============9145448259344925081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.1.0-8.2.2.patch
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
From a1e0da35809653fb68d13fb0470b5da0945e7869 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:50:08 +0000
Subject: [PATCH] fastfloat: upgrade 8.1.0 -> 8.2.2

---
 .../fastfloat/{fastfloat_8.1.0.bb => fastfloat_8.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.1.0.bb => fastfloat_8.2.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
index 84bf90dac9..28d59ca09b 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.1.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.2.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "88b1e5321c6918cbe091afd76728296290668403"
+SRCREV = "97b54ca9e75f5303507699d27c6b4f4efe4641a1"
 
 inherit cmake
-- 
2.47.1


--===============9145448259344925081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.1.0-8.2.2.patch"

RnJvbSBhMWUwZGEzNTgwOTY1M2ZiNjhkMTNmYjA0NzBiNWRhMDk0NWU3ODY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjo1MDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZh
c3RmbG9hdDogdXBncmFkZSA4LjEuMCAtPiA4LjIuMgoKLS0tCiAuLi4vZmFzdGZsb2F0L3tmYXN0
ZmxvYXRfOC4xLjAuYmIgPT4gZmFzdGZsb2F0XzguMi4yLmJifSAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L3tmYXN0ZmxvYXRfOC4xLjAuYmIgPT4gZmFzdGZsb2F0
XzguMi4yLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0
ZmxvYXQvZmFzdGZsb2F0XzguMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9h
dC9mYXN0ZmxvYXRfOC4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4xLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi4yLmJiCmluZGV4
IDg0YmY5MGRhYzkuLjI4ZDU5Y2EwOWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi4yLmJiCkBAIC05LDYgKzksNiBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gIiBcCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mYXN0ZmxvYXQvZmFz
dF9mbG9hdC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSIKIAotU1JD
UkVWID0gIjg4YjFlNTMyMWM2OTE4Y2JlMDkxYWZkNzY3MjgyOTYyOTA2Njg0MDMiCitTUkNSRVYg
PSAiOTdiNTRjYTllNzVmNTMwMzUwNzY5OWQyN2M2YjRmNGVmZTQ2NDFhMSIKIAogaW5oZXJpdCBj
bWFrZQotLSAKMi40Ny4xCgo=

--===============9145448259344925081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 161373 to 167201 (+4%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.1.0 [default] to 8.2.2 [default]
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.1.0" to "8.2.2"
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.1.0" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.2"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.1.0 [default] to 8.2.2 [default]

--===============9145448259344925081==--

