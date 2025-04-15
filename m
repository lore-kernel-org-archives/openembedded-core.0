Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A928C369C3
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20167.1744723971557029177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hmvOtZyC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dYN4CChg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019639a71fcf-71078e2b-3da0-438b-8e86-a737bdef7a25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4QK9FKdtZYriLMwzpe3xXInXaLI8J/HhEXtr3r1yPwQ=;
	b=hmvOtZyCqwmp/y4W1TCnkImDZ3uRMpHtoLrWCX5+kveazZTI24r6epmY6qjtWr6/
	6OrsJoAx2u4JTKbSXFHu1Yg5wqyWdDO41BzcYZMRpMXXy4B5x+F3ltPsBoYSbt7RL6t
	NlZkVDcShW31AkSTr/OZkC8RVjinb0sd0858+4bE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4QK9FKdtZYriLMwzpe3xXInXaLI8J/HhEXtr3r1yPwQ=;
	b=dYN4CChgsGOYo2OvGbqwCkxgMeGEwBG1F6rIVjgANI38BiS83rn2ZmVg7dZ9P5+f
	zGWiZpPh+6b3gx5g+78cVEXEkpM2IcuZeOEFSDt3ejNgi2s+Sy7iGICQ0EitGUuiJp+
	QJ/nHCT1vq2+a1bPzCqb4VouKshaZUaQOn5/qZa4=
Content-Type: multipart/mixed; boundary="===============4685662567733962371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.8 SUCCEEDED
Message-ID: <0101019639a71fcf-71078e2b-3da0-438b-8e86-a737bdef7a25-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214875

--===============4685662567733962371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.7-3.8.patch
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
From 06b32a3a32891d8d708e7d989ed24cd62204b6cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:30:57 +0000
Subject: [PATCH] python3-markdown: upgrade 3.7 -> 3.8

---
 .../python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.7.bb b/meta/recipes-devtools/python/python3-markdown_3.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.7.bb
rename to meta/recipes-devtools/python/python3-markdown_3.8.bb
index 6a2ab36494..09c2f3435b 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.7.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
+SRC_URI[sha256sum] = "7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============4685662567733962371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.7-3.8.patch"

RnJvbSAwNmIzMmEzYTMyODkxZDhkNzA4ZTdkOTg5ZWQyNGNkNjIyMDRiNmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6MzA6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuNyAtPiAzLjgKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYXJrZG93bl8zLjcuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjguYmJ9IHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjcuYmIgPT4gcHl0
aG9uMy1tYXJrZG93bl8zLjguYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjguYmIKc2ltaWxhcml0eSBpbmRleCA3OSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3du
XzMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
cmtkb3duXzMuOC5iYgppbmRleCA2YTJhYjM2NDk0Li4wOWMyZjM0MzViIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy43LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjguYmIKQEAg
LTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWVj
NThjZGY3Y2ZlZDA2YTIxZjdhOTM2MjYyN2E1NDgwIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3Nl
dHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmFlMjQ3MTQ3N2Nm
ZDAyZGJiZjAzOGQ1ZDliYzIyNmQ0MGRlZjg0YjRmZTI5ODZlNDliNTliNmI0NzJiYmVkMiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI3ZGY4MWU2M2YwZGY1YzRiMjRiN2QxNTZlYjgxZTQ2OTA1OTUy
MzliN2Q3MDkzN2QwNDA5ZjFiMGRlMzE5YzZmIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBu
YXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============4685662567733962371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.7.tar.gz;downloadfilename=markdown-3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.8.tar.gz;downloadfilename=markdown-3.8.tar.gz"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 681360 to 685153 (+1%)
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.7 [default] to 3.8 [default]
Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.7.dist-info moved to /usr/lib/python3.13/site-packages/markdown-3.8.dist-info

--===============4685662567733962371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.7.dist-info moved to /usr/lib/python3.13/site-packages/markdown-3.8.dist-info

--===============4685662567733962371==--

