Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6888CD4843
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15602.1777645526072816566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KTrkLmA1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R5kZrZbc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee9277-203ebcdf-2dce-4ef5-aa7d-840ac501ea09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tJHKuf1kBYfM98OpSvGEIzU4kh7xPbaRiGtXBC8pdNE=;
	b=KTrkLmA1dk04ZPWzhZM+CeXkAbFHKip5xcTSV59YC77aZRoG7EH/QEKg7VYBbp/Z
	UbE6R9ziOG6oOnsEVe/yA9NL2PmRhSsFT9QNJW3NHEllB0GQ0VjXWQTPl3VBAmr/HQp
	8tvGWWHnP7O9d4EYKRqqX+7AHhoPGMQKKv4izTEI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tJHKuf1kBYfM98OpSvGEIzU4kh7xPbaRiGtXBC8pdNE=;
	b=R5kZrZbcfJbAKAKhdB6caCjea3c01sl/tdiN9E3REFe9zcHv2lYR67nvCoqFUbQ1
	o4tLW09p8TdDsTjMuYGvaRtqQNS8RJKYCG/8B3uiTiti3qlYoiV3qVTIMRVMTaGETRX
	7bzpcibaxLL/EZ5YBrQ9+YVzQGFXEy5Jzo+50PmE=
Content-Type: multipart/mixed; boundary="===============4607161877443461980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] nghttp2: upgrading to 1.69.0 SUCCEEDED
Message-ID: <0101019de3ee9277-203ebcdf-2dce-4ef5-aa7d-840ac501ea09-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236299

--===============4607161877443461980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.69.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.68.1-1.69.0.patch
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
From 59744794270c1a6545c0dfe1fd91e6c501d43ef1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 14:22:36 +0000
Subject: [PATCH] nghttp2: upgrade 1.68.1 -> 1.69.0

---
 ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 26 -------------------
 .../{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb}  |  7 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb} (62%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
deleted file mode 100644
index 32adb05e07..0000000000
--- a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
-From: Ankur Tyagi <ankur.tyagi85@gmail.com>
-Date: Sun, 9 Nov 2025 12:45:25 +1300
-Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
-
-Remove hard coded path to fix installation on 64-bit arch.
-
-Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 98e3dbe7..3b6a4400 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
- set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
- set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
- set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
--set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
-+set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
- set(NGHTTP2_VERSION ${PROJECT_VERSION})
- 
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
similarity index 62%
rename from meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
index 71d5eef8d6..8f3e1e4a97 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
@@ -4,12 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "\
-    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
-    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
-"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2"
+SRC_URI[sha256sum] = "1fb324b6ec2c56f6bde0658f4139ffd8209fa9e77ce98fd7a5f63af8d0e508ad"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.47.1


--===============4607161877443461980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.3", added "/usr/lib/libnghttp2.so.14.29.4"
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.3 to libnghttp2.so.14.29.4
  /usr/lib/libnghttp2.so.14.29.3 moved to /usr/lib/libnghttp2.so.14.29.4

--===============4607161877443461980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.68.1-1.69.0.patch"

RnJvbSA1OTc0NDc5NDI3MGMxYTY1NDVjMGRmZTFmZDkxZTZjNTAxZDQzZWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxNDoyMjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS42OC4xIC0+IDEuNjkuMAoKLS0tCiAuLi54dC1GaXgtTkdIVFRQMl9D
T05GSUdfSU5TVEFMTF9ESVItcGEucGF0Y2ggfCAyNiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e25naHR0cDJfMS42OC4xLmJiID0+IG5naHR0cDJfMS42OS4wLmJifSAgfCAgNyArKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMi8wMDAxLWxpYi1D
TWFrZUxpc3RzLnR4dC1GaXgtTkdIVFRQMl9DT05GSUdfSU5TVEFMTF9ESVItcGEucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNjguMS5iYiA9PiBu
Z2h0dHAyXzEuNjkuMC5iYn0gKDYyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9uZ2h0dHAyL25naHR0cDIvMDAwMS1saWItQ01ha2VMaXN0cy50eHQtRml4LU5HSFRUUDJfQ09O
RklHX0lOU1RBTExfRElSLXBhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9u
Z2h0dHAyLzAwMDEtbGliLUNNYWtlTGlzdHMudHh0LUZpeC1OR0hUVFAyX0NPTkZJR19JTlNUQUxM
X0RJUi1wYS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzJhZGIwNWUwNy4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAw
MS1saWItQ01ha2VMaXN0cy50eHQtRml4LU5HSFRUUDJfQ09ORklHX0lOU1RBTExfRElSLXBhLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjYgKzAsMCBAQAotRnJvbSBlYjU4MTJkMDE4ZWI5NjI4
NGFhNmVmODI1NjlkMGI2Yjc1YmNkMDIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
QW5rdXIgVHlhZ2kgPGFua3VyLnR5YWdpODVAZ21haWwuY29tPgotRGF0ZTogU3VuLCA5IE5vdiAy
MDI1IDEyOjQ1OjI1ICsxMzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYi9DTWFrZUxpc3RzLnR4dDog
Rml4IE5HSFRUUDJfQ09ORklHX0lOU1RBTExfRElSIHBhdGgKLQotUmVtb3ZlIGhhcmQgY29kZWQg
cGF0aCB0byBmaXggaW5zdGFsbGF0aW9uIG9uIDY0LWJpdCBhcmNoLgotCi1VcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL25naHR0cDIvbmdodHRwMi9wdWxsLzI1
NTFdCi1TaWduZWQtb2ZmLWJ5OiBBbmt1ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBnbWFpbC5jb20+
Ci0tLS0KLSBsaWIvQ01ha2VMaXN0cy50eHQgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9saWIvQ01ha2VMaXN0cy50
eHQgYi9saWIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDk4ZTNkYmU3Li4zYjZhNDQwMCAxMDA2NDQK
LS0tLSBhL2xpYi9DTWFrZUxpc3RzLnR4dAotKysrIGIvbGliL0NNYWtlTGlzdHMudHh0Ci1AQCAt
NTEsNyArNTEsNyBAQCBzZXQoTkdIVFRQMl9HRU5FUkFURURfRElSICIke0NNQUtFX0NVUlJFTlRf
QklOQVJZX0RJUn0vZ2VuZXJhdGVkIikKLSBzZXQoTkdIVFRQMl9WRVJTSU9OX0NPTkZJRyAiJHtO
R0hUVFAyX0dFTkVSQVRFRF9ESVJ9LyR7UFJPSkVDVF9OQU1FfUNvbmZpZ1ZlcnNpb24uY21ha2Ui
KQotIHNldChOR0hUVFAyX1BST0pFQ1RfQ09ORklHICIke05HSFRUUDJfR0VORVJBVEVEX0RJUn0v
JHtQUk9KRUNUX05BTUV9Q29uZmlnLmNtYWtlIikKLSBzZXQoTkdIVFRQMl9UQVJHRVRTX0VYUE9S
VF9OQU1FICIke1BST0pFQ1RfTkFNRX1UYXJnZXRzIikKLS1zZXQoTkdIVFRQMl9DT05GSUdfSU5T
VEFMTF9ESVIgImxpYi9jbWFrZS8ke1BST0pFQ1RfTkFNRX0iKQotK3NldChOR0hUVFAyX0NPTkZJ
R19JTlNUQUxMX0RJUiAiJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0vY21ha2UvJHtQUk9KRUNUX05B
TUV9IikKLSBzZXQoTkdIVFRQMl9OQU1FU1BBQ0UgIiR7UFJPSkVDVF9OQU1FfTo6IikKLSBzZXQo
TkdIVFRQMl9WRVJTSU9OICR7UFJPSkVDVF9WRVJTSU9OfSkKLSAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjY4LjEuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS42OS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNjIlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjY4LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjY5LjAuYmIK
aW5kZXggNzFkNWVlZjhkNi4uOGYzZTFlNGE5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9uZ2h0dHAyL25naHR0cDJfMS42OS4wLmJiCkBAIC00LDEyICs0LDkgQEAgU0VDVElPTiA9ICJs
aWJzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT03NjRhYmRmMzBiMmVhZGQzN2NlNDdkY2JjZTBlYTFlYyIKIAotU1JDX1VSSSA9ICJcCi0g
ICAgJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9LnRhci54
eiBcCi0gICAgZmlsZTovLzAwMDEtbGliLUNNYWtlTGlzdHMudHh0LUZpeC1OR0hUVFAyX0NPTkZJ
R19JTlNUQUxMX0RJUi1wYS5wYXRjaCBcCi0iCitTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJ
fS9kb3dubG9hZC92JHtQVn0vbmdodHRwMi0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI2YWJkN2FiMGE3ZjE1ODBkNTkxNDQ1N2NiM2M4NWViODA0NTU2NTdlZTUxMTkyMDZl
ZGJkN2Y4NDhjMTRmMGIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFmYjMyNGI2ZWMyYzU2ZjZi
ZGUwNjU4ZjQxMzlmZmQ4MjA5ZmE5ZTc3Y2U5OGZkN2E1ZjYzYWY4ZDBlNTA4YWQiCiAKIGluaGVy
aXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40
Ny4xCgo=

--===============4607161877443461980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.68.1/nghttp2-1.68.1.tar.xz file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch" to "https://github.com/nghttp2/nghttp2/releases//download/v1.69.0/nghttp2-1.69.0.tar.xz"
packages/x86-64-v3-poky-linux/nghttp2: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.29.3", added "/usr/lib/.debug/libnghttp2.so.14.29.4"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 626000 to 627872 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 253582 to 253584 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: FILELIST: directory renamed /usr/src/debug/nghttp2/1.68.1/lib -> /usr/src/debug/nghttp2/1.69.0/lib, directory renamed /usr/src/debug/nghttp2/1.68.1/lib/includes/nghttp2 -> /usr/src/debug/nghttp2/1.69.0/lib/includes/nghttp2
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1051466 to 1063280 (+1%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.3", added "/usr/lib/libnghttp2.so.14.29.4"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PKGSIZE changed from 186461 to 190557 (+2%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PV changed from "1.68.1" to "1.69.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PKGV changed from 1.68.1 [default] to 1.69.0 [default]
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.3 to libnghttp2.so.14.29.4
  /usr/lib/libnghttp2.so.14.29.3 moved to /usr/lib/libnghttp2.so.14.29.4

--===============4607161877443461980==--

