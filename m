Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1128C35FED
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.115638.1726410840760726917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GNPeAHgz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=THbu75CK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191f61adc9f-29528eee-e5dd-41f8-a988-0a003c6cfce1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4RpBuah14prMCxydauHUiVQIpmi3VBkQYm/yjeAwRIQ=;
	b=GNPeAHgzYV7TRv6oG98Ix+jaAJLYHqLm6L3yfO1Z8kpTVVbv7XvL+GEirnBzVkGa
	Uzebc6v46DvABEoT8PP809E2/ECqa+yid0+Js3xrp1qbURovJoODbqa2l+XBGnVzAWa
	Mbot8265suV2JZMC2Z6AH4qrT4Q1hjmV5cbnemuM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4RpBuah14prMCxydauHUiVQIpmi3VBkQYm/yjeAwRIQ=;
	b=THbu75CKWcxDnKjDbfA0dzhE2Dbq5kK+IwYpYp3XK+nEJ/sPwYTqa+/C4+cv+VV8
	MBkTqXNTApwFwFJGhvOH1h05AYtQt+bXQKOJPQAWqcsbNNFA1k6RIcX9ZKjanH5KYtD
	EOZJm5qTsvPftP70Af/+xpTlsBBmMiTK107fgNs8=
Content-Type: multipart/mixed; boundary="===============6183341108072344581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.2 SUCCEEDED
Message-ID: <01010191f61adc9f-29528eee-e5dd-41f8-a988-0a003c6cfce1-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204552

--===============6183341108072344581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2024.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.1-2024.2.patch
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
From 5e84ed3eb8baa9bfcc06aaa6083421a11c638ddd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 12:01:44 +0000
Subject: [PATCH] shaderc: upgrade 2024.1 -> 2024.2

---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../0002-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2024.1.bb => shaderc_2024.2.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.1.bb => shaderc_2024.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..fccca24530 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From 90c7c514e09747b868c8068253e79820618080b5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..e2b8472afb 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From b2a15787740933ab1a7310c7e22efbf7bd94603e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.1.bb b/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.2.bb
index 1f0b12ef57..c658e7df05 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "5d7736da11e626b49c5463aadb2afb228ad20276"
+SRCREV = "5dad9194c038702ef20ccabbe4e3c188f2b13cec"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.0


--===============6183341108072344581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3774502 to 3774478 (-0%)
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2024.1" to "2024.2"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2024.1 [default] to 2024.2 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2024.1" to "2024.2"

--===============6183341108072344581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.1-2024.2.patch"

RnJvbSA1ZTg0ZWQzZWI4YmFhOWJmY2MwNmFhYTYwODM0MjFhMTFjNjM4ZGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTI6MDE6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjQuMSAtPiAyMDI0LjIKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICAgIHwgMiArLQogLi4u
LzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBh
dGNoIHwgMiArLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNC4xLmJiID0+IHNoYWRlcmNfMjAy
NC4yLmJifSAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
e3NoYWRlcmNfMjAyNC4xLmJiID0+IHNoYWRlcmNfMjAyNC4yLmJifSAoOTUlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCmluZGV4IDVjNDlhYTdmZDUuLmZjY2NhMjQ1MzAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVy
bmFsLWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQxZjVmNTgzMWU3
YTUyYzI2MTY4ZjgxZjI1ZDA0NzA4NjBjYTZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOTBjN2M1MTRlMDk3NDdiODY4YzgwNjgyNTNlNzk4MjA2MTgwODBiNSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29t
PgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBjbWFrZTogZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmct
aGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggMzlmOTgyYjdmMy4uZTJiODQ3MmFmYiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJz
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGVjMjQ0Mjk0MGUxZDUzMzg5NzE4NjFiYjgxNTM3YmFlM2E2YzE5ZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGIyYTE1Nzg3NzQwOTMzYWIxYTczMTBjN2UyMmVmYmY3YmQ5NDYw
M2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNt
YS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXggZ2xzbGFuZyBoZWFkZXIgZmls
ZSBsb2NhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hh
ZGVyY18yMDI0LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIw
MjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjIuYmIKaW5kZXggMWYwYjEyZWY1Ny4uYzY1OGU3
ZGYwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0
LjIuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9nb29n
bGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNSRVYgPSAiNWQ3NzM2ZGExMWU2MjZiNDljNTQ2M2FhZGIyYWZiMjI4YWQyMDI3NiIKK1NSQ1JF
ViA9ICI1ZGFkOTE5NGMwMzg3MDJlZjIwY2NhYmJlNGUzYzE4OGYyYjEzY2VjIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmct
ZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItbGli
c2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0g
CjIuNDQuMAoK

--===============6183341108072344581==--

