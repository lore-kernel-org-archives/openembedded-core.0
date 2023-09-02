Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796D5CA101C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5681.1693650553637242325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b7EJ7RLQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DO8yOOMJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a557088d0-27a281fb-6277-4646-a4b4-278ed6116561-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LvdC/VNe4cxMVfkrLrQGwFKDKwuRCn2xILfP4Y8P8gs=;
	b=b7EJ7RLQNCYOAHusb7LQkVdn2hodpA6ZGm6T+4CEHYKroteOEGcqhYZQNkb6FEtl
	GEDN7nNNQFIg+mbN7DzMaHSMeb/2L1RqeK5M5Ddzixb8fVvdi3M2cyrq/XpvTDR3Unp
	ZGL+xaI3MjxkZDicAePFTfHlSYTmzOr+W/tKh6t0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LvdC/VNe4cxMVfkrLrQGwFKDKwuRCn2xILfP4Y8P8gs=;
	b=DO8yOOMJELXF6ymt6b9muoWFeXkxbVqxu1lOkBjiC9msyhNf60NXbcvvgN21SOU2
	Wed2oyyacyE/OKciMW5yuGFubTdO7DVVKL03iLcmrFA7JjN7gYJxowvC+v0in1uzn4J
	FyX/X3PyyrPQDnSRxuZUJji3Gu4W7vG2Fn28AwAQ=
Content-Type: multipart/mixed; boundary="===============6929014116277296458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.82.7 SUCCEEDED
Message-ID: <0101018a557088d0-27a281fb-6277-4646-a4b4-278ed6116561-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187067

--===============6929014116277296458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.82.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.82.5-6.82.7.patch
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
From 78a95254c1e60e13c55893c27282541f9e5141ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 15:04:59 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.82.5 -> 6.82.7

---
 ...ython3-hypothesis_6.82.5.bb => python3-hypothesis_6.82.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.82.5.bb => python3-hypothesis_6.82.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
index 89efeff633..5df95eb67b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.82.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.82.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "41e78b4cbc0a36b38729a761e31b92d81d87a60a297994c03f2ccb2c946f5ebd"
+SRC_URI[sha256sum] = "06069ff2f18b530a253c0b853b9fae299369cf8f025b3ad3b86ee7131ecd3207"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============6929014116277296458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.82.5-6.82.7.patch"

RnJvbSA3OGE5NTI1NGMxZTYwZTEzYzU1ODkzYzI3MjgyNTQxZjllNTE0MWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNTowNDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjgyLjUgLT4gNi44Mi43CgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuODIuNS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi44Mi43LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljgy
LjUuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODIuNy5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjgyLjUu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljgy
LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Mi41LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjgyLjcuYmIKaW5kZXgg
ODllZmVmZjYzMy4uNWRmOTVlYjY3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Mi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODIuNy5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNDFlNzhiNGNiYzBhMzZiMzg3MjlhNzYxZTMxYjkyZDgxZDg3
YTYwYTI5Nzk5NGMwM2YyY2NiMmM5NDZmNWViZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNjA2
OWZmMmYxOGI1MzBhMjUzYzBiODUzYjlmYWUyOTkzNjljZjhmMDI1YjNhZDNiODZlZTcxMzFlY2Qz
MjA3IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============6929014116277296458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.82.5.tar.gz;downloadfilename=hypothesis-6.82.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.82.7.tar.gz;downloadfilename=hypothesis-6.82.7.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.82.5" to "6.82.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.82.5 [default] to 6.82.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2873503 to 2873890 (+0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.82.5.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.82.7.dist-info

--===============6929014116277296458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.82.5.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.82.7.dist-info

--===============6929014116277296458==--

