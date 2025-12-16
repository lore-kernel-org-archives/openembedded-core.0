Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8EFD5E144
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17387.1765872133847192755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DddPxzdx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TjOG4bAs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ec974-513f769b-b2d2-4240-ac83-fa69dd62bbd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GjZfy/qCWekC63taf04O+jM6AOmUWzyae7ON7kaFNuU=;
	b=DddPxzdxsSTeAtGXzU9Jdtj50eMdj+eLujkf9TQLJw26hPLCT5BGTNPpub3Gocav
	14gCz7WrUS0GKb65j76cUI4n9q1wHO+IrQELVxpUzIhZzNJaEG5YRZb+UrZy98TEb5v
	OMxGFcKNcdsByfDFyQ8tTbjAUKrGJJMnJ4wb38co=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GjZfy/qCWekC63taf04O+jM6AOmUWzyae7ON7kaFNuU=;
	b=TjOG4bAsKkHQoAn7SszrXqQTZKzMzt4q5R5r59J00mH0CYbpdYYYWSzjOoUC2fnO
	mc0YtaqtFyAyiaWibc9mdEPGajI3cymM8RC50gdIHe/h2dgYaXLX0UrSgK0uxNxUEhF
	6ocTsTFnmiFTkv+8p0c41kbM7Y9oUffL10/yh+7E=
Content-Type: multipart/mixed; boundary="===============7549157595123449770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.5 SUCCEEDED
Message-ID: <0101019b262ec974-513f769b-b2d2-4240-ac83-fa69dd62bbd2-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227867

--===============7549157595123449770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2025.3-2025.5.patch
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
From ba2053b49041452cd79bae3825145594900069ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:38:48 +0000
Subject: [PATCH] shaderc: upgrade 2025.3 -> 2025.5

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 2 +-
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2025.3.bb => shaderc_2025.5.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.3.bb => shaderc_2025.5.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 77b81635b6..cb8bbdd28f 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 3db09ee0d0bf6390eb3dcd835bd4ef786188bf16 Mon Sep 17 00:00:00 2001
+From 29f9099f15755ca8a201a4a02dc1370e21ec936a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..3f030e5c8b 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From 7831df8bb68a8992a07ecc359550879e629e8c79 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.5.bb
index 692e85e56c..9ae5defa5f 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "eb0bc20d0c31320fe834e4ee8eb02807292b9703"
+SRCREV = "bca2fa0bf0242340440d54f8d8e05c5dd2fafcea"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============7549157595123449770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.3-2025.5.patch"

RnJvbSBiYTIwNTNiNDkwNDE0NTJjZDc5YmFlMzgyNTE0NTU5NDkwMDA2OWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6Mzg6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjUuMyAtPiAyMDI1LjUKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICB8IDIgKy0KIC4uLjAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gg
fCA0ICsrLS0KIC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjUuMy5iYiA9PiBzaGFkZXJjXzIwMjUu
NS5iYn0gICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hh
ZGVyY18yMDI1LjMuYmIgPT4gc2hhZGVyY18yMDI1LjUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBl
bmRlbmNpZXMucGF0Y2gKaW5kZXggNzdiODE2MzViNi4uY2I4YmJkZDI4ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1
aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZGIwOWVlMGQwYmY2Mzkw
ZWIzZGNkODM1YmQ0ZWY3ODYxODhiZjE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAy
OWY5MDk5ZjE1NzU1Y2E4YTIwMWE0YTAyZGMxMzcwZTIxZWM5MzZhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFk
ZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCA0MjliNTNjMzA4Li4zZjAzMGU1YzhiIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRl
cmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgt
Z2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NDc5NzY0MmE2Mzk0YWQ3ZTVhMjNhYWEzYmRmOGUyZDAxMWY2OWFkZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNzgzMWRmOGJiNjhhODk5MmEwN2VjYzM1OTU1MDg3OWU2MjllOGM3OSBN
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
YWRlcmMvc2hhZGVyY18yMDI1LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS41LmJiCmluZGV4IDY5
MmU4NWU1NmMuLjlhZTVkZWZhNWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9z
aGFkZXJjL3NoYWRlcmNfMjAyNS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL3NoYWRlcmNfMjAyNS41LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gImViMGJjMjBkMGMzMTMyMGZlODM0ZTRlZThlYjAyODA3
MjkyYjk3MDMiCitTUkNSRVYgPSAiYmNhMmZhMGJmMDI0MjM0MDQ0MGQ1NGY4ZDhlMDVjNWRkMmZh
ZmNlYSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRl
ci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============7549157595123449770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.3 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.5 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5064400 to 5067328 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 64025 to 64272 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: FILELIST: directory renamed /usr/src/debug/shaderc/2025.3/glslc/src -> /usr/src/debug/shaderc/2025.5/glslc/src, directory renamed /usr/src/debug/shaderc/2025.3/libshaderc_util/include/libshaderc_util -> /usr/src/debug/shaderc/2025.5/libshaderc_util/include/libshaderc_util, directory renamed /usr/src/debug/shaderc/2025.3/libshaderc/src -> /usr/src/debug/shaderc/2025.5/libshaderc/src, directory renamed /usr/src/debug/shaderc/2025.3/libshaderc/include/shaderc -> /usr/src/debug/shaderc/2025.5/libshaderc/include/shaderc, directory renamed /usr/src/debug/shaderc/2025.3/libshaderc_util/src -> /usr/src/debug/shaderc/2025.5/libshaderc_util/src
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 326761 to 327800 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.3 [default] to 2025.5 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3769298 to 3771378 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2025.3" to "2025.5"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2025.3 [default] to 2025.5 [default]

--===============7549157595123449770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-55ee147ec62977df9c10551a299a50c6354bc3a8"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:55ee147ec62977df9c10551a299a50c6354bc3a8"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 128 Local 113 Mirrors 0 Missed 15 Current 201 (88% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 270 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 274 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 276 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 277 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: Running task 796 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_fetch)
NOTE: Running setscene task 278 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 280 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 798 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 281 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2025.5-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_fetch: Succeeded
NOTE: Running task 806 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe shaderc-2025.5-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 311 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2025.5-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 816 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 817 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_generate_toolchain_file)
NOTE: Running task 818 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_populate_lic)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_patch)
NOTE: recipe shaderc-2025.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2025.5-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2025.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe shaderc-2025.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_populate_lic unihash changed to 6bf096abf301708b8986c5ad9e9507ec6876ace2e6d7b8f78721b09be1eb6bc7
NOTE: recipe shaderc-2025.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_deploy_source_date_epoch unihash changed to 0988c8bb9ff8017d097c006a3ea0a1fbd402472f9e40152d07a7b3a1c79eec90
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 320 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 327 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 839 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 938 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 947 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_collect_spdx_deps)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 948 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_configure)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_configure: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_configure: Succeeded
NOTE: Running task 949 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_compile)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_compile: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_compile: Succeeded
NOTE: Running task 950 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_install)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_install: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_install: Succeeded
NOTE: Running task 951 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_package)
NOTE: Running task 952 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_package: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_populate_sysroot unihash changed to e78382e3982ddc8e8644ce71b63c5b41e5a1e7f610442461b0bf3e4ab93a86a2
NOTE: Setscene tasks completed
NOTE: Running task 953 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2025.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2025.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 954 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_configure)
NOTE: recipe shaderc-2025.5-r0: task do_configure: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_package unihash changed to 5b616da460a32e7411707b99444dc2fd625a8167f2d79c70d103da764534c297
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_packagedata became valid
NOTE: Running setscene task 329 of 329 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2025.5-r0: task do_configure: Succeeded
NOTE: recipe glslang-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 955 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_compile)
NOTE: recipe shaderc-2025.5-r0: task do_compile: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glslang/1.4.328.1/temp/log.do_packagedata_setscene.2552392
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 956 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_packagedata)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_packagedata: Succeeded
NOTE: Running task 957 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb:do_create_spdx)
NOTE: recipe glslang-1_1.4.328.1-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.4.328.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 958 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2025.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2025.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_compile: Succeeded
NOTE: Running task 959 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_install)
NOTE: recipe shaderc-2025.5-r0: task do_install: Started
NOTE: recipe shaderc-2025.5-r0: task do_install: Succeeded
NOTE: Running task 960 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_package)
NOTE: Running task 961 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_populate_sysroot)
NOTE: recipe shaderc-2025.5-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2025.5-r0: task do_package: Started
NOTE: recipe shaderc-2025.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_populate_sysroot unihash changed to 8feda6130bae6b6764570a4d26063df6c976e146ae921c6f8f442d3bf8f00b7b
NOTE: Setscene tasks completed
NOTE: recipe shaderc-2025.5-r0: task do_package: Succeeded
NOTE: Running task 962 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_packagedata)
NOTE: recipe shaderc-2025.5-r0: task do_packagedata: Started
NOTE: recipe shaderc-2025.5-r0: task do_packagedata: Succeeded
NOTE: Running task 963 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_create_spdx)
NOTE: Running task 964 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_package_write_ipk)
NOTE: Running task 965 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_package_write_deb)
NOTE: Running task 966 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_package_write_rpm)
NOTE: Running task 967 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_package_qa)
NOTE: recipe shaderc-2025.5-r0: task do_create_spdx: Started
NOTE: recipe shaderc-2025.5-r0: task do_package_write_ipk: Started
NOTE: recipe shaderc-2025.5-r0: task do_package_write_deb: Started
NOTE: recipe shaderc-2025.5-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2025.5-r0: task do_package_qa: Started
NOTE: recipe shaderc-2025.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 968 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_create_package_spdx)
NOTE: recipe shaderc-2025.5-r0: task do_create_package_spdx: Started
NOTE: recipe shaderc-2025.5-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shaderc-2025.5-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 969 of 969 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.5.bb:do_build)
NOTE: Tasks Summary: Attempted 969 tasks of which 935 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: glslang-1_1.4.328.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7549157595123449770==--

