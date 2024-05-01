Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9C6C2BA15
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1106.1714579215960895823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XnGEDT4t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CZTDXfdj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f34e29683-63c0e7f2-6171-4468-afe0-b603a7e37063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rjWgr/mOnSJ2/XVvmEdtWDq3YPmfnJ2gpYo/M9/M8sM=;
	b=XnGEDT4t2JTRuygM0HRGs+DE2LceFG1pw2sPD+WolIPY+z9R7vOHMkLuh8nl7iS/
	aS9HEQfkAXYV+6LIQk80dkq9kGjF7oEf6d+1JXTa9ESVupUPhOV5QuRXEri79jK7ru0
	obAlpc8A+PTccmIypKGz7Q8lbxfMxL04uM98CbBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rjWgr/mOnSJ2/XVvmEdtWDq3YPmfnJ2gpYo/M9/M8sM=;
	b=CZTDXfdjurixeGddIKGQAgVPRMOow1RWZ/2LTTlupkYptySfMPbOwgiW7XnGVc6A
	1x6qf/bQm42Gdhb/1whUQEoMlYNtGV/57YHIhm9ISBc3H536rqWoGjWcC+B8lDbEg/l
	pmFTbguDjYbHip7iJJXyZdoR7+HPoTYxBvkiqdxQ=
Content-Type: multipart/mixed; boundary="===============4821869613829248142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.1 SUCCEEDED
Message-ID: <0101018f34e29683-63c0e7f2-6171-4468-afe0-b603a7e37063-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198840

--===============4821869613829248142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2024.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.0-2024.1.patch
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
From 20135352a4474ca48dddf92060d83e18a38ffc7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 12:10:08 +0000
Subject: [PATCH] shaderc: upgrade 2024.0 -> 2024.1

---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../0002-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..c1102f4e3e 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From c6961c37e4367d111ea02ffcd8b105813337dd72 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..19fa439e3c 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From ff8be6e5d207080bd8897e9ed93781243bea06fa Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.1.bb
index 9975c608ac..1f0b12ef57 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9f56ca620c07d6c4d119c65c1c1f3f1c584c9985"
+SRCREV = "5d7736da11e626b49c5463aadb2afb228ad20276"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.0


--===============4821869613829248142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3722944 to 3722960 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2024.0" to "2024.1"

--===============4821869613829248142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.0-2024.1.patch"

RnJvbSAyMDEzNTM1MmE0NDc0Y2E0OGRkZGY5MjA2MGQ4M2UxOGEzOGZmYzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxMjoxMDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNC4wIC0+IDIwMjQuMQoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCAgICAgfCAyICstCiAuLi4v
MDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0
Y2ggfCAyICstCiAuLi4vc2hhZGVyYy97c2hhZGVyY18yMDI0LjAuYmIgPT4gc2hhZGVyY18yMDI0
LjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97
c2hhZGVyY18yMDI0LjAuYmIgPT4gc2hhZGVyY18yMDI0LjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxl
LWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1k
ZXBlbmRlbmNpZXMucGF0Y2gKaW5kZXggNWM0OWFhN2ZkNS4uYzExMDJmNGUzZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxl
LWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJu
YWwtZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDFmNWY1ODMxZTdh
NTJjMjYxNjhmODFmMjVkMDQ3MDg2MGNhNmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjNjk2MWMzN2U0MzY3ZDExMWVhMDJmZmNkOGIxMDU4MTMzMzdkZDcyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+
CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGNtYWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0
aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1o
ZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAppbmRleCAzOWY5ODJiN2YzLi4xOWZhNDM5ZTNjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNo
YWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1m
aXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZWMyNDQyOTQwZTFkNTMzODk3MTg2MWJiODE1MzdiYWUzYTZjMTllMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZmY4YmU2ZTVkMjA3MDgwYmQ4ODk3ZTllZDkzNzgxMjQzYmVhMDZm
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21h
Lmpvc2VAZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAog
U3ViamVjdDogW1BBVENIXSBsaWJzaGFkZXJjX3V0aWw6IGZpeCBnbHNsYW5nIGhlYWRlciBmaWxl
IGxvY2F0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFk
ZXJjXzIwMjQuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAy
NC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMS5iYgppbmRleCA5OTc1YzYwOGFjLi4xZjBiMTJl
ZjU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIw
MjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQu
MS5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2dvb2ds
ZS9zaGFkZXJjIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q1JFViA9ICI5ZjU2Y2E2MjBjMDdkNmM0ZDExOWM2NWMxYzFmM2YxYzU4NGM5OTg1IgorU1JDUkVW
ID0gIjVkNzczNmRhMTFlNjI2YjQ5YzU0NjNhYWRiMmFmYjIyOGFkMjAyNzYiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1l
eHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1saWJz
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2ggXAotLSAK
Mi40NC4wCgo=

--===============4821869613829248142==--

