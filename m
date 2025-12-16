Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3863CD5C0D3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17189.1765872140018372999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zpj5WDNm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZziXjElX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b262e7c10-1c1cb0f3-62cf-46ee-828c-8add20ec0bed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872139;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/cSWroOJD7F2teiw7oFHkE7nq1DEVrg96DVUkW8vPbI=;
	b=zpj5WDNmrAV37EGp9I1ljg3vCbcnXlEG7Sj4OzePUCPL8k1GAQnmc1LHRxGgHpMM
	cwdyoeuaol5W/GRWiOT1f8mixPKSgA46fWM1qvCfIFkHtjfBIKHz1Cq5AgwZx8gjPlw
	/q1QoF7MxrlwkQNx0spSLXQYKyWqxS1j2RL9Lo4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872139;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/cSWroOJD7F2teiw7oFHkE7nq1DEVrg96DVUkW8vPbI=;
	b=ZziXjElXfJv67aGKmEHmGv9S5ZSEjz0ySWzER2+ftutGihVpG/QgzxmR764xDGD/
	onfIDS4OiqgjASp4+OTCDJNDBrzoUhfh7HuiwMD3IA66ckcaWuM+vx0oU/pGAEpWsrS
	QfWjsvNFq7zt2+A4gzRvWPmZH5UYXlPZZIGkE+lY=
Content-Type: multipart/mixed; boundary="===============4692700238295015482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.11.12 SUCCEEDED
Message-ID: <0101019b262e7c10-1c1cb0f3-62cf-46ee-828c-8add20ec0bed-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227797

--===============4692700238295015482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.11.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.8.3-2025.11.12.patch
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
From e9dc8f12791aa251fae30602bde9bd7170262449 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:23:27 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.8.3 -> 2025.11.12

---
 ...ython3-certifi_2025.8.3.bb => python3-certifi_2025.11.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.8.3.bb => python3-certifi_2025.11.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
index d3e842b4bd..a7ba12b620 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
+SRC_URI[sha256sum] = "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4692700238295015482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info -> /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info, directory renamed /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/WHEEL was removed

--===============4692700238295015482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.8.3.tar.gz;downloadfilename=certifi-2025.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.11.12.tar.gz;downloadfilename=certifi-2025.11.12.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.8.3" to "2025.11.12"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.8.3 [default] to 2025.11.12 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info -> /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 297778 to 294129 (-1%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.8.3" to "2025.11.12"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.11.12.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2025.8.3.dist-info/WHEEL was removed

--===============4692700238295015482==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.8.3-2025.11.12.patch"

RnJvbSBlOWRjOGYxMjc5MWFhMjUxZmFlMzA2MDJiZGU5YmQ3MTcwMjYyNDQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6MjM6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNS44LjMgLT4gMjAyNS4xMS4xMgoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDI1LjguMy5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNS4xMS4xMi5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
NS44LjMuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjUuMTEuMTIuYmJ9ICg4NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS44
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1
LjExLjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuOC4zLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjExLjEyLmJiCmlu
ZGV4IGQzZTg0MmI0YmQuLmE3YmExMmI2MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuOC4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuMTEuMTIuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTU2NDEwNWY3OGRlZDU2
NGUzYWU3YzkyMzkyNDQzNWUxZGFhNzQ2M2ZhZWFiNWJiOTMyYmM1M2ZmYWU2MzQwNyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkOGFiNTQ3OGYyZWNkNzhhZjI0Mjg3ODQxNWFmZmNlNzYxY2E2YmM1
NGEyMmEyN2UwMjZkN2MyNTM1N2MzMzE2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============4692700238295015482==--

