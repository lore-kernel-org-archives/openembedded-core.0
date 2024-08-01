Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8934BC531DD
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75740.1722536824022174707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iyWTqwc2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PQOoEEtm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f3216d0-dc763a90-7f89-4ca9-b8b5-7ebcfb19f140-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wDxfZnn6M9NTxKzT5Pxj911hb6XTZSL2ICpUtOHsAJU=;
	b=iyWTqwc2tNqIlZP5yCtvRZ4/njPvQ/GUPTWLwA+JlVIWIVrvQuzjHBSmvT4byH3Q
	vxx/Bh6WzQAddzhmPpPkletXbgy9nqX0oCuTQHLx6OrIfzkm9nCP6xqsxLK7HHauz0p
	TMBLYRjaCzEpWiiUm/Si1cUKTd/xepsN/aACC4zM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wDxfZnn6M9NTxKzT5Pxj911hb6XTZSL2ICpUtOHsAJU=;
	b=PQOoEEtmHt6P6DeariajfqDkwvV7kGYYhsGTeRfH3Qjf8AzIaRaFMqeUUBphxrBH
	CFlrp2GaMSyYwIMbOEk5bv4tHzWr/mXUeplZzkaLGgDqODpzlAc2cRQK7rRkLS9pc1t
	n6Df9UGskV/UwMC/KVYDGXMjn/xacpjKRHoaoiWg=
Content-Type: multipart/mixed; boundary="===============2851688301846975500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 8.2.0 SUCCEEDED
Message-ID: <010101910f3216d0-dc763a90-7f89-4ca9-b8b5-7ebcfb19f140-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202800

--===============2851688301846975500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-importlib-metadata* to *8.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-8.0.0-8.2.0.patch
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
From a5907d109f5f8604d55b1a455efa829be8bacb3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:38:29 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 8.0.0 -> 8.2.0

---
 ...ib-metadata_8.0.0.bb => python3-importlib-metadata_8.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_8.0.0.bb => python3-importlib-metadata_8.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
index 1e446c891f..3e1c7a7d6b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_8.2.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "188bd24e4c346d3f0a933f275c2fec67050326a856b9a359881d7c2a697e8812"
+SRC_URI[sha256sum] = "72e8d4399996132204f9a16dcc751af254a48f8d1b20b9ff0f98d4a8f901e73d"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.44.0


--===============2851688301846975500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.12/site-packages/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.12/site-packages/importlib_metadata-8.2.0.dist-info

--===============2851688301846975500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-importlib-metadata: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-8.0.0.tar.gz;downloadfilename=importlib_metadata-8.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-8.2.0.tar.gz;downloadfilename=importlib_metadata-8.2.0.tar.gz"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "8.0.0" to "8.2.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 8.0.0 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 145447 to 153964 (+6%)
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "8.0.0" to "8.2.0"
Changes to packages/core2-64-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.12/site-packages/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.12/site-packages/importlib_metadata-8.2.0.dist-info

--===============2851688301846975500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-8.0.0-8.2.0.patch"

RnJvbSBhNTkwN2QxMDlmNWY4NjA0ZDU1YjFhNDU1ZWZhODI5YmU4YmFjYjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDozODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhOiB1cGdyYWRlIDguMC4wIC0+IDguMi4wCgotLS0KIC4u
LmliLW1ldGFkYXRhXzguMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzguMi4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaW1wb3J0bGli
LW1ldGFkYXRhXzguMC4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzguMi4wLmJi
fSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbXBvcnRsaWItbWV0YWRhdGFfOC4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzguMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pbXBv
cnRsaWItbWV0YWRhdGFfOC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfOC4yLjAuYmIKaW5kZXggMWU0NDZjODkx
Zi4uM2UxYzdhN2Q2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV84LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzguMi4wLmJiCkBAIC04LDcg
KzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogUFlQSV9Q
QUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9p
bXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjE4OGJkMjRlNGMzNDZkM2YwYTkzM2YyNzVjMmZlYzY3MDUwMzI2YTg1NmI5
YTM1OTg4MWQ3YzJhNjk3ZTg4MTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzJlOGQ0Mzk5OTk2
MTMyMjA0ZjlhMTZkY2M3NTFhZjI1NGE0OGY4ZDFiMjBiOWZmMGY5OGQ0YThmOTAxZTczZCIKIAog
UyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============2851688301846975500==--

