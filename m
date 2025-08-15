Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E5DCA0EF3
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11420.1755263228070634958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fZaWMm8C;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NrWWX+3s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010198add7561a-d680a139-8b8b-4b6d-9821-c87ed2dd0fd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k51LmfdaMPUAV0q/BAFy8qP/dqDIamFKQfRwoYkSIIE=;
	b=fZaWMm8CFwTW80i+T4t/c77lzds2P/8yP7tw5kpytEjO8w520Enb+JI5aNZN7Ubg
	u32Mn6WdhgIzJY6gaSzE29ba8UY5seOBojvto+Xk1Ag9RoRuTs2ECkJ8SsaemZF4tID
	u590cXPhIdJBf/16RtlLTh35oE+uYsoKK1laJUhk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k51LmfdaMPUAV0q/BAFy8qP/dqDIamFKQfRwoYkSIIE=;
	b=NrWWX+3sieq/P8Bx+ndcLNnovNZV1D/8Rqq6qhpOHM9pP22GwMEEIjFYjsD/peO8
	PS6pB6Xz/f7Kfl79LInf+RSdRCpQxissEo6mMCUSfeJ5W7cb0+V1/XlrXh4n7qLtsGK
	IJBOb31Y7FCJ0ZXfQlkbbCCG/dYgrUxiYlH5ICIs=
Content-Type: multipart/mixed; boundary="===============0385390340243291530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.3.2 SUCCEEDED
Message-ID: <01010198add7561a-d680a139-8b8b-4b6d-9821-c87ed2dd0fd2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221916

--===============0385390340243291530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.3.1-2.3.2.patch
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
From ad2ffdc3304ee1bb0bd323052c0f5c54797f1abf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:18:13 +0000
Subject: [PATCH] python3-numpy: upgrade 2.3.1 -> 2.3.2

---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 4 ++--
 .../python/{python3-numpy_2.3.1.bb => python3-numpy_2.3.2.bb} | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.1.bb => python3-numpy_2.3.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3e08b43587..7d734a9084 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
+From 7205e7a2b48154dca79e231b4794490485610586 Mon Sep 17 00:00:00 2001
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
index 8b39b7bcfe..b769a93905 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
+From e1d2aba12a483691fc4f217f04888405f6d41858 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb b/meta/recipes-devtools/python/python3-numpy_2.3.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.3.1.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.2.bb
index ed41d03e6b..7ef353c420 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "1ec9ae20a4226da374362cca3c62cd753faf2f951440b0e3b98e93c235441d2b"
+SRC_URI[sha256sum] = "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============0385390340243291530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.1.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.2.dist-info

--===============0385390340243291530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.3.1/numpy-2.3.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.3.2/numpy-2.3.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100703656 to 100707136 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 359974 to 359966 (-0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.3.1" to "2.3.2"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40896958 to 40913751 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "2.3.1" to "2.3.2"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy-2.3.1.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.3.2.dist-info

--===============0385390340243291530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.3.1-2.3.2.patch"

RnJvbSBhZDJmZmRjMzMwNGVlMWJiMGJkMzIzMDUyYzBmNWM1NDc5N2YxYWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MTg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuMy4xIC0+IDIuMy4yCgotLS0KIC4uLkRvbi10LXNlYXJj
aC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2ggfCA0ICsrLS0K
IC4uLi9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAg
ICAgICAgfCA0ICsrLS0KIC4uLi9weXRob24ve3B5dGhvbjMtbnVtcHlfMi4zLjEuYmIgPT4gcHl0
aG9uMy1udW1weV8yLjMuMi5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLW51bXB5XzIuMy4xLmJiID0+IHB5dGhvbjMtbnVtcHlfMi4zLjIuYmJ9ICg5NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAx
LURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0
Y2gKaW5kZXggM2UwOGI0MzU4Ny4uN2Q3MzRhOTA4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQt
c28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1z
by1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBiMDM2Yzk4NGIwMTlkOTQxZWFkMmVmZDVhMDVkMTU4OGM0YmMxOTNhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA3MjA1ZTdhMmI0ODE1NGRjYTc5ZTIzMWI0Nzk0NDkwNDg1NjEwNTg2
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
dGNoCmluZGV4IDhiMzliN2JjZmUuLmI3NjlhOTM5MDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVw
cm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NWQ3NjAwMmJjOTg5YTkw
OTgxNDFmMmJmY2QyZDJmYWJjNWEwNGQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBl
MWQyYWJhMTJhNDgzNjkxZmM0ZjIxN2YwNDg4ODQwNWY2ZDQxODU4IE1vbiBTZXAgMTcgMDA6MDA6
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
cHl0aG9uMy1udW1weV8yLjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1udW1weV8yLjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjMuMi5iYgppbmRl
eCBlZDQxZDAzZTZiLi43ZWYzNTNjNDIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4zLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMy4yLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19V
UkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke1NSQ05BTUV9LSR7UFZ9
LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIxZWM5YWUyMGE0MjI2ZGEzNzQzNjJjY2EzYzYyY2Q3NTNmYWYyZjk1MTQ0MGIw
ZTNiOThlOTNjMjM1NDQxZDJiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUwNDg2YTExZWMzMGNk
ZWNiNTNmMTg0ZDQ5NmQxYzZhMjA3ODZjODFlNTVlNDE2NDAyNzAxMzAwNTZmOGVlNDgiCiAKIEdJ
VEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMi
CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5c
ZCspKykkIgotLSAKMi40Ny4xCgo=

--===============0385390340243291530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1942 targets, 50 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-64 sysroot...done.
Removing 68 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-220592838cf6fd9e211fe909591e42a0109623aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:220592838cf6fd9e211fe909591e42a0109623aa"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 532 Local 518 Mirrors 0 Missed 14 Current 276 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 277 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 280 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 283 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 286 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 298 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 302 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 305 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 312 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 315 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 321 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 322 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 324 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe meson-1.8.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 325 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_populate_lic_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 330 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 332 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 333 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 341 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 343 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 344 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 349 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 354 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe meson-1.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 357 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_qa_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 358 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-numpy-2.3.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 374 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 385 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_package_write_deb_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 386 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 387 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 392 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_create_spdx_setscene)
NOTE: recipe meson-1.8.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 396 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_create_spdx_setscene)
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 397 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 411 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe meson-1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 414 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 415 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ninja-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 429 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 431 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/meson/1.8.2/temp/log.do_packagedata_setscene.3552277
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 464 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 468 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.135.29.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.135.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 832 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 893 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 913 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_write_config)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.3.2-r0: task do_write_config: Started
NOTE: Running task 1146 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1156 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 611 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_write_config: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 630 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1326 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running setscene task 633 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 668 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1375 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 682 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1396 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_patch)
NOTE: recipe python3-numpy-2.3.2-r0: task do_patch: Started
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1419 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 736 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1420 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running setscene task 739 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_deploy_source_date_epoch unihash changed to 1a34b806ed39d3b6db8cdc30a44b20b2c551e2d88ded9517f451730821c4828b
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1521 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash db60a9ff5cf84c3ac18e7b8d8c332735a1db66dda98ddb4a99d34ea2012a1b56 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '0380d2dffa5a843adc246d2a879bb52b05dca0a8d51e3bd30f3511116a3615d7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'db60a9ff5cf84c3ac18e7b8d8c332735a1db66dda98ddb4a99d34ea2012a1b56'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 0380d2dffa5a843adc246d2a879bb52b05dca0a8d51e3bd30f3511116a3615d7 -> db60a9ff5cf84c3ac18e7b8d8c332735a1db66dda98ddb4a99d34ea2012a1b56 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 808 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1834 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2021 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_packagedata)
NOTE: Running task 2158 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe meson-1.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-1.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2225 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_configure)
NOTE: recipe python3-numpy-2.3.2-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2226 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2227 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_compile)
NOTE: recipe python3-numpy-2.3.2-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2229 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_install)
NOTE: recipe python3-numpy-2.3.2-r0: task do_install: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2231 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package)
NOTE: Running task 2232 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_packagedata)
NOTE: recipe python3-numpy-2.3.2-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_create_spdx)
NOTE: Running task 2235 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package_write_ipk)
NOTE: Running task 2236 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package_write_deb)
NOTE: Running task 2237 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package_write_rpm)
NOTE: Running task 2238 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package_qa)
NOTE: recipe python3-numpy-2.3.2-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2239 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.3.2-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_package_qa unihash changed to 2b161c567aa1f7da2749eaf0adacb1b2720418c1201cbe4e0854b1ad956ad62f
NOTE: recipe python3-numpy-2.3.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.3.2-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2240 of 2240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2240 tasks of which 2207 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-src went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-dbg went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-staticdev went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-dev went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-doc went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson-locale went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package meson went backwards which would break package feeds (from 0:1.8.3-r0 to 0:1.8.2-r0) [version-going-backwards]
ERROR: meson-1.8.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0385390340243291530==--

