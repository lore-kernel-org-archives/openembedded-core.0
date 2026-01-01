Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100A1EED616
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103054.1767267472165222323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hItT3mZy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eQ4Rd+KV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b79599038-d16495ce-53b9-40b3-89d5-5373e686368c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JNjWliWFG+dBbR0MhIu/Bj1ZVwxysvRbOryWjiksvLo=;
	b=hItT3mZyTXn/PaANMGrFtCtrpVEsVMDIJbT7gHU2lZSNmr0eaK6d3LBwaHPxzl3A
	QQUlnCWm15PfJSJgxsFVO+hGqFtlEbom1sl4XUZXgc9g9RcOwP4OW4YsYA/hRrrvI6l
	Nqv6l2o1w6is1FfCURbuI96e2JcFCQ5XtZ9IbWOo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267471;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JNjWliWFG+dBbR0MhIu/Bj1ZVwxysvRbOryWjiksvLo=;
	b=eQ4Rd+KV50BVT3igc85czAtKZVM2dqWr8G5kAIcFmnpAsUTpGa5SIjp9VKsxYBfo
	2VjFOaAek1LRSHAuMKsSYeQtzXfhNmmpf093idPkddjkNjlRQde4R40LaphZONKFqeu
	782RwLDYq08NWNCITQHHkwIoQq/rOnOZvP/TCdos=
Content-Type: multipart/mixed; boundary="===============5731755251552464854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.148.9 SUCCEEDED
Message-ID: <0101019b79599038-d16495ce-53b9-40b3-89d5-5373e686368c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228766

--===============5731755251552464854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.148.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.148.7-6.148.9.patch
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
From b859fa5c7658157d263fb6e6758db525af8c38f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 07:06:48 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.148.7 -> 6.148.9

---
 ...hon3-hypothesis_6.148.7.bb => python3-hypothesis_6.148.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.148.7.bb => python3-hypothesis_6.148.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.148.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.148.9.bb
index a8c0421025..25d18b52c0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.148.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b96e817e715c5b1a278411e3b9baf6d599d5b12207ba25e41a8f066929f6c2a6"
+SRC_URI[sha256sum] = "6ec0696ed2fff8c514d61b6f1ca2cd1cb00c948ffd18cab1877c941c0ddb2839"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============5731755251552464854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.148.7.tar.gz;downloadfilename=hypothesis-6.148.7.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.148.9.tar.gz;downloadfilename=hypothesis-6.148.9.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3590302 to 3592124 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.148.7" to "6.148.9"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.148.7 [default] to 6.148.9 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info

--===============5731755251552464854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.148.7-6.148.9.patch"

RnJvbSBiODU5ZmE1Yzc2NTgxNTdkMjYzZmI2ZTY3NThkYjUyNWFmOGMzOGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNzowNjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE0OC43IC0+IDYuMTQ4LjkKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTQ4LjcuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ4LjkuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTQ4LjcuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ4LjkuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
NDguNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTQ4LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNDguNy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNDguOS5i
YgppbmRleCBhOGMwNDIxMDI1Li4yNWQxOGI1MmMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE0OC43LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ4LjkuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5NmU4MTdlNzE1YzViMWEyNzg0MTFlM2I5
YmFmNmQ1OTlkNWIxMjIwN2JhMjVlNDFhOGYwNjY5MjlmNmMyYTYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNmVjMDY5NmVkMmZmZjhjNTE0ZDYxYjZmMWNhMmNkMWNiMDBjOTQ4ZmZkMThjYWIxODc3
Yzk0MWMwZGRiMjgzOSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============5731755251552464854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.148.9.dist-info

--===============5731755251552464854==--

