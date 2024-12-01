Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188C0D10DBF
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.148755.1733047549241193025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ggncfsb7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FkaCYp2O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019381aef87d-4161682b-e1f9-4b90-b0ea-b129588c4610-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TIypIQl5l05vMHCA60gAEqZgzs6DGnifPHY/ly6T+b0=;
	b=ggncfsb7vHHCKMof6tk8J71TGNuu5wLfi9HaoTI71ZRqqF6HG8v28Qv6spIHrYWq
	QyZkim1ZjaibAPcTkZfZ7iX4mYov6uAIa/vtNK/L2B5Ou3LPE0piE1sXPsExiM1W2Bq
	qBuUU8KcI3BGGgkadKLFxm34Jvd3R96XKbWQmvfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TIypIQl5l05vMHCA60gAEqZgzs6DGnifPHY/ly6T+b0=;
	b=FkaCYp2OiNdHwNi0gdVMjW5zXCaHAQ7UqFQZoYmgARMyEa3YoLSN6n+8zSTgudLG
	f3HledTRjcCOX5YQehYAggOF9feTFXPune8g69w5AxP86QsUv488V55SCBjGDMvglEb
	t4Dzgh3SH9CBckoGM++akp9AK0608zPDt0D0B76o=
Content-Type: multipart/mixed; boundary="===============5526118007235671956=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.31.1,3.31.1 SUCCEEDED
Message-ID: <0101019381aef87d-4161682b-e1f9-4b90-b0ea-b129588c4610-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208051

--===============5526118007235671956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *3.31.1,3.31.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-3.31.0-3.31.1-3.31.0-3.31.patch
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
From 8930d01a98f2b004e4b90522bfbbc43a2245525c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 05:30:35 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 3.31.0 -> 3.31.1,3.31.0 -> 3.31.1

---
 .../cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 ...CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch | 2 +-
 ...Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 4 ++--
 .../cmake/{cmake_3.31.0.bb => cmake_3.31.1.bb}                | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.0.bb => cmake_3.31.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d32e2084ef..0f5b903850 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "300b71db6d69dcc1ab7c5aae61cbc1aa2778a3e00cbd918bc720203e311468c3"
+SRC_URI[sha256sum] = "c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 57d5f08149..cfc0007fef 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 29046e1308bec72cc21b0b00e979906f5a1fb63f Mon Sep 17 00:00:00 2001
+From bcfbef1bdacfc756355061c7259b2bf0748f2a3f Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 87efbd993d..b5df08322a 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 80655318696091d27d131e8c4a48140e37e73366 Mon Sep 17 00:00:00 2001
+From d70402c403b016fae06eff29849a685ad7ed2bc6 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 9071d0f559..a17aa934eb 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2b8f6d4a5fddb5212ce07f0c61f5a3edbf5187d4 Mon Sep 17 00:00:00 2001
+From 6131d31a415b54af6fffdd3d54cbb383ac589013 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index feeaa3b7..c301fb25 100644
+index 4e4b49c1..50e9a733 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
 @@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.0.bb b/meta/recipes-devtools/cmake/cmake_3.31.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.1.bb
-- 
2.44.1


--===============5526118007235671956==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.31.0-3.31.1-3.31.0-3.31.patch"

RnJvbSA4OTMwZDAxYTk4ZjJiMDA0ZTRiOTA1MjJiZmJiYzQzYTIyNDU1MjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNTozMDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSAzLjMxLjAgLT4gMy4zMS4xLDMuMzEuMCAtPiAzLjMx
LjEKCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS4wLmJiID0+IGNtYWtlLW5hdGl2
ZV8zLjMxLjEuYmJ9ICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi5DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIHwgMiArLQogLi4uL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCB8IDIgKy0K
IC4uLkRpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0u
cGF0Y2ggfCA0ICsrLS0KIC4uLi9jbWFrZS97Y21ha2VfMy4zMS4wLmJiID0+IGNtYWtlXzMuMzEu
MS5iYn0gICAgICAgICAgICAgICAgfCAwCiA2IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2Nt
YWtlLW5hdGl2ZV8zLjMxLjAuYmIgPT4gY21ha2UtbmF0aXZlXzMuMzEuMS5iYn0gKDEwMCUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjMxLjAuYmIgPT4gY21h
a2VfMy4zMS4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UtbmF0aXZlXzMuMzEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS1uYXRpdmVfMy4zMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzEuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjEuYmIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGQzMmUyMDg0ZWYuLjBmNWI5
MDM4NTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAtMjAsNyArMjAs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZF
UlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNNYWtl
RGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMDBiNzFkYjZkNjlkY2MxYWI3
YzVhYWU2MWNiYzFhYTI3NzhhM2UwMGNiZDkxOGJjNzIwMjAzZTMxMTQ2OGMzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImM0ZmMyYTliZDBjZDVmODk5Y2NiMmZiODFlYzQyMmUxNzUwOTBiYzBkZTVk
OTBlOTA2ZGQ0NTNiNTMwNjU3MTkiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBp
cGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGls
ZS1mbC5wYXRjaAppbmRleCA1N2Q1ZjA4MTQ5Li5jZmMwMDA3ZmVmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAt
cGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI5MDQ2ZTEz
MDhiZWM3MmNjMjFiMGIwMGU5Nzk5MDZmNWExZmI2M2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGJjZmJlZjFiZGFjZmM3NTYzNTUwNjFjNzI1OWIyYmYwNzQ4ZjJhM2YgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsaXAgTG9yZW56IDxwaGlsaXAubG9yZW56QGJtdy5k
ZT4KIERhdGU6IE1vbiwgMyBKdW4gMjAyNCAxMzoxOToyNCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBDTWFrZURldGVybWluZUNvbXBpbGVyQUJJOiBTdHJpcCAtcGlwZSBmcm9tIGNvbXBpbGUgZmxh
Z3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAy
LnBhdGNoCmluZGV4IDg3ZWZiZDk5M2QuLmI1ZGYwODMyMmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNF
X05HSFRUUDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAw
MDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gODA2NTUzMTg2OTYwOTFkMjdkMTMxZThjNGE0ODE0MGUzN2U3MzM2NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDcwNDAyYzQwM2IwMTZmYWUwNmVmZjI5ODQ5YTY4NWFk
N2VkMmJjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hh
bmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUxOjI3
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9OR0hU
VFAyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1E
aXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2Yt
ZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaAppbmRleCA5MDcxZDBm
NTU5Li5hMTdhYTkzNGViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UvMDAwNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50
ZXJuYWwtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1
LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJiOGY2ZDRhNWZkZGI1MjEyY2UwN2YwYzYxZjVhM2Vk
YmY1MTg3ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYxMzFkMzFhNDE1YjU0YWY2
ZmZmZGQzZDU0Y2JiMzgzYWM1ODkwMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBP
dGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1
bCAyMDE4IDEwOjI4OjA0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4
dDJmcy9leHQyX2ZzLmggYnkgY21ha2UncyBpbnRlcm5hbApAQCAtMTgsNyArMTgsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9VdGlsaXRpZXMvY21saWJhcmNoaXZlL0NNYWtlTGlzdHMudHh0IGIvVXRpbGl0aWVzL2Nt
bGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAotaW5kZXggZmVlYWEzYjcuLmMzMDFmYjI1IDEwMDY0
NAoraW5kZXggNGU0YjQ5YzEuLjUwZTlhNzMzIDEwMDY0NAogLS0tIGEvVXRpbGl0aWVzL2NtbGli
YXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFr
ZUxpc3RzLnR4dAogQEAgLTc0NSwxMiArNzQ1LDggQEAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxFKCJj
b3B5ZmlsZS5oIiBIQVZFX0NPUFlGSUxFX0gpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfMy4zMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlXzMuMzEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMS5iYgotLSAKMi40NC4xCgo=

--===============5526118007235671956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/
 Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Link
 er/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake"
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added

--===============5526118007235671956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1104563152 to 1104596528 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10297839 to 10298740 (+0%)
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.0" to "3.31.1"
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43177650 to 43193503 (+0%)
packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modul
 es/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cma
 ke-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.0 [default] to 3.31.1 [default]
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.0.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.1.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PV changed from "3.31.0" to "3.31.1"
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added
packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9424302 to 9622467 (+2%)
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added

--===============5526118007235671956==--

