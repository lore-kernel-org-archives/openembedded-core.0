Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E52CD8CA4
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:47 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1574.1780328140492911509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RE32ZWyF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Yv8vCLGz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d38c69-51bbabc5-846d-4b21-99f7-8b4e2e28c38d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=urY6fEMmixk+/ECUG6Tds19+w6+5hc4buAtkeeDPKdY=;
	b=RE32ZWyFU18jPQSPxPvJm4SrV6iSCzwr+7sdQ1+9KEf+/hhjbcHUP2g3vWFoSOa+
	MKLGPqvBMWwbRL3HSDezsmN9dOTZaEvREgpx7QFq9moPJO6hXpDRmi1jdnOZKrxn1Oy
	t6myvF9H1xuW17fD6COHie3I4/oX2mcN+1/fIEII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=urY6fEMmixk+/ECUG6Tds19+w6+5hc4buAtkeeDPKdY=;
	b=Yv8vCLGzFiogEdGNuZl1o6XEbZbiCy2AsP94bj8PAw0UuQitOvUV1D9lhVEn2/Sm
	M1I2SyHQfMNqGXC8A69lpyLlyjm9JqVNHQgX8qrNXNszDnt7dpTPRaqVD19r2lcRYdE
	v/GVQMhKHTXCWXIlBz39imEwO7djiMhH+yZLVHcc=
Content-Type: multipart/mixed; boundary="===============8811195621734189654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.4.6 SUCCEEDED
Message-ID: <0101019e83d38c69-51bbabc5-846d-4b21-99f7-8b4e2e28c38d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237886

--===============8811195621734189654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.4.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.4.5-2.4.6.patch
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
From 96c11f1314b429e3952f275692bdf7db6d2671b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:44:58 +0000
Subject: [PATCH] python3-numpy: upgrade 2.4.5 -> 2.4.6

---
 ...1-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 2 +-
 .../python/python3-numpy/0001-python-sysroot.patch              | 2 +-
 .../python/python3-numpy/fix_reproducibility.patch              | 2 +-
 .../python/{python3-numpy_2.4.5.bb => python3-numpy_2.4.6.bb}   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.4.5.bb => python3-numpy_2.4.6.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 4015e05ace..2c669d2e9d 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From e1feb7f7052980d8df2635ecc30a30b70ba73a44 Mon Sep 17 00:00:00 2001
+From 31634bda757a59d3e80aea2766d779db6e95a164 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
index 7575e011f5..495a7be4ee 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-python-sysroot.patch
@@ -1,4 +1,4 @@
-From a4609765d97bc25cdd6d9ee06c7026a2ca3481e3 Mon Sep 17 00:00:00 2001
+From af56e0cef19822c2608d3020a77f5073d947de8a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 21 Jan 2026 14:12:36 +0000
 Subject: [PATCH] Add sysroot to pkgconfig libdir
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index e9ac56c59c..73cd60a44a 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From b9ab979957e1ba14ce42b696c476a5910a07f1aa Mon Sep 17 00:00:00 2001
+From be1f328a56e53fa8a0bc2ea04dd9f43553e59aa6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.5.bb b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.4.5.bb
rename to meta/recipes-devtools/python/python3-numpy_2.4.6.bb
index 56446eb666..2c892e9756 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-python-sysroot.patch \
            "
-SRC_URI[sha256sum] = "ca670567a5683b7c1670ec03e0ddd5862e10934e92a70751d68d7b7b74ca7f9f"
+SRC_URI[sha256sum] = "f3a3570c4a2a16746ac2c31a7c7c7b0c186b95ce902e33db6f28094ed7387dda"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============8811195621734189654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/splitmix64 ->
  /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy
 -2.4.6.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort,
  directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/linalg/lapack_lite
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info

--===============8811195621734189654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.4.5-2.4.6.patch"

RnJvbSA5NmMxMWYxMzE0YjQyOWUzOTUyZjI3NTY5MmJkZjdkYjZkMjY3MWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODo0NDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi40LjUgLT4gMi40LjYKCi0tLQogLi4uMS1Eb24tdC1zZWFy
Y2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIHwgMiArLQog
Li4uL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtcHl0aG9uLXN5c3Jvb3QucGF0Y2ggICAgICAg
ICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxp
dHkucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1weV8y
LjQuNS5iYiA9PiBweXRob24zLW51bXB5XzIuNC42LmJifSAgIHwgMiArLQogNCBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjQuNS5iYiA9PiBweXRob24zLW51bXB5
XzIuNC42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJy
YXJpZXMtYnktZGVmYXVsdC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVz
LWJ5LWRlZmF1bHQtLnBhdGNoCmluZGV4IDQwMTVlMDVhY2UuLjJjNjY5ZDJlOWQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10
LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQt
c2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZTFmZWI3ZjcwNTI5ODBkOGRmMjYzNWVjYzMwYTMwYjcwYmE3M2E0
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzE2MzRiZGE3NTdhNTlkM2U4MGFlYTI3
NjZkNzc5ZGI2ZTk1YTE2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMCBEZWMgMjAx
NSAxMzoyMDozMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBzZWFyY2ggL3VzciBhbmQg
c28gb24gZm9yIGxpYnJhcmllcyBieSBkZWZhdWx0IHRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1weXRob24tc3lzcm9vdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhv
bi1zeXNyb290LnBhdGNoCmluZGV4IDc1NzVlMDExZjUuLjQ5NWE3YmU0ZWUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLXB5dGhvbi1z
eXNyb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weS8wMDAxLXB5dGhvbi1zeXNyb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNDYw
OTc2NWQ5N2JjMjVjZGQ2ZDllZTA2YzcwMjZhMmNhMzQ4MWUzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhZjU2ZTBjZWYxOTgyMmMyNjA4ZDMwMjBhNzdmNTA3M2Q5NDdkZThhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5j
b20+CiBEYXRlOiBXZWQsIDIxIEphbiAyMDI2IDE0OjEyOjM2ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEFkZCBzeXNyb290IHRvIHBrZ2NvbmZpZyBsaWJkaXIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXBy
b2R1Y2liaWxpdHkucGF0Y2gKaW5kZXggZTlhYzU2YzU5Yy4uNzNjZDYwYTQ0YSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1
Y2liaWxpdHkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI5
YWI5Nzk5NTdlMWJhMTRjZTQyYjY5NmM0NzZhNTkxMGEwN2YxYWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGJlMWYzMjhhNTZlNTNmYThhMGJjMmVhMDRkZDlmNDM1NTNlNTlhYTYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjkgU2VwIDIwMjMgMjI6NTM6MjQg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVGhpcyByZWdleCBkZWNpZGVzIHdoZXRoZXIgdG8gdXNl
IE8zIG9waW1pc2F0aW9uIG9uIG51bXB5IG9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi40LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC41
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlf
Mi40LjYuYmIKaW5kZXggNTY0NDZlYjY2Ni4uMmM4OTJlOTc1NiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuNC41LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjQuNi5iYgpAQCAtMTMsNyAr
MTMsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtT
UkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uLXN5c3Jvb3QucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2E2NzA1NjdhNTY4M2I3YzE2NzBlYzAzZTBkZGQ1ODYy
ZTEwOTM0ZTkyYTcwNzUxZDY4ZDdiN2I3NGNhN2Y5ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
M2EzNTcwYzRhMmExNjc0NmFjMmMzMWE3YzdjN2IwYzE4NmI5NWNlOTAyZTMzZGI2ZjI4MDk0ZWQ3
Mzg3ZGRhIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251
bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9Q
PHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIuNDcuMQoK

--===============8811195621734189654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f7f4b69a76e67c02b283e9cbf5410fff00817c63"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:f7f4b69a76e67c02b283e9cbf5410fff00817c63"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 586 Local 531 Mirrors 0 Missed 55 Current 330 (90% match, 93% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 331 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 339 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 364 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 371 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 374 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 387 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 418 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 426 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 427 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 429 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 442 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 443 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 461 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 472 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 491 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 519 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 520 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 562 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 579 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 592 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 824 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_recipe_qa)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 826 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_fetch)
NOTE: recipe python3-numpy-2.4.6-r0: task do_recipe_qa: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_fetch: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_fetch: Succeeded
NOTE: Running task 876 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_unpack)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 904 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 659 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1002 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa)
NOTE: Running task 1003 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: Running task 1073 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_unpack: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1115 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_write_config: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa: Started
NOTE: Running task 1141 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_patch)
NOTE: recipe meson-1.11.1-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1148 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.4.6-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 690 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_patch: Started
NOTE: Running setscene task 692 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 694 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 698 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 710 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 736 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 751 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1247 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_unpack)
NOTE: Running setscene task 771 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1318 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1335 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_fetch)
NOTE: Running task 1336 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_fetch)
NOTE: Running task 1337 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 781 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.4.6-r0: task do_unpack: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.11.1-r0: task do_fetch: Started
NOTE: recipe meson-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 794 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 803 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 804 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 805 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 814 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1397 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1408 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1414 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1438 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_fetch)
NOTE: Running setscene task 851 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1468 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1493 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_create_recipe_spdx)
NOTE: Running task 1503 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_create_recipe_spdx)
NOTE: Running task 1506 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_create_recipe_spdx)
NOTE: Running task 1507 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_patch)
NOTE: recipe meson-1.11.1-r0: task do_unpack: Started
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 866 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe meson-1.11.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1535 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_deploy_source_date_epoch unihash changed to 14c3da509de6ca7f88b4235abf770193bc9f8e914abf35976c8102245136ed78
NOTE: Running setscene task 873 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 884 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1558 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_patch)
NOTE: Running task 1559 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-1.11.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe meson-1.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1568 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 888 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe meson-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_deploy_source_date_epoch unihash changed to 675328b27df4e249de7108ee7c49e598a039fe8ebb81421fee4f51908043414c
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 896 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1574 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_unpack)
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 897 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 907 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 916 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1978 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2025 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2026 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2049 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_patch)
NOTE: Running task 2098 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2196 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk)
NOTE: Running task 2197 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_deb)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2198 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: Running task 2199 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ninja-1.13.2-r0: task do_patch: Started
NOTE: recipe meson-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_ipk: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_deb: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_qa: Started
NOTE: recipe ninja-1.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 64c2a3db7bdc4c624ee6ba6a32ccbc0beffe538d748650afd7f3d02ff570e17e to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd9ae9abc6a92827b2e06425b8bb32fbfddbdc92598def6977ddffd52cd9e1b1a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '64c2a3db7bdc4c624ee6ba6a32ccbc0beffe538d748650afd7f3d02ff570e17e'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d9ae9abc6a92827b2e06425b8bb32fbfddbdc92598def6977ddffd52cd9e1b1a -> 64c2a3db7bdc4c624ee6ba6a32ccbc0beffe538d748650afd7f3d02ff570e17e as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2213 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch unihash changed to 70ac6b7a48a890b33adaa8fc9fdd10546d7b9ab5ba4a1edc8b3becae48504738
NOTE: recipe meson-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2214 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_configure)
NOTE: Running task 2215 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_configure)
NOTE: Running task 2216 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_configure)
NOTE: Running noexec task 2217 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_configure)
NOTE: Running task 2218 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_configure: Started
NOTE: recipe ninja-1.13.2-r0: task do_compile: Started
NOTE: recipe meson-1.11.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_configure_ptest_base)
NOTE: recipe meson-1.11.1-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_configure_ptest_base)
NOTE: Running task 2221 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_compile)
NOTE: Running task 2222 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2223 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_compile)
NOTE: recipe python3-numpy-2.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Started
NOTE: recipe meson-1.11.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2224 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-numpy_2.4.6.bb:do_compile)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.4.6-r0: task do_compile: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2225 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package)
NOTE: Running task 2227 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_compile_ptest_base)
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2229 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_install)
NOTE: recipe meson-1.11.1-r0: task do_compile: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_package_qa: Succeeded
NOTE: Running task 2230 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package_qa unihash changed to 193ffa13a7e8f3c7142ef8fbadee3f6c5938873bcb82fc4cfc9a834ea51c89e0
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install: Started
NOTE: recipe meson-1.11.1-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_compile: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2231 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_install)
NOTE: recipe ninja-1.13.2-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install: Succeeded
NOTE: Running task 2233 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package)
NOTE: Running task 2234 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_install_ptest_base)
NOTE: recipe ninja-1.13.2-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_packagedata unihash changed to 48e5fcf70d5b5fbfb08a2b52072e6efa47ef07c0707814a0d70cc979e7bd3dd0
NOTE: Setscene tasks completed
NOTE: Running task 2235 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_package)
NOTE: Running task 2236 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_populate_sysroot)
NOTE: Running task 2237 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_create_spdx)
NOTE: Running task 2238 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk)
NOTE: Running task 2239 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb)
NOTE: Running task 2240 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm)
NOTE: Running task 2241 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_qa unihash changed to 941403d83423f0772317c15c76c2b9e51121922ad6aaccffb488925ef0a2ab82
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2242 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_ipk unihash changed to fff890992c13ac0ea260cf84da0a737f6324788cc634b674c2a6353dd4281c6b
NOTE: Running task 2243 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_populate_sysroot)
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe meson-1.11.1-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.15.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_deb unihash changed to 8a42541d07a430bff641917a1f3fdd74f6b3075e536937fac87fd0c872b8d9ef
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_package_write_rpm unihash changed to 2504db1f9879d2aa20291401f8848378fdf89a3b04e3834379ff3e8ac9cba252
NOTE: recipe meson-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_package: Succeeded
NOTE: Running task 2245 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata)
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Started
NOTE: recipe ninja-1.13.2-r0: task do_packagedata: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 2246 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_packagedata)
NOTE: recipe meson-1.11.1-r0: task do_packagedata: Started
NOTE: recipe meson-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_packagedata unihash changed to 92bf3ea576a1b0056d0bd22669bf22c0e63107e2ef717178393ebe6bb840575c
NOTE: Running task 2247 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_create_spdx)
NOTE: Running task 2248 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_ipk)
NOTE: Running task 2249 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_deb)
NOTE: Running task 2250 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_rpm)
NOTE: Running task 2251 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_qa)
NOTE: recipe meson-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe meson-1.11.1-r0: task do_package_write_ipk: Started
NOTE: recipe meson-1.11.1-r0: task do_package_write_deb: Started
NOTE: recipe meson-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe meson-1.11.1-r0: task do_package_qa: Started
NOTE: recipe meson-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe meson-1.11.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_ipk unihash changed to 4d66fd0d1c60a98d2ca0c6c4c54e41c0e226ef789f6f3ef3048113e0ebb1f05a
NOTE: recipe meson-1.11.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_qa unihash changed to ae126bc8fca30072a3ffc196e02af6519cce798c49af3948495eb1c0a84b2e43
NOTE: recipe meson-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_rpm unihash changed to f9808a6cc5f69a205efb6acaf1a08efb5e57a65becbdc1f642e5c9c5024ef9e0
NOTE: recipe meson-1.11.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_package_write_deb unihash changed to 3bddaa9c7d82b3a087d8c0cca987995a8ca61d65633cf6b7bd4a45cd822db780
NOTE: recipe python3-hypothesis-6.152.4-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-2.4.6-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2251 tasks of which 2166 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601084351.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601084351.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.152.4/temp/log.do_packagedata.720542
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.155.1-r0 to 0:6.152.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.152.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.152.4/temp/log.do_packagedata.720542
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb:do_packagedata) failed with exit code '1'

--===============8811195621734189654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.4.5/numpy-2.4.5.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch" to "https://github.com/numpy/numpy/releases/download/v2.4.6/numpy-2.4.6.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest file://0001-python-sysroot.patch"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 100751496 to 100748952 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 25252701 to 25252556 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_pcg6
 4.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/fft -> /usr/src/debug/python3-numpy/2.4.6/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.4.6/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p/numpy/random, director
 y renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/linalg -> /usr/src/debug/python3-numpy/2.4.6/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_mt19937.cpython-314
 -x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.4.6/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/pytho
 n3-numpy/2.4.5/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/in
 clude/numpy, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.4.6/n
 umpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/include -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.4.5/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.4.6/numpy/_core/include/numpy/random
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40620263 to 40622853 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/splitmix64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/include/numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random -
 > /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python
 3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/r
 andom/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info/licenses/numpy/_core/src/highway
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.4.5.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.4.6.dist-info

--===============8811195621734189654==--

