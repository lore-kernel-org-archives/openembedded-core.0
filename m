Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4C7C369D7
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18063.1743511388576499051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P4hyEkYo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BtQGvw43;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010195f160cfa7-6d8bb6ef-66bf-4a33-9383-19f36cd57a0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Q/fh2P5Sc8c5muTSvUV8caUAG/zwcHrYt5Ov/x5jMo=;
	b=P4hyEkYo3pWcF0N5fRHqMH0a05gvZReovK2LjA8tgU9g62gKbMB7fVsyyxBaT/RZ
	jqW/6jVTXS3xNekUnVt+vKZzhtmYZtovsBxJ5QIZjYWl0quzlrTx4y5k5kXhUDcuMs3
	jNyt1CpDJk28cfNV2AM06/zRRo6iNL1qyZOPvybc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Q/fh2P5Sc8c5muTSvUV8caUAG/zwcHrYt5Ov/x5jMo=;
	b=BtQGvw43HiX2XDswE+l8lmo1hq/D4k/xftypv3IHqStAJZoGfObS5fXe5OLT32tI
	VdUWtijb/o7QjZL+NwUPBIMco1KyegHQ6l7j5uJZFD1FkJx3bof7NvAxXsi2AJHojXu
	bn+EUuTJGJCOlqTtloQ7Nh+ZKxlaHJI9Ld9nxNhU=
Content-Type: multipart/mixed; boundary="===============6903397449267763050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.1 SUCCEEDED
Message-ID: <01010195f160cfa7-6d8bb6ef-66bf-4a33-9383-19f36cd57a0c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214103

--===============6903397449267763050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.1* has Succeeded.

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
From f26f2dc4b7b3d57fa66629f66aff381953001ad7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:33:35 +0000
Subject: [PATCH] shaderc: upgrade 2024.3 -> 2025.1

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 4 ++--
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb}          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..07765653bb 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From ed0e2fad08a3cd3f0a0c70922737d8a6886f484d Mon Sep 17 00:00:00 2001
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
index 39f982b7f3..429b53c308 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
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
2.47.1


--===============6903397449267763050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5080960 to 5084128 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 63964 to 64025 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 325804 to 326761 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3777606 to 3779350 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2024.3" to "2025.1"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2024.3 [default] to 2025.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PKGSIZE changed from 296096 to 300192 (+1%)

--===============6903397449267763050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.3-2025.1.patch"

RnJvbSBmMjZmMmRjNGI3YjNkNTdmYTY2NjI5ZjY2YWZmMzgxOTUzMDAxYWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTozMzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
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
ZW5kZW5jaWVzLnBhdGNoCmluZGV4IDVjNDlhYTdmZDUuLjA3NzY1NjUzYmIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1i
dWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFs
LWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQxZjVmNTgzMWU3YTUy
YzI2MTY4ZjgxZjI1ZDA0NzA4NjBjYTZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZWQwZTJmYWQwOGEzY2QzZjBhMGM3MDkyMjczN2Q4YTY4ODZmNDg0ZCBNb24gU2VwIDE3IDAwOjAw
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
YjdmMy4uNDI5YjUzYzMwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRl
cmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9j
YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAw
Mi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGVjMjQ0Mjk0MGUxZDUzMzg5NzE4NjFiYjgxNTM3YmFlM2E2
YzE5ZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ3OTc2NDJhNjM5NGFkN2U1YTIz
YWFhM2JkZjhlMmQwMTFmNjlhZGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3Nl
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
c2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============6903397449267763050==--

