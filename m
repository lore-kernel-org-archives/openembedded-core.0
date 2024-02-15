Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532B0C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20325.1708018344503055758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aOWNKjYN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pb3JxmPg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018dadd3a429-8992c8a0-4713-4ed8-86f5-1d9b0b31f92b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=stzoLVLMPD0nmhKLQnHMb4c3FIPk+dGm1GQOhgXnaJo=;
	b=aOWNKjYNO4kWbZWcQSP44XoXh4QiE64datI1Bk7Y3fs7iXGPXcTAaUrM7LXbAXmk
	gqR5THYHBPWTOge1rqnB1u3eYOyrnPNTE3uKK0UpyvyZeMWNpgDRMKi6FhZ5byaT+c+
	NuMrLWTR5L2UIu5/2KD84+jK10AS53Zc6gBEvxAg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=stzoLVLMPD0nmhKLQnHMb4c3FIPk+dGm1GQOhgXnaJo=;
	b=pb3JxmPgSA5UcNTp5ib1uVkZt4g1TGCSDapV2jL04g9/JFONP4rektL8GQnkxoo0
	hoe3JB7V2kTbNu6bCjEBKDl5ZGz9Thm9KXFjLc1KW9aQ84XARud8r3crTk+rTRAG98t
	34Yr3favEZ6MLzXEyMMxIOOf8abqseeAvVVmm1k0=
Content-Type: multipart/mixed; boundary="===============4229553224487071073=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-yamllint: upgrading to 1.34.0 SUCCEEDED
Message-ID: <0101018dadd3a429-8992c8a0-4713-4ed8-86f5-1d9b0b31f92b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195592

--===============4229553224487071073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-yamllint* to *1.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-yamllint-upgrade-1.33.0-1.34.0.patch
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
From 478afd488dec9ddf2bd4e2f254c792d9154034a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 08:43:08 +0000
Subject: [PATCH] python3-yamllint: upgrade 1.33.0 -> 1.34.0

---
 .../{python3-yamllint_1.33.0.bb => python3-yamllint_1.34.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.33.0.bb => python3-yamllint_1.34.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.34.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.34.0.bb
index 7e51fc9395..b3b29a0264 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.34.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
+SRC_URI[sha256sum] = "7f0a6a41e8aab3904878da4ae34b6248b6bc74634e0d3a90f0fb2d7e723a3d4f"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS:${PN} += "${PYTHON_PN}-pathspec ${PYTHON_PN}-pyyaml"
-- 
2.42.0


--===============4229553224487071073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-yamllint: SRC_URI changed from "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.33.0.tar.gz;downloadfilename=yamllint-1.33.0.tar.gz" to "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.34.0.tar.gz;downloadfilename=yamllint-1.34.0.tar.gz"
packages/core2-64-poky-linux/python3-yamllint: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dbg: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-dev: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-doc: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-locale: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-src: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint-staticdev: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PV changed from "1.33.0" to "1.34.0"
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGSIZE changed from 332055 to 341328 (+3%)
packages/core2-64-poky-linux/python3-yamllint/python3-yamllint: PKGV changed from 1.33.0 [default] to 1.34.0 [default]
Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.12/site-packages/yamllint-1.33.0.dist-info moved to /usr/lib/python3.12/site-packages/yamllint-1.34.0.dist-info

--===============4229553224487071073==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-yamllint-upgrade-1.33.0-1.34.0.patch"

RnJvbSA0NzhhZmQ0ODhkZWM5ZGRmMmJkNGUyZjI1NGM3OTJkOTE1NDAzNGE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDg6NDM6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXlhbWxsaW50OiB1cGdyYWRlIDEuMzMuMCAtPiAxLjM0LjAKCi0tLQogLi4uL3tweXRo
b24zLXlhbWxsaW50XzEuMzMuMC5iYiA9PiBweXRob24zLXlhbWxsaW50XzEuMzQuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy15YW1sbGludF8xLjMzLjAu
YmIgPT4gcHl0aG9uMy15YW1sbGludF8xLjM0LjAuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzMuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy15YW1sbGludF8xLjM0LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXlhbWxsaW50XzEuMzMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzQuMC5iYgppbmRleCA3ZTUxZmM5Mzk1Li5i
M2IyOWEwMjY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMteWFtbGxpbnRfMS4zMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy15YW1sbGludF8xLjM0LjAuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAieWFtbGxpbnQiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIyZGNlYWI5ZWYyZDk5NTE4YTJmY2Y0ZmZjOTY0ZDQ0MjUwYWM0NDU5YmUxYmEzY2Ez
MTUxMThlNGExYTgxZjdkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmMGE2YTQxZThhYWIzOTA0
ODc4ZGE0YWUzNGI2MjQ4YjZiYzc0NjM0ZTBkM2E5MGYwZmIyZDdlNzIzYTNkNGYiCiAKIERFUEVO
RFMgKz0gIiR7UFlUSE9OX1BOfS1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5EUzoke1BO
fSArPSAiJHtQWVRIT05fUE59LXBhdGhzcGVjICR7UFlUSE9OX1BOfS1weXlhbWwiCi0tIAoyLjQy
LjAKCg==

--===============4229553224487071073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.12/site-packages/yamllint-1.33.0.dist-info moved to /usr/lib/python3.12/site-packages/yamllint-1.34.0.dist-info

--===============4229553224487071073==--

