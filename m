Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932E4CD13B1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.44661.1711994603382943339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M/KmrK+0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dHFS4MON;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad4848b-d44dde26-64d2-4a73-b48c-b0b1dd501e6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4cdYGU883s3xbQoiPiH6APhYxMQXZlcQINoc2bEo+eo=;
	b=M/KmrK+0OZH1kd+7TXMOZgCXlSZ1MKdtlLG9SV32XETtfdkKHgSRV48iniQWtW58
	dx04/79Cp7HRc0oGpPZmwgIBrZUVOR2ofK252OZ20a4JjoaWYFrBqzJ2OM/xXGziP+p
	MNaVBReQkKPYJonj1ZaD0QH6Gc/SYzmHgTHGVC7U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4cdYGU883s3xbQoiPiH6APhYxMQXZlcQINoc2bEo+eo=;
	b=dHFS4MONkL2zSS48Wuo8L4ItxvycGDi7JeFf4P+NrDwL73nG1Tr+rFLGr/2Bxzr1
	/38mLoAY/acPmvRDhZgM8GS7WldYjJ+UcewiyOyceY4IWDcWi6PpRuOerSnRhIf/yVD
	Ixy1N1Lo42GO02cEp6w1XeyPPWQJYCJd0p0k67lg=
Content-Type: multipart/mixed; boundary="===============5873652286974594713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.0 SUCCEEDED
Message-ID: <0101018e9ad4848b-d44dde26-64d2-4a73-b48c-b0b1dd501e6c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197768

--===============5873652286974594713==
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
From 9c6e8c44b664e2a55b49bee3175931682767bf49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 13:48:12 +0000
Subject: [PATCH] shaderc: upgrade 2023.8 -> 2024.0

---
 ...make-disable-building-external-dependencies.patch | 12 ++++++------
 ...aderc_util-fix-glslang-header-file-location.patch |  2 +-
 .../shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 4212512034..e25e932f2c 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 792a46ef27ef879a21c9f01a198eae213ea535e6 Mon Sep 17 00:00:00 2001
+From eb07b218680e64d98b6bc932fa0dd13865317db6 Mon Sep 17 00:00:00 2001
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
index 39f982b7f3..96dcc26891 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 8a4cb2acdea4686c40345a909bfd33bf326a0d75 Mon Sep 17 00:00:00 2001
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


--===============5873652286974594713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.8-2024.0.patch"

RnJvbSA5YzZlOGM0NGI2NjRlMmE1NWI0OWJlZTMxNzU5MzE2ODI3NjdiZjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMzo0ODoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMy44IC0+IDIwMjQuMAoKLS0tCiAuLi5tYWtlLWRpc2FibGUtYnVp
bGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIHwgMTIgKysrKysrLS0tLS0tCiAuLi5h
ZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIHwgIDIgKy0K
IC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjMuOC5iYiA9PiBzaGFkZXJjXzIwMjQuMC5iYn0gfCAg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNfMjAyMy44LmJiID0+
IHNoYWRlcmNfMjAyNC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1k
ZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8w
MDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCmlu
ZGV4IDQyMTI1MTIwMzQuLmUyNWU5MzJmMmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1k
ZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmls
ZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzkyYTQ2ZWYyN2VmODc5YTIxYzlmMDFhMTk4ZWFlMjEz
ZWE1MzVlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWIwN2IyMTg2ODBlNjRkOThi
NmJjOTMyZmEwZGQxMzg2NTMxN2RiNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpv
c2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIg
MjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogZGlzYWJsZSBidWls
ZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKQEAgLTE1LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1i
eTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0NN
YWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDdiYzhmNWQuLjEzZmM1MzUgMTAw
NjQ0CitpbmRleCBmZmNiNTRiLi5jY2U3MTVlIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQK
ICsrKyBiL0NNYWtlTGlzdHMudHh0CiBAQCAtNjIsNiArNjIsNyBAQCBlbHNlKCkKQEAgLTI2LDcg
KzI2LDcgQEAgaW5kZXggN2JjOGY1ZC4uMTNmYzUzNSAxMDA2NDQKICAKICBzZXQgKENNQUtFX0NY
WF9TVEFOREFSRCAxNykKICAKLUBAIC0xMjMsOCArMTI0LDE0IEBAIGVuZGlmKE1TVkMpCitAQCAt
MTE5LDggKzEyMCwxNCBAQCBlbmRpZihNU1ZDKQogIAogIAogICMgQ29uZmlndXJlIHN1YmRpcmVj
dG9yaWVzLgpAQCAtNDMsOSArNDMsOSBAQCBpbmRleCA3YmM4ZjVkLi4xM2ZjNTM1IDEwMDY0NAog
IAogIGFkZF9zdWJkaXJlY3RvcnkobGlic2hhZGVyY191dGlsKQogIGFkZF9zdWJkaXJlY3Rvcnko
bGlic2hhZGVyYykKLUBAIC0xMzYsNyArMTQzLDcgQEAgZW5kaWYoKQorQEAgLTEzMiw3ICsxMzks
NyBAQCBlbmRpZigpCiAgYWRkX2N1c3RvbV90YXJnZXQoYnVpbGQtdmVyc2lvbgotICAgJHtQWVRI
T05fRVhFQ1VUQUJMRX0KKyAgICR7UHl0aG9uX0VYRUNVVEFCTEV9CiAgICAke0NNQUtFX0NVUlJF
TlRfU09VUkNFX0RJUn0vdXRpbHMvdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkKIC0gICR7c2hhZGVy
Y19TT1VSQ0VfRElSfSAke3NwaXJ2LXRvb2xzX1NPVVJDRV9ESVJ9ICR7Z2xzbGFuZ19TT1VSQ0Vf
RElSfSAke0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0vYnVpbGQtdmVyc2lvbi5pbmMKICsgICR7
Q01BS0VfQ1VSUkVOVF9CSU5BUllfRElSfS9idWlsZC12ZXJzaW9uLmluYyAke3NoYWRlcmNfU09V
UkNFX0RJUn0gJHtzcGlydi10b29sc19TT1VSQ0VfRElSfSAke2dsc2xhbmdfU09VUkNFX0RJUn0K
QEAgLTUzLDcgKzUzLDcgQEAgaW5kZXggN2JjOGY1ZC4uMTNmYzUzNSAxMDA2NDQKICAKICBmdW5j
dGlvbihkZWZpbmVfcGtnX2NvbmZpZ19maWxlIE5BTUUgTElCUykKIGRpZmYgLS1naXQgYS91dGls
cy91cGRhdGVfYnVpbGRfdmVyc2lvbi5weSBiL3V0aWxzL3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5
Ci1pbmRleCAxMWVlNTNlLi5kMzllNTlkIDEwMDc1NQoraW5kZXggYjdjZTViOC4uOTViMzRjNSAx
MDA3NTUKIC0tLSBhL3V0aWxzL3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5CiArKysgYi91dGlscy91
cGRhdGVfYnVpbGRfdmVyc2lvbi5weQogQEAgLTMwLDYgKzMwLDcgQEAgaW1wb3J0IHJlCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRl
cmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNs
YW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCmluZGV4IDM5Zjk4MmI3ZjMuLjk2ZGNjMjY4
OTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBlYzI0NDI5NDBlMWQ1MzM4OTcxODYxYmI4MTUzN2JhZTNhNmMxOWUyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YTRjYjJhY2RlYTQ2ODZjNDAzNDVhOTA5YmZkMzNiZjMy
NmEwZDc1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVh
cmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnNoYWRlcmNfdXRpbDogZml4IGdsc2xhbmcgaGVhZGVy
IGZpbGUgbG9jYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L3NoYWRlcmNfMjAyMy44LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDI0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNC4wLmJiCmluZGV4IGJjN2FmYmRmNWUuLjk5
NzVjNjA4YWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMy44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNf
MjAyNC4wLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIK
IAotU1JDUkVWID0gImY4YTI1YzU5MWJmNWVkYmI0NjJjYTRhZWE5OWRjYzY2NmYwOTZkMTMiCitT
UkNSRVYgPSAiOWY1NmNhNjIwYzA3ZDZjNGQxMTljNjVjMWMxZjNmMWM1ODRjOTk4NSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxk
aW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBc
Ci0tIAoyLjQyLjAKCg==

--===============5873652286974594713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-f3c19f3cc200b4636eb7d97d6a750a244b2f75d4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f3c19f3cc200b4636eb7d97d6a750a244b2f75d4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 146 Local 135 Mirrors 0 Missed 11 Current 188 (92% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 205 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 207 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 708 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 268 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 270 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glslang/1.3.275.0/temp/log.do_packagedata_setscene.1431991
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 271 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_package_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 709 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_unpack)
NOTE: recipe shaderc-2024.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 274 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_package_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 791 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_patch)
NOTE: recipe shaderc-2024.0-r0: task do_patch: Started
NOTE: recipe shaderc-2024.0-r0: task do_patch: Succeeded
NOTE: Running task 798 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 799 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_generate_toolchain_file)
NOTE: Running task 800 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_lic)
NOTE: recipe shaderc-2024.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2024.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2024.0-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2024.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_populate_lic unihash changed to 361706f18a8b2a96732117ca21dd4d11494b6b7cdae7dc48f16a03a6f782f6b3
NOTE: recipe shaderc-2024.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_deploy_source_date_epoch unihash changed to c7e6a708d02563237a626e259a1d4160e53df53a2851566ed34c90895a171f7a
NOTE: recipe glslang-1_1.3.275.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 275 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 284 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
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
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
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
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
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
NOTE: recipe shaderc-2024.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2024.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 970 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_configure)
NOTE: recipe shaderc-2024.0-r0: task do_configure: Started
NOTE: recipe shaderc-2024.0-r0: task do_collect_spdx_deps: Succeeded
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
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_qa became valid
NOTE: Running setscene task 330 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_ipk_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_package_qa_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 334 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2024.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-2024.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 976 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_create_spdx)
NOTE: Running task 979 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_rpm)
NOTE: recipe shaderc-2024.0-r0: task do_create_spdx: Started
NOTE: recipe shaderc-2024.0-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2024.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 981 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_create_runtime_spdx)
NOTE: recipe shaderc-2024.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe shaderc-2024.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe shaderc-2024.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_package_write_rpm unihash changed to ed7488ed6dd6606422d518bc968d02fde570e1f6c03a942fdc6c0500963c14cd
NOTE: Running noexec task 982 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.0.bb:do_build)
NOTE: Tasks Summary: Attempted 982 tasks of which 964 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.280.0-r0 to 1:1.3.275.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.275.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5873652286974594713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.8" to "2024.0"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3720936 to 3720928 (-0%)
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2023.8 [default] to 2024.0 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2023.8" to "2024.0"

--===============5873652286974594713==--

