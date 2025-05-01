Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C03C3ABC5
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1793.1746113618967861266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YBJUogq5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jXEpdFSV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b6163-53dfb930-024c-40a8-b2f1-f17c92f958eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ySa7zHsCMcdrqbx734MQHzp8GqNjRhmQ3wHJe0UG7aQ=;
	b=YBJUogq5pz/9USNt0lwSTlcm7V3x9uNik0DLkAXxlb9pZMXPyBgbHNj5fMZSNlaQ
	XEtoY1EVQu3+WkZ5d4K7iACrIzyiEUtbdgLWHUo1qd+db519B0dyXCTzW2ywioQ/tHP
	9PT5i1lG5yY8hwEX+ys503lFisOhPqKnTPN4RIvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ySa7zHsCMcdrqbx734MQHzp8GqNjRhmQ3wHJe0UG7aQ=;
	b=jXEpdFSVEhv14qEqvGaI54+q8VbnRrVD7kKHwD9wBOT/AMhPKWb8kPaqVXiCIwM8
	MM5yZq8Y8+NeCktUjltK0bXHeqtI7BQPn0UA0MyJ6RgtWdU51ffOkcbyJoS3A+cTAGB
	LX16Qi2Sx0FkRFRHCqvGGfAUaopJQFBIeDNOddw4=
Content-Type: multipart/mixed; boundary="===============8695811238532513661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.131.9 SUCCEEDED
Message-ID: <010101968c7b6163-53dfb930-024c-40a8-b2f1-f17c92f958eb-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215814

--===============8695811238532513661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.131.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.131.0-6.131.9.patch
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
From 7e5a8a4e48902f257f7b29bf229f69d4a0b1b91d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:48:52 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.131.0 -> 6.131.9

---
 ...hon3-hypothesis_6.131.0.bb => python3-hypothesis_6.131.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.131.0.bb => python3-hypothesis_6.131.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.131.9.bb
index d7656dc1d8..0ec2d8d84f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "4b807daeeee47852edfd9818ba0e33df14902f1b78a5524f1a3fb71f80c7cec3"
+SRC_URI[sha256sum] = "ee9b0e1403e1121c91921dbdc79d7f509fdb96d457a0389222d2a68d6c8a8f8e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8695811238532513661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.131.0-6.131.9.patch"

RnJvbSA3ZTVhOGE0ZTQ4OTAyZjI1N2Y3YjI5YmYyMjlmNjlkNGEwYjFiOTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODo0ODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjEzMS4wIC0+IDYuMTMxLjkKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTMxLjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMxLjkuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTMxLjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMxLjkuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
MzEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTMxLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzEuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzEuOS5i
YgppbmRleCBkNzY1NmRjMWQ4Li4wZWMyZDhkODRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzMS4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTMxLjkuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRiODA3ZGFlZWVlNDc4NTJlZGZkOTgxOGJh
MGUzM2RmMTQ5MDJmMWI3OGE1NTI0ZjFhM2ZiNzFmODBjN2NlYzMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZWU5YjBlMTQwM2UxMTIxYzkxOTIxZGJkYzc5ZDdmNTA5ZmRiOTZkNDU3YTAzODkyMjJk
MmE2OGQ2YzhhOGY4ZSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============8695811238532513661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.131.0.tar.gz;downloadfilename=hypothesis-6.131.0.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.131.9.tar.gz;downloadfilename=hypothesis-6.131.9.tar.gz file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.131.0" to "6.131.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3307196 to 3331084 (+1%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.131.0 [default] to 6.131.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.131.0" to "6.131.9"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.131.0.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.131.9.dist-info

--===============8695811238532513661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.131.0.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.131.9.dist-info

--===============8695811238532513661==--

