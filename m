Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1125C52D74
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13428.1713248038241196778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YVPDlk6H;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eaB55VoK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a98bb-8097d0f9-c633-4900-be86-f09f51d59ddf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3iKfnllorljJ3XDZsVccZE70SLGKP58GQFSE0d5AMxk=;
	b=YVPDlk6HyCZY14kFxPqln80xpP0SxQkdb/VC4BMz3wqrgm0KEX1ZbhWHkyFJ+492
	GkVT2Uj4zASFlPTt3xFJE2NYjzxveGfBBJMw/5PfOe4+F0o67CBzB2FJ+eG1gSu1Ca3
	aFYrsGkQ2AAhDXHONiBqq40i7F86rfJMGQ5CIJQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3iKfnllorljJ3XDZsVccZE70SLGKP58GQFSE0d5AMxk=;
	b=eaB55VoK6gcZ5X6zrbnSRaWiZT21S3Ek3PN8GiKt68zu7fEWQ2jpBs9BFD/bcwAJ
	hWROb/Ide08rWzQhVdR8Fqs014lcWekIf/gYxMoEdT+kzwRm9AFnMu2RdotYeKpsHmr
	Thhk6xkq24jjnSoknVWUkrc2HNmC7qZZsq1RZqWE=
Content-Type: multipart/mixed; boundary="===============4124263063523244512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.0 SUCCEEDED
Message-ID: <0101018ee58a98bb-8097d0f9-c633-4900-be86-f09f51d59ddf-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198365

--===============4124263063523244512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2024.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.8-2024.0.patch
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
From f5960df28b7856ab9b84a5035cebc7dcbab41ece Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 23:28:48 +0000
Subject: [PATCH] shaderc: upgrade 2023.8 -> 2024.0

---
 ...make-disable-building-external-dependencies.patch | 12 ++++++------
 ...aderc_util-fix-glslang-header-file-location.patch |  2 +-
 .../shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 4212512034..c605f33590 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 792a46ef27ef879a21c9f01a198eae213ea535e6 Mon Sep 17 00:00:00 2001
+From 458e1a00be096a16d23e1294477e7afd26b6d6f2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7bc8f5d..13fc535 100644
+index ffcb54b..cce715e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -62,6 +62,7 @@ else()
@@ -26,7 +26,7 @@ index 7bc8f5d..13fc535 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -123,8 +124,14 @@ endif(MSVC)
+@@ -119,8 +120,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,9 +43,9 @@ index 7bc8f5d..13fc535 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -136,7 +143,7 @@ endif()
+@@ -132,7 +139,7 @@ endif()
  add_custom_target(build-version
-   ${PYTHON_EXECUTABLE}
+   ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
 -  ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc
 +  ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR}
@@ -53,7 +53,7 @@ index 7bc8f5d..13fc535 100644
  
  function(define_pkg_config_file NAME LIBS)
 diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index 11ee53e..d39e59d 100755
+index b7ce5b8..95b34c5 100755
 --- a/utils/update_build_version.py
 +++ b/utils/update_build_version.py
 @@ -30,6 +30,7 @@ import re
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..9c285627cb 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 7fb73cfe97b02bae2c4c8c186d94fd1971c899f5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.8.bb b/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.8.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.0.bb
index bc7afbdf5e..9975c608ac 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.8.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "f8a25c591bf5edbb462ca4aea99dcc666f096d13"
+SRCREV = "9f56ca620c07d6c4d119c65c1c1f3f1c584c9985"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.42.0


--===============4124263063523244512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.8-2024.0.patch"

RnJvbSBmNTk2MGRmMjhiNzg1NmFiOWI4NGE1MDM1Y2ViYzdkY2JhYjQxZWNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjM6Mjg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjMuOCAtPiAyMDI0LjAKCi0tLQogLi4ubWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCB8IDEyICsrKysrKy0tLS0tLQogLi4u
YWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCB8ICAyICst
CiAuLi4vc2hhZGVyYy97c2hhZGVyY18yMDIzLjguYmIgPT4gc2hhZGVyY18yMDI0LjAuYmJ9IHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3tzaGFkZXJjXzIwMjMuOC5iYiA9
PiBzaGFkZXJjXzIwMjQuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMv
MDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaApp
bmRleCA0MjEyNTEyMDM0Li5jNjA1ZjMzNTkwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2Zp
bGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc5MmE0NmVmMjdlZjg3OWEyMWM5ZjAxYTE5OGVhZTIx
M2VhNTM1ZTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ1OGUxYTAwYmUwOTZhMTZk
MjNlMTI5NDQ3N2U3YWZkMjZiNmQ2ZjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmVi
IDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IGRpc2FibGUgYnVp
bGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYt
Ynk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIDIgZmlsZXMgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9D
TWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA3YmM4ZjVkLi4xM2ZjNTM1IDEw
MDY0NAoraW5kZXggZmZjYjU0Yi4uY2NlNzE1ZSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0
CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTYyLDYgKzYyLDcgQEAgZWxzZSgpCkBAIC0yNiw3
ICsyNiw3IEBAIGluZGV4IDdiYzhmNWQuLjEzZmM1MzUgMTAwNjQ0CiAgCiAgc2V0IChDTUFLRV9D
WFhfU1RBTkRBUkQgMTcpCiAgCi1AQCAtMTIzLDggKzEyNCwxNCBAQCBlbmRpZihNU1ZDKQorQEAg
LTExOSw4ICsxMjAsMTQgQEAgZW5kaWYoTVNWQykKICAKICAKICAjIENvbmZpZ3VyZSBzdWJkaXJl
Y3Rvcmllcy4KQEAgLTQzLDkgKzQzLDkgQEAgaW5kZXggN2JjOGY1ZC4uMTNmYzUzNSAxMDA2NDQK
ICAKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRlcmNfdXRpbCkKICBhZGRfc3ViZGlyZWN0b3J5
KGxpYnNoYWRlcmMpCi1AQCAtMTM2LDcgKzE0Myw3IEBAIGVuZGlmKCkKK0BAIC0xMzIsNyArMTM5
LDcgQEAgZW5kaWYoKQogIGFkZF9jdXN0b21fdGFyZ2V0KGJ1aWxkLXZlcnNpb24KLSAgICR7UFlU
SE9OX0VYRUNVVEFCTEV9CisgICAke1B5dGhvbl9FWEVDVVRBQkxFfQogICAgJHtDTUFLRV9DVVJS
RU5UX1NPVVJDRV9ESVJ9L3V0aWxzL3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5CiAtICAke3NoYWRl
cmNfU09VUkNFX0RJUn0gJHtzcGlydi10b29sc19TT1VSQ0VfRElSfSAke2dsc2xhbmdfU09VUkNF
X0RJUn0gJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9L2J1aWxkLXZlcnNpb24uaW5jCiArICAk
e0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0vYnVpbGQtdmVyc2lvbi5pbmMgJHtzaGFkZXJjX1NP
VVJDRV9ESVJ9ICR7c3BpcnYtdG9vbHNfU09VUkNFX0RJUn0gJHtnbHNsYW5nX1NPVVJDRV9ESVJ9
CkBAIC01Myw3ICs1Myw3IEBAIGluZGV4IDdiYzhmNWQuLjEzZmM1MzUgMTAwNjQ0CiAgCiAgZnVu
Y3Rpb24oZGVmaW5lX3BrZ19jb25maWdfZmlsZSBOQU1FIExJQlMpCiBkaWZmIC0tZ2l0IGEvdXRp
bHMvdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkgYi91dGlscy91cGRhdGVfYnVpbGRfdmVyc2lvbi5w
eQotaW5kZXggMTFlZTUzZS4uZDM5ZTU5ZCAxMDA3NTUKK2luZGV4IGI3Y2U1YjguLjk1YjM0YzUg
MTAwNzU1CiAtLS0gYS91dGlscy91cGRhdGVfYnVpbGRfdmVyc2lvbi5weQogKysrIGIvdXRpbHMv
dXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkKIEBAIC0zMCw2ICszMCw3IEBAIGltcG9ydCByZQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFk
ZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xz
bGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCAzOWY5ODJiN2YzLi45YzI4NTYy
N2NiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNf
dXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZWMyNDQyOTQwZTFkNTMzODk3MTg2MWJiODE1MzdiYWUzYTZjMTllMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2ZiNzNjZmU5N2IwMmJhZTJjNGM4YzE4NmQ5NGZkMTk3
MWM4OTlmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1
YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBsaWJzaGFkZXJjX3V0aWw6IGZpeCBnbHNsYW5nIGhlYWRl
ciBmaWxlIGxvY2F0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVy
Yy9zaGFkZXJjXzIwMjMuOC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMC5iYgppbmRleCBiYzdhZmJkZjVlLi45
OTc1YzYwOGFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjMuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJj
XzIwMjQuMC5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29t
L2dvb2dsZS9zaGFkZXJjIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjci
CiAKLVNSQ1JFViA9ICJmOGEyNWM1OTFiZjVlZGJiNDYyY2E0YWVhOTlkY2M2NjZmMDk2ZDEzIgor
U1JDUkVWID0gIjlmNTZjYTYyMGMwN2Q2YzRkMTE5YzY1YzFjMWYzZjFjNTg0Yzk5ODUiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMuZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1idWls
ZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gg
XAotLSAKMi40Mi4wCgo=

--===============4124263063523244512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3720936 to 3720928 (-0%)
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2023.8 [default] to 2024.0 [default]

--===============4124263063523244512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-64 sysroot...done.
Removing 8 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f5337ef598f0a9ff0c1f014f9eda131b5a495c57"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f5337ef598f0a9ff0c1f014f9eda131b5a495c57"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 141 Local 130 Mirrors 0 Missed 11 Current 193 (92% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 201 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 349 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_fetch: Succeeded
NOTE: Running task 350 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glslang/1.3.275.0/temp/log.do_packagedata_setscene.742135
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 270 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_package_setscene)
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 273 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 277 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 738 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_patch)
NOTE: recipe shaderc-2024.0-r0: task do_patch: Started
NOTE: recipe shaderc-2024.0-r0: task do_patch: Succeeded
NOTE: Running task 798 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 799 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_generate_toolchain_file)
NOTE: Running task 800 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 283 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 284 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2024.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2024.0-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_lic unihash changed to 361706f18a8b2a96732117ca21dd4d11494b6b7cdae7dc48f16a03a6f782f6b3
NOTE: recipe shaderc-2024.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_deploy_source_date_epoch unihash changed to c7e6a708d02563237a626e259a1d4160e53df53a2851566ed34c90895a171f7a
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 300 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 323 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 324 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 956 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_packagedata)
NOTE: Running task 962 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_packagedata: Started
NOTE: recipe shaderc-2024.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_packagedata: Succeeded
NOTE: Running task 969 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2024.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 970 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_configure)
NOTE: recipe shaderc-2024.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2024.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_configure: Started
NOTE: recipe shaderc-2024.0-r0: task do_configure: Succeeded
NOTE: Running task 971 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_compile)
NOTE: recipe shaderc-2024.0-r0: task do_compile: Started
NOTE: recipe shaderc-2024.0-r0: task do_compile: Succeeded
NOTE: Running task 972 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_install)
NOTE: recipe shaderc-2024.0-r0: task do_install: Started
NOTE: recipe shaderc-2024.0-r0: task do_install: Succeeded
NOTE: Running task 973 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package)
NOTE: Running task 974 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_sysroot)
NOTE: recipe shaderc-2024.0-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2024.0-r0: task do_package: Started
NOTE: recipe shaderc-2024.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_sysroot unihash changed to ec6963a3e82c301a35c55d96e5cc94dd0b7f9aae94f69c37940a69486b442ba7
NOTE: recipe shaderc-2024.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package unihash changed to 774332a947a7c21d2af49d4348b25f57ed6f5f38de9b4106abf7d891a09ccc55
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_packagedata became valid
NOTE: Running setscene task 334 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 976 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_create_spdx)
NOTE: Running task 977 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_ipk)
NOTE: Running task 978 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_deb)
NOTE: Running task 979 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_rpm)
NOTE: Running task 980 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_qa)
NOTE: recipe shaderc-2024.0-r0: task do_create_spdx: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_ipk: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_deb: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_qa: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_qa unihash changed to 392bb598b377de892b499f4c3c3236893086319ceebe39aefd429870a68e5f0b
NOTE: recipe shaderc-2024.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_ipk unihash changed to 8afb5250a5248b3ad530a9521fb0bce637c383226319e93f8355542c1b966fca
NOTE: recipe shaderc-2024.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 981 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_create_runtime_spdx)
NOTE: recipe shaderc-2024.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe shaderc-2024.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_deb unihash changed to cce85e5f653d645ae37687ba87ee700eeefb25ca4fe2ebfe98d313f8b0c45de9
NOTE: recipe shaderc-2024.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_rpm unihash changed to ed7488ed6dd6606422d518bc968d02fde570e1f6c03a942fdc6c0500963c14cd
NOTE: Running noexec task 982 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_build)
NOTE: Tasks Summary: Attempted 982 tasks of which 961 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4124263063523244512==--

