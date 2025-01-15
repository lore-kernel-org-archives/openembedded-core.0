Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55855C02190
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.17862.1736936763165500022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TzH2hmqQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cAcroYsF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194697fabc5-35cc25a9-b0f2-4f0e-a2f5-0dfc07ae87b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936762;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W2/pjqMJPlmCcJ+kU3ZoBDCBmLs++9cU9IlDG3ljQwM=;
	b=TzH2hmqQGkNyiN3uXusjwqhaySuei1iMsHpj8X1SiHNJtD0E7erLtCMpcXamXsZS
	WuND8V0zHkqxTMJdQqWpd0SyLa/7MBlVnpZqoh9hZ+VxVMyE2/Q5c8JDFBmgLMttg5e
	2Ppox2iY8dQN09dFMoBMy4QesTOe1/wPZ6X5tiZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936762;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W2/pjqMJPlmCcJ+kU3ZoBDCBmLs++9cU9IlDG3ljQwM=;
	b=cAcroYsF0JMw5IA3G2KPQsEaEEoLJC58FG6Ga+CWHGQbH1XbF2BrO1ArPGuZ4xh0
	I4u7zK/j+134Nu2rdGNprCjZnYS8GcxCizlIgCjolDt6IbiApwd5lJCgdFj1h9aQ1FS
	L+iCTvrD2T1XzE2k8iBCKBFaERwpO3uY/Wnml8GU=
Content-Type: multipart/mixed; boundary="===============8888130056801323155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 3.31.4,3.31.4 SUCCEEDED
Message-ID: <01010194697fabc5-35cc25a9-b0f2-4f0e-a2f5-0dfc07ae87b5-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209827

--===============8888130056801323155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *3.31.4,3.31.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-3.31.3-3.31.4-3.31.3-3.31.patch
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
From 68a6cbeb732bd448133161f9cc0774d272a67912 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 05:37:35 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 3.31.3 -> 3.31.4,3.31.3 -> 3.31.4

---
 .../cmake/{cmake-native_3.31.3.bb => cmake-native_3.31.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.3.bb => cmake_3.31.4.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.3.bb => cmake-native_3.31.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.3.bb => cmake_3.31.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 14cd9ffc5e..f1410a2c4b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87"
+SRC_URI[sha256sum] = "a6130bfe75f5ba5c73e672e34359f7c0a1931521957e8393a5c2922c8b0f7f25"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 68c1020a42..e681b9d020 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From d6e3cb98ffa81c6234ad5a563354ef5f442e1bb3 Mon Sep 17 00:00:00 2001
+From f1244367070d1819c7932befd90d927c870b76fb Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index fe3bf33c60..afe3dcfc02 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 3f9b36a52f12e8f8860cf4337acc9a9514a2095b Mon Sep 17 00:00:00 2001
+From 2b24cce94dab6ad1e65f8142b4482b88ab2d9251 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index ea4c76f99f..c4004238d8 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 7a4c1ed7b4dd038ef99c4a82e1d27743b2801757 Mon Sep 17 00:00:00 2001
+From 7f2f07ddaf7ea94c78c17cbd0754ee7e5528fcf4 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.3.bb b/meta/recipes-devtools/cmake/cmake_3.31.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.4.bb
-- 
2.44.1


--===============8888130056801323155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-3.31.3-3.31.4-3.31.3-3.31.patch"

RnJvbSA2OGE2Y2JlYjczMmJkNDQ4MTMzMTYxZjljYzA3NzRkMjcyYTY3OTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDU6Mzc6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgMy4zMS4zIC0+IDMuMzEuNCwzLjMxLjMgLT4gMy4z
MS40CgotLS0KIC4uLi9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzEuMy5iYiA9PiBjbWFrZS1uYXRp
dmVfMy4zMS40LmJifSAgICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLjEtQ01ha2VEZXRlcm1pbmVD
b21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCB8IDIgKy0KIC4uLi9j
bWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gg
ICB8IDIgKy0KIC4uLjUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1z
LWludGVybmFsLS5wYXRjaCB8IDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFr
ZV8zLjMxLjMuYmIgPT4gY21ha2VfMy4zMS40LmJifSB8IDAKIDYgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzEuMy5iYiA9PiBjbWFrZS1uYXRpdmVfMy4zMS40LmJi
fSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMzEu
My5iYiA9PiBjbWFrZV8zLjMxLjQuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4z
MS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZl
XzMuMzEuNC5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggMTRjZDlm
ZmM1ZS4uZjE0MTBhMmM0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBA
IC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01B
S0VfTUFKT1JfVkVSU0lPTn0vY21ha2UtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1m
bC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZhYzQ1YmM2
ZDQxMGI0OWIzMTEzYWI4NjYwNzQ4ODhkNmM5ZTlkYzgxYTE0MTg3NDQ0NmViMjM5YWMzOGNiODci
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTYxMzBiZmU3NWY1YmE1YzczZTY3MmUzNDM1OWY3YzBh
MTkzMTUyMTk1N2U4MzkzYTVjMjkyMmM4YjBmN2YyNSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJB
QkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBpcGUt
ZnJvbS1jb21waWxlLWZsLnBhdGNoCmluZGV4IDY4YzEwMjBhNDIuLmU2ODFiOWQwMjAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJt
aW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxl
ckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZDZlM2NiOThmZmE4MWM2MjM0YWQ1YTU2MzM1NGVmNWY0NDJlMWJiMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZjEyNDQzNjcwNzBkMTgxOWM3OTMyYmVmZDkwZDkyN2M4NzBiNzZm
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBoaWxpcCBMb3JlbnogPHBoaWxpcC5s
b3JlbnpAYm13LmRlPgogRGF0ZTogTW9uLCAzIEp1biAyMDI0IDEzOjE5OjI0ICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIENNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkk6IFN0cmlwIC1waXBlIGZyb20g
Y29tcGlsZSBmbGFncwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUt
VVNFX05HSFRUUDIucGF0Y2gKaW5kZXggZmUzYmYzM2M2MC4uYWZlM2RjZmMwMiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQt
ZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAzZjliMzZhNTJmMTJlOGY4ODYwY2Y0MzM3YWNjOWE5NTE0YTIw
OTViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYjI0Y2NlOTRkYWI2YWQxZTY1Zjgx
NDJiNDQ4MmI4OGFiMmQ5MjUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjggRGVjIDIw
MjIgMTc6NTE6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6IGRpc2Fi
bGUgVVNFX05HSFRUUDIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRl
cm5hbC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1EaXNh
YmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNoCmlu
ZGV4IGVhNGM3NmY5OWYuLmM0MDA0MjM4ZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnkt
Y21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWlu
dGVybmFsLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2E0YzFlZDdiNGRkMDM4ZWY5OWM0
YTgyZTFkMjc3NDNiMjgwMTc1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2YyZjA3
ZGRhZjdlYTk0Yzc4YzE3Y2JkMDc1NGVlN2U1NTI4ZmNmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IE90YXZpbyBTYWx2YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+CiBEYXRl
OiBUaHUsIDUgSnVsIDIwMTggMTA6Mjg6MDQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJs
ZSB1c2Ugb2YgZXh0MmZzL2V4dDJfZnMuaCBieSBjbWFrZSdzIGludGVybmFsCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuNC5iYgotLSAK
Mi40NC4xCgo=

--===============8888130056801323155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1104749440 to 1104668624 (-0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10301438 to 10299827 (-0%)
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43202449 to 43198977 (-0%)
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.31.3" to "3.31.4"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.3 [default] to 3.31.4 [default]
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.3.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.4.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"

--===============8888130056801323155==--

