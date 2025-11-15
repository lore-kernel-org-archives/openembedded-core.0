Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46712CEE320
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11959.1763224746123669911
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1HC/zJCJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m8nV8Dkx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88627994-72e63bb6-d22f-4603-b44d-d494da808da8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/pryRPjOUCGNVMvXfaoH+/HTQbcYPWYvPOnJ9gWY5F8=;
	b=1HC/zJCJRnCWhPah8A+bg5fypxU4LmFN7tBQ7RK1jl0Sae2F+7ldty5pLgi5sJ+3
	t8gyxf8awBZ2OwX3brsG/YRug/ffQwkY6PZ+X2c6GIsM3ZRvbyyTf26DbeJzdHsyw8b
	ohzsDluGWSoSQT3oXRUyI0yRTeBhKDUUK8SkPuz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/pryRPjOUCGNVMvXfaoH+/HTQbcYPWYvPOnJ9gWY5F8=;
	b=m8nV8DkxyOkBNCy/2KkO7H2qrMyDCZ2Gpof7VRwnZwwRLQOFbsgLUihZPFe7Jge/
	hYBaPMJ2Y8PXpUudG5IDnVABNGiMPjJjUlB9Rqloeuy73UOtVGc7//8QMwibenPYViw
	eHEUKJwu1Xtz2ORJ/Cns8VcNv03RqrzePYnAyDJo=
Content-Type: multipart/mixed; boundary="===============0962555101051604628=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.4 SUCCEEDED
Message-ID: <0101019a88627994-72e63bb6-d22f-4603-b44d-d494da808da8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226422

--===============0962555101051604628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2025.3-2025.4.patch
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
From 24ba7da85e1823739867588f36b88f2da37887bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 14:30:11 +0000
Subject: [PATCH] shaderc: upgrade 2025.3 -> 2025.4

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 2 +-
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2025.3.bb => shaderc_2025.4.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.3.bb => shaderc_2025.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 77b81635b6..f002de60ce 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 3db09ee0d0bf6390eb3dcd835bd4ef786188bf16 Mon Sep 17 00:00:00 2001
+From 2d7eb6054c903770f7e8d051f3f7fc7a68f9f072 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..8f07ec0a19 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From 723e21dab013fa19f881a19db32efa84987aeaed Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index 9bf9a43..dc0efd2 100644
+index f2ed3c7..59b262a 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.4.bb
index 692e85e56c..8312831b88 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "eb0bc20d0c31320fe834e4ee8eb02807292b9703"
+SRCREV = "17c1832c132ccfb11a3050945389f64dd485e327"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============0962555101051604628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.3 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.4 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5064272 to 5067208 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 64025 to 64272 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 326761 to 327800 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3769298 to 3771386 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2025.3" to "2025.4"

--===============0962555101051604628==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.3-2025.4.patch"

RnJvbSAyNGJhN2RhODVlMTgyMzczOTg2NzU4OGYzNmI4OGYyZGEzNzg4N2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTQ6MzA6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjUuMyAtPiAyMDI1LjQKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICB8IDIgKy0KIC4uLjAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gg
fCA0ICsrLS0KIC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjUuMy5iYiA9PiBzaGFkZXJjXzIwMjUu
NC5iYn0gICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hh
ZGVyY18yMDI1LjMuYmIgPT4gc2hhZGVyY18yMDI1LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBl
bmRlbmNpZXMucGF0Y2gKaW5kZXggNzdiODE2MzViNi4uZjAwMmRlNjBjZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZGIwOWVlMGQwYmY2Mzkw
ZWIzZGNkODM1YmQ0ZWY3ODYxODhiZjE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
ZDdlYjYwNTRjOTAzNzcwZjdlOGQwNTFmM2Y3ZmM3YTY4ZjlmMDcyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFk
ZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCA0MjliNTNjMzA4Li44ZjA3ZWMwYTE5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRl
cmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgt
Z2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NDc5NzY0MmE2Mzk0YWQ3ZTVhMjNhYWEzYmRmOGUyZDAxMWY2OWFkZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNzIzZTIxZGFiMDEzZmExOWY4ODFhMTlkYjMyZWZhODQ5ODdhZWFlZCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpv
c2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBsaWJzaGFkZXJjX3V0aWw6IGZpeCBnbHNsYW5nIGhlYWRlciBmaWxlIGxv
Y2F0aW9uCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPHF1
YXJlc21hLmpvc2VAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGlic2hhZGVyY191dGlsL3NyYy9jb21waWxl
ci5jYyBiL2xpYnNoYWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MKLWluZGV4IDliZjlhNDMuLmRj
MGVmZDIgMTAwNjQ0CitpbmRleCBmMmVkM2M3Li41OWIyNjJhIDEwMDY0NAogLS0tIGEvbGlic2hh
ZGVyY191dGlsL3NyYy9jb21waWxlci5jYwogKysrIGIvbGlic2hhZGVyY191dGlsL3NyYy9jb21w
aWxlci5jYwogQEAgLTIwLDcgKzIwLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3No
YWRlcmMvc2hhZGVyY18yMDI1LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS40LmJiCmluZGV4IDY5
MmU4NWU1NmMuLjgzMTI4MzFiODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9z
aGFkZXJjL3NoYWRlcmNfMjAyNS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL3NoYWRlcmNfMjAyNS40LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gImViMGJjMjBkMGMzMTMyMGZlODM0ZTRlZThlYjAyODA3
MjkyYjk3MDMiCitTUkNSRVYgPSAiMTdjMTgzMmMxMzJjY2ZiMTFhMzA1MDk0NTM4OWY2NGRkNDg1
ZTMyNyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRl
ci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============0962555101051604628==--

