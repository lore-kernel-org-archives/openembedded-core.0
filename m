Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA03FD5E138
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17409.1765872158090865315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hIYilI06;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DdeoVH6e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ec36d-6761e773-f39e-4ab7-87d9-41289cc9bee4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zYaCOSl4XALxYLtBsUx64yupjqs+JEoMtx6E2qQKqvk=;
	b=hIYilI06MXat0nMUL8e6uVmfBkt1jX7ZbzkGqggUYnCLkg3xe6KQ4nDwzPq8ACP2
	+6wpIr+2dCnFa5mxFQFX98lB9mENpvO9R0sWhcyxMialVXFRGWZ/GzO1zQMWLY8DT4j
	ht0ZuRH7nzgkvNj7MpN9+K2Xdup+LIswKjdGQjH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zYaCOSl4XALxYLtBsUx64yupjqs+JEoMtx6E2qQKqvk=;
	b=DdeoVH6eZf/qgF/h/YPXvJ93SyOcDSERyXRX+0yYrJXo8ykMosk9nzpvUrwVUhsL
	QyQu1//UkPqFCaTBQKw4g0i/NQxkuAqFT+/D5b/AmNmQrQJrMAvSkH537rPRYN6GT9v
	JcH6FD9Hk9b5MQ/cC+M0vzxuR00VD4qgRAKVcriw=
Content-Type: multipart/mixed; boundary="===============5106780808018096285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.335.0 SUCCEEDED
Message-ID: <0101019b262ec36d-6761e773-f39e-4ab7-87d9-41289cc9bee4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227862

--===============5106780808018096285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.335.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.328.1-1.4.335.0.patch
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
From 0897218ac43fe700dc1e795cfb1128036d6fc4d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:13:41 +0000
Subject: [PATCH] glslang: upgrade 1.4.328.1 -> 1.4.335.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.4.328.1.bb => glslang_1.4.335.0.bb}  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.328.1.bb => glslang_1.4.335.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 04dab67773..150242ce1d 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From df6111570ada81d3968043decb5eee16dc5f9fa1 Mon Sep 17 00:00:00 2001
+From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 47925d8d..d90191c3 100644
+index 1bf4c1f2..9a05cbaf 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -256,6 +256,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb b/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
index 57d9fe1a98..7d3b5d0bc8 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "a57276bf558f5cf94d3a9854ebdf5a2236849a5a"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.328;tag=vulkan-sdk-${PV} \
+SRCREV = "b5782e52ee2f7b3e40bb9c80d15b47016e008bc9"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
-- 
2.47.1


--===============5106780808018096285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.16.0.0 /usr/lib/libSPIRV.so.16.0.0 /usr/lib/libglslang-default-resource-limits.so.16.0.0", added "/usr/lib/libglslang-default-resource-limits.so.16.1.0 /usr/lib/libglslang.so.16.1.0 /usr/lib/libSPIRV.so.16.1.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.0.0 to libglslang-default-resource-limits.so.16.1.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.0.0 to libglslang.so.16.1.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.0.0 to libSPIRV.so.16.1.0
  /usr/lib/libglslang-default-resource-limits.so.16.0.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.1.0
  /usr/lib/libglslang.so.16.0.0 moved to /usr/lib/libglslang.so.16.1.0
  /usr/lib/libSPIRV.so.16.0.0 moved to /usr/lib/libSPIRV.so.16.1.0

--===============5106780808018096285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.16.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.0.0 /usr/lib/.debug/libSPIRV.so.16.0.0", added "/usr/lib/.debug/libglslang-default-resource-limits.so.16.1.0 /usr/lib/.debug/libSPIRV.so.16.1.0 /usr/lib/.debug/libglslang.so.16.1.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 50790776 to 51589752 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGSIZE changed from 413153 to 422433 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.335.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/HLSL -> /usr/src/debug/glslang/1.4.335.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.335.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.328.1/include/glslang -> /usr/src/debug/glslang/1.4.335.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.328.1/StandAlone -> /usr/src/debug/glslang/1.4.335.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.328.1/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.335.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/Public -> /usr/src/debug/glslang/1.4.335.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.328.1/
 glslang/OSDependent -> /usr/src/debug/glslang/1.4.335.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang -> /usr/src/debug/glslang/1.4.335.0/glslang, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/Include -> /usr/src/debug/glslang/1.4.335.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.4.328.1/SPIRV -> /usr/src/debug/glslang/1.4.335.0/SPIRV, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/CInterface -> /usr/src/debug/glslang/1.4.335.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.335.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.335.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.328.1/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.335.0/glslang/OSDependent/Unix
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGSIZE changed from 5287466 to 5391292 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.16.0.0 /usr/lib/libglslang.so.16.0.0 /usr/lib/libglslang-default-resource-limits.so.16.0.0", added "/usr/lib/libglslang-default-resource-limits.so.16.1.0 /usr/lib/libglslang.so.16.1.0 /usr/lib/libSPIRV.so.16.1.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGSIZE changed from 3616889 to 3682425 (+2%)
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.328;tag=vulkan-sdk-1.4.328.1 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.335.0 file://0001-generate-glslang-pkg-config.patch"
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.328.1" to "1.4.335.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.0.0 to libglslang-default-resource-limits.so.16.1.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.0.0 to libglslang.so.16.1.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.0.0 to libSPIRV.so.16.1.0
  /usr/lib/libglslang-default-resource-limits.so.16.0.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.1.0
  /usr/lib/libglslang.so.16.0.0 moved to /usr/lib/libglslang.so.16.1.0
  /usr/lib/libSPIRV.so.16.0.0 moved to /usr/lib/libSPIRV.so.16.1.0

--===============5106780808018096285==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSAwODk3MjE4YWM0M2ZlNzAwZGMxZTc5NWNmYjExMjgwMzZkNmZjNGQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6MTM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuNC4zMjguMSAtPiAxLjQuMzM1LjAKCi0tLQogLi4uL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgfCA2ICsrKy0t
LQogLi4uL2dsc2xhbmcve2dsc2xhbmdfMS40LjMyOC4xLmJiID0+IGdsc2xhbmdfMS40LjMzNS4w
LmJifSAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEu
NC4zMjguMS5iYiA9PiBnbHNsYW5nXzEuNC4zMzUuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFu
Zy1wa2ctY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFu
Zy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAppbmRleCAwNGRhYjY3Nzcz
Li4xNTAyNDJjZTFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9n
bHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBr
Zy1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRmNjExMTU3MGFkYTgxZDM5Njgw
NDNkZWNiNWVlZTE2ZGM1ZjlmYTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZhNDIz
NzgwMmQ4YTc5ZjY1ZWQ3NGIxMjg2NWUyY2U1YjY2Njk5M2QgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6
IFN1biwgNyBGZWIgMjAyMSAwMTozMDozOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnZW5lcmF0
ZSBnbHNsYW5nIHBrZy1jb25maWcKQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2
NDQgZ2xzbGFuZy9nbHNsYW5nLnBjLmNtYWtlLmluCiAKIGRpZmYgLS1naXQgYS9nbHNsYW5nL0NN
YWtlTGlzdHMudHh0IGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotaW5kZXggNDc5MjVkOGQuLmQ5
MDE5MWMzIDEwMDY0NAoraW5kZXggMWJmNGMxZjIuLjlhMDVjYmFmIDEwMDY0NAogLS0tIGEvZ2xz
bGFuZy9DTWFrZUxpc3RzLnR4dAogKysrIGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotQEAgLTI1
NSw2ICsyNTUsOCBAQCBpZihHTFNMQU5HX0VOQUJMRV9JTlNUQUxMKQorQEAgLTI1Niw2ICsyNTYs
OCBAQCBpZihHTFNMQU5HX0VOQUJMRV9JTlNUQUxMKQogICAgICAgICAgaW5zdGFsbChUQVJHRVRT
IE1hY2hpbmVJbmRlcGVuZGVudCBFWFBPUlQgZ2xzbGFuZy10YXJnZXRzKQogICAgICAgICAgaW5z
dGFsbChUQVJHRVRTIEdlbmVyaWNDb2RlR2VuIEVYUE9SVCBnbHNsYW5nLXRhcmdldHMpCiAgICAg
IGVuZGlmKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xh
bmdfMS40LjMyOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18x
LjQuMzM1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzI4LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjMzNS4wLmJiCmluZGV4IDU3ZDlmZTFh
OTguLjdkM2I1ZDBiYzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmdfMS40LjMyOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmdfMS40LjMzNS4wLmJiCkBAIC04LDggKzgsOCBAQCBIT01FUEFHRSA9ICJodHRwczov
L3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVmZXJlbmNlLUNvbXBpbGVyIgog
TElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2UgJiBNSVQgJiBBcGFjaGUtMi4w
ICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9NTBmZjlkMGZjZGUyZDViOTUzZWJlNDMxYzQ4ZTM0ZTMiCiAKLVNS
Q1JFViA9ICJhNTcyNzZiZjU1OGY1Y2Y5NGQzYTk4NTRlYmRmNWEyMjM2ODQ5YTVhIgotU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nLmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9dnVsa2FuLXNkay0xLjQuMzI4O3RhZz12dWxrYW4tc2RrLSR7UFZ9IFwKK1NS
Q1JFViA9ICJiNTc4MmU1MmVlMmY3YjNlNDBiYjljODBkMTViNDcwMTZlMDA4YmM5IgorU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nLmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWFpbjt0YWc9dnVsa2FuLXNkay0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCBcCiAgICAgICAgICAgICIK
IFBFID0gIjEiCi0tIAoyLjQ3LjEKCg==

--===============5106780808018096285==--

