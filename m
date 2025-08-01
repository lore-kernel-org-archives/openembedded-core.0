Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC62CA0ED5
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88812.1754057271307449629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Pn7Set4g;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eb1gNXjf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f5efe1-fa8fa490-1f14-40c3-a200-a5a22fe0ef44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nciSkWIRiQiZanPt4mCfU1JIv/RbsJ6mPRaeBHALCec=;
	b=Pn7Set4gsijYRNlcsrj2hjxXpcyFo/Iw/nOjhctXNlC0yTpHAFJM45MKUSjE7AO1
	O3eX6t1gVIxrm1Aw5u68j/hGMZnn5AJ7g3vXT2zbiS5NCQBaedq2PTigIY2VfR6At8c
	F5Hcuiv1fjqvX6UBvPrpAQ3syD56czLO0QqX2yjk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nciSkWIRiQiZanPt4mCfU1JIv/RbsJ6mPRaeBHALCec=;
	b=eb1gNXjfy8+VNDSH5LbW4kI9xxbUPC/6Ek3SXcDkLCIpJvfmsJ5EC08KZu1ggOjc
	5nqH0LBOsBP2wODZWtwdeIoUo3+9taWu1Zu+r6TV4mC1n0x5U6Eq1FSWbiWst7eUwon
	HEnwd4Y2Q0sQmkVTKTYoD81YZqYSzjiq0an1w6ws=
Content-Type: multipart/mixed; boundary="===============8720564758827618949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-license-expression: upgrading to 30.4.4 SUCCEEDED
Message-ID: <0101019865f5efe1-fa8fa490-1f14-40c3-a200-a5a22fe0ef44-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221278

--===============8720564758827618949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-license-expression* to *30.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-license-expression-upgrade-30.4.3-30.4.4.patch
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
From 9aaf51cd7a2b698d2f40a96dcab6b2923851c5a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:28:30 +0000
Subject: [PATCH] python3-license-expression: upgrade 30.4.3 -> 30.4.4

---
 ...xpression_30.4.3.bb => python3-license-expression_30.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.3.bb => python3-license-expression_30.4.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
index 065284ed62..690149123a 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "49f439fea91c4d1a642f9f2902b58db1d42396c5e331045f41ce50df9b40b1f2"
+SRC_URI[sha256sum] = "73448f0aacd8d0808895bdc4b2c8e01a8d67646e4188f887375398c761f340fd"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.47.1


--===============8720564758827618949==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-license-expression-upgrade-30.4.3-30.4.4.patch"

RnJvbSA5YWFmNTFjZDdhMmI2OThkMmY0MGE5NmRjYWI2YjI5MjM4NTFjNWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToyODozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uOiB1cGdyYWRlIDMwLjQuMyAtPiAzMC40LjQKCi0tLQog
Li4ueHByZXNzaW9uXzMwLjQuMy5iYiA9PiBweXRob24zLWxpY2Vuc2UtZXhwcmVzc2lvbl8zMC40
LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1saWNlbnNl
LWV4cHJlc3Npb25fMzAuNC4zLmJiID0+IHB5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQu
NC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC40LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1saWNlbnNlLWV4cHJlc3Npb25fMzAuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuNC5iYgppbmRleCAw
NjUyODRlZDYyLi42OTAxNDkxMjNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGljZW5zZS1leHByZXNzaW9uXzMwLjQuNC5i
YgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL25leEIvbGlj
ZW5zZS1leHByZXNzaW9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vYXBhY2hlLTIuMC5MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5ZjQzOWZlYTkxYzRkMWE2NDJm
OWYyOTAyYjU4ZGIxZDQyMzk2YzVlMzMxMDQ1ZjQxY2U1MGRmOWI0MGIxZjIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNzM0NDhmMGFhY2Q4ZDA4MDg4OTViZGM0YjJjOGUwMWE4ZDY3NjQ2ZTQxODhm
ODg3Mzc1Mzk4Yzc2MWYzNDBmZCIKIAogaW5oZXJpdCBweXBpIHB0ZXN0LXB5dGhvbi1weXRlc3Qg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9QQUNLQUdFID0gImxpY2Vuc2VfZXhw
cmVzc2lvbiIKLS0gCjIuNDcuMQoK

--===============8720564758827618949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-license-expression: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.3.tar.gz;downloadfilename=license_expression-30.4.3.tar.gz" to "https://files.pythonhosted.org/packages/source/l/license_expression/license_expression-30.4.4.tar.gz;downloadfilename=license_expression-30.4.4.tar.gz"
packages/core2-64-poky-linux/python3-license-expression: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dbg: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-dev: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-doc: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-locale: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-ptest: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-src: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression-staticdev: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PV changed from "30.4.3" to "30.4.4"
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGSIZE changed from 1161503 to 1206865 (+4%)
packages/core2-64-poky-linux/python3-license-expression/python3-license-expression: PKGV changed from 30.4.3 [default] to 30.4.4 [default]
Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.4.dist-info

--===============8720564758827618949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-license-expression (sysroot):
  /usr/lib/python3.13/site-packages/license_expression-30.4.3.dist-info moved to /usr/lib/python3.13/site-packages/license_expression-30.4.4.dist-info

--===============8720564758827618949==--

