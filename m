Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10654CD12C1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.44653.1711994602292208131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DhApmWTC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jnGJnOBe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad483b1-613dd026-b4c0-4ae0-83f5-b64c0d2ac5c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wdl9McjyVgCfNDHKz2jVmHvIMDuAqgDh0StT4asZtKY=;
	b=DhApmWTCigWSUnuJEDO5M956LzuVWdy9R4daOWBT/OxWxwB/R9tEP8Ep6sWIcySf
	eqiuwo4SITE46dtbjI3BgUCT+QP/xn9Jx3dCYQLzHGwC99W1DOiwuw5t3Wi8XlztGUM
	agHLjkO52ODUV23UE9xFuA4tFXq3rs+lci0eMsb0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wdl9McjyVgCfNDHKz2jVmHvIMDuAqgDh0StT4asZtKY=;
	b=jnGJnOBexgU0KZ9WY4GWni2cnSSHvOZC7+Kq21e/rj0MGuZXQ+rsAomuWwn/m+Eg
	cgeRCKh8cvYyy0B9VJqQlDlPF3YSe6LxLCaCDFrdCBW3GXm2YjV1VkudPAWB3OnuQrV
	W6DGb1AmOYAlG565qojutnccI1NxltfCetrnMkOI=
Content-Type: multipart/mixed; boundary="===============5608725253486155870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018e9ad483b1-613dd026-b4c0-4ae0-83f5-b64c0d2ac5c4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197773

--===============5608725253486155870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.280.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.275.0-1.3.280.0.patch
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
From 89768bd0a1e690d49d022354803dba18ba443b31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 12:49:21 +0000
Subject: [PATCH] glslang: upgrade 1.3.275.0 -> 1.3.280.0

---
 .../glslang/0001-generate-glslang-pkg-config.patch     | 10 +++++-----
 .../{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb}     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 316a57fa4a..f489e68796 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 4cede5edcff96134baf35953d58595c4aa5f1fc5 Mon Sep 17 00:00:00 2001
+From 896db1e4b7b2060653292041423325fc2e999f19 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,12 +15,12 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 37eecaad..6974935c 100644
+index e4690f09..8e660bc5 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
-         ")
-         install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+@@ -233,6 +233,8 @@ if(GLSLANG_ENABLE_INSTALL)
+         install(TARGETS MachineIndependent EXPORT glslang-targets)
+         install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
index 2fd1e72a26..637082c719 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
+SRCREV = "ee2f5d09eaf8f4e8d0d598bd2172fce290d4ca60"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.42.0


--===============5608725253486155870==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSA4OTc2OGJkMGExZTY5MGQ0OWQwMjIzNTQ4MDNkYmExOGJhNDQzYjMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMjo0OToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI3NS4wIC0+IDEuMy4yODAuMAoKLS0tCiAuLi4vZ2xzbGFuZy8w
MDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgICAgfCAxMCArKysrKy0tLS0t
CiAuLi4ve2dsc2xhbmdfMS4zLjI3NS4wLmJiID0+IGdsc2xhbmdfMS4zLjI4MC4wLmJifSAgICAg
fCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI3NS4w
LmJiID0+IGdsc2xhbmdfMS4zLjI4MC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1j
b25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCmluZGV4IDMxNmE1N2ZhNGEuLmY0ODll
Njg3OTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcv
MDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZp
Zy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGNlZGU1ZWRjZmY5NjEzNGJhZjM1OTUzZDU4
NTk1YzRhYTVmMWZjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODk2ZGIxZTRiN2Iy
MDYwNjUzMjkyMDQxNDIzMzI1ZmMyZTk5OWYxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU3VuLCA3
IEZlYiAyMDIxIDAxOjMwOjM5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlIGdsc2xh
bmcgcGtnLWNvbmZpZwpAQCAtMTUsMTIgKzE1LDEyIEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVh
cmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEwMDY0NCBnbHNs
YW5nL2dsc2xhbmcucGMuY21ha2UuaW4KIAogZGlmZiAtLWdpdCBhL2dsc2xhbmcvQ01ha2VMaXN0
cy50eHQgYi9nbHNsYW5nL0NNYWtlTGlzdHMudHh0Ci1pbmRleCAzN2VlY2FhZC4uNjk3NDkzNWMg
MTAwNjQ0CitpbmRleCBlNDY5MGYwOS4uOGU2NjBiYzUgMTAwNjQ0CiAtLS0gYS9nbHNsYW5nL0NN
YWtlTGlzdHMudHh0CiArKysgYi9nbHNsYW5nL0NNYWtlTGlzdHMudHh0Ci1AQCAtMjUxLDYgKzI1
MSw4IEBAIGlmKFBST0pFQ1RfSVNfVE9QX0xFVkVMKQotICAgICAgICAgIikKLSAgICAgICAgIGlu
c3RhbGwoRklMRVMgIiR7Q01BS0VfQ1VSUkVOVF9CSU5BUllfRElSfS9nbHNsYW5nVGFyZ2V0cy5j
bWFrZSIgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0vY21ha2UpCitAQCAtMjMz
LDYgKzIzMyw4IEBAIGlmKEdMU0xBTkdfRU5BQkxFX0lOU1RBTEwpCisgICAgICAgICBpbnN0YWxs
KFRBUkdFVFMgTWFjaGluZUluZGVwZW5kZW50IEVYUE9SVCBnbHNsYW5nLXRhcmdldHMpCisgICAg
ICAgICBpbnN0YWxsKFRBUkdFVFMgR2VuZXJpY0NvZGVHZW4gRVhQT1JUIGdsc2xhbmctdGFyZ2V0
cykKICAgICAgZW5kaWYoKQogKyAgICBjb25maWd1cmVfZmlsZSgke0NNQUtFX0NVUlJFTlRfU09V
UkNFX0RJUn0vZ2xzbGFuZy5wYy5jbWFrZS5pbiAke0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0v
cGtnY29uZmlnL2dsc2xhbmcucGMgQE9OTFkpCiArICAgIGluc3RhbGwoRklMRVMgJHtDTUFLRV9D
VVJSRU5UX0JJTkFSWV9ESVJ9L3BrZ2NvbmZpZy9nbHNsYW5nLnBjIERFU1RJTkFUSU9OICR7Q01B
S0VfSU5TVEFMTF9MSUJESVJ9L3BrZ2NvbmZpZykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI3NS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjc1LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI4
MC4wLmJiCmluZGV4IDJmZDFlNzJhMjYuLjYzNzA4MmM3MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI3NS4wLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI4MC4wLmJiCkBAIC04LDcgKzgsNyBA
QCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMv
UmVmZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1
c2UgJiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0
Y2ZkYTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICJhOTE2MzFiMjYwY2JhM2YyMjg1OGQ2YzY4Mjc1
MTFlNjM2YzI0NThhIgorU1JDUkVWID0gImVlMmY1ZDA5ZWFmOGY0ZThkMGQ1OThiZDIxNzJmY2Uy
OTBkNGNhNjAiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xh
bmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAK
Mi40Mi4wCgo=

--===============5608725253486155870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/glslang-standaloneTargets.cmake /usr/lib/cmake/SPVRemapperTargets.cmake /usr/lib/cmake/SPIRVTargets.cmake /usr/lib/cmake/spirv-remapTargets.cmake /usr/lib/cmake/glslang-default-resource-limitsTargets.cmake"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.14.0.0 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libSPVRemapper.so.14.0.0", added "/usr/lib/libglslang-default-resource-limits.so.14.1.0 /usr/lib/libSPIRV.so.14.1.0 /usr/lib/libglslang.so.14.1.0 /usr/lib/libSPVRemapper.so.14.1.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.0.0 to libglslang-default-resource-limits.so.14.1.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.0.0 to libglslang.so.14.1.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.0.0 to libSPIRV.so.14.1.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.0.0 to libSPVRemapper.so.14.1.0
  /usr/lib/libglslang-default-resource-limits.so.14.0.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.1.0
  /usr/lib/libglslang.so.14.0.0 moved to /usr/lib/libglslang.so.14.1.0
  /usr/lib/libSPIRV.so.14.0.0 moved to /usr/lib/libSPIRV.so.14.1.0
  /usr/lib/libSPVRemapper.so.14.0.0 moved to /usr/lib/libSPVRemapper.so.14.1.0
  /usr/lib/cmake/glslang-default-resource-limitsTargets.cmake was removed
  /usr/lib/cmake/glslang-standaloneTargets.cmake was removed
  /usr/lib/cmake/spirv-remapTargets.cmake was removed
  /usr/lib/cmake/SPIRVTargets.cmake was removed
  /usr/lib/cmake/SPVRemapperTargets.cmake was removed

--===============5608725253486155870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPVRemapper.so.14.0.0 /usr/lib/.debug/libglslang.so.14.0.0 /usr/lib/.debug/libSPIRV.so.14.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.0.0", added "/usr/lib/.debug/libglslang.so.14.1.0 /usr/lib/.debug/libSPVRemapper.so.14.1.0 /usr/lib/.debug/libSPIRV.so.14.1.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.1.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 82472200 to 83650464 (+1%)
packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/SPIRVTargets.cmake /usr/lib/cmake/glslang-default-resource-limitsTargets.cmake /usr/lib/cmake/spirv-remapTargets.cmake /usr/lib/cmake/SPVRemapperTargets.cmake /usr/lib/cmake/glslang-standaloneTargets.cmake"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 276224 to 276064 (-0%)
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.3.275.0/StandAlone -> /usr/src/debug/glslang/1.3.280.0/StandAlone, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.3.280.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/HLSL -> /usr/src/debug/glslang/1.3.280.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent -> /usr/src/debug/glslang/1.3.280.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/CInterface -> /usr/src/debug/glslang/1.3.280.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.3.280.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.3.275.0/include/glslang -> /usr/src/debug/glslang/1.3.280.0/include/glslang, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent/U
 nix -> /usr/src/debug/glslang/1.3.280.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.3.275.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.3.280.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.3.275.0/SPIRV -> /usr/src/debug/glslang/1.3.280.0/SPIRV, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/Public -> /usr/src/debug/glslang/1.3.280.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.3.275.0/glslang/Include -> /usr/src/debug/glslang/1.3.280.0/glslang/Include, removed "/usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/RemoveTree.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/propagateNoContraction.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/propagateNoContraction.h /usr/src/debug/glslang/1.3.275.0/glslang/Machin
 eIndependent/SymbolTable.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/linkValidate.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Versions.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Versions.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/SpirvIntrinsics.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/iomapper.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/ParseContextBase.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Intermediate.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/ShaderLang.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/parseConst.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/reflection.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/RemoveTree.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Initialize.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/ParseHe
 lper.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Initialize.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/limits.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/reflection.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/glslang_tab.cpp.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/LiveTraverser.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/parseVersions.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/IntermTraverse.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/ParseHelper.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/PoolAlloc.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/localintermediate.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/ScanContext.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Scan.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/attribute.cpp /usr/src/debug/
 glslang/1.3.275.0/glslang/MachineIndependent/iomapper.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/InfoSink.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/SymbolTable.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Constant.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/intermOut.cpp /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/attribute.h /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/Scan.h", added "/usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/RemoveTree.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/propagateNoContraction.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/propagateNoContraction.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/SymbolTable.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Scan.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/linkValidate.cpp /usr/src/debug/glslang/1.3.280
 .0/glslang/MachineIndependent/Versions.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Versions.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/SpirvIntrinsics.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/iomapper.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/ParseContextBase.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Intermediate.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/ShaderLang.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/parseConst.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/reflection.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/RemoveTree.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Initialize.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/ParseHelper.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Initialize.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineInde
 pendent/limits.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/reflection.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/glslang_tab.cpp.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/LiveTraverser.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/parseVersions.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/IntermTraverse.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/ParseHelper.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/PoolAlloc.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/localintermediate.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/ScanContext.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Scan.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/attribute.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/iomapper.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/InfoSink.cpp /usr/
 src/debug/glslang/1.3.280.0/glslang/MachineIndependent/SymbolTable.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/Constant.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/intermOut.cpp /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/attribute.h /usr/src/debug/glslang/1.3.280.0/glslang/MachineIndependent/span.h"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4900643 to 4931318 (+1%)
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.14.0.0 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14.0.0", added "/usr/lib/libSPIRV.so.14.1.0 /usr/lib/libSPVRemapper.so.14.1.0 /usr/lib/libglslang-default-resource-limits.so.14.1.0 /usr/lib/libglslang.so.14.1.0"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 5958841 to 5984409 (+0%)
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/glslang: PV changed from "1.3.275.0" to "1.3.280.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.0.0 to libglslang-default-resource-limits.so.14.1.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.0.0 to libglslang.so.14.1.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.0.0 to libSPIRV.so.14.1.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.0.0 to libSPVRemapper.so.14.1.0
  /usr/lib/libglslang-default-resource-limits.so.14.0.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.1.0
  /usr/lib/libglslang.so.14.0.0 moved to /usr/lib/libglslang.so.14.1.0
  /usr/lib/libSPIRV.so.14.0.0 moved to /usr/lib/libSPIRV.so.14.1.0
  /usr/lib/libSPVRemapper.so.14.0.0 moved to /usr/lib/libSPVRemapper.so.14.1.0
  /usr/lib/cmake/glslang-default-resource-limitsTargets.cmake was removed
  /usr/lib/cmake/glslang-standaloneTargets.cmake was removed
  /usr/lib/cmake/spirv-remapTargets.cmake was removed
  /usr/lib/cmake/SPIRVTargets.cmake was removed
  /usr/lib/cmake/SPVRemapperTargets.cmake was removed

--===============5608725253486155870==--

