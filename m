Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C77C5B559
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.27786.1748786127252233983
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xn6X86vn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pD4U4qsz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc6c283-b79db805-7c03-4e4b-8643-5f1cc7c4f388-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luasGkxlPcgh+Pl/2uwtXzlN3Y/l6HAj+LlkvMn6CjY=;
	b=xn6X86vnan3TgUIFn5CCyLFzYW70b4ha9XRN8aguvoe49iVw0mdmtyp6MGdocg9l
	bLfgrpB+9jWRc1uIF5pMEaXpfziWm6qQBFHzlRaJoqoL24ml4GoTayerLekPO4tBotJ
	7060Jlvo6mAlHtjx4MuTPff7zAJ5oYP2lkfOVHCE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luasGkxlPcgh+Pl/2uwtXzlN3Y/l6HAj+LlkvMn6CjY=;
	b=pD4U4qszqBwgMPbtg4kJRqCWnuqogiaIdSpDfxPjtbbeTYn7zAo90GKOz1pic4sx
	WOia8DflGRizAC2K1rwIL5dT1W2uOM5u6N0uz/orRx8lXwN4cE4hPofusoQ8IUdhWFq
	hqvdUs6MZawFCPt5EUKCFpocFOdaL7BeP0d2uRT4=
Content-Type: multipart/mixed; boundary="===============1369759762204632119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 25.1.0 SUCCEEDED
Message-ID: <010101972bc6c283-b79db805-7c03-4e4b-8643-5f1cc7c4f388-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217604

--===============1369759762204632119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *25.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-25.0.0-25.1.0.patch
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
From aa3ff7e5b5e3534b318bfdc629d55088ec422de4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:40:15 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 25.0.0 -> 25.1.0

---
 ...{python3-pyopenssl_25.0.0.bb => python3-pyopenssl_25.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.0.0.bb => python3-pyopenssl_25.1.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
index 6485f3e1ed..c1f571c552 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16"
+SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280fc205b"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============1369759762204632119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.0.0.tar.gz;downloadfilename=pyopenssl-25.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.1.0.tar.gz;downloadfilename=pyopenssl-25.1.0.tar.gz"
packages/core2-64-poky-linux/python3-pyopenssl: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "25.0.0" to "25.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 470168 to 473306 (+1%)
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 25.0.0 [default] to 25.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "25.0.0" to "25.1.0"
Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.0.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info

--===============1369759762204632119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.0.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info

--===============1369759762204632119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-25.0.0-25.1.0.patch"

RnJvbSBhYTNmZjdlNWI1ZTM1MzRiMzE4YmZkYzYyOWQ1NTA4OGVjNDIyZGU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTo0MDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDI1LjAuMCAtPiAyNS4xLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzI1LjAuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNS4xLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjUuMC4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjAuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjUuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjUuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYgppbmRleCA2NDg1ZjNl
MWVkLi5jMWY1NzFjNTUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzI1LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgcHl0aG9uMy1jcnlwdG9ncmFwaHkiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDJjZWY3OTllZmEzOTM2YmIwOGU4Y2NiOTQzM2E1NzU3
MjJiOWRkOTg2MDIzZjFjYWJjNGFlNjRlOWRhYzE2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhk
MDMxODg0NDgyZTBjNjdlZTkyYmY5YTRkOGNjZWIwOGQ5MmFiYTcxMzY0MzJmZmIwNzAzYzUyODBm
YzIwNWIiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ3LjEKCg==

--===============1369759762204632119==--

