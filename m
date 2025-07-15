Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D62CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12483.1752594935998325326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vGm7o4HZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bCVmI6zo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980ecc8de8-a366a573-9c6e-4cb7-afec-64386888d1d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mjUjFWDX9ZB0BJhngalSmrzdfcyq5U1PF3Cz2NwiIlk=;
	b=vGm7o4HZ1mA7XoYVznRqjyHI4bQXTqEt0kiumm3lBKxqto6bIG7BlPVKsmOdd8qD
	oxtzN5FmNWN5UpLX7nYdH7Ei2SNxsA4fBnhv4mTlyZYsqV8CAIA2YaYN0GH6T/uB+u9
	fyX+JE7rOt9loXkVY49ernwZAWSel7/avwJS8GYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mjUjFWDX9ZB0BJhngalSmrzdfcyq5U1PF3Cz2NwiIlk=;
	b=bCVmI6zobBITITWqHWXc7f+tHjPSZF0aUo7fKlddXwLZY5R8zE2UZLjy6A00GZFo
	2QRO4+No+IVdo8aJzHzQ36JbtNAJtkZOumIrLoGBcE/wRnuerdCFj5U23jX6Hvl5ges
	I581FribChUFpSuciORSpXWZPUxHkBdAMS2TAaeg=
Content-Type: multipart/mixed; boundary="===============4418913965191185692=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.14.1 SUCCEEDED
Message-ID: <010101980ecc8de8-a366a573-9c6e-4cb7-afec-64386888d1d0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220351

--===============4418913965191185692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-typing-extensions* to *4.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.14.0-4.14.1.patch
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
From 5d12909fca188758594cbb02c1d7ffd2b1d5bc75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:18:46 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.14.0 -> 4.14.1

---
 ...extensions_4.14.0.bb => python3-typing-extensions_4.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.14.0.bb => python3-typing-extensions_4.14.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
index 1c03aacc10..32edb656db 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
+SRC_URI[sha256sum] = "38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4418913965191185692==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.14.0-4.14.1.patch"

RnJvbSA1ZDEyOTA5ZmNhMTg4NzU4NTk0Y2JiMDJjMWQ3ZmZkMmIxZDViYzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6MTg6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuMTQuMCAtPiA0LjE0LjEKCi0tLQog
Li4uZXh0ZW5zaW9uc180LjE0LjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjE0
LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10eXBpbmct
ZXh0ZW5zaW9uc180LjE0LjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjE0LjEu
YmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cGluZy1leHRlbnNpb25zXzQuMTQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjE0LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5
cGluZy1leHRlbnNpb25zXzQuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTQuMS5iYgppbmRleCAxYzAzYWFj
YzEwLi4zMmVkYjY1NmRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjE0LjEuYmIKQEAgLTE2
LDcgKzE2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmNmNmIy
NDljMjY0MTU0MDIxOWE3MjdmMzVkOGQyYzIiCiBQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVu
c2lvbnMiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODY3NmI3ODhlMzJmMDJhYjQyZDllN2M2MTMyNDA0OGFl
NGM2ZDg0NGEzOTllZWJhY2UzZDQ5NzlkNzVjZWVmNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
OGIzOWY0YWVlYWI2NDg4NGNlOWY3NGM5NDI2M2VmNzhmM2MyMjQ2N2M4NzI0MDA1NDgzMTU0YzI2
NjQ4ZDM2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============4418913965191185692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.14.0.tar.gz;downloadfilename=typing_extensions-4.14.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.14.1.tar.gz;downloadfilename=typing_extensions-4.14.1.tar.gz"
packages/core2-64-poky-linux/python3-typing-extensions: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.14.0" to "4.14.1"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 335543 to 335807 (+0%)
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.14.0 [default] to 4.14.1 [default]
Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.13/site-packages/typing_extensions-4.14.0.dist-info moved to /usr/lib/python3.13/site-packages/typing_extensions-4.14.1.dist-info

--===============4418913965191185692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.13/site-packages/typing_extensions-4.14.0.dist-info moved to /usr/lib/python3.13/site-packages/typing_extensions-4.14.1.dist-info

--===============4418913965191185692==--

