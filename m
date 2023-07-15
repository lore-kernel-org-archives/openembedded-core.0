Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E7C2FC06
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.5932.1689456452991123417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VogoBRO8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101895b73a9c8-3bb5c7bb-a617-4c11-ab0b-9631cffffcf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oxyrJ18E+3jwl3AmTkUTjh/Vuat9K2V4g1SxZzLl4yo=;
	b=VogoBRO8xHCdvQblx9HcGsBcg9OOB58eI1VkqVR74Qq8bc6ATskG3xlEff4N2n8T
	qCkKOasJKp3LnzukIALHY3vdCRH8iYN+iRnK6CSOHt2bgiJvtooIJyv5lYHP8023Hsr
	onHUC4mggUsdsNa5ZrKTrZivnqQEGsnJdwVHAfKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oxyrJ18E+3jwl3AmTkUTjh/Vuat9K2V4g1SxZzLl4yo=;
	b=RX30AQTbRtg/MtcJhxpPXvVObAJudyt2lfjbntpdE3cfe7ixioR/7UvnuVii9MsV
	r+zEkEP6f+aehh0LlCHAlvU/qxVPcPSl8Hei0w8pyunCgXaj6lBzXd+Ud6o8bvDIf73
	XEtxQUvVGxnMp3XILyHGISZUwpzcAKo+9J541CMA=
Content-Type: multipart/mixed; boundary="===============7960860495600622245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.81.1 SUCCEEDED
Message-ID: <010101895b73a9c8-3bb5c7bb-a617-4c11-ab0b-9631cffffcf4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184341

--===============7960860495600622245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.81.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.80.0-6.81.1.patch
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
From b56f04a52599eb6dff9d1fe7e7a682f965170a2d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:15:24 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.80.0 -> 6.81.1

---
 ...ython3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.80.0.bb => python3-hypothesis_6.81.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.81.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.81.1.bb
index 82f855d4b7..1c656e0b50 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.81.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "75d74da36fd3837b5b3fe15211dabc7389e78d882bf2c91bab2184ccf91fe64c"
+SRC_URI[sha256sum] = "89c1afad5000a1cc89409fff4187e6118816a6cac80195c8c719efda14a8ce52"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============7960860495600622245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.80.0.tar.gz;downloadfilename=hypothesis-6.80.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.81.1.tar.gz;downloadfilename=hypothesis-6.81.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2871714 to 2871321 (-0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.80.0" to "6.81.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.80.0 [default] to 6.81.1 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.80.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.81.1.dist-info

--===============7960860495600622245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.80.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.81.1.dist-info

--===============7960860495600622245==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.80.0-6.81.1.patch"

RnJvbSBiNTZmMDRhNTI1OTllYjZkZmY5ZDFmZTdlN2E2ODJmOTY1MTcwYTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MTU6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi44MC4wIC0+IDYuODEuMQoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjgwLjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODEuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi44
MC4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjgxLjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44MC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44
MS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44MS4xLmJiCmluZGV4
IDgyZjg1NWQ0YjcuLjFjNjU2ZTBiNTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjgxLjEuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjc1ZDc0ZGEzNmZkMzgzN2I1YjNmZTE1MjExZGFiYzczODll
NzhkODgyYmYyYzkxYmFiMjE4NGNjZjkxZmU2NGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODlj
MWFmYWQ1MDAwYTFjYzg5NDA5ZmZmNDE4N2U2MTE4ODE2YTZjYWM4MDE5NWM4YzcxOWVmZGExNGE4
Y2U1MiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM5LjIKCg==

--===============7960860495600622245==--

