Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C30CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12178.1752594941273060025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ikHh/e4F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l9Zp9xOm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101980ecc834d-1d05fb9c-de46-4511-b4f8-825dce519e7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7Lsf66Kr+FGZiN/bdlis3jdSFmUVFYxhL6vEb5eicQY=;
	b=ikHh/e4FUI/2z/exAaU0Svg/kD5HV1w3SdVSkKk5stf5HY3lY/tGadaUko6Tq1mC
	mQvr+ZqaVE6DZyMF0+j2ZEe46yXhnqzmULa5A0iZ1dPAbFOnW22nxntQ7Eqvlq0VZOs
	s91Z1vfaKu5jMBWcS79Mt4pb740tYv2AfiGLJfdc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7Lsf66Kr+FGZiN/bdlis3jdSFmUVFYxhL6vEb5eicQY=;
	b=l9Zp9xOmrf3lWWxz4nP/6tebUHC9+mTUOoCFNwbtpCSIA4pqVqUOYWZhnFn7oUis
	p+wNiO9VJqUKIM6AHjXaVeluiawyrXDq7VL9BLymrHAC7qfC8VrKHVV1+2/lXolvvyt
	5+28bYiaYLih9Wb870JFgnm+wBBCi2I4lC0zx7r4=
Content-Type: multipart/mixed; boundary="===============4979598149385398693=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.7.14 SUCCEEDED
Message-ID: <010101980ecc834d-1d05fb9c-de46-4511-b4f8-825dce519e7b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220343

--===============4979598149385398693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.7.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.6.15-2025.7.14.patch
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
From dcd95eea8232d78ba250d2a553ed453091e8e0c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:55:12 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.6.15 -> 2025.7.14

---
 ...ython3-certifi_2025.6.15.bb => python3-certifi_2025.7.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.6.15.bb => python3-certifi_2025.7.14.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb b/meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
index e8ad8da486..d223b8694c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.7.14.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
+SRC_URI[sha256sum] = "8ea99dbdfaaf2ba2f9bac77b9249ef62ec5218e7c2b2e903378ed5fccf765995"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4979598149385398693==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.6.15-2025.7.14.patch"

RnJvbSBkY2Q5NWVlYTgyMzJkNzhiYTI1MGQyYTU1M2VkNDUzMDkxZThlMGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6NTU6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNS42LjE1IC0+IDIwMjUuNy4xNAoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDI1LjYuMTUuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNy4xNC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
NS42LjE1LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjcuMTQuYmJ9ICg4NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS42
LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
NS43LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNi4xNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS43LjE0LmJiCmlu
ZGV4IGU4YWQ4ZGE0ODYuLmQyMjNiODY5NGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNi4xNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjcuMTQuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc0N2FhNWE4YjliYmJi
MWJiOGMyMmJiMTNlMjJiZDFmMThlOTc5NmRlZmExNmJhYjQyMWY3ZjdhMzE3MzIzYiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4ZWE5OWRiZGZhYWYyYmEyZjliYWM3N2I5MjQ5ZWY2MmVjNTIxOGU3
YzJiMmU5MDMzNzhlZDVmY2NmNzY1OTk1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============4979598149385398693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.6.15.tar.gz;downloadfilename=certifi-2025.6.15.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.7.14.tar.gz;downloadfilename=certifi-2025.7.14.tar.gz"
packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.6.15" to "2025.7.14"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 291370 to 300202 (+3%)
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.6.15 [default] to 2025.7.14 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.6.15" to "2025.7.14"
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.6.15.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info

--===============4979598149385398693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.6.15.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.7.14.dist-info

--===============4979598149385398693==--

