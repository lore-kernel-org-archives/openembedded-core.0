Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E00EC27C7B
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13602.1713248040300477665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e/3TjAfn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JsurJPRt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a7266-0753b44d-b267-4ed5-8aab-39e63d7a1da9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2hhm8auwasiMDC2b4oE4VrFMsfAhoAIeJh6DFrrbAo0=;
	b=e/3TjAfnCKkQq/LDNyMPpxQ+s2BcoAmrRf2vGnNQCQPLn8lelMLfWPRN+vBGowxI
	92W2r7AjOIh3akyg2CkUTQDON834SY1TFDyLftQwFZNMx2plk43UlFcaVjYhJs/d6Wn
	Jih6RX6vWVliw7F8XMTqrBA7n04k1pM7Er8rR+Z8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2hhm8auwasiMDC2b4oE4VrFMsfAhoAIeJh6DFrrbAo0=;
	b=JsurJPRtKF+qgHkrau2Lrnxs9iwDDCZ9NjhkRto7fBkA11qCcCZUYmzOJTwNUst5
	qVKkYaPHYPcEJqBrdBSRSzsVRsRpBF8V1EGYaqIhdTqKyiwjhHVAXAL22/0++kuA9Z7
	mJIT2GgpRu0zXoNpab4mJOlXqkm6181wSmiTau8U=
Content-Type: multipart/mixed; boundary="===============7868153788083950888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.11.0 SUCCEEDED
Message-ID: <0101018ee58a7266-0753b44d-b267-4ed5-8aab-39e63d7a1da9-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198316

--===============7868153788083950888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.10.0-4.11.0.patch
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
From 03800b4e49d37eb2e6ff83ed9711af5540a4fa1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 20:12:54 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 4.10.0 -> 4.11.0

---
 ...extensions_4.10.0.bb => python3-typing-extensions_4.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.10.0.bb => python3-typing-extensions_4.11.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
index 8698a80cc5..ad45b669ec 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "b0abd7c89e8fb96f98db18d86106ff1d90ab692004eb746cf6eda2682f91b3cb"
+SRC_URI[sha256sum] = "83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============7868153788083950888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.12/site-packages/typing_extensions-4.10.0.dist-info moved to /usr/lib/python3.12/site-packages/typing_extensions-4.11.0.dist-info

--===============7868153788083950888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.10.0-4.11.0.patch"

RnJvbSAwMzgwMGI0ZTQ5ZDM3ZWIyZTZmZjgzZWQ5NzExYWY1NTQwYTRmYTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjA6MTI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuMTAuMCAtPiA0LjExLjAKCi0tLQog
Li4uZXh0ZW5zaW9uc180LjEwLjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjEx
LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10eXBpbmct
ZXh0ZW5zaW9uc180LjEwLjAuYmIgPT4gcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjExLjAu
YmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXR5cGluZy1leHRlbnNpb25zXzQuMTAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjExLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5
cGluZy1leHRlbnNpb25zXzQuMTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMTEuMC5iYgppbmRleCA4Njk4YTgw
Y2M1Li5hZDQ1YjY2OWVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4xMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjExLjAuYmIKQEAgLTE1
LDcgKzE1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmNmNmIy
NDljMjY0MTU0MDIxOWE3MjdmMzVkOGQyYzIiCiAjIFRoZSBuYW1lIG9uIFB5UGkgaXMgc2xpZ2h0
bHkgZGlmZmVyZW50LgogUFlQSV9QQUNLQUdFID0gInR5cGluZ19leHRlbnNpb25zIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjBhYmQ3Yzg5ZThmYjk2Zjk4ZGIxOGQ4NjEwNmZmMWQ5MGFiNjky
MDA0ZWI3NDZjZjZlZGEyNjgyZjkxYjNjYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4M2YwODVi
ZDVjYTU5YzgwMjk1ZmMyYTgyYWI1ZGFjNjc5Y2JlMDJiOWYzM2Y3ZDgzYWY2OGUyNDFiZWE1MWIw
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQyLjAKCg==

--===============7868153788083950888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-typing-extensions: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.10.0.tar.gz;downloadfilename=typing_extensions-4.10.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.11.0.tar.gz;downloadfilename=typing_extensions-4.11.0.tar.gz"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.10.0" to "4.11.0"
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 259972 to 267732 (+3%)
packages/core2-64-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
Changes to packages/core2-64-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.12/site-packages/typing_extensions-4.10.0.dist-info moved to /usr/lib/python3.12/site-packages/typing_extensions-4.11.0.dist-info

--===============7868153788083950888==--

