Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D04FD1D87D
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11802.1728994555781572509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OYyu8RJB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YwDJgKqX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b4624-476bb166-739b-4e5a-991f-78c2247b0d96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MPJIRxtw4wKSxaA+pNVu/rX3ctkAG3tK3ZujeK98ZVE=;
	b=OYyu8RJB163RCASENQ5U8ovGTXzerbzCSY3YxT3LUNG+5NvEPmOMjwDEJGfoNB0V
	AYjtQrvLKUg+U+99yMca1FdXNobIjxstkSrwu8RHyI9d+lc4Xjy5f9oYjJahy6wEf/f
	icdQJj14VcjKmoaVOGzdpQtYdrBIIxPRc04jkyJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MPJIRxtw4wKSxaA+pNVu/rX3ctkAG3tK3ZujeK98ZVE=;
	b=YwDJgKqXGOwvAmhd3WjPusSn5q5T+lD80nLmp788rG41yzE4D5RLnKMRVwBAIz/E
	Akuy3/PtQyW/01bsO6XBQ/cG3e9KsZ0KaJ6jLfiOpCiMvq3Cc9QZdEmYEkUsRtpQpvd
	w2wjVDJ+fs19sXfaJ6zc0Md9tlosNfbbhI0Ti2aE=
Content-Type: multipart/mixed; boundary="===============8942738223910583951=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.10.13 SUCCEEDED
Message-ID: <01010192901b4624-476bb166-739b-4e5a-991f-78c2247b0d96-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205853

--===============8942738223910583951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2024.10.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.9.12-2024.10..patch
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
From cdd7a7e23ca47454d1c22e5b276e44e13a1df7df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:58:45 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.9.12 -> 2024.10.13

---
 ...ers_2024.9.12.bb => python3-trove-classifiers_2024.10.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.9.12.bb => python3-trove-classifiers_2024.10.13.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.13.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.10.13.bb
index c3a4eea1c7..923504f51c 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4"
+SRC_URI[sha256sum] = "b820fc6f9544543afa15e5d9cfc426cde3b20fc2246dff6f019b835731508cef"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.44.1


--===============8942738223910583951==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.9.12-2024.10..patch"

RnJvbSBjZGQ3YTdlMjNjYTQ3NDU0ZDFjMjJlNWIyNzZlNDRlMTNhMWRmN2RmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6NTg6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuOS4xMiAtPiAyMDI0LjEwLjEz
CgotLS0KIC4uLmVyc18yMDI0LjkuMTIuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjEwLjEzLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNC45LjEyLmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNC4xMC4xMy5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC45LjEyLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMTAu
MTMuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuOS4xMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjQuMTAuMTMuYmIKaW5kZXggYzNhNGVlYTFjNy4uOTIzNTA0ZjUxYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjQuOS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNC4xMC4xMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3NpZmllcnMiCiBMSUNFTlNFID0gIkFw
YWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNh
OTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRiNDZi
M2UxMzRhNGQwMTk5OWFjNWJjNmU1MjhhZmNjMTBjYzQ4ZjBmNzI0ZjE4NWYyNjdlMjc2MDA1NzY4
ZjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjgyMGZjNmY5NTQ0NTQzYWZhMTVlNWQ5Y2ZjNDI2
Y2RlM2IyMGZjMjI0NmRmZjZmMDE5YjgzNTczMTUwOGNlZiIKIAogUFlQSV9QQUNLQUdFID0gInRy
b3ZlX2NsYXNzaWZpZXJzIgogCi0tIAoyLjQ0LjEKCg==

--===============8942738223910583951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was removed

--===============8942738223910583951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.9.12.tar.gz;downloadfilename=trove_classifiers-2024.9.12.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.10.13.tar.gz;downloadfilename=trove_classifiers-2024.10.13.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93132 to 93244 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.9.12" to "2024.10.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.9.12 [default] to 2024.10.13 [default]
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.10.13.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was removed

--===============8942738223910583951==--

