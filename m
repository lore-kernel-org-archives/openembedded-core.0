Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3591DC54EAA
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.36641.1709330717514306574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BtTakHBB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c17bbDuK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dfc0cd88f-e7a57aeb-41d5-4ba2-9a82-db8b8b0f62fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uT8xV35CZiHI4psTvOUtLa5Gy1QWUot6jCFesEVybfo=;
	b=BtTakHBBnGxopzGt1mvkP2HMf9xF+BJBDPDnfccFshGQDtwTN8uGs0dlldXz+8Kk
	+xb2INpRLHxuR3uSYbxu2XYiQQjJIs7LSZCK33cfJ7htdMio+IQTBtAhVmDx0mIzZ6Y
	ULLzNQvysuVnBhMC5JiZXpwVl6154uVAGxQCqUQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uT8xV35CZiHI4psTvOUtLa5Gy1QWUot6jCFesEVybfo=;
	b=c17bbDuKMlvUC2+g+aJh2VSXzu9fiG3FvfGrnxKXvMG40wg2EtMnewNi6pEaoh6K
	3Y+A/wzibZike8vS4ZTOqNy4yjFPibt+ELp0hu4bB8Y9GHUm2f701h/J6sREqkRdQP1
	xyiZ22jMMJUsQDe5pOzLj3GpDUqt6ntEn5VFzzag=
Content-Type: multipart/mixed; boundary="===============0211699702930255704=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.275.0 SUCCEEDED
Message-ID: <0101018dfc0cd88f-e7a57aeb-41d5-4ba2-9a82-db8b8b0f62fc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196515

--===============0211699702930255704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.275.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.268.0-1.3.275.0.patch
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
From adb681ce2ae9bda173326104ae56624bdb7d16b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 16:08:34 +0000
Subject: [PATCH] glslang: upgrade 1.3.268.0 -> 1.3.275.0

---
 .../glslang/0001-generate-glslang-pkg-config.patch  | 13 ++++++-------
 .../{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb}  |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index a2dcb13b36..316a57fa4a 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From e8c1b7e1dc6d108a3b49d0adfdc4f836cfafcf1a Mon Sep 17 00:00:00 2001
+From 4cede5edcff96134baf35953d58595c4aa5f1fc5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -8,7 +8,6 @@ Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-
 Upstream-Status: Pending
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  glslang/CMakeLists.txt      |  2 ++
  glslang/glslang.pc.cmake.in | 11 +++++++++++
@@ -16,21 +15,21 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 72e82b48..c6188e12 100644
+index 37eecaad..6974935c 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -223,6 +223,8 @@ if(ENABLE_GLSLANG_INSTALL)
+@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
          ")
          install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
      endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
  
-     set(ALL_HEADERS
-         ${GLSLANG_HEADERS}
+     set(PUBLIC_HEADERS
+         Public/ResourceLimits.h
 diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
 new file mode 100644
-index 00000000..948a0952
+index 00000000..43104e68
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
index 033830ba36..2fd1e72a26 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
+SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.42.0


--===============0211699702930255704==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSBhZGI2ODFjZTJhZTliZGExNzMzMjYxMDRhZTU2NjI0YmRiN2QxNmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNjowODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI2OC4wIC0+IDEuMy4yNzUuMAoKLS0tCiAuLi4vZ2xzbGFuZy8w
MDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgfCAxMyArKysrKystLS0tLS0t
CiAuLi4ve2dsc2xhbmdfMS4zLjI2OC4wLmJiID0+IGdsc2xhbmdfMS4zLjI3NS4wLmJifSAgfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI2OC4wLmJi
ID0+IGdsc2xhbmdfMS4zLjI3NS4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25m
aWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2Vu
ZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCmluZGV4IGEyZGNiMTNiMzYuLjMxNmE1N2Zh
NGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAw
MS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZThjMWI3ZTFkYzZkMTA4YTNiNDlkMGFkZmRjNGY4
MzZjZmFmY2YxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGNlZGU1ZWRjZmY5NjEz
NGJhZjM1OTUzZDU4NTk1YzRhYTVmMWZjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTogU3VuLCA3IEZl
YiAyMDIxIDAxOjMwOjM5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlIGdsc2xhbmcg
cGtnLWNvbmZpZwpAQCAtOCw3ICs4LDYgQEAgQmFzZWQgb24gaHR0cHM6Ly9zcmMuZmVkb3JhcHJv
amVjdC5vcmcvcnBtcy9nbHNsYW5nL2Jsb2IvbWFpbi9mLzAwMDEtcGtnLWNvbmZpZy0KIFVwc3Ry
ZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFy
ZXNtYS5qb3NlQGdtYWlsLmNvbT4KLQogLS0tCiAgZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dCAgICAg
IHwgIDIgKysKICBnbHNsYW5nL2dsc2xhbmcucGMuY21ha2UuaW4gfCAxMSArKysrKysrKysrKwpA
QCAtMTYsMjEgKzE1LDIxIEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21h
Lmpvc2VAZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEwMDY0NCBnbHNsYW5nL2dsc2xhbmcucGMu
Y21ha2UuaW4KIAogZGlmZiAtLWdpdCBhL2dsc2xhbmcvQ01ha2VMaXN0cy50eHQgYi9nbHNsYW5n
L0NNYWtlTGlzdHMudHh0Ci1pbmRleCA3MmU4MmI0OC4uYzYxODhlMTIgMTAwNjQ0CitpbmRleCAz
N2VlY2FhZC4uNjk3NDkzNWMgMTAwNjQ0CiAtLS0gYS9nbHNsYW5nL0NNYWtlTGlzdHMudHh0CiAr
KysgYi9nbHNsYW5nL0NNYWtlTGlzdHMudHh0Ci1AQCAtMjIzLDYgKzIyMyw4IEBAIGlmKEVOQUJM
RV9HTFNMQU5HX0lOU1RBTEwpCitAQCAtMjUxLDYgKzI1MSw4IEBAIGlmKFBST0pFQ1RfSVNfVE9Q
X0xFVkVMKQogICAgICAgICAgIikKICAgICAgICAgIGluc3RhbGwoRklMRVMgIiR7Q01BS0VfQ1VS
UkVOVF9CSU5BUllfRElSfS9nbHNsYW5nVGFyZ2V0cy5jbWFrZSIgREVTVElOQVRJT04gJHtDTUFL
RV9JTlNUQUxMX0xJQkRJUn0vY21ha2UpCiAgICAgIGVuZGlmKCkKICsgICAgY29uZmlndXJlX2Zp
bGUoJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9L2dsc2xhbmcucGMuY21ha2UuaW4gJHtDTUFL
RV9DVVJSRU5UX0JJTkFSWV9ESVJ9L3BrZ2NvbmZpZy9nbHNsYW5nLnBjIEBPTkxZKQogKyAgICBp
bnN0YWxsKEZJTEVTICR7Q01BS0VfQ1VSUkVOVF9CSU5BUllfRElSfS9wa2djb25maWcvZ2xzbGFu
Zy5wYyBERVNUSU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfS9wa2djb25maWcpCiAgCi0g
ICAgIHNldChBTExfSEVBREVSUwotICAgICAgICAgJHtHTFNMQU5HX0hFQURFUlN9CisgICAgIHNl
dChQVUJMSUNfSEVBREVSUworICAgICAgICAgUHVibGljL1Jlc291cmNlTGltaXRzLmgKIGRpZmYg
LS1naXQgYS9nbHNsYW5nL2dsc2xhbmcucGMuY21ha2UuaW4gYi9nbHNsYW5nL2dsc2xhbmcucGMu
Y21ha2UuaW4KIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAwMC4uOTQ4YTA5NTIK
K2luZGV4IDAwMDAwMDAwLi40MzEwNGU2OAogLS0tIC9kZXYvbnVsbAogKysrIGIvZ2xzbGFuZy9n
bHNsYW5nLnBjLmNtYWtlLmluCiBAQCAtMCwwICsxLDExIEBACmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNjguMC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI3NS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4z
LjI2OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5n
XzEuMy4yNzUuMC5iYgppbmRleCAwMzM4MzBiYTM2Li4yZmQxZTcyYTI2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNjguMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNzUuMC5iYgpAQCAtOCw3
ICs4LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2hyb25vcy5vcmcvb3BlbmdsZXMvc2Rr
L3Rvb2xzL1JlZmVyZW5jZS1Db21waWxlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNE
LTItQ2xhdXNlICYgTUlUICYgQXBhY2hlLTIuMCAmIEdQTC0zLXdpdGgtYmlzb24tZXhjZXB0aW9u
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTJhMmI1YWNkN2Jj
NDg0NDk2NGNmZGE0NWZlODA3ZGMzIgogCi1TUkNSRVYgPSAiMzZkMDhjMGQ5NDBjZjMwN2EyMzky
ODI5OWVmNTJjNzk3MGQ4Y2VlNiIKK1NSQ1JFViA9ICJhOTE2MzFiMjYwY2JhM2YyMjg1OGQ2YzY4
Mjc1MTFlNjM2YzI0NThhIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91
cC9nbHNsYW5nLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCBcCiAgICAgICAgICAg
ICIKLS0gCjIuNDIuMAoK

--===============0211699702930255704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 82309528 to 82472200 (+0%)
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.13.1.1 /usr/lib/.debug/libglslang-default-resource-limits.so.13.1.1 /usr/lib/.debug/libSPVRemapper.so.13.1.1 /usr/lib/.debug/libglslang.so.13.1.1 /usr/lib/.debug/libHLSL.so.13.1.1", added "/usr/lib/.debug/libSPIRV.so.14.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.0.0 /usr/lib/.debug/libSPVRemapper.so.14.0.0 /usr/lib/.debug/libglslang.so.14.0.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/MachineIndependent/localintermediate.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h /usr/include/glslang/MachineIndependent/gl_types.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/SPIRV/doc.h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/SPIRV/GLSL.ext.ARM.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/Include/InitializeGlobals.h /usr/includ
 e/glslang/HLSL/hlslTokens.h /usr/include/glslang/Include/SpirvIntrinsics.h /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/lib/libHLSL.so /usr/include/glslang/Include/BaseTypes.h /usr/include/glslang/MachineIndependent/RemoveTree.h /usr/include/glslang/MachineIndependent/LiveTraverser.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/Include/Types.h /usr/include/glslang/SPIRV/bitutils.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/Include/Common.h /usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/
 include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/HLSL/hlslScanContext.h /usr/include/glslang/SPIRV/spvIR.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/HLSL/hlslParseables.h /usr/lib/cmake/HLSLTargets.cmake /usr/include/glslang/Include/ShHandle.h"
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4880558 to 4900643 (+0%)
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.3.268.0/SPIRV -> /usr/src/debug/glslang/1.3.275.0/SPIRV, directory renamed /usr/src/debug/glslang/1.3.268.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.3.275.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.3.275.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.3.268.0/include/glslang -> /usr/src/debug/glslang/1.3.275.0/include/glslang, directory renamed /usr/src/debug/glslang/1.3.268.0/StandAlone -> /usr/src/debug/glslang/1.3.275.0/StandAlone, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.3.275.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/MachineIndependen
 t/preprocessor -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Public -> /usr/src/debug/glslang/1.3.275.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Include -> /usr/src/debug/glslang/1.3.275.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/CInterface -> /usr/src/debug/glslang/1.3.275.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/HLSL -> /usr/src/debug/glslang/1.3.275.0/glslang/HLSL, removed all items "/usr/src/debug/glslang/1.3.268.0/OGLCompilersDLL/InitializeDll.h"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 5952234 to 5958841 (+0%)
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.13 /usr/lib/libglslang.so.13 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libHLSL.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libglslang.so.13.1.1 /usr/lib/libSPVRemapper.so.13 /usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libHLSL.so.13", added "/usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libSPIRV.so.14 /usr/lib/libglslang.so.14 /usr/lib/libglslang.so.14.0.0 /usr/lib/libSPVRemapper.so.14 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.13 to libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so changed symlink target from libglslang.so.13 to libglslang.so.14
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.13 to libSPIRV.so.14
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.13 to libSPVRemapper.so.14
  /usr/lib/libglslang-default-resource-limits.so.13.1.1 moved to /usr/lib/libglslang-default-resource-limits.so.14.0.0
  /usr/lib/libglslang-default-resource-limits.so.13 moved to /usr/lib/libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so.13.1.1 moved to /usr/lib/libglslang.so.14.0.0
  /usr/lib/libglslang.so.13 moved to /usr/lib/libglslang.so.14
  /usr/lib/libSPIRV.so.13.1.1 moved to /usr/lib/libSPIRV.so.14.0.0
  /usr/lib/libSPIRV.so.13 moved to /usr/lib/libSPIRV.so.14
  /usr/lib/libSPVRemapper.so.13.1.1 moved to /usr/lib/libSPVRemapper.so.14.0.0
  /usr/lib/libSPVRemapper.so.13 moved to /usr/lib/libSPVRemapper.so.14
  /usr/include/glslang/HLSL was removed
  /usr/include/glslang/HLSL/hlslAttributes.h was removed
  /usr/include/glslang/HLSL/hlslGrammar.h was removed
  /usr/include/glslang/HLSL/hlslOpMap.h was removed
  /usr/include/glslang/HLSL/hlslParseables.h was removed
  /usr/include/glslang/HLSL/hlslParseHelper.h was removed
  /usr/include/glslang/HLSL/hlslScanContext.h was removed
  /usr/include/glslang/HLSL/hlslTokens.h was removed
  /usr/include/glslang/HLSL/hlslTokenStream.h was removed
  /usr/include/glslang/Include/arrays.h was removed
  /usr/include/glslang/Include/BaseTypes.h was removed
  /usr/include/glslang/Include/Common.h was removed
  /usr/include/glslang/Include/ConstantUnion.h was removed
  /usr/include/glslang/Include/InfoSink.h was removed
  /usr/include/glslang/Include/InitializeGlobals.h was removed
  /usr/include/glslang/Include/intermediate.h was removed
  /usr/include/glslang/Include/PoolAlloc.h was removed
  /usr/include/glslang/Include/ShHandle.h was removed
  /usr/include/glslang/Include/SpirvIntrinsics.h was removed
  /usr/include/glslang/Include/Types.h was removed
  /usr/include/glslang/MachineIndependent/attribute.h was removed
  /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h was removed
  /usr/include/glslang/MachineIndependent/gl_types.h was removed
  /usr/include/glslang/MachineIndependent/Initialize.h was removed
  /usr/include/glslang/MachineIndependent/iomapper.h was removed
  /usr/include/glslang/MachineIndependent/LiveTraverser.h was removed
  /usr/include/glslang/MachineIndependent/localintermediate.h was removed
  /usr/include/glslang/MachineIndependent/ParseHelper.h was removed
  /usr/include/glslang/MachineIndependent/parseVersions.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h was removed
  /usr/include/glslang/MachineIndependent/propagateNoContraction.h was removed
  /usr/include/glslang/MachineIndependent/reflection.h was removed
  /usr/include/glslang/MachineIndependent/RemoveTree.h was removed
  /usr/include/glslang/MachineIndependent/ScanContext.h was removed
  /usr/include/glslang/MachineIndependent/Scan.h was removed
  /usr/include/glslang/MachineIndependent/SymbolTable.h was removed
  /usr/include/glslang/SPIRV/bitutils.h was removed
  /usr/include/glslang/SPIRV/doc.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/glslang/SPIRV/GLSL.std.450.h was removed
  /usr/include/glslang/SPIRV/hex_float.h was removed
  /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h was removed
  /usr/include/glslang/SPIRV/SpvBuilder.h was removed
  /usr/include/glslang/SPIRV/spvIR.h was removed
  /usr/include/glslang/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/HLSLTargets.cmake was removed
  /usr/lib/libHLSL.so.13.1.1 was removed
  /usr/lib/libHLSL.so.13 was removed
  /usr/lib/libHLSL.so was removed

--===============0211699702930255704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/Include/Common.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h /usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/SPIRV/GLSL.ext.ARM.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/SPIRV/spvIR.h /usr/include/glslang/HLSL/hlslScanContext.h /usr/include/glslang/Include/SpirvIntrinsics.h /usr/include
 /glslang/Include/InitializeGlobals.h /usr/lib/cmake/HLSLTargets.cmake /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/Include/Types.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/HLSL/hlslParseables.h /usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/MachineIndependent/gl_types.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/MachineIndependent/localintermediate.h /usr/include/glslang/SPIRV/bitutils.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/include/glslang/SPIRV/doc.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/include/glslang/Include/BaseTypes.h /usr/incl
 ude/glslang/MachineIndependent/RemoveTree.h /usr/lib/libHLSL.so /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/HLSL/hlslTokens.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/Include/ShHandle.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/MachineIndependent/LiveTraverser.h"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libHLSL.so.13.1.1 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libSPVRemapper.so.13 /usr/lib/libSPIRV.so.13 /usr/lib/libglslang.so.13 /usr/lib/libHLSL.so.13 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libglslang.so.13.1.1", added "/usr/lib/libSPIRV.so.14 /usr/lib/libglslang.so.14 /usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libglslang.so.14.0.0 /usr/lib/libSPVRemapper.so.14"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.13 to libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so changed symlink target from libglslang.so.13 to libglslang.so.14
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.13 to libSPIRV.so.14
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.13 to libSPVRemapper.so.14
  /usr/lib/libglslang-default-resource-limits.so.13.1.1 moved to /usr/lib/libglslang-default-resource-limits.so.14.0.0
  /usr/lib/libglslang-default-resource-limits.so.13 moved to /usr/lib/libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so.13.1.1 moved to /usr/lib/libglslang.so.14.0.0
  /usr/lib/libglslang.so.13 moved to /usr/lib/libglslang.so.14
  /usr/lib/libSPIRV.so.13.1.1 moved to /usr/lib/libSPIRV.so.14.0.0
  /usr/lib/libSPIRV.so.13 moved to /usr/lib/libSPIRV.so.14
  /usr/lib/libSPVRemapper.so.13.1.1 moved to /usr/lib/libSPVRemapper.so.14.0.0
  /usr/lib/libSPVRemapper.so.13 moved to /usr/lib/libSPVRemapper.so.14
  /usr/include/glslang/HLSL was removed
  /usr/include/glslang/HLSL/hlslAttributes.h was removed
  /usr/include/glslang/HLSL/hlslGrammar.h was removed
  /usr/include/glslang/HLSL/hlslOpMap.h was removed
  /usr/include/glslang/HLSL/hlslParseables.h was removed
  /usr/include/glslang/HLSL/hlslParseHelper.h was removed
  /usr/include/glslang/HLSL/hlslScanContext.h was removed
  /usr/include/glslang/HLSL/hlslTokens.h was removed
  /usr/include/glslang/HLSL/hlslTokenStream.h was removed
  /usr/include/glslang/Include/arrays.h was removed
  /usr/include/glslang/Include/BaseTypes.h was removed
  /usr/include/glslang/Include/Common.h was removed
  /usr/include/glslang/Include/ConstantUnion.h was removed
  /usr/include/glslang/Include/InfoSink.h was removed
  /usr/include/glslang/Include/InitializeGlobals.h was removed
  /usr/include/glslang/Include/intermediate.h was removed
  /usr/include/glslang/Include/PoolAlloc.h was removed
  /usr/include/glslang/Include/ShHandle.h was removed
  /usr/include/glslang/Include/SpirvIntrinsics.h was removed
  /usr/include/glslang/Include/Types.h was removed
  /usr/include/glslang/MachineIndependent/attribute.h was removed
  /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h was removed
  /usr/include/glslang/MachineIndependent/gl_types.h was removed
  /usr/include/glslang/MachineIndependent/Initialize.h was removed
  /usr/include/glslang/MachineIndependent/iomapper.h was removed
  /usr/include/glslang/MachineIndependent/LiveTraverser.h was removed
  /usr/include/glslang/MachineIndependent/localintermediate.h was removed
  /usr/include/glslang/MachineIndependent/ParseHelper.h was removed
  /usr/include/glslang/MachineIndependent/parseVersions.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h was removed
  /usr/include/glslang/MachineIndependent/propagateNoContraction.h was removed
  /usr/include/glslang/MachineIndependent/reflection.h was removed
  /usr/include/glslang/MachineIndependent/RemoveTree.h was removed
  /usr/include/glslang/MachineIndependent/ScanContext.h was removed
  /usr/include/glslang/MachineIndependent/Scan.h was removed
  /usr/include/glslang/MachineIndependent/SymbolTable.h was removed
  /usr/include/glslang/SPIRV/bitutils.h was removed
  /usr/include/glslang/SPIRV/doc.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/glslang/SPIRV/GLSL.std.450.h was removed
  /usr/include/glslang/SPIRV/hex_float.h was removed
  /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h was removed
  /usr/include/glslang/SPIRV/SpvBuilder.h was removed
  /usr/include/glslang/SPIRV/spvIR.h was removed
  /usr/include/glslang/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/HLSLTargets.cmake was removed
  /usr/lib/libHLSL.so.13.1.1 was removed
  /usr/lib/libHLSL.so.13 was removed
  /usr/lib/libHLSL.so was removed

--===============0211699702930255704==--

