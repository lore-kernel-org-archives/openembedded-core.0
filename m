Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DC4C5474F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1302.1721071146309465418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=da02jS7j;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dHunoA0f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d59670-6d987a14-a720-4201-869a-9bf4fd3a7ac1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=48yBzU7WFmkaIZl5BPWajcIMSQ1pwTSQlILt0crQCSI=;
	b=da02jS7ju0Ip62sceHK+IwsDUkk6D+DDZFRNyR2zS7RymK86T2e0IsO5mc7knlUi
	gbbishcyTKYQaXSQ/ewb3PKmgd16PV+SzQJklWscXSIi1GPaZoGzHDFPWnhPl1BQ54I
	7hz6762mMJrc+KeoEipjl4GLna/3K/UGORTFiA14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=48yBzU7WFmkaIZl5BPWajcIMSQ1pwTSQlILt0crQCSI=;
	b=dHunoA0fd+HszXss38tAuckg5mz3nhTHa3fVOczvdvsAoDvhxX9PnxfRBCkSPG/Q
	JTIqjMMqYkmMIUrrbY00lbtkQERGQXc75va4EbZtv+J3bNF53sZ4tcZT9ILc6VI8ZNe
	U5pN9al+IFtFK+umVUKLypn/5tXpxLsVThxFAm8E=
Content-Type: multipart/mixed; boundary="===============8786424751029662275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.7.2 SUCCEEDED
Message-ID: <01010190b7d59670-6d987a14-a720-4201-869a-9bf4fd3a7ac1-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201983

--===============8786424751029662275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.5.22-2024.7.2.patch
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
From 921777c875d7639be1ebaa66918166a13dc99ce3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 11:28:31 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.5.22 -> 2024.7.2

---
 ...fiers_2024.5.22.bb => python3-trove-classifiers_2024.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.5.22.bb => python3-trove-classifiers_2024.7.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
index 8876b63e7d..934c6d4be0 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8a6242bbb5c9ae88d34cf665e816b287d2212973c8777dfaef5ec18d72ac1d03"
+SRC_URI[sha256sum] = "8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.44.0


--===============8786424751029662275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/WHEEL was removed

--===============8786424751029662275==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.5.22-2024.7.2.patch"

RnJvbSA5MjE3NzdjODc1ZDc2MzliZTFlYmFhNjY5MTgxNjZhMTNkYzk5Y2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTE6Mjg6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuNS4yMiAtPiAyMDI0LjcuMgoK
LS0tCiAuLi5maWVyc18yMDI0LjUuMjIuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjcuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjQuNS4yMi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjQuNy4yLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjUuMjIuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC43LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuNS4yMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQu
Ny4yLmJiCmluZGV4IDg4NzZiNjNlN2QuLjkzNGM2ZDRiZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjUuMjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNz
aWZpZXJzXzIwMjQuNy4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGE2MjQyYmJiNWM5YWU4
OGQzNGNmNjY1ZTgxNmIyODdkMjIxMjk3M2M4Nzc3ZGZhZWY1ZWMxOGQ3MmFjMWQwMyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4MzI4ZjJhYzJjZTNmZDc3M2NiYjM3Yzc2NWEwZWQ3YTgzZjg5ZGM1
NjRjN2Q0NTJmMDM5YjY5MjQ5ZDBhYzM1IgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3Np
ZmllcnMiCiAKLS0gCjIuNDQuMAoK

--===============8786424751029662275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.5.22.tar.gz;downloadfilename=trove_classifiers-2024.5.22.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.7.2.tar.gz;downloadfilename=trove_classifiers-2024.7.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 92626 to 93072 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.5.22" to "2024.7.2"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.5.22 [default] to 2024.7.2 [default]
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info/WHEEL was removed

--===============8786424751029662275==--

