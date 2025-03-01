Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DBCC35FF8
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7164.1740828318892089703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PKRx4XRu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P0yXNEhT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195517459a8-139760fb-acf0-4eb5-b371-fd6f1a8ee221-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IYM99MfPW4+ERIxKXpbuT2wTPR6lP69rqa63raa9+mk=;
	b=PKRx4XRu/b0n08ofdjhHQah6ZTucOEtIERGYNtQqyH/2odSeFdDOoyPBFbp1Lmrm
	xEE75rcLIXcrAZB+nY1usOjOGVncv0EtghDuFUgIK1feOgD6b/TArMAFR4iyWvM325l
	hxPNpM/0t2pb533N1aN0RtCinzUG5H0k1Tp/7qPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IYM99MfPW4+ERIxKXpbuT2wTPR6lP69rqa63raa9+mk=;
	b=P0yXNEhTYvfMNlrhuzAi9Q3LwdfL+vDQq5T2FFVDGcNCSkbDb8XB2Me5RygtrWKP
	JekE4qqbHCrIANOaUmns3vQbx7c1uG/vCCN2Zdd00fQgZZA3A5nhvNNSakzpgy4l96u
	a++3sOUyCXs/odfYYgRRMCagZVGWP5NbceCv+n+8=
Content-Type: multipart/mixed; boundary="===============8777564730456698675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.1 FAILED
Message-ID: <01010195517459a8-139760fb-acf0-4eb5-b371-fd6f1a8ee221-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212156

--===============8777564730456698675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.3-2025.1.patch
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
From 04f0d0f7ad874f6942be986332fcbf62126154c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:05:52 +0000
Subject: [PATCH] shaderc: upgrade 2024.3 -> 2025.1

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 4 ++--
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb}          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..fdd722d2cf 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From 011e995b76bc422d13bf53a7f2da570cd791c06d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ffcb54b..cce715e 100644
+index bd6b890..f1ddd74 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -62,6 +62,7 @@ else()
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..06b2176abd 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 668e655faae9586898d2640855875645090d106a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index e5f5d10..5fd6d3c 100644
+index 9bf9a43..dc0efd2 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.1.bb
index 0948ba28d6..d245a7f3a0 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
+SRCREV = "7f68b1cf6f35f518febf36d425365bb8e6ad224a"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.1


--===============8777564730456698675==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.3-2025.1.patch"

RnJvbSAwNGYwZDBmN2FkODc0ZjY5NDJiZTk4NjMzMmZjYmY2MjEyNjE1NGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDowNTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNC4zIC0+IDIwMjUuMQoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCAgIHwgNCArKy0tCiAuLi4w
MDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNo
IHwgNCArKy0tCiAuLi4vc2hhZGVyYy97c2hhZGVyY18yMDI0LjMuYmIgPT4gc2hhZGVyY18yMDI1
LjEuYmJ9ICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3No
YWRlcmNfMjAyNC4zLmJiID0+IHNoYWRlcmNfMjAyNS4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1i
dWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVw
ZW5kZW5jaWVzLnBhdGNoCmluZGV4IDVjNDlhYTdmZDUuLmZkZDcyMmQyY2YgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1i
dWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFs
LWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQxZjVmNTgzMWU3YTUy
YzI2MTY4ZjgxZjI1ZDA0NzA4NjBjYTZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MDExZTk5NWI3NmJjNDIyZDEzYmY1M2E3ZjJkYTU3MGNkNzkxYzA2ZCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgog
RGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBj
bWFrZTogZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKQEAgLTE1LDcgKzE1
LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5j
b20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IGZm
Y2I1NGIuLmNjZTcxNWUgMTAwNjQ0CitpbmRleCBiZDZiODkwLi5mMWRkZDc0IDEwMDY0NAogLS0t
IGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0CiBAQCAtNjIsNiArNjIsNyBA
QCBlbHNlKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVz
LzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJj
X3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggMzlmOTgy
YjdmMy4uMDZiMjE3NmFiZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRl
cmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9j
YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGVjMjQ0Mjk0MGUxZDUzMzg5NzE4NjFiYjgxNTM3YmFlM2E2
YzE5ZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2OGU2NTVmYWFlOTU4Njg5OGQy
NjQwODU1ODc1NjQ1MDkwZDEwNmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3Nl
IFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIw
MjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXgg
Z2xzbGFuZyBoZWFkZXIgZmlsZSBsb2NhdGlvbgpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYnNo
YWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MgYi9saWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVy
LmNjCi1pbmRleCBlNWY1ZDEwLi41ZmQ2ZDNjIDEwMDY0NAoraW5kZXggOWJmOWE0My4uZGMwZWZk
MiAxMDA2NDQKIC0tLSBhL2xpYnNoYWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MKICsrKyBiL2xp
YnNoYWRlcmNfdXRpbC9zcmMvY29tcGlsZXIuY2MKIEBAIC0yMCw3ICsyMCw3IEBACmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMy5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjUuMS5iYgppbmRleCAwOTQ4YmEyOGQ2Li5kMjQ1YTdmM2EwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUuMS5iYgpAQCAtNiw3ICs2LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjIgogTElDRU5T
RSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ1JFViA9ICI3MjIzZGMzZDVl
MzRiYmNjNDRmMzE1MDU0NmRiZmE4YTVkYTU4YzRjIgorU1JDUkVWID0gIjdmNjhiMWNmNmYzNWY1
MThmZWJmMzZkNDI1MzY1YmI4ZTZhZDIyNGEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNp
ZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWds
c2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggXAotLSAKMi40NC4xCgo=

--===============8777564730456698675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1881 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf462738102c9afc74984cda720775362ef3c063"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 100 Local 88 Mirrors 0 Missed 12 Current 231 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 849 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_recipe_qa)
NOTE: recipe shaderc-2025.1-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2025.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 960 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_fetch)
NOTE: recipe shaderc-2025.1-r0: task do_fetch: Started
NOTE: recipe shaderc-2025.1-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_unpack)
NOTE: Running task 962 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2025.1-r0: task do_unpack: Started
NOTE: recipe shaderc-2025.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2025.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_unpack: Succeeded
NOTE: Running task 963 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_patch)
NOTE: Running task 964 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2025.1-r0: task do_patch: Started
NOTE: recipe shaderc-2025.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2025.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_patch: Succeeded
NOTE: Running task 965 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 966 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_generate_toolchain_file)
NOTE: Running task 967 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_populate_lic)
NOTE: recipe shaderc-2025.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2025.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2025.1-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2025.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_populate_lic: Succeeded
NOTE: recipe shaderc-2025.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 968 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_configure)
NOTE: recipe shaderc-2025.1-r0: task do_configure: Started
NOTE: recipe shaderc-2025.1-r0: task do_configure: Succeeded
NOTE: Running task 969 of 980 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile)
NOTE: recipe shaderc-2025.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -MF libshaderc_ut
 il/CMakeFiles/shaderc_util.dir/src/resources.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/resources.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/resources.cc
| [2/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/python3-native/python3 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/utils/update_build_version.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/build-version.inc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git
| [3/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=h
 idden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file.cc
| [4/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o -MF libshad
 erc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/version_profile.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/version_profile.cc
| [5/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-
 prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/shader_stage.cc
| [6/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_shared -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [7/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=h
 idden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -MF glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/shader_stage.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/shader_stage.cc
| [8/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc_static.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc_static.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc\ \ -lshaderc_util -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [9/29] cd /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build && /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/cmake -DCHANGES_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/CHANGES -DTEMPLATE_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/shaderc_combined.pc.in -DOUT_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/shaderc_combined.pc -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_INCLUDEDIR=include -DLIBS=-lshaderc_combined -P /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/cmake/write_pkg_config.cmake
| [10/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -MF libshaderc_util/C
 MakeFiles/shaderc_util.dir/src/args.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/args.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/args.cc
| [11/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/file_finder.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/file_finder.cc
| [12/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -MF libshaderc_
 util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/io_shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/io_shaderc.cc
| [13/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -MF libshaderc_uti
 l/CMakeFiles/shaderc_util.dir/src/message.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/message.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/message.cc
| [14/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -MF li
 bshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -MF libshaderc
 _util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/spirv_tools_wrapper.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc: In function 'spv_target_env shaderc_util::{anonymous}::GetSpirvToolsTargetEnv(shaderc_util::Compiler::TargetEnv, shaderc_util::Compiler::TargetEnvVersion)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/spirv_tools_wrapper.cc:44:18: error: 'SPV_ENV_VULKAN_1_4' was not declared in this scope; did you mean 'SPV_ENV_VULKAN_1_3'?
|    44 |           return SPV_ENV_VULKAN_1_4;
|       |                  ^~~~~~~~~~~~~~~~~~
|       |                  SPV_ENV_VULKAN_1_3
| [15/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -MF glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/dependency_info.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/dependency_info.cc
| [16/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -MF glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/resource_parse.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/resource_parse.cc
| [17/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_includer.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file_includer.cc
| [18/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro
 -prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF libshaderc_ut
 il/CMakeFiles/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc
| FAILED: libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DENABLE_HLSL -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-
 map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -MF libshaderc_util/CMake
 Files/shaderc_util.dir/src/compiler.cc.o.d -o libshaderc_util/CMakeFiles/shaderc_util.dir/src/compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc: In function 'shaderc_util::GlslangClientInfo shaderc_util::GetGlslangClientInfo(const std::string&, Compiler::TargetEnv, Compiler::TargetEnvVersion, Compiler::SpirvVersion, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/src/compiler.cc:762:42: error: 'EShTargetVulkan_1_4' is not a member of 'glslang'; did you mean 'EShTargetVulkan_1_3'?
|   762 |         result.client_version = glslang::EShTargetVulkan_1_4;
|       |                                          ^~~~~~~~~~~~~~~~~~~
|       |                                          EShTargetVulkan_1_3
| [19/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=
 hidden -fPIC -MD -MT glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -MF glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o.d -o glslc/CMakeFiles/glslc.dir/src/file_compiler.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/file_compiler.cc
| [20/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yoct
 o-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -f
 visibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/src/shaderc.cc
| [21/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot -DSHADERC_IMPLEMENTATION -DSHADERC_SHAREDLIB -Dshaderc_shared_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=
 /usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -pipe -fvisibility-inlines
 -hidden -Wimplicit-fallthrough -DNDEBUG -fPIC -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -MF libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o.d -o libshaderc/CMakeFiles/shaderc_shared.dir/src/shaderc.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/src/shaderc.cc
| [22/29] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build/glslc/.. -I/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc_util/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/libshaderc/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cor
 e2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git=/usr/src/debug/shaderc/2025.1  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build=/usr/src/debug/shaderc/2025.1  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/recipe-sysroot
 -native=  -pipe -fvisibility-inlines-hidden -Wimplicit-fallthrough -DNDEBUG -Wextra-semi -Wall -Werror -fvisibility=hidden -fPIC -MD -MT glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -MF glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o.d -o glslc/CMakeFiles/glslc_exe.dir/src/main.cc.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/git/glslc/src/main.cc
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390:159 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390, line 159
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390, line 153
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390, line 172
NOTE: recipe shaderc-2025.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 969 tasks of which 958 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301100536.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301100536.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/log.do_compile.540390
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shaderc-2025.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/run.do_compile.540390' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shaderc/2025.1/temp/log.do_compile.540390
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2025.1.bb:do_compile) failed with exit code '1'

--===============8777564730456698675==--

