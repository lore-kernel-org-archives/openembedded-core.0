Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6423CC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42712.1738416044742695977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hiEQI7Za;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EL1xL1sR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abd1f5-2c92fdd2-22c3-4ee9-bebf-28aa40dd347d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y3IbWt6k7NS2hRkNBzhPZkFv7huTAFAS9W5ll+0dtwo=;
	b=hiEQI7ZaZzIK8F3cVy17AIreOZRcZtgPUDIYvwORx/jHKdJM4lxesshVStxOr9HW
	EFBAEPBMTKk+WVdFdDgYKlEp3pUU5oWrGTF0jj6oPu+bRdW9dvHzlkLs+U9D/3+90v8
	+LdzFYgBWrkZxHzQFsE/GW9a+F9WWYRWSnWKoWo8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y3IbWt6k7NS2hRkNBzhPZkFv7huTAFAS9W5ll+0dtwo=;
	b=EL1xL1sRO01K94fPIvejwFs+XkLqW3lHmy0OBmyL2o+Yc03y/Zpbtxr2LJ5MptUL
	CDaLlNI/3dOovPo/i0zED1OwbYyWtpMPjFzgdWO9Mt58BF71CM9j4EoTRplwrFgDCzK
	g+4qlsmC9DNk/XzKAbtdzm1Xnm/pZvkuvqhDcrCw=
Content-Type: multipart/mixed; boundary="===============8744921026908676650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.1.31 SUCCEEDED
Message-ID: <01010194c1abd1f5-2c92fdd2-22c3-4ee9-bebf-28aa40dd347d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210527

--===============8744921026908676650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.1.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2024.12.14-2025.1.31.patch
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
From 134e8a12e261135f6b5c5a9ab6376034b238a319 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:04:38 +0000
Subject: [PATCH] python3-certifi: upgrade 2024.12.14 -> 2025.1.31

---
 ...thon3-certifi_2024.12.14.bb => python3-certifi_2025.1.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.12.14.bb => python3-certifi_2025.1.31.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
index 714e231efe..69b39ba100 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
+SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
 
 inherit pypi setuptools3
 
-- 
2.44.1


--===============8744921026908676650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2024.12.14.tar.gz;downloadfilename=certifi-2024.12.14.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.1.31.tar.gz;downloadfilename=certifi-2025.1.31.tar.gz"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2024.12.14 [default] to 2025.1.31 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2024.12.14" to "2025.1.31"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 306934 to 309419 (+1%)
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/WHEEL was removed

--===============8744921026908676650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/certifi-2024.12.14.dist-info/WHEEL was removed

--===============8744921026908676650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2024.12.14-2025.1.31.patch"

RnJvbSAxMzRlOGExMmUyNjExMzVmNmI1YzVhOWFiNjM3NjAzNGIyMzhhMzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODowNDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDI0LjEyLjE0IC0+IDIwMjUuMS4zMQoKLS0tCiAuLi50
aG9uMy1jZXJ0aWZpXzIwMjQuMTIuMTQuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjUuMS4zMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
NC4xMi4xNC5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNS4xLjMxLmJifSAoODYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjQu
MTIuMTQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8y
MDI1LjEuMzEuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNC4xMi4xNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS4xLjMxLmJi
CmluZGV4IDcxNGUyMzFlZmUuLjY5YjM5YmExMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjQuMTIuMTQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS4xLjMxLmJiCkBAIC03
LDcgKzcsNyBAQCBIT01FUEFHRSA9ICIgaHR0cDovL2NlcnRpZmkuaW8vIgogTElDRU5TRSA9ICJJ
U0MiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xMTYxOGNiNmE5NzU5
NDg2NzkyODZiMTIxMWJkNTczYyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2NTBkMzBmMzcw
YzJiNzI0ODEyYmVlMDgwMDhiZTBjNDE2M2IxNjNkZGFlYzNmMjU0NmMxY2FmNjVmMTkxZGIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q1ZGE2OTI1MDU2ZjZmMThmMTE5MjAwNDM0YTQ3ODBhOTQy
NjNmMTBkMWMyMWQwMzJhNmY2YjJiYWEyMDY1MSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMz
CiAKLS0gCjIuNDQuMQoK

--===============8744921026908676650==--

