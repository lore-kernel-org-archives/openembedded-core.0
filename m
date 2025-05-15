Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FDCC5B547
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11041.1747312314434957606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AIcyARDf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bmClR62q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010196d3ee05f2-9967a9cb-835d-4f9a-888a-e4cfa57d8ca5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xjTIakY6/ZmQyX1wLWTcjcqxxHTn+gg+nvk2tTb45d4=;
	b=AIcyARDfBdovEpRC2tzvSdGX7jpy09csBqSLz4FWfVcS43dmw4ptaJET+hcPG9G9
	/7UoPkollSohmPTEO8i4Yog86oV+KjZ5ATxegRRizHMih0hR+Mm2Ws8Hjhr78vCwc0v
	2aR+ipb9f11ElbBOp6Vs7qIfL7oHW5SB+GYjn07Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xjTIakY6/ZmQyX1wLWTcjcqxxHTn+gg+nvk2tTb45d4=;
	b=bmClR62qpQGeAV262BW7P9vxfwDTqJrckcw66e8+BsRhd5DBox5MdIWdfb3ULcKY
	b4yMaoVilNHuEyZPRkYkUcLmu72zPH4sAAK24uM2Zzz6MABag1bxeOzYvUrx4wWhdYN
	ke1F7Q+/TCDyrFbf5lKU2DD7vTDq6U28CLRP9I4s=
Content-Type: multipart/mixed; boundary="===============4429436993757750199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.131.17 SUCCEEDED
Message-ID: <01010196d3ee05f2-9967a9cb-835d-4f9a-888a-e4cfa57d8ca5-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216611

--===============4429436993757750199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.131.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.131.14-6.131.17.patch
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
From 08cc1a34e8d3bd764a23be5e321a8881567b4abe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:58:02 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.131.14 -> 6.131.17

---
 ...n3-hypothesis_6.131.14.bb => python3-hypothesis_6.131.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.131.14.bb => python3-hypothesis_6.131.17.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.17.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.131.17.bb
index 269ed936b6..d720d0c5c3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.17.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "347edc46cfe9bfcfb0598c4c927ed8fd573edfc8bacd2162023c4cf16accb702"
+SRC_URI[sha256sum] = "8901926baf6915494ba84353a4cbeaa845c6076d4a159c1d782e6969d4176829"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4429436993757750199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.131.14-6.131.17.patch"

RnJvbSAwOGNjMWEzNGU4ZDNiZDc2NGEyM2JlNWUzMjFhODg4MTU2N2I0YWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6NTg6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMzEuMTQgLT4gNi4xMzEuMTcKCi0tLQogLi4u
bjMtaHlwb3RoZXNpc182LjEzMS4xNC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xMzEuMTcu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTMxLjE0LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4xNy5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjEzMS4xNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBv
dGhlc2lzXzYuMTMxLjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMxLjE0LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjEzMS4xNy5iYgppbmRleCAyNjllZDkzNmI2Li5kNzIwZDBjNWMzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4xNC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEz
MS4xNy5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0
X3JsZS5weSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQ3ZWRjNDZjZmU5YmZj
ZmIwNTk4YzRjOTI3ZWQ4ZmQ1NzNlZGZjOGJhY2QyMTYyMDIzYzRjZjE2YWNjYjcwMiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4OTAxOTI2YmFmNjkxNTQ5NGJhODQzNTNhNGNiZWFhODQ1YzYwNzZk
NGExNTljMWQ3ODJlNjk2OWQ0MTc2ODI5IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBw
eXRob24zLWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============4429436993757750199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.131.14.tar.gz;downloadfilename=hypothesis-6.131.14.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.131.17.tar.gz;downloadfilename=hypothesis-6.131.17.tar.gz file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.131.14" to "6.131.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3335714 to 3344204 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.131.14 [default] to 6.131.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.131.14" to "6.131.17"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.131.14.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.131.17.dist-info

--===============4429436993757750199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.131.14.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.131.17.dist-info

--===============4429436993757750199==--

