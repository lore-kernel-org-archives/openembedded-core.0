Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ED2C761AE
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8863.1749993282158080202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=muZGcGMB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZKbnjhsq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba73db-f9191f3d-59e6-4641-9a14-9096d34dd975-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hiCQy16omI+B8ZK1vBHXQRos7N1h1bQRWjJTekUFpFI=;
	b=muZGcGMBw8GigiKHk/PMNKdVlrbS/kAMRRl/6F61zCOUiaHGkB7Ow/AVkuM+4AQ9
	TLNpcbPOXJlAqX1aUrwMHywGKwNtNvXT/PFlzmDRbocpfCm0jE6PFVJTUQ9ZXRMLCAh
	5M4MjdKzOvgznwhmmAiwo33O5YcbjIbz+pMpx710=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hiCQy16omI+B8ZK1vBHXQRos7N1h1bQRWjJTekUFpFI=;
	b=ZKbnjhsqY2oge0SW1shmbbTP/2MgfNoQ1l8EFCu0koMrFlO4hHEu/9Xmv6WaBa5k
	uknS/Ra2effHdldlIkpEu8csSpociKt/fnXBPPUrx1VCp/bFGurOOfNBqv7lugPEb3Z
	hcMcN1fgxigOvR8r/I4+s7q4wpGb0Yk1WJnCfuNc=
Content-Type: multipart/mixed; boundary="===============6930549310854179928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.3.0 SUCCEEDED
Message-ID: <0101019773ba73db-f9191f3d-59e6-4641-9a14-9096d34dd975-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218686

--===============6930549310854179928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.2.6-2.3.0.patch
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
From cc06455c809aa3fc33c446ca45806a27eaace749 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:41:11 +0000
Subject: [PATCH] python3-numpy: upgrade 2.2.6 -> 2.3.0

---
 ...-and-so-on-for-libraries-by-default-.patch |  4 ++--
 .../python3-numpy/fix_reproducibility.patch   |  4 ++--
 ...-numpy_2.2.6.bb => python3-numpy_2.3.0.bb} | 23 +++++++++++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.6.bb => python3-numpy_2.3.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3e08b43587..b270bc14e2 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
+From 417e49b2f766bb77a140fd99f2e0160806109393 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 6478548..c0620e7 100644
+index e428b47..65d95ed 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
 @@ -326,44 +326,14 @@ def add_system_root(library_root):
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 8b39b7bcfe..9b42390cd6 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
+From e722e5c4f1ba4aca577ec611c703879ab65476d7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
@@ -26,7 +26,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
-index b1a6fa3..7b0302b 100644
+index 4dea2f9..00f563f 100644
 --- a/numpy/distutils/ccompiler_opt.py
 +++ b/numpy/distutils/ccompiler_opt.py
 @@ -991,7 +991,7 @@ def __init__(self):
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb b/meta/recipes-devtools/python/python3-numpy_2.3.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-numpy_2.2.6.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.0.bb
index 10468d6850..59e61022e5 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2005-2024, NumPy Developers.
+# +Copyright (c) 2005-2025, NumPy Developers.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26080bf81b2662c7119d3ef28ae197fd"
 
 SRCNAME = "numpy"
 
@@ -12,7 +31,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e29554e2bef54a90aa5cc07da6ce955accb83f21ab5de01a62c8478897b264fd"
+SRC_URI[sha256sum] = "581f87f9e9e9db2cba2141400e160e9dd644ee248788d6f90636eeb8fd9260a6"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============6930549310854179928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.2.6-2.3.0.patch"

RnJvbSBjYzA2NDU1YzgwOWFhM2ZjMzNjNDQ2Y2E0NTgwNmEyN2VhYWNlNzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6NDE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuMi42IC0+IDIuMy4wCgotLS0KIC4uLi1hbmQtc28tb24t
Zm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCB8ICA0ICsrLS0KIC4uLi9weXRob24zLW51
bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICB8ICA0ICsrLS0KIC4uLi1udW1weV8yLjIu
Ni5iYiA9PiBweXRob24zLW51bXB5XzIuMy4wLmJifSB8IDIzICsrKysrKysrKysrKysrKysrLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzIuMi42LmJiID0+
IHB5dGhvbjMtbnVtcHlfMi4zLjAuYmJ9ICg3NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQt
c28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9u
LWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKaW5kZXggM2UwOGI0MzU4Ny4uYjI3MGJj
MTRlMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51
bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZh
dWx0LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1
bHQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMDM2Yzk4NGIwMTlkOTQxZWFkMmVmZDVh
MDVkMTU4OGM0YmMxOTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MTdlNDliMmY3
NjZiYjc3YTE0MGZkOTlmMmUwMTYwODA2MTA5MzkzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBU
aHUsIDEwIERlYyAyMDE1IDEzOjIwOjMwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNl
YXJjaCAvdXNyIGFuZCBzbyBvbiBmb3IgbGlicmFyaWVzIGJ5IGRlZmF1bHQgdG8KQEAgLTEzLDcg
KzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9udW1weS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkgYi9udW1w
eS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkKLWluZGV4IDY0Nzg1NDguLmMwNjIwZTcgMTAwNjQ0
CitpbmRleCBlNDI4YjQ3Li42NWQ5NWVkIDEwMDY0NAogLS0tIGEvbnVtcHkvZGlzdHV0aWxzL3N5
c3RlbV9pbmZvLnB5CiArKysgYi9udW1weS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkKIEBAIC0z
MjYsNDQgKzMyNiwxNCBAQCBkZWYgYWRkX3N5c3RlbV9yb290KGxpYnJhcnlfcm9vdCk6CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3Jl
cHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4IDhiMzliN2JjZmUuLjliNDIz
OTBjZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0NWQ3NjAwMmJjOTg5YTkwOTgxNDFmMmJmY2QyZDJmYWJjNWEwNGQ1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNzIyZTVjNGYxYmE0YWNhNTc3ZWM2MTFjNzAz
ODc5YWI2NTQ3NmQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI5IFNl
cCAyMDIzIDIyOjUzOjI0ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRl
cyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBvbiBudW1weSBvcgpAQCAtMjYsNyArMjYs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5IGIv
bnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKLWluZGV4IGIxYTZmYTMuLjdiMDMwMmIg
MTAwNjQ0CitpbmRleCA0ZGVhMmY5Li4wMGY1NjNmIDEwMDY0NAogLS0tIGEvbnVtcHkvZGlzdHV0
aWxzL2Njb21waWxlcl9vcHQucHkKICsrKyBiL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0
LnB5CiBAQCAtOTkxLDcgKzk5MSw3IEBAIGRlZiBfX2luaXRfXyhzZWxmKToKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjIuNi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjMuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDc3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbnVtcHlfMi4yLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weV8yLjMuMC5iYgppbmRleCAxMDQ2OGQ2ODUwLi41OWU2MTAyMmU1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4y
LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIu
My4wLmJiCkBAIC0xLDkgKzEsMjggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZh
bHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxv
d2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5z
ZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5k
IHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNl
bnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0
IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnR4
dAorIyArKysgTElDRU5TRS50eHQKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMp
IDIwMDUtMjAyNCwgTnVtUHkgRGV2ZWxvcGVycy4KKyMgK0NvcHlyaWdodCAoYykgMjAwNS0yMDI1
LCBOdW1QeSBEZXZlbG9wZXJzLgorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVk
aXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3
aXRob3V0CisjIAorIworCiBTVU1NQVJZID0gIkEgc29waGlzdGljYXRlZCBOdW1lcmljIFByb2Nl
c3NpbmcgUGFja2FnZSBmb3IgUHl0aG9uIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9udW1weS5vcmcv
IgogREVTQ1JJUFRJT04gPSAiTnVtUHkgaXMgdGhlIGZ1bmRhbWVudGFsIHBhY2thZ2UgbmVlZGVk
IGZvciBzY2llbnRpZmljIGNvbXB1dGluZyB3aXRoIFB5dGhvbi4iCiBTRUNUSU9OID0gImRldmVs
L3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNELTItQ2xhdXNlICYgUFNGLTIu
MCAmIEFwYWNoZS0yLjAgJiBNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9MWRlODYzYzM3YTgzZTcxYjFlOTdiNjRkMDM2ZWE3OGIiCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MjYwODBiZjgxYjI2NjJjNzExOWQzZWYyOGFl
MTk3ZmQiCiAKIFNSQ05BTUUgPSAibnVtcHkiCiAKQEAgLTEyLDcgKzMxLDcgQEAgU1JDX1VSSSA9
ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImUyOTU1NGUyYmVmNTRhOTBhYTVjYzA3ZGE2Y2U5NTVhY2NiODNmMjFhYjVkZTAxYTYy
Yzg0Nzg4OTdiMjY0ZmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTgxZjg3ZjllOWU5ZGIyY2Jh
MjE0MTQwMGUxNjBlOWRkNjQ0ZWUyNDg3ODhkNmY5MDYzNmVlYjhmZDkyNjBhNiIKIAogR0lUSFVC
X0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykr
KSQiCi0tIAoyLjQ3LjEKCg==

--===============6930549310854179928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (0 cached, 935 parsed). 1911 targets, 47 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-64 sysroot...done.
Removing 66 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4fbeee538ced089f38e647b642e551c3460df0de"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 557 Local 546 Mirrors 0 Missed 11 Current 253 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 255 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 261 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 266 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 280 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 289 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 293 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 300 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 306 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe meson-1.8.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe meson-1.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 319 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 322 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 326 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 331 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 332 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_package_write_deb_setscene)
NOTE: recipe meson-1.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 344 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 354 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 355 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 360 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 366 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_qa_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 374 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 377 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 386 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 389 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 392 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 393 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe meson-1.8.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 409 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 411 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 413 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe meson-1.8.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 418 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 424 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 430 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_create_spdx_setscene)
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/meson/1.8.1/temp/log.do_packagedata_setscene.1838291
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 436 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 440 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.132.0/temp/log.do_packagedata_setscene.1838360
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_package_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ninja-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_package_setscene)
NOTE: Running setscene task 472 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.8.1-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 659 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe meson-1.8.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 671 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe meson-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 974 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_recipe_qa)
NOTE: recipe python3-3.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.3.0-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 745 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1074 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 748 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 753 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 760 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1128 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_unpack)
NOTE: Running task 1141 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_write_config)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 762 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 765 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_write_config: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1513 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.3.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1520 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 810 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1856 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2041 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.132.0.bb:do_packagedata)
NOTE: Running task 2042 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_packagedata: Started
NOTE: recipe meson-1.8.1-r0: task do_packagedata: Started
NOTE: Running task 2168 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-1.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.132.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2235 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_configure)
NOTE: recipe python3-numpy-2.3.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2237 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_compile)
NOTE: recipe python3-numpy-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2238 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2239 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_install)
NOTE: recipe python3-numpy-2.3.0-r0: task do_install: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2241 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_package)
NOTE: Running task 2242 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2243 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_packagedata)
NOTE: recipe python3-numpy-2.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2244 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_create_spdx)
NOTE: Running task 2245 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_package_write_ipk)
NOTE: Running task 2246 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_package_write_deb)
NOTE: Running task 2247 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_package_write_rpm)
NOTE: Running task 2248 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_package_qa)
NOTE: recipe python3-numpy-2.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2249 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.3.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2250 of 2250 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2250 tasks of which 2224 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-src went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-dbg went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-staticdev went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-dev went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-doc went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson-locale went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package meson went backwards which would break package feeds (from 0:1.8.2-r0 to 0:1.8.1-r0) [version-going-backwards]
ERROR: meson-1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.135.9-r0 to 0:6.132.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.132.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6930549310854179928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.2.6/numpy-2.2.6.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.3.0/numpy-2.3.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100812584 to 100610288 (-0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 11422374 to 11439702 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 359590 to 359550 (-0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.2.6" to "2.3.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.2.6.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.3.0.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/ma/__pycache__/timer_comparison.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/compat/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/compat/tests/__init__.py /usr/lib/python3.13/site-packages/numpy/compat/py3k.py /usr/lib/python3.13/site-packages/numpy/_core/include/numpy/npy_1_7_deprecated_api.h /usr/lib/python3.13/site-packages/numpy/ma/timer_comparison.py /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/py3k.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/compat/__init__.py /usr/lib/python3.13/site-packages/numpy/ctypeslib.pyi /usr/lib/python3.13/site-packages/numpy/__pycache__/ctypeslib.cp
 ython-313.pyc /usr/lib/python3.13/site-packages/numpy/ctypeslib.py", added "/usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.py /usr/lib/python3.13/site-packages/numpy/f2py/capi_maps.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_src_pyf.pyi /usr/lib/python3.13/site-packages/numpy/lib/__pycache__/_format_impl.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_meson.pyi /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ma.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_isocbind.pyi /usr/lib/python3.13/site-packages/numpy/f2py/diagnose.pyi /usr/lib/python3.13/site-packages/numpy/f2py/common_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/f90mod_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/mod_derived_types.f90 /usr/lib/python3.13/site-packages/numpy/f2py/cb_rules.pyi /usr/lib/python3.13/site-packages/numpy/random/_bounded_integers.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.py
 i /usr/lib/python3.13/site-packages/numpy/random/_common.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_backend.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/use_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_distutils.pyi /usr/lib/python3.13/site-packages/numpy/f2py/symbolic.pyi /usr/lib/python3.13/site-packages/numpy/f2py/__version__.pyi /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.pyi /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.pyi /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/ma.pyi /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.py /usr/lib/python3.13/site-packages/numpy/f2py/func2subr.pyi /usr/lib/python3.13/site-packages/numpy/f2py/auxfuncs.pyi /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.pyi /usr/lib/python3.13/site-packages/numpy/f2py/cfuncs.pyi /usr/lib/python3.13/site-packages/numpy/f2py/crack
 fortran.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/_ctypeslib.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/rules.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.py /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_backends/__init__.pyi"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40541769 to 40856137 (+1%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.2.6 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "2.2.6" to "2.3.0"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.2.6.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.0.dist-info
  /usr/lib/python3.13/site-packages/numpy/ctypeslib was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.py was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.py was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__ was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/_ctypeslib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/f2py/auxfuncs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_backend.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_distutils.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_meson.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/capi_maps.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/cb_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/cfuncs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/common_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/diagnose.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/f90mod_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/func2subr.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_isocbind.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_src_pyf.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/symbolic.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/mod_derived_types.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/use_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/__version__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.py was added
  /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.pyi was added
  /usr/lib/python3.13/site-packages/numpy/lib/__pycache__/_format_impl.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/random/_bounded_integers.pyi was added
  /usr/lib/python3.13/site-packages/numpy/random/_common.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/ma.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ma.pyi was added
  /usr/lib/python3.13/site-packages/numpy/compat was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__init__.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/py3k.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__ was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/py3k.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/include/numpy/npy_1_7_deprecated_api.h was removed
  /usr/lib/python3.13/site-packages/numpy/ctypeslib.py was removed
  /usr/lib/python3.13/site-packages/numpy/ctypeslib.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/ma/__pycache__/timer_comparison.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/ma/timer_comparison.py was removed
  /usr/lib/python3.13/site-packages/numpy/__pycache__/ctypeslib.cpython-313.pyc was removed

--===============6930549310854179928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.2.6.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.3.0.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/compat/__pycache__/py3k.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/compat/tests/__init__.py /usr/lib/python3.13/site-packages/numpy/_core/include/numpy/npy_1_7_deprecated_api.h /usr/lib/python3.13/site-packages/numpy/compat/__init__.py /usr/lib/python3.13/site-packages/numpy/ma/timer_comparison.py /usr/lib/python3.13/site-packages/numpy/compat/py3k.py /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/ctypeslib.pyi /usr/lib/python3.13/site-packages/numpy/__pycache__/ctypeslib.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/ma/__pycache__/timer_comparison.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/ctypeslib.py /usr/lib/python3.13/sit
 e-packages/numpy/compat/tests/__pycache__/__init__.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/numpy/f2py/_backends/__init__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/symbolic.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.pyi /usr/lib/python3.13/site-packages/numpy/f2py/auxfuncs.pyi /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/ma.pyi /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ma.pyi /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.py /usr/lib/python3.13/site-packages/numpy/random/_bounded_integers.pyi /usr/lib/python3.13/site-packages/numpy/f2py/func2subr.pyi /usr/lib/python3.13/site-packages/numpy/f2py/use_rules.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.py /usr/lib/python3.13/site-packages/numpy/f2py/rules.pyi /usr/lib/python3.13/s
 ite-packages/numpy/f2py/tests/src/regression/mod_derived_types.f90 /usr/lib/python3.13/site-packages/numpy/f2py/cb_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/common_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/f90mod_rules.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_backend.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_src_pyf.pyi /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.pyi /usr/lib/python3.13/site-packages/numpy/f2py/diagnose.pyi /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.py /usr/lib/python3.13/site-packages/numpy/f2py/capi_maps.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_isocbind.pyi /usr/lib/python3.13/site-packages/numpy/random/_common.pyi /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_distutils.pyi /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.pyi /usr/lib/python3.13/site-packages/numpy/f2py/__version__.pyi /usr/lib/p
 ython3.13/site-packages/numpy/ctypeslib/_ctypeslib.pyi /usr/lib/python3.13/site-packages/numpy/f2py/cfuncs.pyi /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/_ctypeslib.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/lib/__pycache__/_format_impl.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_meson.pyi"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.2.6.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.0.dist-info
  /usr/lib/python3.13/site-packages/numpy/ctypeslib was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.py was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/_ctypeslib.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.py was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__ was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/_ctypeslib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/ctypeslib/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/f2py/auxfuncs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_backend.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_distutils.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/__init__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_backends/_meson.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/capi_maps.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/cb_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/cfuncs.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/common_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/diagnose.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/f90mod_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/func2subr.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_isocbind.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/_src_pyf.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/symbolic.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/mod_derived_types.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/use_rules.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/__version__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.py was added
  /usr/lib/python3.13/site-packages/numpy/lib/_format_impl.pyi was added
  /usr/lib/python3.13/site-packages/numpy/lib/__pycache__/_format_impl.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/random/_bounded_integers.pyi was added
  /usr/lib/python3.13/site-packages/numpy/random/_common.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/ma.pyi was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ma.pyi was added
  /usr/lib/python3.13/site-packages/numpy/compat was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__init__.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/py3k.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__ was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/compat/__pycache__/py3k.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/numpy/compat/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/_core/include/numpy/npy_1_7_deprecated_api.h was removed
  /usr/lib/python3.13/site-packages/numpy/ctypeslib.py was removed
  /usr/lib/python3.13/site-packages/numpy/ctypeslib.pyi was removed
  /usr/lib/python3.13/site-packages/numpy/ma/__pycache__/timer_comparison.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/numpy/ma/timer_comparison.py was removed
  /usr/lib/python3.13/site-packages/numpy/__pycache__/ctypeslib.cpython-313.pyc was removed

--===============6930549310854179928==--

