Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BECCA0EF6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.11418.1755263225738767937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p9YMBZmm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Wp1jsNzl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010198add74d9d-318e6e5b-d8b3-4af1-8a62-fd1d61c85d7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O43pw+G8E+DYN4yrS9SoOUf2zSF5WzYmLpbbOsc4CJY=;
	b=p9YMBZmmaIG5QdXTSSVFmkEZ18WO4lBkZcq0m3vvNQ9whoagW3cQhGhm6qtKQjxG
	tov00RDKzLnNJAdw0TygtoVniFEuGcNpIu5B1rxpY3rgP5lqAzKjFYzUppij/y6+GmK
	Ps9Xg9STZEgbMhwl+0ja11f8j6zIIP0keFc8kVIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O43pw+G8E+DYN4yrS9SoOUf2zSF5WzYmLpbbOsc4CJY=;
	b=Wp1jsNzl6FlwQxKP9/hItwWFM3C0ZToNFRWYsmVwWhyrgC9K3qYx4ylgKJlt7Aoj
	TCDmFZ1tXtJfvv/9wwfcT0WHEguTFDGg6CzvaqG5VeJ97z1c27uSCLawqVtLHKswPVV
	sk4E2S0E0VCwbOLB1VzKdV1gaCIjXT5MFOp01AjI=
Content-Type: multipart/mixed; boundary="===============7828606828726252902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.138.1 SUCCEEDED
Message-ID: <01010198add74d9d-318e6e5b-d8b3-4af1-8a62-fd1d61c85d7a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221911

--===============7828606828726252902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.138.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.135.29-6.138.1.patch
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
From dffd8fe3e75e798d043d81176b4d44e2b8e90dfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:06:39 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.135.29 -> 6.138.1

---
 ...on3-hypothesis_6.135.29.bb => python3-hypothesis_6.138.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.29.bb => python3-hypothesis_6.138.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb b/meta/recipes-devtools/python/python3-hypothesis_6.138.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.138.1.bb
index 0795e8a507..68a37216c4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.138.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "871acb38ff61346a420267f81f4ba05ad9a85d08965211edf9b29bc0c1ad9d7b"
+SRC_URI[sha256sum] = "2408a303b229cefae06e9429a68b15cc24d6ce28018c85573105946d6f5ba9d3"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7828606828726252902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/WHEEL was removed

--===============7828606828726252902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.135.29-6.138.1.patch"

RnJvbSBkZmZkOGZlM2U3NWU3OThkMDQzZDgxMTc2YjRkNDRlMmI4ZTkwZGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MDY6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMzUuMjkgLT4gNi4xMzguMQoKLS0tCiAuLi5v
bjMtaHlwb3RoZXNpc182LjEzNS4yOS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xMzguMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNf
Ni4xMzUuMjkuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM4LjEuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni4xMzUuMjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3Ro
ZXNpc182LjEzOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM1LjI5LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEz
OC4xLmJiCmluZGV4IDA3OTVlOGE1MDcuLjY4YTM3MjE2YzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM1LjI5LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM4LjEu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUu
cHkgXAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3MWFjYjM4ZmY2MTM0NmE0MjAy
NjdmODFmNGJhMDVhZDlhODVkMDg5NjUyMTFlZGY5YjI5YmMwYzFhZDlkN2IiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMjQwOGEzMDNiMjI5Y2VmYWUwNmU5NDI5YTY4YjE1Y2MyNGQ2Y2UyODAxOGM4
NTU3MzEwNTk0NmQ2ZjViYTlkMyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9u
My1hdHRycyBcCi0tIAoyLjQ3LjEKCg==

--===============7828606828726252902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.135.29.tar.gz;downloadfilename=hypothesis-6.135.29.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.138.1.tar.gz;downloadfilename=hypothesis-6.138.1.tar.gz file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.135.29" to "6.138.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3484974 to 3538529 (+2%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.135.29 [default] to 6.138.1 [default]
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.138.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.29.dist-info/WHEEL was removed

--===============7828606828726252902==--

