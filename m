Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF61CC54799
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1801.1746113610926977850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WA395/Wf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=a6eWKlvh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b9d1b-626ad0df-453b-445c-8890-1a4b5396aca2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aRRYjyRIH8l9NuszYvWlZnivWnTLf8UEtdRY3qT9s5k=;
	b=WA395/Wf5yqy4st9V+4/X5vsG1DZzAGyt+pxtYTo9mDZF1Mk8ZuvoD0LnN+jBSxh
	9lCPM03bvD8Q7uCbrdVrtPJPES52ugTFhKzE6Z4tboazbGpYRg1ot0+XaQaxoVtwvvs
	lrN60/7sU/t1ir1TiDud99LmfyzEBXRZzC69+3a8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aRRYjyRIH8l9NuszYvWlZnivWnTLf8UEtdRY3qT9s5k=;
	b=a6eWKlvhf2S3p7P5hcdEobPakvExqUwPw4Qnphh7SQIgAFiv4qAHdG7Pn4s9YR+I
	LelEP7uAzuTSOD9ahJHeM1ApN4hpsWDujlmXGr046GegU+gUEYUeF4VAp7cfaXgYNEk
	FYk/W6kqwdVFae037qEQNN8Ttk5DJntpNFJVghVs=
Content-Type: multipart/mixed; boundary="===============1790399824023102317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.2 SUCCEEDED
Message-ID: <010101968c7b9d1b-626ad0df-453b-445c-8890-1a4b5396aca2-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215867

--===============1790399824023102317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2025.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2025.1-2025.2.patch
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
From 85f85680bd4fdd6daf81f8080a6025426078863e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 12:52:02 +0000
Subject: [PATCH] shaderc: upgrade 2025.1 -> 2025.2

---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../0002-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2025.1.bb => shaderc_2025.2.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.1.bb => shaderc_2025.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 07765653bb..5f873e9d13 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From ed0e2fad08a3cd3f0a0c70922737d8a6886f484d Mon Sep 17 00:00:00 2001
+From 55fb0e7823f20993de37edd926f87f7ac112e9fe Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..748a885a7e 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From f37ba69ef81d6b89246fa40ab6fd299a6f1c8c3b Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.1.bb b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.2.bb
index e9c0ecdd37..8c451e6e46 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7f68b1cf6f35f518febf36d425365bb8e6ad224a"
+SRCREV = "8c269ee0fe607f2d7cac00c0cb4fa243d6a6ec26"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============1790399824023102317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.1-2025.2.patch"

RnJvbSA4NWY4NTY4MGJkNGZkZDZkYWY4MWY4MDgwYTYwMjU0MjYwNzg4NjNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMjo1MjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNS4xIC0+IDIwMjUuMgoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCAgICAgfCAyICstCiAuLi4v
MDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0
Y2ggfCAyICstCiAuLi4vc2hhZGVyYy97c2hhZGVyY18yMDI1LjEuYmIgPT4gc2hhZGVyY18yMDI1
LjIuYmJ9ICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97
c2hhZGVyY18yMDI1LjEuYmIgPT4gc2hhZGVyY18yMDI1LjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxl
LWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1k
ZXBlbmRlbmNpZXMucGF0Y2gKaW5kZXggMDc3NjU2NTNiYi4uNWY4NzNlOWQxMyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxl
LWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJu
YWwtZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlZDBlMmZhZDA4YTNj
ZDNmMGEwYzcwOTIyNzM3ZDhhNjg4NmY0ODRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA1NWZiMGU3ODIzZjIwOTkzZGUzN2VkZDkyNmY4N2Y3YWMxMTJlOWZlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+
CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGNtYWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0
aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1o
ZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCA0MjliNTNjMzA4Li43NDhhODg1YTdlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNo
YWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1m
aXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNDc5NzY0MmE2Mzk0YWQ3ZTVhMjNhYWEzYmRmOGUyZDAxMWY2OWFkZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZjM3YmE2OWVmODFkNmI4OTI0NmZhNDBhYjZmZDI5OWE2ZjFjOGMz
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21h
Lmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAog
U3ViamVjdDogW1BBVENIXSBsaWJzaGFkZXJjX3V0aWw6IGZpeCBnbHNsYW5nIGhlYWRlciBmaWxl
IGxvY2F0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjUuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAy
NS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUuMi5iYgppbmRleCBlOWMwZWNkZDM3Li44YzQ1MWU2
ZTQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIw
MjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUu
Mi5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2dvb2ds
ZS9zaGFkZXJjIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q1JFViA9ICI3ZjY4YjFjZjZmMzVmNTE4ZmViZjM2ZDQyNTM2NWJiOGU2YWQyMjRhIgorU1JDUkVW
ID0gIjhjMjY5ZWUwZmU2MDdmMmQ3Y2FjMDBjMGNiNGZhMjQzZDZhNmVjMjYiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxl
LWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5w
YXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============1790399824023102317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.1 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.2 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/core2-64-poky-linux/shaderc: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.1 [default] to 2025.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2025.1" to "2025.2"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2025.1 [default] to 2025.2 [default]

--===============1790399824023102317==--

