Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C37C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8856.1749993275954159520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2zFfVa5R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HR7GWzz8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba671e-82f0d9dc-14ab-47b3-8c6e-b7a3b3543eb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BtLGvNakV0WdCZD+fy5HW2juilSN8AgQ3ZURZ5YeRkA=;
	b=2zFfVa5RhljlfhYK8F2a9O2p4gU13R09UVgNet1N/NP/v2aGZ35v3Ny5arJLF+lV
	HBwKApgI+1GgntufqKItMfBgaEYChqQr9r+wAdnlLQvKfKUEx4kwIYyJPLkca6yNPCN
	qYoB4eQa4joe1bejZxV7b26JGVwoDFZy+92vPrrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BtLGvNakV0WdCZD+fy5HW2juilSN8AgQ3ZURZ5YeRkA=;
	b=HR7GWzz8kq8bfVrbPonyKCEki41YET+OZN7taH47yE2az0jAue7Eiv4UDbpSKfam
	4zCyL0jjVSpUQK82aOvendlnaTsy6gtDolVbdgxs52vghQuuH3cOMRibv7/4KdC134m
	G38iWVRt0dGOeDEr3zR4cWgoTK5jU1G2cHlxMwTE=
Content-Type: multipart/mixed; boundary="===============7406819829277324128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.6.15 SUCCEEDED
Message-ID: <0101019773ba671e-82f0d9dc-14ab-47b3-8c6e-b7a3b3543eb2-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218676

--===============7406819829277324128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.6.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.4.26-2025.6.15.patch
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
From 62e183dfeff7a884b3cdf07e82ae9ca8e6023342 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:07:08 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.4.26 -> 2025.6.15

---
 ...ython3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
index 07f9f3bfc8..32e677c638 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
+SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============7406819829277324128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.4.26-2025.6.15.patch"

RnJvbSA2MmUxODNkZmVmZjdhODg0YjNjZGYwN2U4MmFlOWNhOGU2MDIzMzQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MDc6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNS40LjI2IC0+IDIwMjUuNi4xNQoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDI1LjQuMjYuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNi4xNS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
NS40LjI2LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI1LjYuMTUuYmJ9ICg4NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS40
LjI2LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
NS42LjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNC4yNi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS42LjE1LmJiCmlu
ZGV4IDA3ZjlmM2JmYzguLjMyZTY3N2M2MzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNC4yNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjYuMTUuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE4MTYwNTdlYTNjZGVm
Y2VmNzAyNzBkMmM1MTVlNDUwNmJiYzk1NGY0MTdmYTVhZGUyMDIxMjEzYmI4ZjBjNiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkNzQ3YWE1YThiOWJiYmIxYmI4YzIyYmIxM2UyMmJkMWYxOGU5Nzk2
ZGVmYTE2YmFiNDIxZjdmN2EzMTczMjNiIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAot
LSAKMi40Ny4xCgo=

--===============7406819829277324128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.4.26.tar.gz;downloadfilename=certifi-2025.4.26.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.6.15.tar.gz;downloadfilename=certifi-2025.6.15.tar.gz"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.4.26" to "2025.6.15"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 296135 to 291370 (-2%)
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.4.26 [default] to 2025.6.15 [default]
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.4.26.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.6.15.dist-info

--===============7406819829277324128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.4.26.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.6.15.dist-info

--===============7406819829277324128==--

