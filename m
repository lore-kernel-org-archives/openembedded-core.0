Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179FFC35FF3
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.115625.1726410839505721212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dgiP9RY8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yExEM3Y+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191f61ad974-3719ff45-654a-4470-9be4-dfd0f8dbcd53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3ujmYeLw8S8oSmWoQtMgG6xc4SWS26+JjptWJZBga9E=;
	b=dgiP9RY8kS01AECKX1T8YHaGru09gT8wT9/mFDoT3j5uNkcq4w+L7uPWEdl8ekou
	HiT6Ew3uevOe+krRzHi1j2HEnP0hjo4Mbk1OPtwaYmNq0p6cXeJGyx1Iy+uAxUeEE9I
	7cF1kurwim60X5US3xjYHeNDeZMzl+uhupWQtCig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3ujmYeLw8S8oSmWoQtMgG6xc4SWS26+JjptWJZBga9E=;
	b=yExEM3Y+RZ7hHngMDg9slnyRfu/9LZAFzE0TnS8/o+74rhEKQv9IEDhYIM5n+yW2
	1bdzjrsQuO0M+6lvQ+XXOvYolIqOPuOqUpNfVqlKIuR7t4XhVD6fuVz1ulRIGQw+n0q
	PTZhMAyz0PZAvwOJTzt6spyt9Yq29Hal7aEjD6R4=
Content-Type: multipart/mixed; boundary="===============7278184964251543861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.9.12 SUCCEEDED
Message-ID: <01010191f61ad974-3719ff45-654a-4470-9be4-dfd0f8dbcd53-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204529

--===============7278184964251543861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2024.9.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.7.2-2024.9.12.patch
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
From faa892a3910d2e584cc0340752b618178b38dba2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 09:20:05 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.7.2 -> 2024.9.12

---
 ...fiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
index 934c6d4be0..c3a4eea1c7 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35"
+SRC_URI[sha256sum] = "4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.44.0


--===============7278184964251543861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was removed

--===============7278184964251543861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.7.2.tar.gz;downloadfilename=trove_classifiers-2024.7.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.9.12.tar.gz;downloadfilename=trove_classifiers-2024.9.12.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.7.2" to "2024.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93066 to 93132 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.7.2 [default] to 2024.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.7.2" to "2024.9.12"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.9.12.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.7.2.dist-info/WHEEL was removed

--===============7278184964251543861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.7.2-2024.9.12.patch"

RnJvbSBmYWE4OTJhMzkxMGQyZTU4NGNjMDM0MDc1MmI2MTgxNzhiMzhkYmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDk6MjA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuNy4yIC0+IDIwMjQuOS4xMgoK
LS0tCiAuLi5maWVyc18yMDI0LjcuMi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjQuOS4xMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjQuNy4yLmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNf
MjAyNC45LjEyLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjcuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjkuMTIuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuNy4yLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC45
LjEyLmJiCmluZGV4IDkzNGM2ZDRiZTAuLmMzYTRlZWExYzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjcuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3Np
ZmllcnNfMjAyNC45LjEyLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODMyOGYyYWMyY2UzZmQ3
NzNjYmIzN2M3NjVhMGVkN2E4M2Y4OWRjNTY0YzdkNDUyZjAzOWI2OTI0OWQwYWMzNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI0YjQ2YjNlMTM0YTRkMDE5OTlhYzViYzZlNTI4YWZjYzEwY2M0OGYw
ZjcyNGYxODVmMjY3ZTI3NjAwNTc2OGY0IgogCiBQWVBJX1BBQ0tBR0UgPSAidHJvdmVfY2xhc3Np
ZmllcnMiCiAKLS0gCjIuNDQuMAoK

--===============7278184964251543861==--

