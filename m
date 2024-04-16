Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8432FC27C43
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13578.1713248036779554887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gVzgTKD3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4Wc1yWEo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a726d-76570360-bd7e-4057-b8ee-f9070434c7cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KhmCgJCt3WYImt0RaZ0MOrDrfdKMPbV0cI3simIQGk0=;
	b=gVzgTKD3NyHyOpbCkJDmrUgt1gI1h9VMSq1kHMqVl0qLC/XQCGKjnm6T6L8fTpRy
	yzF/iK0fG54alnBwN1aOJkTcO7+ncaPpNTECTBpKKglsZurj0BVZ+IoJ9sC9rhc0SFP
	kIl+JyctNX36AynbKMHcYjhVpgG3ahVjWB/j5XoI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KhmCgJCt3WYImt0RaZ0MOrDrfdKMPbV0cI3simIQGk0=;
	b=4Wc1yWEoT2wHTTT2ijaSZzuc5h1C6G2Ogl/8QqBuKU3Iq891KFHBEufrFZ8f558G
	/UQ2NXKU1BSvw71+zyZLYh3NC5O1rJGLKfnANUavP1QbO83gVkhS6N03KF/IpJLNh1J
	T+P1qYPKeBdb5oPDUASVg3DUGHFQHetK739YjrY4=
Content-Type: multipart/mixed; boundary="===============4405521552269765419=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.7.0 SUCCEEDED
Message-ID: <0101018ee58a726d-76570360-bd7e-4057-b8ee-f9070434c7cf-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198304

--===============4405521552269765419==
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
From 15df00faf68f38cb5eec5a229090741450e7134b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 20:03:32 +0000
Subject: [PATCH] python3-scons: upgrade 4.6.0 -> 4.7.0

---
 .../python/python3-scons/0001-Fix-man-page-installation.patch  | 3 +--
 .../python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb}  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons_4.6.0.bb => python3-scons_4.7.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
index 6dffe64809..ed70bce8a9 100644
--- a/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
+++ b/meta/recipes-devtools/python/python3-scons/0001-Fix-man-page-installation.patch
@@ -1,4 +1,4 @@
-From 8b482e618047e94833545dce3a26924ef4f075db Mon Sep 17 00:00:00 2001
+From dea2b6bd5f5283264bbfd2034c18e5788784a2cb Mon Sep 17 00:00:00 2001
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


--===============4405521552269765419==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.6.0-4.7.0.patch"

RnJvbSAxNWRmMDBmYWY2OGYzOGNiNWVlYzVhMjI5MDkwNzQxNDUwZTcxMzRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjA6MDM6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuNi4wIC0+IDQuNy4wCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1zY29ucy8wMDAxLUZpeC1tYW4tcGFnZS1pbnN0YWxsYXRpb24ucGF0Y2ggIHwgMyArLS0K
IC4uLi9weXRob24ve3B5dGhvbjMtc2NvbnNfNC42LjAuYmIgPT4gcHl0aG9uMy1zY29uc180Ljcu
MC5iYn0gIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zY29u
c180LjYuMC5iYiA9PiBweXRob24zLXNjb25zXzQuNy4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29ucy8wMDAxLUZpeC1tYW4t
cGFnZS1pbnN0YWxsYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2NvbnMvMDAwMS1GaXgtbWFuLXBhZ2UtaW5zdGFsbGF0aW9uLnBhdGNoCmluZGV4IDZk
ZmZlNjQ4MDkuLmVkNzBiY2U4YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zY29ucy8wMDAxLUZpeC1tYW4tcGFnZS1pbnN0YWxsYXRpb24ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zLzAwMDEtRml4
LW1hbi1wYWdlLWluc3RhbGxhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGI0ODJl
NjE4MDQ3ZTk0ODMzNTQ1ZGNlM2EyNjkyNGVmNGYwNzVkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZGVhMmI2YmQ1ZjUyODMyNjRiYmZkMjAzNGMxOGU1Nzg4Nzg0YTJjYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFRpbSBPcmxpbmcgPHRpY290aW1vQGdtYWlsLmNvbT4K
IERhdGU6IFNhdCwgMjIgTWF5IDIwMjEgMTE6MjA6NDYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0g
Rml4IG1hbiBwYWdlIGluc3RhbGxhdGlvbgpAQCAtOSw3ICs5LDYgQEAgRml4ZXM6CiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBU
aW0gT3JsaW5nIDx0aWNvdGltb0BnbWFpbC5jb20+Ci0KIC0tLQogIE1BTklGRVNULmluIHwgMiAr
LQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuNi4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuNy4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zY29uc180LjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXNjb25zXzQuNy4wLmJiCmluZGV4IGMzY2MzZjAzNzMuLmJiYTZjNzk5
ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29u
c180LjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2Nv
bnNfNC43LjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDkwM2IwYjgwMjdmNDYxNDAyYmFjOWI1MTY5YjM2
ZjciCiAKIFNSQ19VUkkgKz0gIiBmaWxlOi8vMDAwMS1GaXgtbWFuLXBhZ2UtaW5zdGFsbGF0aW9u
LnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkYjI4OTU4YjE4OGI4MDBmODAzYzI4N2Qw
NjgwY2MzYWM3YzQyMmVkMGIxY2Y5ODk1MDQyYzUyNTY3ODAzZWMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDhiNjE3ZjY2MTBhNzNlNDY1MDlkZTcwZGNmODJmNzY4NjFiNzk3NjJmZjYwMmQ1NDZm
NGU4MDkxOGVjODFmMyIKIAogUFlQSV9QQUNLQUdFID0gIlNDb25zIgogCi0tIAoyLjQyLjAKCg==

--===============4405521552269765419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info -> /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info, removed "/usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.12/site-packages/SCons/Util/sctyping.py /usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info
  /usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py was added
  /usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc was removed

--===============4405521552269765419==
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
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGSIZE changed from 717050 to 724465 (+1%)
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.6.0" to "4.7.0"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21954056 to 21937059 (-0%)
packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info -> /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info, removed "/usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc", added "/usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGV changed from 4.6.0 [default] to 4.7.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons: PV changed from "4.6.0" to "4.7.0"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.6.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.7.0.dist-info
  /usr/lib/python3.12/site-packages/SCons/Util/__pycache__/sctyping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/SCons/Util/sctyping.py was added
  /usr/lib/python3.12/site-packages/SCons/Tool/docbook/__pycache__/__init__.cpython-311.pyc was removed

--===============4405521552269765419==--

