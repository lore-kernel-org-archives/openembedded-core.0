Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB95D5CC94
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17191.1765872143528324452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kiSf5Chh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iKsPzwqU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e8a73-03ee221e-bbdf-437b-a7af-4645fa1a1cd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ghhv74/0Ijph7bEYRqtOcmPkYmN9ZjUdL4VaGAaEG9E=;
	b=kiSf5ChhrG3u5UpZvTFy3ZcrPdjNMQjjYM7BcXT/Y75ko3taxnkpalz9L/h4yxGR
	bLtFzGhpDyvyI8ZWuDJ/4yYGQ6hQSfMmP2Xtvb3ndBS869cu4ict6RGN5swwMYNiiZt
	HSupZImVqKAh3AB609ZhU92/pfv7jgjlA7Uo1HOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ghhv74/0Ijph7bEYRqtOcmPkYmN9ZjUdL4VaGAaEG9E=;
	b=iKsPzwqUfrcs9C7dP4pY1EHcuC5++jQ5TIjgqvSjfwd0659Hsjl4N/xPGqclK12a
	A/osmD1Uv2P/GlfABdohcdpQr0ImjMF1jaRjhx5Dc6Wnf9POLjWY+0R6axKE+Snen/1
	4h5R2KwCd8wEXpfWnaS/F2uYATu23Ef2Z4cJ/SiI=
Content-Type: multipart/mixed; boundary="===============8064365771146465686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.3.5 SUCCEEDED
Message-ID: <0101019b262e8a73-03ee221e-bbdf-437b-a7af-4645fa1a1cd3-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227811

--===============8064365771146465686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.3.4-2.3.5.patch
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
From 148cc33d6c603dd177ddf65253b8b5559dd27c3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:28:32 +0000
Subject: [PATCH] python3-numpy: upgrade 2.3.4 -> 2.3.5

---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 4 ++--
 .../python/{python3-numpy_2.3.4.bb => python3-numpy_2.3.5.bb} | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.4.bb => python3-numpy_2.3.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3e08b43587..3a77ffa4e0 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
+From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
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
index 8b39b7bcfe..71b3634b77 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
+From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb b/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.5.bb
index 520c567bd4..55b8091ff8 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a7d018bfedb375a8d979ac758b120ba846a7fe764911a64465fd87b8729f4a6a"
+SRC_URI[sha256sum] = "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86eeec2cba234bdf1c0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============8064365771146465686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.3.4.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.4.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info

--===============8064365771146465686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.3.4-2.3.5.patch"

RnJvbSAxNDhjYzMzZDZjNjAzZGQxNzdkZGY2NTI1M2I4YjU1NTlkZDI3YzNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6Mjg6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuMy40IC0+IDIuMy41CgotLS0KIC4uLkRvbi10LXNlYXJj
aC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2ggfCA0ICsrLS0K
IC4uLi9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAg
ICAgICAgfCA0ICsrLS0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi4zLjQuYmIgPT4gcHl0
aG9uMy1udW1weV8yLjMuNS5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLW51bXB5XzIuMy40LmJiID0+IHB5dGhvbjMtbnVtcHlfMi4zLjUuYmJ9ICg5NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAx
LURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0
Y2gKaW5kZXggM2UwOGI0MzU4Ny4uM2E3N2ZmYTRlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQt
c28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1z
by1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBiMDM2Yzk4NGIwMTlkOTQxZWFkMmVmZDVhMDVkMTU4OGM0YmMxOTNhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA1Y2I3MzE2MTI4ODQ1ZTNkYTFjZTE2MThhNDJiMmUzMjIyYjU5YmE5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEwIERlYyAyMDE1IDEzOjIwOjMwICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJjaCAvdXNyIGFuZCBzbyBvbiBmb3IgbGlicmFy
aWVzIGJ5IGRlZmF1bHQgdG8KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9udW1weS9kaXN0
dXRpbHMvc3lzdGVtX2luZm8ucHkgYi9udW1weS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkKLWlu
ZGV4IDY0Nzg1NDguLmMwNjIwZTcgMTAwNjQ0CitpbmRleCBlNDI4YjQ3Li42NWQ5NWVkIDEwMDY0
NAogLS0tIGEvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5CiArKysgYi9udW1weS9kaXN0
dXRpbHMvc3lzdGVtX2luZm8ucHkKIEBAIC0zMjYsNDQgKzMyNiwxNCBAQCBkZWYgYWRkX3N5c3Rl
bV9yb290KGxpYnJhcnlfcm9vdCk6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBh
dGNoCmluZGV4IDhiMzliN2JjZmUuLjcxYjM2MzRiNzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVw
cm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NWQ3NjAwMmJjOTg5YTkw
OTgxNDFmMmJmY2QyZDJmYWJjNWEwNGQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2
ZmQ3OWNiZTdhZTlmMGE3YTVmYzRlNWNkNmM1YzNkYTllYTA5ODE1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CiBEYXRlOiBGcmksIDI5IFNlcCAyMDIzIDIyOjUzOjI0ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlv
biBvbiBudW1weSBvcgpAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1
cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL251bXB5L2Rp
c3R1dGlscy9jY29tcGlsZXJfb3B0LnB5IGIvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQu
cHkKLWluZGV4IGIxYTZmYTMuLjdiMDMwMmIgMTAwNjQ0CitpbmRleCA0ZGVhMmY5Li4wMGY1NjNm
IDEwMDY0NAogLS0tIGEvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKICsrKyBiL251
bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5CiBAQCAtOTkxLDcgKzk5MSw3IEBAIGRlZiBf
X2luaXRfXyhzZWxmKToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1udW1weV8yLjMuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1udW1weV8yLjMuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjMuNS5iYgppbmRl
eCA1MjBjNTY3YmQ0Li41NWI4MDkxZmY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMy41LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19V
UkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke1NSQ05BTUV9LSR7UFZ9
LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJhN2QwMThiZmVkYjM3NWE4ZDk3OWFjNzU4YjEyMGJhODQ2YTdmZTc2NDkxMWE2
NDQ2NWZkODdiODcyOWY0YTZhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4NGRiMWRjZGFiNTZi
ZjA1MTc3NDNlNzQ2ZGZiMGY4ODVmYzY4ZDk0OGFiYTg2ZWVlYzJjYmEyMzRiZGYxYzAiCiAKIEdJ
VEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMi
CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5c
ZCspKykkIgotLSAKMi40Ny4xCgo=

--===============8064365771146465686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.3.4/numpy-2.3.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.3.5/numpy-2.3.5.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100855448 to 100858184 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/include -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.3.5/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-nump
 y/2.3.4/numpy/linalg -> /usr/src/debug/python3-numpy/2.3.5/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/sr
 c/philox -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.3.5/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.
 5/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/fft -> /usr/src/debug/python3-numpy/2.3.5/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy
 /random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/npysort/x86-simd-s
 ort/src -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/multiarray/string
 dtype -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.3.5/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/multiarray/textreading, removed "/usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/
 array_assign.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-num
 py/2.3.4/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/
 common/npstd.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.3.4/numpy/_core/src/common/numpyos.c", added "/usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/
 src/common/array_assign.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/mem_overlap.h /usr/src/debug/
 python3-numpy/2.3.5/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/blas_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.3.5/numpy/_co
 re/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.3.5/numpy/_core/src/common/numpyos.c"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 24615701 to 24619761 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 354270 to 354278 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.3.4" to "2.3.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.3.4 [default] to 2.3.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.3.4.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41114677 to 41125956 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.3.4" to "2.3.5"
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.4.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.5.dist-info

--===============8064365771146465686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-af0c76be1808fe9fdf91391b51318ace67bba0a0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:af0c76be1808fe9fdf91391b51318ace67bba0a0"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 524 Local 480 Mirrors 0 Missed 44 Current 284 (91% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 289 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 291 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 299 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 304 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 307 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 330 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 341 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 355 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 373 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 383 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 384 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 385 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 399 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 400 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 403 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 407 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 412 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 419 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 435 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 448 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 469 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 471 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 473 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 478 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 479 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 494 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-iniconfig/2.1.0/temp/log.do_packagedata_setscene.16269
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 497 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 499 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_package_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 878 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_fetch)
NOTE: Running task 880 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 953 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 994 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1060 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_recipe_qa)
NOTE: Running task 1063 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1148 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_unpack)
NOTE: Running task 1152 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_fetch)
NOTE: recipe python3-numpy-2.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1238 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1239 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Started
NOTE: recipe meson-1.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.3.5-r0: task do_write_config: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_unpack: Started
NOTE: Running task 1310 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_unpack)
NOTE: recipe python3-numpy-2.3.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_unpack: Succeeded
NOTE: Running task 1323 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_patch)
NOTE: Running task 1325 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Started
NOTE: recipe ninja-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1347 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 652 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1350 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1351 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_fetch)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_unpack: Started
NOTE: Running setscene task 662 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 674 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1379 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1405 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.3.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 715 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ninja-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 716 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1427 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1428 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1439 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1441 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_patch: Started
NOTE: recipe meson-1.10.0-r0: task do_patch: Started
NOTE: Running setscene task 751 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 764 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1486 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_populate_lic)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe meson-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_populate_lic: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_deploy_source_date_epoch unihash changed to 4fcc80c2b2af377c6d0fcde2b178a90e59a80c9991ab27a4d16c9e5a9a4a2f37
NOTE: recipe meson-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_populate_lic: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_populate_lic unihash changed to 1d880472a0ee4b8b0ed4957e32ea125c655b2e72f68ad9565e261a9226038932
NOTE: Running setscene task 775 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1511 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 790 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash bdbd9ba785e23712dbb42449cecbcba2519d9fa709afee6113a03ec8e8941a9c to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'fd49fc2cac3cfabdd42050bed52a2dd37130728468f91d9560b405e70371d1b6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'bdbd9ba785e23712dbb42449cecbcba2519d9fa709afee6113a03ec8e8941a9c'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed fd49fc2cac3cfabdd42050bed52a2dd37130728468f91d9560b405e70371d1b6 -> bdbd9ba785e23712dbb42449cecbcba2519d9fa709afee6113a03ec8e8941a9c as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1837 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1838 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2055 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2119 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2136 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 2151 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2152 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_collect_spdx_deps)
NOTE: recipe meson-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2153 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_collect_spdx_deps)
NOTE: recipe ninja-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2175 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-1.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa: Started
NOTE: recipe ninja-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2180 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_configure)
NOTE: Running task 2181 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_compile)
NOTE: recipe ninja-1.13.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2186 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_configure)
NOTE: recipe meson-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2187 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_configure)
NOTE: recipe python3-numpy-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2188 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_configure)
NOTE: Running task 2189 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_configure: Started
NOTE: recipe meson-1.10.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_configure_ptest_base)
NOTE: recipe meson-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2192 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_compile)
NOTE: recipe python3-numpy-2.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_configure_ptest_base: Started
NOTE: recipe meson-1.10.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2194 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_compile)
NOTE: recipe python3-numpy-2.3.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2195 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_compile)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa unihash changed to d4ca3d9131cd31ba4e937dcc8be683d5704e25d5ba2fb816816d7f6be31d1ec6
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 2197 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package)
NOTE: Running task 2198 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot unihash changed to 5995fd7aa09f945284d7fbcf90a9c9d7142d697b7842e2e80c94bd9fb02e7807
NOTE: Setscene tasks completed
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2200 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_install)
NOTE: recipe meson-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_install: Started
NOTE: recipe meson-1.10.0-r0: task do_install: Started
NOTE: recipe ninja-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package unihash changed to c08f7ef740adf7687f096cab429c7e7d9e99306039931aaf85ab02b13ade2a78
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata became valid
NOTE: Running setscene task 802 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 803 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 804 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_install: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 2203 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_package)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 808 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata_setscene)
NOTE: Running task 2204 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2206 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx)
NOTE: Running task 2210 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2211 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package)
NOTE: Running task 2212 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa unihash changed to 941403d83423f0772317c15c76c2b9e51121922ad6aaccffb488925ef0a2ab82
NOTE: recipe meson-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_package)
NOTE: Running task 2214 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_populate_sysroot)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_populate_sysroot unihash changed to e90ac2793cff4349a407c03ac62df41a94caeab289409e51a1cf3705aea47ba4
NOTE: Setscene tasks completed
NOTE: recipe meson-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe meson-1.10.0-r0: task do_package: Started
NOTE: recipe meson-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package unihash changed to 0e8715f453c0d45c225016c26f8a1e8498fcad849640f66b3c0069d695801685
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_packagedata became valid
NOTE: recipe ninja-1.13.1-r0: task do_package: Succeeded
NOTE: Running setscene task 808 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_package unihash changed to 7a6025c66fceec3fd520114f9d87fc3a5e883acbe9ca4458b1bdee4ca7809c47
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_packagedata became valid
NOTE: Running setscene task 808 of 808 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.148.5/temp/log.do_packagedata_setscene.22265
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 2215 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_packagedata)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/ninja/1.13.1/temp/log.do_packagedata_setscene.22294
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 2216 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2217 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_create_spdx)
NOTE: recipe ninja-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2218 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_ipk)
NOTE: Running task 2219 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_deb)
NOTE: Running task 2220 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_rpm)
NOTE: Running task 2221 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_create_spdx: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_qa: Started
NOTE: recipe meson-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2222 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_create_spdx: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_ipk unihash changed to e4f682d69f16e0512c00b904bf19e0904c7f2ffc7704cf813f551b7fb1bf1c64
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_qa unihash changed to dbf682d1efd791cb5553dac69639fa0a74f11598bdbef35101e58a8f8e6f0307
NOTE: recipe meson-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2223 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_create_spdx)
NOTE: Running task 2224 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_package_write_ipk)
NOTE: Running task 2225 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_package_write_deb)
NOTE: Running task 2226 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2227 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.0.bb:do_package_qa)
NOTE: recipe meson-1.10.0-r0: task do_create_spdx: Started
NOTE: recipe meson-1.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe meson-1.10.0-r0: task do_package_write_deb: Started
NOTE: recipe meson-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe meson-1.10.0-r0: task do_package_qa: Started
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_rpm unihash changed to 520b4a3cc5c6733e3de6627764d8a0fe87b405798b6f9b10538cd4a112d4f471
NOTE: recipe meson-1.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-hypothesis-6.148.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb:do_package_write_deb unihash changed to f1602c7d15265e274d82acb5e34d5f5491053a64f73c03d30a80ff03cdd3db80
NOTE: recipe meson-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe meson-1.10.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.3.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2229 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_install)
NOTE: recipe python3-numpy-2.3.5-r0: task do_install: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.3.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2231 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_package)
NOTE: Running task 2232 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_packagedata)
NOTE: recipe python3-numpy-2.3.5-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_create_spdx)
NOTE: Running task 2235 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_package_write_ipk)
NOTE: Running task 2236 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_package_write_deb)
NOTE: Running task 2237 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_package_write_rpm)
NOTE: Running task 2238 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_package_qa)
NOTE: recipe python3-numpy-2.3.5-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2239 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.3.5-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.3.5-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2240 of 2240 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.3.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2240 tasks of which 2147 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-src went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dbg went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-staticdev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-dev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-doc went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig-locale went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-iniconfig went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.1.0-r0) [version-going-backwards]
ERROR: python3-iniconfig-2.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-src went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.148.7-r0 to 0:6.148.5-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-dbg went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.148.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-staticdev went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-dev went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-doc went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja-locale went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package ninja went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: ninja-1.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8064365771146465686==--

