Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A8DC3ABD2
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1774.1746113609447995714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WUAwDlsG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BemKiWgc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b61df-d219e721-2846-4837-af94-0053749a46cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7GxZJjwhxKpBgommNPzPAgLVrO1SmTA6U5tuJ0xncKM=;
	b=WUAwDlsGBY1hY8FPgZG45biWGwK7gaNFcKjpQaWjjWskO8R2teSBtyh/Tk003o80
	9H7XIkvKwrFb74oFya1eNKDxq5De9aVm2pkAMM/CWDfo2ayIrlX3fxsXhqcYr0ATIZ9
	7heZt4xwatLjAYp/XBXI8GT6eDS4UyRvD1Lfmfrg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113618;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7GxZJjwhxKpBgommNPzPAgLVrO1SmTA6U5tuJ0xncKM=;
	b=BemKiWgccEETU+6PPVuPJ9lfovM1pXG8H3rcnwmWY9FCtOfLT4XiuLFjb0aq5mO7
	Wa5aHoprK/WINblNvOcLZDCux1WewsKJytcC4sE064tKCfGEClLwAe6NnjAVOpdy7VJ
	ahNse3pqR1KTPID+s8ree6Fpu8FYjDzoh4OQfc2c=
Content-Type: multipart/mixed; boundary="===============6312295058087060332=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2025.4.26 SUCCEEDED
Message-ID: <010101968c7b61df-d219e721-2846-4837-af94-0053749a46cb-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215816

--===============6312295058087060332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2025.4.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2025.1.31-2025.4.26.patch
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
From ba7fb8a88d33c87acc9c95f36fff735344e25a1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:46:12 +0000
Subject: [PATCH] python3-certifi: upgrade 2025.1.31 -> 2025.4.26

---
 ...ython3-certifi_2025.1.31.bb => python3-certifi_2025.4.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.1.31.bb => python3-certifi_2025.4.26.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
index 69b39ba100..07f9f3bfc8 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
+SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============6312295058087060332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.1.31.tar.gz;downloadfilename=certifi-2025.1.31.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2025.4.26.tar.gz;downloadfilename=certifi-2025.4.26.tar.gz"
packages/core2-64-poky-linux/python3-certifi: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2025.1.31" to "2025.4.26"
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 309619 to 296135 (-4%)
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2025.1.31 [default] to 2025.4.26 [default]
packages/core2-64-poky-linux/python3-certifi/python3-certifi: PV changed from "2025.1.31" to "2025.4.26"
Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.4.26.dist-info

--===============6312295058087060332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.13/site-packages/certifi-2025.1.31.dist-info moved to /usr/lib/python3.13/site-packages/certifi-2025.4.26.dist-info

--===============6312295058087060332==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2025.1.31-2025.4.26.patch"

RnJvbSBiYTdmYjhhODhkMzNjODdhY2M5Yzk1ZjM2ZmZmNzM1MzQ0ZTI1YTFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODo0NjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDI1LjEuMzEgLT4gMjAyNS40LjI2CgotLS0KIC4uLnl0
aG9uMy1jZXJ0aWZpXzIwMjUuMS4zMS5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNS40LjI2LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8yMDI1
LjEuMzEuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNC4yNi5iYn0gKDg2JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjEu
MzEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1
LjQuMjYuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS4xLjMxLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI1LjQuMjYuYmIKaW5k
ZXggNjliMzliYTEwMC4uMDdmOWYzYmZjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNS4xLjMxLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjUuNC4yNi5iYgpAQCAtNyw3ICs3
LDcgQEAgSE9NRVBBR0UgPSAiIGh0dHA6Ly9jZXJ0aWZpLmlvLyIKIExJQ0VOU0UgPSAiSVNDIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTE2MThjYjZhOTc1OTQ4Njc5
Mjg2YjEyMTFiZDU3M2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDVkYTY5MjUwNTZmNmYx
OGYxMTkyMDA0MzRhNDc4MGE5NDI2M2YxMGQxYzIxZDAzMmE2ZjZiMmJhYTIwNjUxIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjBhODE2MDU3ZWEzY2RlZmNlZjcwMjcwZDJjNTE1ZTQ1MDZiYmM5NTRm
NDE3ZmE1YWRlMjAyMTIxM2JiOGYwYzYiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0t
IAoyLjQ3LjEKCg==

--===============6312295058087060332==--

