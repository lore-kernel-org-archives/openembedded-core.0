Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5E6C369A1
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18037.1743511387671847570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Z4gMzs+p;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SF8RRX+l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160acaa-3b878660-243c-440f-826d-8edd020cff85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6VTUCyiTtJ3SPyrR7XFQYfWEmtwSke74L8ZL9TIj2Ys=;
	b=Z4gMzs+pYI8/Q2nimhiD+kmKwmXtVcexy0wmORgK1rFdXkl1Mad1jpIaX9qRwYfF
	ZftHOUrVY5NIRxs5Ad8+dLqItXBDPwswXRo0HMaR7/xxWh1qu6QcLGZv3dXLPg85fwC
	i9RiTlh3Kv0tnuDokyyj4Pm0YEL4tGHAGwlK3ODE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511399;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6VTUCyiTtJ3SPyrR7XFQYfWEmtwSke74L8ZL9TIj2Ys=;
	b=SF8RRX+lYFY6XH3alpzJI9fpMYikaeLdmsrY0bFHBkBzOs6DZ/iPizF6A1dkXQP0
	81CYF0bA8pWoyjsDf7jmVPACbowJzvnMinRW1LWSkQZArAAD7ubemmRkTQYFdwVcfQ8
	8Jg14NvSMU7VwOl2fyR+Tel3aLQ5AI+BoJDMfDLI=
Content-Type: multipart/mixed; boundary="===============6565569748045352976=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.3.19.19 SUCCEEDED
Message-ID: <01010195f160acaa-3b878660-243c-440f-826d-8edd020cff85-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214071

--===============6565569748045352976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.3.19.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.3.13.13-2025..patch
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
From 0f96915e873732a4e7e381696ce76c1b8ad0ae3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:36:51 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.3.13.13 ->
 2025.3.19.19

---
 ...025.3.13.13.bb => python3-trove-classifiers_2025.3.19.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.13.13.bb => python3-trove-classifiers_2025.3.19.19.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
index f2b06b2919..39fb997e88 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.13.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2a5e24ddafb20da2225a825fe167c4fd4ecbf312cef4310d67f19dc40da7dc8d"
+SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============6565569748045352976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info

--===============6565569748045352976==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.3.13.13-2025..patch"

RnJvbSAwZjk2OTE1ZTg3MzczMmE0ZTdlMzgxNjk2Y2U3NmMxYjhhZDBhZTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOTozNjo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNS4zLjEzLjEzIC0+CiAyMDI1LjMu
MTkuMTkKCi0tLQogLi4uMDI1LjMuMTMuMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjMuMTkuMTkuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTMuMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI1LjMuMTkuMTkuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4xMy4x
My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI1LjMuMTkuMTkuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUu
My4xMy4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4xOS4xOS5iYgppbmRleCBmMmIwNmIyOTE5Li4zOWZi
OTk3ZTg4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNS4zLjEzLjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTkuMTkuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNs
YXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIyYTVlMjRkZGFmYjIwZGEyMjI1YTgyNWZlMTY3YzRmZDRlY2Jm
MzEyY2VmNDMxMGQ2N2YxOWRjNDBkYTdkYzhkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4ZTlk
Mzk2ZmU5MDhkNWY0M2I3NDU0ZmE0YzQzZDE3Y2QwZmRhZGYwNDZmNDVmYjM4YTVlM2FmOGQ5NTll
Y2QiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIFVQU1RSRUFNX0NIRUNL
X1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============6565569748045352976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.13.13.tar.gz;downloadfilename=trove_classifiers-2025.3.13.13.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.19.19.tar.gz;downloadfilename=trove_classifiers-2025.3.19.19.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.3.13.13" to "2025.3.19.19"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.3.13.13 [default] to 2025.3.19.19 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93387 to 93546 (+0%)
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.13.13.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info

--===============6565569748045352976==--

