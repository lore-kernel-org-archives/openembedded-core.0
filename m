Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EB9D60052
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4798.1731964613643664920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AsK31gq8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1wnKssp0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101934122f83e-71d89045-57d8-4ef4-a153-38db886659cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vWyATv0+ySXuNQFPlJIuFzFP6FojPqe/fk4+7fqIK1M=;
	b=AsK31gq8yNwk2zqGVMUYA8C3dmJnsyHEo0d4eNdoXV6bKBcjmZMhK21SO/3WYN3i
	LthFnHUUbMwzWAapwwQrA0vDBl+K62dqsnAvQkwSB6OrW80UfJIt5S9WDtc+pjf+ygQ
	TEOTFuKk/RuBZqLPuGpVgcTTeqEuSkd28DQXTT0c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vWyATv0+ySXuNQFPlJIuFzFP6FojPqe/fk4+7fqIK1M=;
	b=1wnKssp0Z7x4YL+TTgl0HiTqiK3JkGB7rtAx7IT4JxnTt6LwSZaL8TJ5UyBxGU4U
	2uv2WUKwuYKpbXqtKmFKdUU0OBWPHY9vUHUhf2G6R+0s1PQvAKXl0QzeZfAs7DY0xAt
	RGkjMvnDJtkBji+ZbPvYOTuv9oH4WdRdysE631gA=
Content-Type: multipart/mixed; boundary="===============3071975696700589868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 3.0.2 SUCCEEDED
Message-ID: <010101934122f83e-71d89045-57d8-4ef4-a153-38db886659cf-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207283

--===============3071975696700589868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markupsafe* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-3.0.1-3.0.2.patch
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
From dc77111d094fa13d1efa13f569ebfa23d8296abe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 22:47:45 +0000
Subject: [PATCH] python3-markupsafe: upgrade 3.0.1 -> 3.0.2

---
 ...{python3-markupsafe_3.0.1.bb => python3-markupsafe_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.1.bb => python3-markupsafe_3.0.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
index 03be78a022..7e48bc36c7 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344"
+SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
 
 PYPI_PACKAGE = "markupsafe"
 UPSTREAM_CHECK_PYPI_PACKAGE = "MarkupSafe"
-- 
2.44.1


--===============3071975696700589868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 9214 to 10160 (+10%)
Changes to packages/core2-64-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.13/site-packages/MarkupSafe-3.0.1.dist-info moved to /usr/lib/python3.13/site-packages/MarkupSafe-3.0.2.dist-info

--===============3071975696700589868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markupsafe: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.1.tar.gz;downloadfilename=markupsafe-3.0.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.2.tar.gz;downloadfilename=markupsafe-3.0.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-markupsafe: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGSIZE changed from 34992 to 34600 (-1%)
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 9214 to 10160 (+10%)
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGSIZE changed from 4154 to 4149 (-0%)
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "3.0.1" to "3.0.2"
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 3.0.1 [default] to 3.0.2 [default]
packages/core2-64-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 60357 to 60352 (-0%)
Changes to packages/core2-64-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.13/site-packages/MarkupSafe-3.0.1.dist-info moved to /usr/lib/python3.13/site-packages/MarkupSafe-3.0.2.dist-info

--===============3071975696700589868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-3.0.1-3.0.2.patch"

RnJvbSBkYzc3MTExZDA5NGZhMTNkMWVmYTEzZjU2OWViZmEyM2Q4Mjk2YWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjI6NDc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmt1cHNhZmU6IHVwZ3JhZGUgMy4wLjEgLT4gMy4wLjIKCi0tLQogLi4ue3B5dGhv
bjMtbWFya3Vwc2FmZV8zLjAuMS5iYiA9PiBweXRob24zLW1hcmt1cHNhZmVfMy4wLjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4x
LmJiID0+IHB5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMi5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMi5iYgppbmRleCAwM2JlNzhh
MDIyLi43ZTQ4YmMzNmM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBB
R0UgPSAiaHR0cDovL2dpdGh1Yi5jb20vbWl0c3VoaWtvL21hcmt1cHNhZmUiCiBMSUNFTlNFID0g
IkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21k
NT1mZmVmZmE1OWM5MGM5YzRhMDMzYzc1NzRmOGYzZmI3NSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjNlNjgzZWU0ZjVkMGZhMmRkZTRkYjc3ZWQ4ZGQ4YTg3NjY4NmUzZmM0MTc2NTVjMmVjZTlh
OTA1NzY5MDUzNDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWU1NWQzZWRmODAxNjdlNDhlYTEx
YTkyM2M3Mzg2ZjQ2NjlkZjY3ZDc5OTQ1NTQzODdmODRlN2Q4YjBhMmJmMCIKIAogUFlQSV9QQUNL
QUdFID0gIm1hcmt1cHNhZmUiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiTWFya3Vw
U2FmZSIKLS0gCjIuNDQuMQoK

--===============3071975696700589868==--

