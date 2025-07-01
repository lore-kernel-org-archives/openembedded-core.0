Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639C8C83F3D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1411.1751386807592846792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VPOdu9+6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ArahAyyY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9f49c-6704a6ac-c36f-49f7-94da-9114a845e5ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=apJyf+/DUU8s5TpOEvb52xPHPuKaQEYZOX/r8hBkZSI=;
	b=VPOdu9+69kMtmri/ERf+z11usDthUIaICOyo++2IBVrq9+32cd0q1pXCsntQ/PnH
	EokwTHzLN9iAWtsHZSbKjTds3uYI8IQtgTDzLOLPvxb06Pa8YvyseirRvWNGZbq4SUr
	CoU5K109Blqb2uKriyBIE7uVNimwZ3iLfEDJinjc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=apJyf+/DUU8s5TpOEvb52xPHPuKaQEYZOX/r8hBkZSI=;
	b=ArahAyyYOPpQjd5v54j3HaWE4XbSIoUbiYO9Zsier8s4QCaUO1Fgm1rVL9Ae6Op2
	55fr92CYzPTgYnXs4M8VyKnzaWKCROVX8eakmYY0gqirA39H3LhXAS19HWw9luTl8KC
	vhiqQJ8EgV4nfL0x6KjSj0AXkSFNKAg3fY1DhrzE=
Content-Type: multipart/mixed; boundary="===============4362706110658283871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.135.20 SUCCEEDED
Message-ID: <01010197c6c9f49c-6704a6ac-c36f-49f7-94da-9114a845e5ce-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219637

--===============4362706110658283871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.135.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.135.9-6.135.20.patch
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
From 9d062a570fd5ab57d7758b5d26fcca85c8b4d0cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 09:01:51 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.135.9 -> 6.135.20

---
 ...on3-hypothesis_6.135.9.bb => python3-hypothesis_6.135.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.135.9.bb => python3-hypothesis_6.135.20.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.135.20.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.135.20.bb
index efc5229fbc..bc632e6082 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.135.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.135.20.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a80a256268b8af3d34d62be30f6bf4a7d099b2b762621cc5f3f1de65e7b98543"
+SRC_URI[sha256sum] = "cef91cf893337b90a4df427ff77674f38bb5bc6c5e1e3d3db1764faee77df7a5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4362706110658283871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses, added "/usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/WHEEL was removed

--===============4362706110658283871==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.135.9-6.135.20.patch"

RnJvbSA5ZDA2MmE1NzBmZDVhYjU3ZDc3NThiNWQyNmZjY2E4NWM4YjRkMGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwOTowMTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjEzNS45IC0+IDYuMTM1LjIwCgotLS0KIC4uLm9u
My1oeXBvdGhlc2lzXzYuMTM1LjkuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTM1LjIwLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjEzNS45LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEzNS4yMC5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182
LjEzNS45LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVz
aXNfNi4xMzUuMjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzUuOS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzUu
MjAuYmIKaW5kZXggZWZjNTIyOWZiYy4uYmM2MzJlNjA4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMzUuOS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEzNS4yMC5i
YgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5w
eSBcCiAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTgwYTI1NjI2OGI4YWYzZDM0ZDYy
YmUzMGY2YmY0YTdkMDk5YjJiNzYyNjIxY2M1ZjNmMWRlNjVlN2I5ODU0MyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjZWY5MWNmODkzMzM3YjkwYTRkZjQyN2ZmNzc2NzRmMzhiYjViYzZjNWUxZTNk
M2RiMTc2NGZhZWU3N2RmN2E1IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24z
LWF0dHJzIFwKLS0gCjIuNDcuMQoK

--===============4362706110658283871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.135.9.tar.gz;downloadfilename=hypothesis-6.135.9.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.135.20.tar.gz;downloadfilename=hypothesis-6.135.20.tar.gz file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.135.9" to "6.135.20"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.135.9 [default] to 6.135.20 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info, added "/usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3470604 to 3472537 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.135.9" to "6.135.20"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.20.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/__pycache__/threading.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/hypothesis/utils/threading.py was added
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.135.9.dist-info/WHEEL was removed

--===============4362706110658283871==--

