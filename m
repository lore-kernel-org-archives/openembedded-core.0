Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC98EC54ED9
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20163.1708018345245219721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DBAPHo2o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U82B/Lq8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3a202-d30b6e29-7528-4298-9acb-5563e2ac1ff9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QiML/9f9M1ET/IvtnasoLzQeAVKE3WbAhJ/hpYIW3Q4=;
	b=DBAPHo2omQBS/3u1SPdFwBPUq7t/exm9raH8528ZQyAbUokqqUMNp8JVVzeBbrIh
	LfeTNuohrVtjL0BU+OuQWVv+Q8hiWlxFBD4EVMzx9YCZVgP4ZEV+PH0V1m62byBL+8Y
	QLHRJMn4bNqvk2o+yNfWL3Nntdq0f8BnNJ4U0plk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QiML/9f9M1ET/IvtnasoLzQeAVKE3WbAhJ/hpYIW3Q4=;
	b=U82B/Lq8L7wAaAvxGUaTXvHGbvjVE4qsA3u0ZbxoO1dXgSLFbunT/hWtI5NX3p38
	qqlOjTL1+uhJzrkXEs7MkwsKeT7DBK//kF+2f11u78HnpcaXod5jBBTMNsT6sDpCmD6
	kblAtIF+bwvfUlCEGgPidkZHkjc8C4ylNiDQBsuM=
Content-Type: multipart/mixed; boundary="===============8089247945975614000=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2024.2.2 SUCCEEDED
Message-ID: <0101018dadd3a202-d30b6e29-7528-4298-9acb-5563e2ac1ff9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195588

--===============8089247945975614000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2024.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2023.11.17-2024.2.2.patch
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
From 235f0b2dadf1ea1dc7b2431b589feb40b4432068 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:58:35 +0000
Subject: [PATCH] python3-certifi: upgrade 2023.11.17 -> 2024.2.2

---
 ...ython3-certifi_2023.11.17.bb => python3-certifi_2024.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2023.11.17.bb => python3-certifi_2024.2.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index daed712362..4e61b8d9d4 100644
--- a/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1"
+SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
 inherit pypi setuptools3
 
-- 
2.42.0


--===============8089247945975614000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2023.11.17.tar.gz;downloadfilename=certifi-2023.11.17.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2024.2.2.tar.gz;downloadfilename=certifi-2024.2.2.tar.gz"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2023.11.17" to "2024.2.2"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 302536 to 305361 (+1%)
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2023.11.17 [default] to 2024.2.2 [default]
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/WHEEL was removed

--===============8089247945975614000==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2023.11.17-2024.2.2.patch"

RnJvbSAyMzVmMGIyZGFkZjFlYTFkYzdiMjQzMWI1ODlmZWI0MGI0NDMyMDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NTg6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyMy4xMS4xNyAtPiAyMDI0LjIuMgoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDIzLjExLjE3LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI0LjIuMi5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
My4xMS4xNy5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNC4yLjIuYmJ9ICg4NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMy4x
MS4xNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIw
MjQuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjMuMTEuMTcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjQuMi4yLmJiCmlu
ZGV4IGRhZWQ3MTIzNjIuLjRlNjFiOGQ5ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjMuMTEuMTcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNC4yLjIuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWI0NjlmM2E5MDBiZjI4
ZGMxOWI4Y2ZiZjgwMTliZjQ3ZjdmZGQxYTY1YTFkNGZmYjk4ZmMxNDE2NmJlYjRkMSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwNTY5ODU5Zjk1ZmM3NjFiMThiNDVlZjQyMWIxMjkwYTBmNjVmMTQ3
ZTkyYTFlNWViM2U2MzVmOWE1ZTRlNjZmIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAot
LSAKMi40Mi4wCgo=

--===============8089247945975614000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/certifi-2024.2.2.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/certifi-2023.11.17.dist-info/WHEEL was removed

--===============8089247945975614000==--

