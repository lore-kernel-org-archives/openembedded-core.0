Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D58CD13B0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1992.1711994601504125933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YQsFNVgx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XaRjCw1B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad48062-5858cfc5-f87c-402c-b9bd-aa5ee56d5a54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FVO0yOtJGmtTkxol4O/D0EBARlWE3Vy6D/7c28LSRWE=;
	b=YQsFNVgxgDVpnqiA9Di7MXpU4nzahrB4eFkG+V7CRWroXTukSN84SwN3bqI3YooE
	aI4IkPJh+nq9F5RJPlZz/HMLBqgJyOWiPonHjELg64PODRtSFA3u5c6HdgSlBzzeX68
	RwvaKlfDDdv1rA/NEMu5v+PYgOswwSQYIvRxD1lo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FVO0yOtJGmtTkxol4O/D0EBARlWE3Vy6D/7c28LSRWE=;
	b=XaRjCw1BS1RNI5NU1Rzfs4/JoSmk0iiYb/gb3M0RwOV3SclI29crDyQFdxEwnVFK
	yPNJMPozov8Hgk3rFUvAc4NYzVWvOdqu/pfnbPhmMt/nJffm9Wg0ClnMdvKrCQeTd7F
	ejzrfvn+dXBD3mAtnk6YU5CDJSFgZgqPtWHVPaAE=
Content-Type: multipart/mixed; boundary="===============0668842301915147848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.7.0 SUCCEEDED
Message-ID: <0101018e9ad48062-5858cfc5-f87c-402c-b9bd-aa5ee56d5a54-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197730

--===============0668842301915147848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-scons* to *4.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.6.0-4.7.0.patch
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
From 131ff7a21000496c932d345c87cc188d362b35ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:24:29 +0000
Subject: [PATCH] python3-scons: upgrade 4.6.0 -> 4.7.0

---
 .../python/python3-scons/0001-Fix-man-page-installation.patch  | 3 +--
 .../python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb}  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
index 6dffe64809..4b575ea0ae 100644
--- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
+++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
@@ -1,4 +1,4 @@
-From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
+From 5b68d4928ef6947fe1acad84e9c617fbef054380 Mon Sep 17 00:00:00 2001
 From: Tim Orling <ticotimo@gmail.com>
 Date: Sat, 22 May 2021 11:20:46 -0700
 Subject: [PATCH] Fix man page installation
@@ -9,7 +9,6 @@ Fixes:
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Tim Orling <ticotimo@gmail.com>
-
 ---
  MANIFEST.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3-scons_4.6.0.bb b/meta/recipes-devtools/python/python3-scons_4.7.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.6.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.7.0.bb
index c3cc3f0373..bba6c799d4 100644
--- a/meta/recipes-devtools/python/python3-scons_4.6.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.7.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "7db28958b188b800f803c287d0680cc3ac7c422ed0b1cf9895042c52567803ec"
+SRC_URI[sha256sum] = "d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.42.0


--===============0668842301915147848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info -> /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info, removed "/usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info
  /usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py was added
  /usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc was removed

--===============0668842301915147848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/SCons/SCons-4.6.0.tar.gz;downloadfilename=SCons-4.6.0.tar.gz file://0001-Fix-man-page-installation.patch" to "https://files.pythonhosted.org/packages/source/S/SCons/SCons-4.7.0.tar.gz;downloadfilename=SCons-4.7.0.tar.gz file://0001-Fix-man-page-installation.patch"
packages/core2-64-poky-linux/python3-scons: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGSIZE changed from 717050 to 724465 (+1%)
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21953987 to 21936990 (-0%)
packages/core2-64-poky-linux/python3-scons/python3-scons: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info -> /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info, removed "/usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info
  /usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py was added
  /usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc was removed

--===============0668842301915147848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.6.0-4.7.0.patch"

RnJvbSAxMzFmZjdhMjEwMDA0OTZjOTMyZDM0NWM4N2NjMTg4ZDM2MmIzNWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOToyNDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2NvbnM6IHVwZ3JhZGUgNC42LjAgLT4gNC43LjAKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLXNjb25zLzAwMDEtRml4LW1hbi1wYWdlLWluc3RhbGxhdGlvbi5wYXRjaCAgfCAzICstLQog
Li4uL3B5dGhvbi97cHl0aG9uMy1zY29uc180LjYuMC5iYiA9PiBweXRob24zLXNjb25zXzQuNy4w
LmJifSAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNjb25z
XzQuNi4wLmJiID0+IHB5dGhvbjMtc2NvbnNfNC43LjAuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zLzAwMDEtRml4LW1hbi1w
YWdlLWluc3RhbGxhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zY29ucy8wMDAxLUZpeC1tYW4tcGFnZS1pbnN0YWxsYXRpb24ucGF0Y2gKaW5kZXggNmRm
ZmU2NDgwOS4uNGI1NzVlYTBhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNjb25zLzAwMDEtRml4LW1hbi1wYWdlLWluc3RhbGxhdGlvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnMvMDAwMS1GaXgt
bWFuLXBhZ2UtaW5zdGFsbGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YjQ4MmU2
MTgwNDdlOTQ4MzM1NDVkY2UzYTI2OTI0ZWY0ZjA3NWRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1YjY4ZDQ5MjhlZjY5NDdmZTFhY2FkODRlOWM2MTdmYmVmMDU0MzgwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVGltIE9ybGluZyA8dGljb3RpbW9AZ21haWwuY29tPgog
RGF0ZTogU2F0LCAyMiBNYXkgMjAyMSAxMToyMDo0NiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBG
aXggbWFuIHBhZ2UgaW5zdGFsbGF0aW9uCkBAIC05LDcgKzksNiBAQCBGaXhlczoKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFRp
bSBPcmxpbmcgPHRpY290aW1vQGdtYWlsLmNvbT4KLQogLS0tCiAgTUFOSUZFU1QuaW4gfCAyICst
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC42LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC43LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNjb25zXzQuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2NvbnNfNC43LjAuYmIKaW5kZXggYzNjYzNmMDM3My4uYmJhNmM3OTlk
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25z
XzQuNi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29u
c180LjcuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kOTAzYjBiODAyN2Y0NjE0MDJiYWM5YjUxNjliMzZm
NyIKIAogU1JDX1VSSSArPSAiIGZpbGU6Ly8wMDAxLUZpeC1tYW4tcGFnZS1pbnN0YWxsYXRpb24u
cGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2RiMjg5NThiMTg4YjgwMGY4MDNjMjg3ZDA2
ODBjYzNhYzdjNDIyZWQwYjFjZjk4OTUwNDJjNTI1Njc4MDNlYyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkOGI2MTdmNjYxMGE3M2U0NjUwOWRlNzBkY2Y4MmY3Njg2MWI3OTc2MmZmNjAyZDU0NmY0
ZTgwOTE4ZWM4MWYzIgogCiBQWVBJX1BBQ0tBR0UgPSAiU0NvbnMiCiAKLS0gCjIuNDIuMAoK

--===============0668842301915147848==--

