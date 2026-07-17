Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AECC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:31:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7466.1784266306206341143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HdhLVMIF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MP2cD/6u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f6e8f2eb3-bf4f6259-5b97-48f7-83d0-764195ed7bea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784266305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oqYjHWj4Z7/HXTAcWOzmJItq/65lD9HKteaNGlHRaCI=;
	b=HdhLVMIF0/RtcPTkScNAmrI56uJg/smKWTICQB8eUy58Mv/AlVuo1lwUB/hsU8PG
	LvEV0ChOX0PaabdiCAPdFV/c5nlyiRO1T5jzC8xpq+a8Uf3Yy7wDM8N188eBGQSE1w+
	gh/g+OnxvvKDepyd5B4Jgh0OfYQfkaawhlf4I5ZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784266305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oqYjHWj4Z7/HXTAcWOzmJItq/65lD9HKteaNGlHRaCI=;
	b=MP2cD/6u4jGYAbNcAL3ILKoHVwKFSybsVZb+gGjj/uFRlICwKkVtGNVK6gNgRaWX
	Kq+1q47BBnTeX3vVgzRg/qP7PqCMxSK25pjgLXzIzDhhk6IGS6BQHFQrvZcdvU+Sw5D
	9xjHSaDRK5vuxn/1NBkUutbmKSY7vc4fDBaB9Q1k=
Content-Type: multipart/mixed; boundary="===============1528942703617834337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2026.3 SUCCEEDED
Message-ID: <0101019f6e8f2eb3-bf4f6259-5b97-48f7-83d0-764195ed7bea-000000@us-west-2.amazonses.com>
Date: Fri, 17 Jul 2026 05:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.17-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241127

--===============1528942703617834337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2026.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2026.2-2026.3.patch
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
From a06572e57a1043a7cbbd2debb09fe2182b78a788 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 17 Jul 2026 05:23:16 +0000
Subject: [PATCH] shaderc: upgrade 2026.2 -> 2026.3

---
 ...-cmake-disable-building-external-dependencies.patch | 10 +++++-----
 ...shaderc_util-fix-glslang-header-file-location.patch |  4 ++--
 .../shaderc/{shaderc_2026.2.bb => shaderc_2026.3.bb}   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.2.bb => shaderc_2026.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index f9731a8eaa..bc324b5c0d 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From adf7927c3fa5055d33c3970be53fdf1a8853b617 Mon Sep 17 00:00:00 2001
+From b2d321b9c493a6e36203c50ad20adb655485c951 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 06f5395..39b8869 100644
+index 51b5469..8557714 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -72,6 +72,7 @@ else()
+@@ -77,6 +77,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
@@ -26,7 +26,7 @@ index 06f5395..39b8869 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -129,8 +130,14 @@ endif(MSVC)
+@@ -134,8 +135,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +43,7 @@ index 06f5395..39b8869 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -142,7 +149,7 @@ endif()
+@@ -147,7 +154,7 @@ endif()
  add_custom_target(build-version
    ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index d639635766..fb11fae014 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From f3915766d382d30c83da6d8077bf183e930a4789 Mon Sep 17 00:00:00 2001
+From 8f2350e4172758bf6ef3464c998352864b90988f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index f2ed3c7..59b262a 100644
+index 41bdba7..db7f329 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.2.bb b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.3.bb
index 644db97969..063bafaa04 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "baec0c74d6dca70c52d937e2e5bf6ffcd449e430"
+SRCREV = "82757e4f72af8518fb679604d352623450cb761f"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============1528942703617834337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.2 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.3 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5154496 to 5164344 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: FILELIST: directory renamed /usr/src/debug/shaderc/2026.2/glslc/src -> /usr/src/debug/shaderc/2026.3/glslc/src, directory renamed /usr/src/debug/shaderc/2026.2/libshaderc_util/src -> /usr/src/debug/shaderc/2026.3/libshaderc_util/src, directory renamed /usr/src/debug/shaderc/2026.2/libshaderc/src -> /usr/src/debug/shaderc/2026.3/libshaderc/src, directory renamed /usr/src/debug/shaderc/2026.2/libshaderc/include/shaderc -> /usr/src/debug/shaderc/2026.3/libshaderc/include/shaderc, directory renamed /usr/src/debug/shaderc/2026.2/libshaderc_util/include/libshaderc_util -> /usr/src/debug/shaderc/2026.3/libshaderc_util/include/libshaderc_util
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 327800 to 328643 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3798746 to 3806674 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2026.2" to "2026.3"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2026.2 [default] to 2026.3 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2026.2" to "2026.3"

--===============1528942703617834337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2026.2-2026.3.patch"

RnJvbSBhMDY1NzJlNTdhMTA0M2E3Y2JiZDJkZWJiMDlmZTIxODJiNzhhNzg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTcgSnVsIDIwMjYgMDU6MjM6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjYuMiAtPiAyMDI2LjMKCi0tLQogLi4uLWNtYWtlLWRpc2FibGUt
YnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIHwgMTAgKysrKystLS0tLQogLi4u
c2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIHwgIDQg
KystLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNi4yLmJiID0+IHNoYWRlcmNfMjAyNi4zLmJi
fSAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3tzaGFkZXJjXzIwMjYu
Mi5iYiA9PiBzaGFkZXJjXzIwMjYuMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0
ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
ZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5w
YXRjaAppbmRleCBmOTczMWE4ZWFhLi5iYzMyNGI1YzBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0
ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNp
ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFkZjc5MjdjM2ZhNTA1NWQzM2MzOTcwYmU1
M2ZkZjFhODg1M2I2MTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIyZDMyMWI5YzQ5
M2E2ZTM2MjAzYzUwYWQyMGFkYjY1NTQ4NWM5NTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwg
MTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IGRpc2Fi
bGUgYnVpbGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCkBAIC0xNSwxMCArMTUsMTAgQEAgU2ln
bmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMiBm
aWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDA2ZjUzOTUuLjM5
Yjg4NjkgMTAwNjQ0CitpbmRleCA1MWI1NDY5Li44NTU3NzE0IDEwMDY0NAogLS0tIGEvQ01ha2VM
aXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtNzIsNiArNzIsNyBAQCBlbHNlKCkK
K0BAIC03Nyw2ICs3Nyw3IEBAIGVsc2UoKQogIGVuZGlmKCkKICAKICBvcHRpb24oU0hBREVSQ19F
TkFCTEVfV0VSUk9SX0NPTVBJTEUgIkVuYWJsZSBwYXNzaW5nIC1XZXJyb3IgdG8gY29tcGlsZXIs
IGlmIGF2YWlsYWJsZSIgT04pCkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IDA2ZjUzOTUuLjM5Yjg4
NjkgMTAwNjQ0CiAgCiAgc2V0IChDTUFLRV9DWFhfU1RBTkRBUkQgMTcpCiAgCi1AQCAtMTI5LDgg
KzEzMCwxNCBAQCBlbmRpZihNU1ZDKQorQEAgLTEzNCw4ICsxMzUsMTQgQEAgZW5kaWYoTVNWQykK
ICAKICAKICAjIENvbmZpZ3VyZSBzdWJkaXJlY3Rvcmllcy4KQEAgLTQzLDcgKzQzLDcgQEAgaW5k
ZXggMDZmNTM5NS4uMzliODg2OSAxMDA2NDQKICAKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRl
cmNfdXRpbCkKICBhZGRfc3ViZGlyZWN0b3J5KGxpYnNoYWRlcmMpCi1AQCAtMTQyLDcgKzE0OSw3
IEBAIGVuZGlmKCkKK0BAIC0xNDcsNyArMTU0LDcgQEAgZW5kaWYoKQogIGFkZF9jdXN0b21fdGFy
Z2V0KGJ1aWxkLXZlcnNpb24KICAgICR7UHl0aG9uX0VYRUNVVEFCTEV9CiAgICAke0NNQUtFX0NV
UlJFTlRfU09VUkNFX0RJUn0vdXRpbHMvdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmct
aGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggZDYzOTYzNTc2Ni4uZmIxMWZhZTAxNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJz
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGYzOTE1NzY2ZDM4MmQzMGM4M2RhNmQ4MDc3YmYxODNlOTMwYTQ3ODkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDhmMjM1MGU0MTcyNzU4YmY2ZWYzNDY0Yzk5ODM1Mjg2NGI5MDk4
OGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNt
YS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXggZ2xzbGFuZyBoZWFkZXIgZmls
ZSBsb2NhdGlvbgpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21h
IDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYnNoYWRlcmNfdXRpbC9zcmMvY29t
cGlsZXIuY2MgYi9saWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVyLmNjCi1pbmRleCBmMmVkM2M3
Li41OWIyNjJhIDEwMDY0NAoraW5kZXggNDFiZGJhNy4uZGI3ZjMyOSAxMDA2NDQKIC0tLSBhL2xp
YnNoYWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MKICsrKyBiL2xpYnNoYWRlcmNfdXRpbC9zcmMv
Y29tcGlsZXIuY2MKIEBAIC0yMCw3ICsyMCw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zaGFkZXJjL3NoYWRlcmNfMjAyNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNi4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjYuMy5iYgppbmRl
eCA2NDRkYjk3OTY5Li4wNjNiYWZhYTA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
c2hhZGVyYy9zaGFkZXJjXzIwMjYuMy5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5
YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ1JFViA9ICJiYWVjMGM3NGQ2ZGNhNzBjNTJkOTM3ZTJlNWJm
NmZmY2Q0NDllNDMwIgorU1JDUkVWID0gIjgyNzU3ZTRmNzJhZjg1MThmYjY3OTYwNGQzNTI2MjM0
NTBjYjc2MWYiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1o
ZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============1528942703617834337==--

