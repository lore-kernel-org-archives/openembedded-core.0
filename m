Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA57FC87FD6
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1403.1751386801499103242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PevL7GXw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rORcYdDB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6ca25bb-d8d4fc60-f109-4ffd-a2fe-851a7c0dd781-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4j7Z57VY+em/dPZmSsjZ7bEXVgZz+8r9iPRPRbYg1AE=;
	b=PevL7GXw61EGylV4Nm1zmI6JFrSjWGAQHznfKHlvaB4I2R+kL6kRkjAXLjohJyjX
	W8vskodu6G4QSV4klkOcOAYV9i6kbQkx0FmWtu2lVxIyU5x5UqZZusO2W8JppDteLu7
	YRBnzdgSsoaBwnD/ak399SWMgt1SxfAuYOAU410s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4j7Z57VY+em/dPZmSsjZ7bEXVgZz+8r9iPRPRbYg1AE=;
	b=rORcYdDB4p/B8+zaBHPdPnllh0FAtCZPsspFp2zqsoO9laX/ldcq6pOCaCpfFzRl
	UvWdF7b45gk5OzHiupbgkfwMM0bN66GhFaFQl5tKF6QZjVBqXW0ZUlWvBePsxlBncIy
	OkMrOUMRHiwaIeEyWjLUb8CrBYAuXdbsW5tGdSQA=
Content-Type: multipart/mixed; boundary="===============2064940316122867682=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.3 SUCCEEDED
Message-ID: <01010197c6ca25bb-d8d4fc60-f109-4ffd-a2fe-851a7c0dd781-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219677

--===============2064940316122867682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2025.2-2025.3.patch
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
From a02f11396b660ed9e165ff354ca2fb6d2cef2973 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 13:50:21 +0000
Subject: [PATCH] shaderc: upgrade 2025.2 -> 2025.3

---
 ...-cmake-disable-building-external-dependencies.patch | 10 +++++-----
 ...shaderc_util-fix-glslang-header-file-location.patch |  2 +-
 .../shaderc/{shaderc_2025.2.bb => shaderc_2025.3.bb}   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.2.bb => shaderc_2025.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 07765653bb..ea1eaee1be 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From ed0e2fad08a3cd3f0a0c70922737d8a6886f484d Mon Sep 17 00:00:00 2001
+From e9e7b562226165b731f4ae96c07e19b66cda4fc7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bd6b890..f1ddd74 100644
+index 06f5395..39b8869 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -62,6 +62,7 @@ else()
+@@ -72,6 +72,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
@@ -26,7 +26,7 @@ index bd6b890..f1ddd74 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -119,8 +120,14 @@ endif(MSVC)
+@@ -129,8 +130,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +43,7 @@ index bd6b890..f1ddd74 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -132,7 +139,7 @@ endif()
+@@ -142,7 +149,7 @@ endif()
  add_custom_target(build-version
    ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..d9ac1ce756 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From 2254e2619adfe75b9dfb3913ad18866a87a7746f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb b/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.3.bb
index 9e56b97830..692e85e56c 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "8c269ee0fe607f2d7cac00c0cb4fa243d6a6ec26"
+SRCREV = "eb0bc20d0c31320fe834e4ee8eb02807292b9703"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============2064940316122867682==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.2-2025.3.patch"

RnJvbSBhMDJmMTEzOTZiNjYwZWQ5ZTE2NWZmMzU0Y2EyZmI2ZDJjZWYyOTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMzo1MDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNS4yIC0+IDIwMjUuMwoKLS0tCiAuLi4tY21ha2UtZGlzYWJsZS1i
dWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggfCAxMCArKysrKy0tLS0tCiAuLi5z
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggfCAgMiAr
LQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNS4yLmJiID0+IHNoYWRlcmNfMjAyNS4zLmJifSAg
IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3tzaGFkZXJjXzIwMjUuMi5i
YiA9PiBzaGFkZXJjXzIwMjUuMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJu
YWwtZGVwZW5kZW5jaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmls
ZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRj
aAppbmRleCAwNzc2NTY1M2JiLi5lYTFlYWVlMWJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJu
YWwtZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVkMGUyZmFkMDhhM2NkM2YwYTBjNzA5MjI3Mzdk
OGE2ODg2ZjQ4NGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU5ZTdiNTYyMjI2MTY1
YjczMWY0YWU5NmMwN2UxOWI2NmNkYTRmYzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMg
RmViIDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IGRpc2FibGUg
YnVpbGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVk
LW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMiBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IGJkNmI4OTAuLmYxZGRk
NzQgMTAwNjQ0CitpbmRleCAwNmY1Mzk1Li4zOWI4ODY5IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0
cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtNjIsNiArNjIsNyBAQCBlbHNlKCkKK0BA
IC03Miw2ICs3Miw3IEBAIGVsc2UoKQogIGVuZGlmKCkKICAKICBvcHRpb24oU0hBREVSQ19FTkFC
TEVfV0VSUk9SX0NPTVBJTEUgIkVuYWJsZSBwYXNzaW5nIC1XZXJyb3IgdG8gY29tcGlsZXIsIGlm
IGF2YWlsYWJsZSIgT04pCkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IGJkNmI4OTAuLmYxZGRkNzQg
MTAwNjQ0CiAgCiAgc2V0IChDTUFLRV9DWFhfU1RBTkRBUkQgMTcpCiAgCi1AQCAtMTE5LDggKzEy
MCwxNCBAQCBlbmRpZihNU1ZDKQorQEAgLTEyOSw4ICsxMzAsMTQgQEAgZW5kaWYoTVNWQykKICAK
ICAKICAjIENvbmZpZ3VyZSBzdWJkaXJlY3Rvcmllcy4KQEAgLTQzLDcgKzQzLDcgQEAgaW5kZXgg
YmQ2Yjg5MC4uZjFkZGQ3NCAxMDA2NDQKICAKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRlcmNf
dXRpbCkKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRlcmMpCi1AQCAtMTMyLDcgKzEzOSw3IEBA
IGVuZGlmKCkKK0BAIC0xNDIsNyArMTQ5LDcgQEAgZW5kaWYoKQogIGFkZF9jdXN0b21fdGFyZ2V0
KGJ1aWxkLXZlcnNpb24KICAgICR7UHl0aG9uX0VYRUNVVEFCTEV9CiAgICAke0NNQUtFX0NVUlJF
TlRfU09VUkNFX0RJUn0vdXRpbHMvdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGls
LWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVh
ZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggNDI5YjUzYzMwOC4uZDlhYzFjZTc1NiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFk
ZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4
LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDQ3OTc2NDJhNjM5NGFkN2U1YTIzYWFhM2JkZjhlMmQwMTFmNjlhZGYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDIyNTRlMjYxOWFkZmU3NWI5ZGZiMzkxM2FkMTg4NjZhODdhNzc0NmYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5q
b3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXggZ2xzbGFuZyBoZWFkZXIgZmlsZSBs
b2NhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDI1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjMuYmIKaW5kZXggOWU1NmI5NzgzMC4uNjkyZTg1ZTU2
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjMu
YmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
c2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1TUkNS
RVYgPSAiOGMyNjllZTBmZTYwN2YyZDdjYWMwMGMwY2I0ZmEyNDNkNmE2ZWMyNiIKK1NSQ1JFViA9
ICJlYjBiYzIwZDBjMzEzMjBmZTgzNGU0ZWU4ZWIwMjgwNzI5MmI5NzAzIgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9
bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1i
dWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0
Y2ggXAotLSAKMi40Ny4xCgo=

--===============2064940316122867682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.2 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.3 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/core2-64-poky-linux/shaderc: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.2" to "2025.3"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3733730 to 3733738 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2025.2 [default] to 2025.3 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2025.2" to "2025.3"

--===============2064940316122867682==--

