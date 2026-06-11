Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59233CD98EC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50420.1781195502294183022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VAg8y0rb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VIgnZBEE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb7866fd5-c13c75d3-2062-4716-9f2a-42b5ecda8ec4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oW2FhV3pJeXTDedxec8Mje4amzqOJ4yqp4Ny0yJkQAg=;
	b=VAg8y0rbum1FzZIWTnOv0EIyWpP1nsOcu2HSlr9Q/57/ViS3lhT2xNyTCNBB5qDR
	DOm2UPI9F0vz3FUTsvKdYcY1YL1jmtCB/AjW2t0EUwUWRJeoSVZ7TWIJcQukgLVypce
	AScyfI8ETKN0dIB2DWdh0YUc9OWGFq7wNMddr16w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oW2FhV3pJeXTDedxec8Mje4amzqOJ4yqp4Ny0yJkQAg=;
	b=VIgnZBEEgubK8zOGcb4+1cExxrwWE49Sxob56OH0l+fEUxOg4trPNwtpgh0EH+ZF
	kysiOhLCifE6MRLglTbqMO26I1bAVrvmb+P8IQ4BEL4TFABFCA4uXoKfjL2mKhrb4Qu
	xZ7sPT8f/R/CpkQHyyDU1szQKuJsPVRJyGOTrElc=
Content-Type: multipart/mixed; boundary="===============3067917800297953039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.2.8 SUCCEEDED
Message-ID: <0101019eb7866fd5-c13c75d3-2062-4716-9f2a-42b5ecda8ec4-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238483

--===============3067917800297953039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.5-8.2.8.patch
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
From 3d0fdc526a370c87867ca5e7c9ef650368afba7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 08:56:24 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.5 -> 8.2.8

---
 .../fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.8.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
index cbd7151f85..761bab84d7 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.8.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
+SRCREV = "e8ec8e8f34bd6142efdbf4c714734dcff51ea9ac"
 
 inherit cmake
-- 
2.47.1


--===============3067917800297953039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 173674 to 179879 (+4%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.5" to "8.2.8"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.5 [default] to 8.2.8 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.5" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.8"

--===============3067917800297953039==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.5-8.2.8.patch"

RnJvbSAzZDBmZGM1MjZhMzcwYzg3ODY3Y2E1ZTdjOWVmNjUwMzY4YWZiYTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDg6NTY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjUgLT4gOC4yLjgKCi0tLQogLi4uL2Zhc3RmbG9hdC97ZmFz
dGZsb2F0XzguMi41LmJiID0+IGZhc3RmbG9hdF84LjIuOC5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMi41LmJiID0+IGZhc3RmbG9h
dF84LjIuOC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjIuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0Zmxv
YXQvZmFzdGZsb2F0XzguMi44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi41LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuOC5iYgppbmRl
eCBjYmQ3MTUxZjg1Li43NjFiYWI4NGQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjIuOC5iYgpAQCAtOSw2ICs5LDYgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmFzdGZsb2F0L2Zh
c3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0iCiAKLVNS
Q1JFViA9ICIwNTA4N2EzMDNkYWQ5Yzk4NzY4YjMzYzgyOWQzOTgyMjNhNjQ5YmM2IgorU1JDUkVW
ID0gImU4ZWM4ZThmMzRiZDYxNDJlZmRiZjRjNzE0NzM0ZGNmZjUxZWE5YWMiCiAKIGluaGVyaXQg
Y21ha2UKLS0gCjIuNDcuMQoK

--===============3067917800297953039==--

