Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C9C54EED
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1235.1710522010786895544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VmW5LBKo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=doIw198J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e9ae3-3808da6a-c5e3-46f1-877d-ee8ab188da77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mQYL/qq7b5i3Ql5QBwPV1td7DXriE/j1xW5ukp+zkAk=;
	b=VmW5LBKoJH85ipNjeVq+PLG1pJdIseHZZ8//cxyXoVsWbL4acRKb5mkIr427m/vr
	T48Ifodo/vdFs4L+SNYhVkcgrPXQcMd/l5hraTETUXXI1lRWJF0I6+48bCyFupZsHzV
	ilp40ZW9/1ctC9SeY7W9pUhdHRCros2lRFTwIp+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mQYL/qq7b5i3Ql5QBwPV1td7DXriE/j1xW5ukp+zkAk=;
	b=doIw198JTkHEQzQJ8KupYY4+4vdFDD1C18bY/1FMzII0cBXd9/gSuTYk5/7PhY6u
	2tBwsT8ctnl/vSkG158RUqpp9g/k6e04Xq1j1of3Xp9N9No4Q5fyf3k+tEQ5Gp7q9cz
	ED0GqbB0EKPyrU+RMyHrsflUpSLUGaLlOdaQQfH0=
Content-Type: multipart/mixed; boundary="===============3247617608167347384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.0 SUCCEEDED
Message-ID: <0101018e430e9ae3-3808da6a-c5e3-46f1-877d-ee8ab188da77-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197212

--===============3247617608167347384==
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
From ad058a0c4b50cddeea30b8f735aa65683c83685a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 13:02:15 +0000
Subject: [PATCH] shaderc: upgrade 2023.8 -> 2024.0

---
 ...make-disable-building-external-dependencies.patch | 12 ++++++------
 ...aderc_util-fix-glslang-header-file-location.patch |  2 +-
 .../shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 4212512034..9fad2d558a 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 792a46ef27ef879a21c9f01a198eae213ea535e6 Mon Sep 17 00:00:00 2001
+From e7cd559f3ce5ccc964b7bc00d512defc907f0a7e Mon Sep 17 00:00:00 2001
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
index 39f982b7f3..2b3cd158fa 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 2a5af967b09a2a1a55ee4abfb20b8121a59e9f54 Mon Sep 17 00:00:00 2001
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


--===============3247617608167347384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2023.8" to "2024.0"
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

--===============3247617608167347384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.8-2024.0.patch"

RnJvbSBhZDA1OGEwYzRiNTBjZGRlZWEzMGI4ZjczNWFhNjU2ODNjODM2ODVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTM6MDI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
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
bmRleCA0MjEyNTEyMDM0Li45ZmFkMmQ1NThhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2Zp
bGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc5MmE0NmVmMjdlZjg3OWEyMWM5ZjAxYTE5OGVhZTIx
M2VhNTM1ZTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU3Y2Q1NTlmM2NlNWNjYzk2
NGI3YmMwMGQ1MTJkZWZjOTA3ZjBhN2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBK
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
bGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCAzOWY5ODJiN2YzLi4yYjNjZDE1
OGZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNf
dXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZWMyNDQyOTQwZTFkNTMzODk3MTg2MWJiODE1MzdiYWUzYTZjMTllMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmE1YWY5NjdiMDlhMmExYTU1ZWU0YWJmYjIwYjgxMjFh
NTllOWY1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1
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

--===============3247617608167347384==--

