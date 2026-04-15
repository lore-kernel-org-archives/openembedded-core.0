Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADE9F4211B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19808.1776261870566545053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hs1cPlOc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wodFATbF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d917530fa-7a58a156-4010-4bd7-875f-e84b396f3908-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N5bsksNY+rsqU6HXlX8zxt6CR6E98rv2XWs7zAqQXIY=;
	b=Hs1cPlOc/n64XW72/2z2K4i+jBvcYP6qAe76lxHsUD/SpRvUDKwpULDZWtbOg6lR
	nCQw41yt9aVtcnpLVlP8f8Fyzr99Q10uz0MRpPk9VvrgacYWFjBJ0ghNSLqyv3bc7Dw
	5MOIXLKOjtx34E+S8fi4MYZ7zIGlta9S2yalyAwI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N5bsksNY+rsqU6HXlX8zxt6CR6E98rv2XWs7zAqQXIY=;
	b=wodFATbFUw9wpmgWKUw9iK/cba8HHLwtb54V+YjdTuaB64BpSq/C+/Lcep7bbbnm
	7UejZHZcB/XXWVZVP4wd4+d9+RsD64kP9sghbnxGSARgtfE3GnT+Jm+8uXTDDt1UTTD
	hSI94HObE0e+YIlyty5cLlCuyzPD/IU9ccDRy4VY=
Content-Type: multipart/mixed; boundary="===============3123115948111685833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 46.0.7,46.0.7 SUCCEEDED
Message-ID: <0101019d917530fa-7a58a156-4010-4bd7-875f-e84b396f3908-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235204

--===============3123115948111685833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *46.0.7,46.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-python3-cryptography-vectors-up.patch
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
From 93538449f4b8f6d2301aa0b85cae632f9bb902a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 05:24:22 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 46.0.5 -> 46.0.7,46.0.5 -> 46.0.7

---
 .../python/python3-cryptography-common.inc                 | 2 +-
 .../python/python3-cryptography-vectors.bb                 | 2 +-
 .../0001-bump-uv_build-to-0.10.0-14271.patch               | 7 ++-----
 ...-pyproject.toml-bump-uv_build-version-requirement.patch | 4 ++--
 meta/recipes-devtools/python/python3-cryptography.bb       | 2 +-
 ...01-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 4e4434bd66..0515cf7705 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "46.0.5"
+PV = "46.0.7"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 800bf1b0e0..9047e690ea 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -12,7 +12,7 @@ require python3-cryptography-common.inc
 SRC_URI += "file://0001-pyproject.toml-bump-uv_build-version-requirement.patch \
             file://0001-bump-uv_build-to-0.10.0-14271.patch \
 "
-SRC_URI[sha256sum] = "ffbccee9455201c01b37c63d65d9f83b362d40c2bed9caac248ebbdfa4e4fc7c"
+SRC_URI[sha256sum] = "08f3d13846fdd86d4c1138a88c695cee203b3dd3825c784d64a3b06d000cdda1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
index 9fa4d1cd47..914e1fb1d0 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-bump-uv_build-to-0.10.0-14271.patch
@@ -1,4 +1,4 @@
-From 1f6626557e4766ffa40874984f1e29197ed66eb8 Mon Sep 17 00:00:00 2001
+From 18b5240acb0317db2f316dbbde5017fa8809f3cb Mon Sep 17 00:00:00 2001
 From: Ridai Govinda Pombo <beholderseye@vivaldi.net>
 Date: Tue, 3 Mar 2026 10:38:12 +0800
 Subject: [PATCH] bump uv_build to 0.10.0 (#14271)
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index f01d2c1..f7af712 100644
+index 2365843..eac1a07 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
@@ -22,6 +22,3 @@ index f01d2c1..f7af712 100644
  build-backend = "uv_build"
  
  [project]
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
index 6faaf1051d..5d693bd275 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproject.toml-bump-uv_build-version-requirement.patch
@@ -1,4 +1,4 @@
-From 6d4c14a2781fb02903fd4d59f638cf72ee370b8d Mon Sep 17 00:00:00 2001
+From faed421bcec6de8c3b38d58a030ff15a137f4977 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 20:20:13 +0100
 Subject: [PATCH] pyproject.toml: bump uv_build version requirement
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 2ed12a3..f01d2c1 100644
+index 5da79a4..2365843 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index fc5cb50b02..a2a2d3ac0c 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
+SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c245aa5"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 5c2e3c53ba..a213253ca6 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 6d6fbe77732ce3c4d2dcf3a5f75bb20ea352bf4a Mon Sep 17 00:00:00 2001
+From e571927a71355b2fab8e2401f1475e66d6ee7281 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 95ced11..75bfcbb 100644
+index 9545f54..2b5e345 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -134,7 +134,7 @@ exclude = [
-- 
2.47.1


--===============3123115948111685833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.7.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info

--===============3123115948111685833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA5MzUzODQ0OWY0YjhmNmQyMzAxYWEwYjg1Y2FlNjMyZjliYjkwMmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDU6MjQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0Ni4wLjUgLT4gNDYuMC43LDQ2LjAuNSAtPiA0Ni4wLjcKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiAgICAgICAgICAgICAgICAgfCAy
ICstCiAuLi4vMDAwMS1idW1wLXV2X2J1aWxkLXRvLTAuMTAuMC0xNDI3MS5wYXRjaCAgICAgICAg
ICAgICAgIHwgNyArKy0tLS0tCiAuLi4tcHlwcm9qZWN0LnRvbWwtYnVtcC11dl9idWlsZC12ZXJz
aW9uLXJlcXVpcmVtZW50LnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgIHwgMiArLQogLi4uMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCB8IDQgKystLQogNiBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29t
bW9uLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY29tbW9uLmluYwppbmRleCA0ZTQ0MzRiZDY2Li4wNTE1Y2Y3NzA1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5p
bmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCkBAIC0zLDQgKzMsNCBAQAogIwogIyBBZGRpdGlvbmFsbHkgQVVIIHdpbGwg
ZGV0ZWN0IHRoYXQgdGhleSBzaGFyZSB0aGlzIC5pbmMgZmlsZSBhbmQKICMgcGVyZm9ybSBhIGxv
Y2tzdGVwIHVwZ3JhZGUgZm9yIGJvdGguCi1QViA9ICI0Ni4wLjUiCitQViA9ICI0Ni4wLjciCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LXZlY3RvcnMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LXZlY3RvcnMuYmIKaW5kZXggODAwYmYxYjBlMC4uOTA0N2U2OTBlYSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12
ZWN0b3JzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYgpAQCAtMTIsNyArMTIsNyBAQCByZXF1aXJlIHB5dGhvbjMtY3J5
cHRvZ3JhcGh5LWNvbW1vbi5pbmMKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50
b21sLWJ1bXAtdXZfYnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaCBcCiAgICAgICAgICAg
ICBmaWxlOi8vMDAwMS1idW1wLXV2X2J1aWxkLXRvLTAuMTAuMC0xNDI3MS5wYXRjaCBcCiAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmZiY2NlZTk0NTUyMDFjMDFiMzdjNjNkNjVkOWY4M2IzNjJk
NDBjMmJlZDljYWFjMjQ4ZWJiZGZhNGU0ZmM3YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwOGYz
ZDEzODQ2ZmRkODZkNGMxMTM4YTg4YzY5NWNlZTIwM2IzZGQzODI1Yzc4NGQ2NGEzYjA2ZDAwMGNk
ZGExIgogCiBQWVBJX1BBQ0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVj
dG9ycy8wMDAxLWJ1bXAtdXZfYnVpbGQtdG8tMC4xMC4wLTE0MjcxLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtYnVt
cC11dl9idWlsZC10by0wLjEwLjAtMTQyNzEucGF0Y2gKaW5kZXggOWZhNGQxY2Q0Ny4uOTE0ZTFm
YjFkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtYnVtcC11dl9idWlsZC10by0wLjEwLjAtMTQyNzEucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzLzAwMDEtYnVtcC11dl9idWlsZC10by0wLjEwLjAtMTQyNzEucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDFmNjYyNjU1N2U0NzY2ZmZhNDA4NzQ5ODRmMWUyOTE5N2VkNjZlYjgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE4YjUyNDBhY2IwMzE3ZGIyZjMxNmRiYmRl
NTAxN2ZhODgwOWYzY2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWRhaSBHb3Zp
bmRhIFBvbWJvIDxiZWhvbGRlcnNleWVAdml2YWxkaS5uZXQ+CiBEYXRlOiBUdWUsIDMgTWFyIDIw
MjYgMTA6Mzg6MTIgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYnVtcCB1dl9idWlsZCB0byAwLjEw
LjAgKCMxNDI3MSkKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8
aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2pl
Y3QudG9tbAotaW5kZXggZjAxZDJjMS4uZjdhZjcxMiAxMDA2NDQKK2luZGV4IDIzNjU4NDMuLmVh
YzFhMDcgMTAwNjQ0CiAtLS0gYS9weXByb2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwK
IEBAIC0xLDUgKzEsNSBAQApAQCAtMjIsNiArMjIsMyBAQCBpbmRleCBmMDFkMmMxLi5mN2FmNzEy
IDEwMDY0NAogIGJ1aWxkLWJhY2tlbmQgPSAidXZfYnVpbGQiCiAgCiAgW3Byb2plY3RdCi0tLSAK
LTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1weXByb2plY3QudG9tbC1idW1wLXV2X2J1aWxk
LXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMvMDAwMS1weXByb2plY3QudG9tbC1idW1wLXV2
X2J1aWxkLXZlcnNpb24tcmVxdWlyZW1lbnQucGF0Y2gKaW5kZXggNmZhYWYxMDUxZC4uNWQ2OTNi
ZDI3NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS12ZWN0b3JzLzAwMDEtcHlwcm9qZWN0LnRvbWwtYnVtcC11dl9idWlsZC12ZXJz
aW9uLXJlcXVpcmVtZW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy8wMDAxLXB5cHJvamVjdC50b21sLWJ1bXAtdXZf
YnVpbGQtdmVyc2lvbi1yZXF1aXJlbWVudC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmQ0
YzE0YTI3ODFmYjAyOTAzZmQ0ZDU5ZjYzOGNmNzJlZTM3MGI4ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZmFlZDQyMWJjZWM2ZGU4YzNiMzhkNThhMDMwZmYxNWExMzdmNDk3NyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+CiBEYXRlOiBUaHUsIDE4IERlYyAyMDI1IDIwOjIwOjEzICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiBidW1wIHV2X2J1aWxkIHZlcnNpb24gcmVxdWlyZW1l
bnQKQEAgLTEwLDcgKzEwLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwK
LWluZGV4IDJlZDEyYTMuLmYwMWQyYzEgMTAwNjQ0CitpbmRleCA1ZGE3OWE0Li4yMzY1ODQzIDEw
MDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJvamVjdC50b21sCiBAQCAtMSw1
ICsxLDUgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3J5cHRvZ3JhcGh5LmJiCmluZGV4IGZjNWNiNTBiMDIuLmEyYTJkM2FjMGMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgpA
QCAtMTEsNyArMTEsNyBAQCBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAjIE5PVEU6IE1ha2Ugc3Vy
ZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycwogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2Ft
ZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJhYmFjZTQ5OTI0NzI2OGUzNzU3MjcxYjJmMWUyNDRiMzZiMDZmODUxNWNm
MjdjNGQ0OTQ2OGZjOWViMTZlOTNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU0Y2ZkNjhjNWYz
ZTBiZmRhZDBkMzhlMDIzMjM5Yjk2YTJmZTg0MTQ2NDgxODUyZGZmYmNjYTQ0MmMyNDVhYTUiCiAK
IFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmst
ZGlzYWJsZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovL2NoZWNrLW1lbWZyZWUu
cHkgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNy
eXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1v
cHRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlv
bi5wYXRjaAppbmRleCA1YzJlM2M1M2JhLi5hMjEzMjUzY2E2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNmQ2ZmJlNzc3MzJjZTNjNGQyZGNmM2E1Zjc1YmIyMGVhMzUyYmY0YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTU3MTkyN2E3MTM1NWIyZmFiOGUyNDAxZjE0NzVlNjZk
NmVlNzI4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xp
Lnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IE1heSAyMDIyIDE3OjIyOjQ4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiByZW1vdmUgLS1iZW5jaG1hcmstZGlz
YWJsZSBvcHRpb24KQEAgLTI2LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogVGltIE9ybGluZyA8
dGltLm9ybGluZ0Brb25zdWxrby5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9weXByb2plY3QudG9tbCBiL3B5cHJvamVj
dC50b21sCi1pbmRleCA5NWNlZDExLi43NWJmY2JiIDEwMDY0NAoraW5kZXggOTU0NWY1NC4uMmI1
ZTM0NSAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21sCiArKysgYi9weXByb2plY3QudG9tbAog
QEAgLTEzNCw3ICsxMzQsNyBAQCBleGNsdWRlID0gWwotLSAKMi40Ny4xCgo=

--===============3123115948111685833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.5.tar.gz;downloadfilename=cryptography_vectors-46.0.5.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch file://0001-bump-uv_build-to-0.10.0-14271.patch" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-46.0.7.tar.gz;downloadfilename=cryptography_vectors-46.0.7.tar.gz file://0001-pyproject.toml-bump-uv_build-version-requirement.patch file://0001-bump-uv_build-to-0.10.0-14271.patch"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.7.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "46.0.5" to "46.0.7"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography_vectors-46.0.7.dist-info
packages/x86-64-v3-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.5.tar.gz;downloadfilename=cryptography-46.0.5.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://cra
 tes.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-46.0.7.tar.gz;downloadfilename=cryptography-46.0.7.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.22.0 crate://crates.io/asn1_derive/0.22.0 crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.9.4 crate://crates.io/cc/1.2.37 
 crate://crates.io/cfg-if/1.0.3 crate://crates.io/find-msvc-tools/0.1.1 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/itoa/1.0.15 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/openssl/0.10.74 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.110 crate://crates.io/pem/3.0.5 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/self_cell/1.2.0 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/unicode-ident/1.0.19 crate:/
 /crates.io/unindent/0.2.4 crate://crates.io/vcpkg/0.2.15"
packages/x86-64-v3-poky-linux/python3-cryptography: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1203856 to 1201848 (-0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1822520 to 1823124 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "46.0.5" to "46.0.7"
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info -> /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 10493822 to 10496056 (+0%)
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 46.0.5 [default] to 46.0.7 [default]
packages/x86-64-v3-poky-linux/python3-cryptography/python3-cryptography: PV changed from "46.0.5" to "46.0.7"
Changes to packages/x86-64-v3-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.14/site-packages/cryptography-46.0.5.dist-info moved to /usr/lib/python3.14/site-packages/cryptography-46.0.7.dist-info

--===============3123115948111685833==--

