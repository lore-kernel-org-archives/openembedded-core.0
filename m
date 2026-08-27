Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1F2C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 05:18:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29847.1787807907327140980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 22:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZbOim2F7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LxYs2SKx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a041a7ba21-bd69c81a-4d0f-42dc-9c5d-8dc79bbcc80e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787807906;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TqsGfDDLI/lUkZIAF8JBhjMe27wMt1DW2v+MwMpkEnY=;
	b=ZbOim2F7YVCNuYCMUdcODXTfnUuXEMzp+GVe17Cp9Hp+nOOScXewV95iEWKK63wX
	D/KI0qbIGNSnWutyfCm6/ft+PmQe02FQDlIv0Q9E6KkM6Lj9GifPCLmif696x8Jz6HT
	keG0XIo+6k1LmEAxKiwMdoj2OZfQ9Q3JZ6zpmzjw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787807906;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TqsGfDDLI/lUkZIAF8JBhjMe27wMt1DW2v+MwMpkEnY=;
	b=LxYs2SKx9gVNwPaM9zlZADiZP1nX8U2tJf5lKXrc7/B5Rlyw7gp7LOpDwDRq695T
	9nYhCO64VGBKLTVN8WFq7fc/Pc4zFnk2cDxBeEqHvbpDQchnb/GCGZdHN218RQf5Tfs
	X0mFGdH9Q21g3uwhBxKWuKWmP4knf6LAQoRkwP9A=
Content-Type: multipart/mixed; boundary="===============4606029141404198896=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.11.1 SUCCEEDED
Message-ID: <010101a041a7ba21-bd69c81a-4d0f-42dc-9c5d-8dc79bbcc80e-000000@us-west-2.amazonses.com>
Date: Thu, 27 Aug 2026 05:18:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.27-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244446

--===============4606029141404198896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.11.0-4.11.1.patch
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
From 066b25c7c16b0f6fec6c21db6341db47a84955a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 27 Aug 2026 05:09:52 +0000
Subject: [PATCH] python3-scons: upgrade 4.11.0 -> 4.11.1

---
 .../python/{python3-scons_4.11.0.bb => python3-scons_4.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.11.0.bb => python3-scons_4.11.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.11.0.bb b/meta/recipes-devtools/python/python3-scons_4.11.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.11.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.11.1.bb
index 585cad271c..c1c56856c6 100644
--- a/meta/recipes-devtools/python/python3-scons_4.11.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "5ba48f9e2eb6b9178cabdc9893792418e6970c84f43f4b027e4468e20616a89c"
+SRC_URI[sha256sum] = "4210d1a80a62e986029208117991b6347ccaaaab37b67463a3ff31ee065dc487"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4606029141404198896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1, directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info moved to /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info

--===============4606029141404198896==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.11.0-4.11.1.patch"

RnJvbSAwNjZiMjVjN2MxNmIwZjZmZWM2YzIxZGI2MzQxZGI0N2E4NDk1NWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjcgQXVnIDIwMjYgMDU6MDk6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuMTEuMCAtPiA0LjExLjEKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1zY29uc180LjExLjAuYmIgPT4gcHl0aG9uMy1zY29uc180LjExLjEuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zY29uc180LjExLjAuYmIgPT4g
cHl0aG9uMy1zY29uc180LjExLjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjExLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25z
XzQuMTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNjb25zXzQuMTEuMS5iYgppbmRleCA1ODVjYWQyNzFjLi5jMWM1Njg1NmM2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC4xMS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjExLjEuYmIK
QEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kOTAzYjBiODAyN2Y0NjE0
MDJiYWM5YjUxNjliMzZmNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViYTQ4ZjllMmViNmI5
MTc4Y2FiZGM5ODkzNzkyNDE4ZTY5NzBjODRmNDNmNGIwMjdlNDQ2OGUyMDYxNmE4OWMiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDIxMGQxYTgwYTYyZTk4NjAyOTIwODExNzk5MWI2MzQ3Y2NhYWFh
YjM3YjY3NDYzYTNmZjMxZWUwNjVkYzQ4NyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotLSAKMi40Ny4xCgo=

--===============4606029141404198896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-scons: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.11.0.tar.gz;downloadfilename=scons-4.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.11.1.tar.gz;downloadfilename=scons-4.11.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1 -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info/licenses/SCons/Tool/docbook/docbook-xsl-1.76.1, directory renamed /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info -> /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PV changed from "4.11.0" to "4.11.1"
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 22303467 to 22303518 (+0%)
packages/x86-64-v3-poky-linux/python3-scons/python3-scons: PKGV changed from 4.11.0 [default] to 4.11.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.14/site-packages/scons-4.11.0.dist-info moved to /usr/lib/python3.14/site-packages/scons-4.11.1.dist-info

--===============4606029141404198896==--

