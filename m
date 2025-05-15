Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DAEC54799
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11041.1747312314434957606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Or3/prGz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=aXXb63x1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010196d3ee113f-6f55fd5b-9bf4-43ea-9696-8762c2b1fbd0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EB0UhGn5UdpCJRsR+k82B7Rcg8qxogqp93301SJr1cM=;
	b=Or3/prGzOwt7WhH9FeV+z/MSX+qcinyW4hLkKrvG1vSsinNGe6WuVwqFfeOt4EUb
	INOKwYa76dr5TPYOJrHLNwxS84vD6d/QblX5iaZ+auQpsPPPBSVXlm8+yf4MZ6EnYGE
	h5cCd16gqN8uGFjxEhc0APFSeINmG30c4ErwXJrc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EB0UhGn5UdpCJRsR+k82B7Rcg8qxogqp93301SJr1cM=;
	b=aXXb63x1B1lauTz9ZsQ6GbPwhQvg1Y7qbD/z8QqcT/r1w4whnPj1q5cSIxSD6Abn
	rZKsHNS+Aye3u9auLevGpBH5d5JiDe6lFnqmnV8dbAibpHWeLt8uMZVo36v0orwuYK2
	9/KS7KwSzwnd2Cm68fuG2YVVmrHjsnFu8dBAraLo=
Content-Type: multipart/mixed; boundary="===============5221367960533403233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.5.9.12 SUCCEEDED
Message-ID: <01010196d3ee113f-6f55fd5b-9bf4-43ea-9696-8762c2b1fbd0-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216620

--===============5221367960533403233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.5.9.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch
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
From 7d433df8b6a6f0d89e9f755f5a8cdf449e03734b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:22:04 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.3.19.19 ->
 2025.5.9.12

---
 ...2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.19.19.bb => python3-trove-classifiers_2025.5.9.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
index 39fb997e88..68b09537bc 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
+SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============5221367960533403233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch"

RnJvbSA3ZDQzM2RmOGI2YTZmMGQ4OWU5Zjc1NWY1YThjZGY0NDllMDM3MzRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6MjI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuMy4xOS4xOSAtPgogMjAyNS41
LjkuMTIKCi0tLQogLi4uMjAyNS4zLjE5LjE5LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS41LjkuMTIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTkuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI1LjUuOS4xMi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4zLjE5LjE5
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZp
ZXJzXzIwMjUuNS45LjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMu
MTkuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10
cm92ZS1jbGFzc2lmaWVyc18yMDI1LjUuOS4xMi5iYgppbmRleCAzOWZiOTk3ZTg4Li42OGIwOTUz
N2JjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNS4zLjE5LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjUuOS4xMi5iYgpAQCAtMyw3
ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3Np
ZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjk4ZTlkMzk2ZmU5MDhkNWY0M2I3NDU0ZmE0YzQzZDE3Y2QwZmRhZGYw
NDZmNDVmYjM4YTVlM2FmOGQ5NTllY2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2NhN2M4YTdh
NzZlMmNkMzE0NDY4YzY3N2M2OWQxMmNjMjM1NzcxMWZjYWI0YTYwZjg3OTk0YzE1ODllNWNiNSIK
IAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogVVBTVFJFQU1fQ0hFQ0tfUFlQ
SV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDcuMQoK

--===============5221367960533403233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.19.19.tar.gz;downloadfilename=trove_classifiers-2025.3.19.19.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.5.9.12.tar.gz;downloadfilename=trove_classifiers-2025.5.9.12.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5496 (+23%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt /usr/bin/trove-classifiers"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.5.9.12"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93568 to 95240 (+2%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.5.9.12 [default]
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed

--===============5221367960533403233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5496 (+23%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt /usr/bin/trove-classifiers /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was removed

--===============5221367960533403233==--

