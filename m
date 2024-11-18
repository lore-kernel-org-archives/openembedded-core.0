Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0C8D6204D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4856.1731964660621852309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A7GOxCPL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mRewmMu5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019341236991-f38ba2e6-c96e-41a0-81f1-b35fe21e90e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964660;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/LMumSt+urtcuRBNk/SnD5Gbg26su818QHXROJ+AI6k=;
	b=A7GOxCPLimw9Ig6hG6CJ782v1JANPAKy56adFPzQ9tMwjpjOl6isAxsQRp4eaZ8P
	BApdNQZQ7RrbjH8/FoQM5g9JVEzr8+hYmWoCeVh7wXHQl8NqPS8TB0P2qdQ1gJpE5dy
	G7zKcT+G7FiyDzID2WSojfASYH+hFj3tY+VnkP9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964660;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/LMumSt+urtcuRBNk/SnD5Gbg26su818QHXROJ+AI6k=;
	b=mRewmMu5yRKTdB5efHIFaxu3jlkU6dU7us624pRgCciDJQdiyFvzRcQ/j2nD5nPc
	+dW44pWbUZZk4XF7cdMuHfTeqNehrz7dbqKacQjDYPTE3xcRDtNAEt/oivAJMwrz7fJ
	7dR72/rDA9aFQtYRaSIMtyblG7u8QpSGDSFUuxXo=
Content-Type: multipart/mixed; boundary="===============7785026505009586693=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.296.0 SUCCEEDED
Message-ID: <0101019341236991-f38ba2e6-c96e-41a0-81f1-b35fe21e90e8-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207323

--===============7785026505009586693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.3.296.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.290.0-1.3.296.0.patch
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
From 6c9c9f1883d97b90057875f15924de29133dee68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 18:47:35 +0000
Subject: [PATCH] glslang: upgrade 1.3.290.0 -> 1.3.296.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index f8c0fc64c8..a8b4728c59 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 0311dfd63ea41abb45aaf0f4ccc674f574ce639e Mon Sep 17 00:00:00 2001
+From c7b08172a56a9f8bcd64a1515a8fa9f82bbc4833 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 8d4b1e9c..717c6d47 100644
+index 47925d8d..d90191c3 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -235,6 +235,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
index d6ee46de1e..3b66e3544c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "fa9c3deb49e035a8abcabe366f26aac010f6cbfb"
+SRCREV = "46ef757e048e760b46601e6e77ae0cb72c97bd2f"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.44.1


--===============7785026505009586693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 88761304 to 52195776 (-41%)
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: added "/usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/Include/visibility.h"
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 6537369 to 3616489 (-45%)
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.14 /usr/lib/libSPIRV.so.14.3.0 /usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libglslang-default-resource-limits.so.14.3.0 /usr/lib/libglslang.so.14.3.0 /usr/lib/libglslang.so.14 /usr/lib/libSPVRemapper.so.14.3.0 /usr/lib/libSPIRV.so.14", added "/usr/lib/libSPVRemapper.so.15 /usr/lib/libglslang.so.15.0.0 /usr/lib/libSPIRV.so.15.0.0 /usr/lib/libglslang-default-resource-limits.so.15 /usr/lib/libglslang.so.15 /usr/lib/libSPVRemapper.so.15.0.0 /usr/lib/libglslang-default-resource-limits.so.15.0.0 /usr/lib/libSPIRV.so.15"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.14 to libglslang-default-resource-limits.so.15
  /usr/lib/libglslang.so changed symlink target from libglslang.so.14 to libglslang.so.15
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.14 to libSPIRV.so.15
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.14 to libSPVRemapper.so.15
  /usr/lib/libglslang-default-resource-limits.so.14.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.15.0.0
  /usr/lib/libglslang-default-resource-limits.so.14 moved to /usr/lib/libglslang-default-resource-limits.so.15
  /usr/lib/libglslang.so.14.3.0 moved to /usr/lib/libglslang.so.15.0.0
  /usr/lib/libglslang.so.14 moved to /usr/lib/libglslang.so.15
  /usr/lib/libSPIRV.so.14.3.0 moved to /usr/lib/libSPIRV.so.15.0.0
  /usr/lib/libSPIRV.so.14 moved to /usr/lib/libSPIRV.so.15
  /usr/lib/libSPVRemapper.so.14.3.0 moved to /usr/lib/libSPVRemapper.so.15.0.0
  /usr/lib/libSPVRemapper.so.14 moved to /usr/lib/libSPVRemapper.so.15
  /usr/include/glslang/Include/visibility.h was added
  /usr/include/glslang/SPIRV/SpvTools.h was added

--===============7785026505009586693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 88761304 to 52195776 (-41%)
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPVRemapper.so.14.3.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.3.0 /usr/lib/.debug/libglslang.so.14.3.0 /usr/lib/.debug/libSPIRV.so.14.3.0", added "/usr/lib/.debug/libglslang.so.15.0.0 /usr/lib/.debug/libSPVRemapper.so.15.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.15.0.0 /usr/lib/.debug/libSPIRV.so.15.0.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 277788 to 288513 (+4%)
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: added "/usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/Include/visibility.h"
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4961305 to 4957073 (-0%)
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 6537369 to 3616489 (-45%)
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libglslang-default-resource-limits.so.14.3.0 /usr/lib/libSPIRV.so.14.3.0 /usr/lib/libSPVRemapper.so.14 /usr/lib/libSPIRV.so.14 /usr/lib/libSPVRemapper.so.14.3.0 /usr/lib/libglslang.so.14.3.0 /usr/lib/libglslang.so.14", added "/usr/lib/libglslang-default-resource-limits.so.15 /usr/lib/libSPIRV.so.15.0.0 /usr/lib/libglslang.so.15.0.0 /usr/lib/libSPVRemapper.so.15 /usr/lib/libSPIRV.so.15 /usr/lib/libglslang-default-resource-limits.so.15.0.0 /usr/lib/libSPVRemapper.so.15.0.0 /usr/lib/libglslang.so.15"
packages/core2-64-poky-linux/glslang: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.14 to libglslang-default-resource-limits.so.15
  /usr/lib/libglslang.so changed symlink target from libglslang.so.14 to libglslang.so.15
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.14 to libSPIRV.so.15
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.14 to libSPVRemapper.so.15
  /usr/lib/libglslang-default-resource-limits.so.14.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.15.0.0
  /usr/lib/libglslang-default-resource-limits.so.14 moved to /usr/lib/libglslang-default-resource-limits.so.15
  /usr/lib/libglslang.so.14.3.0 moved to /usr/lib/libglslang.so.15.0.0
  /usr/lib/libglslang.so.14 moved to /usr/lib/libglslang.so.15
  /usr/lib/libSPIRV.so.14.3.0 moved to /usr/lib/libSPIRV.so.15.0.0
  /usr/lib/libSPIRV.so.14 moved to /usr/lib/libSPIRV.so.15
  /usr/lib/libSPVRemapper.so.14.3.0 moved to /usr/lib/libSPVRemapper.so.15.0.0
  /usr/lib/libSPVRemapper.so.14 moved to /usr/lib/libSPVRemapper.so.15
  /usr/include/glslang/Include/visibility.h was added
  /usr/include/glslang/SPIRV/SpvTools.h was added

--===============7785026505009586693==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA2YzljOWYxODgzZDk3YjkwMDU3ODc1ZjE1OTI0ZGUyOTEzM2RlZTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMTg6NDc6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yOTAuMCAtPiAxLjMuMjk2LjAKCi0tLQogLi4uL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgfCA2ICsrKy0t
LQogLi4uL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI5MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI5Ni4w
LmJifSAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMu
MjkwLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjk2LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmct
cGtnLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcv
MDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKaW5kZXggZjhjMGZjNjRjOC4u
YThiNDcyOGM1OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xz
bGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ct
Y29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzExZGZkNjNlYTQxYWJiNDVhYWYw
ZjRjY2M2NzRmNTc0Y2U2MzllIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjN2IwODE3
MmE1NmE5ZjhiY2Q2NGExNTE1YThmYTlmODJiYmM0ODMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBT
dW4sIDcgRmViIDIwMjEgMDE6MzA6MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUg
Z2xzbGFuZyBwa2ctY29uZmlnCkBAIC0xNSwxMCArMTUsMTAgQEAgU2lnbmVkLW9mZi1ieTogSm9z
ZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGdsc2xhbmcvZ2xzbGFuZy5wYy5jbWFrZS5pbgogCiBkaWZmIC0tZ2l0IGEvZ2xzbGFuZy9DTWFr
ZUxpc3RzLnR4dCBiL2dsc2xhbmcvQ01ha2VMaXN0cy50eHQKLWluZGV4IDhkNGIxZTljLi43MTdj
NmQ0NyAxMDA2NDQKK2luZGV4IDQ3OTI1ZDhkLi5kOTAxOTFjMyAxMDA2NDQKIC0tLSBhL2dsc2xh
bmcvQ01ha2VMaXN0cy50eHQKICsrKyBiL2dsc2xhbmcvQ01ha2VMaXN0cy50eHQKLUBAIC0yMzUs
NiArMjM1LDggQEAgaWYoR0xTTEFOR19FTkFCTEVfSU5TVEFMTCkKK0BAIC0yNTUsNiArMjU1LDgg
QEAgaWYoR0xTTEFOR19FTkFCTEVfSU5TVEFMTCkKICAgICAgICAgIGluc3RhbGwoVEFSR0VUUyBN
YWNoaW5lSW5kZXBlbmRlbnQgRVhQT1JUIGdsc2xhbmctdGFyZ2V0cykKICAgICAgICAgIGluc3Rh
bGwoVEFSR0VUUyBHZW5lcmljQ29kZUdlbiBFWFBPUlQgZ2xzbGFuZy10YXJnZXRzKQogICAgICBl
bmRpZigpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5n
XzEuMy4yOTAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4z
LjI5Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI5MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yOTYuMC5iYgppbmRleCBkNmVlNDZkZTFl
Li4zYjY2ZTM1NDRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9n
bHNsYW5nXzEuMy4yOTAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9n
bHNsYW5nXzEuMy4yOTYuMC5iYgpAQCAtOCw3ICs4LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93
d3cua2hyb25vcy5vcmcvb3BlbmdsZXMvc2RrL3Rvb2xzL1JlZmVyZW5jZS1Db21waWxlciIKIExJ
Q0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNELTItQ2xhdXNlICYgTUlUICYgQXBhY2hlLTIuMCAm
IEdQTC0zLXdpdGgtYmlzb24tZXhjZXB0aW9uIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS50eHQ7bWQ1PTJhMmI1YWNkN2JjNDg0NDk2NGNmZGE0NWZlODA3ZGMzIgogCi1TUkNS
RVYgPSAiZmE5YzNkZWI0OWUwMzVhOGFiY2FiZTM2NmYyNmFhYzAxMGY2Y2JmYiIKK1NSQ1JFViA9
ICI0NmVmNzU3ZTA0OGU3NjBiNDY2MDFlNmU3N2FlMGNiNzJjOTdiZDJmIgogU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtn
LWNvbmZpZy5wYXRjaCBcCiAgICAgICAgICAgICIKLS0gCjIuNDQuMQoK

--===============7785026505009586693==--

