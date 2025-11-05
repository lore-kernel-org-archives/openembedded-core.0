Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDF1CD4857
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1762384577815006049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XUgrNZMn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hy4hNPXc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564eda51-21fc1ff7-1390-4dfa-b245-e2747cdef389-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384599;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fTXFw5TiVZUxvHGnjRFP9AY6EEAEDsNZcrcEOM7Ixwg=;
	b=XUgrNZMnaUuQLND3mdk5y/tSNKZLTS8UXjVkijT3LzdHTwL2zAU+Krg4dZhqamVG
	OUXE+Dhgh0AmVLugfGBZq8lf+m8GM7nJJu/H4mYXcIAXGKiYLgaDbjDZCl7vbuOTd7Q
	j4bJOde425f8XMX7MgMslMJGlH4A4VzL4KEvuy1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384599;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fTXFw5TiVZUxvHGnjRFP9AY6EEAEDsNZcrcEOM7Ixwg=;
	b=hy4hNPXcNlWTK7Ck6ktoc4lXXNQtA0lzOSm52hgj2Z0JCCpjbidwmiSz60kDNkm7
	drScYNSjIDR0obhxS1/KfWlenXhX5uGPCY54ofYBnSYdcNJBNcf7w5ocOPBRIdFOBVp
	VSPooJXdJKyHe9Nc0GJQ71TKMskrgbu8ZQOfFSnQ=
Content-Type: multipart/mixed; boundary="===============1547128330115009982=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2025.4 SUCCEEDED
Message-ID: <0101019a564eda51-21fc1ff7-1390-4dfa-b245-e2747cdef389-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225887

--===============1547128330115009982==
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
From 1f2c3b9e4f81819333d84c5d1959a3d6ca6f2874 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:58:31 +0000
Subject: [PATCH] shaderc: upgrade 2025.3 -> 2025.4

---
 .../0001-cmake-disable-building-external-dependencies.patch   | 2 +-
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2025.3.bb => shaderc_2025.4.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.3.bb => shaderc_2025.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 77b81635b6..6149909cb9 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 3db09ee0d0bf6390eb3dcd835bd4ef786188bf16 Mon Sep 17 00:00:00 2001
+From 804f28476fae45e5f37edd74b17f050e64048402 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..f42a4ca240 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From ce7245d702ca22379d41e802008111a5574e54b3 Mon Sep 17 00:00:00 2001
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


--===============1547128330115009982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.3 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.4 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 5064272 to 5067208 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 64025 to 64272 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 326761 to 327800 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3769298 to 3771386 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.3" to "2025.4"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2025.3 [default] to 2025.4 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2025.3" to "2025.4"

--===============1547128330115009982==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.3-2025.4.patch"

RnJvbSAxZjJjM2I5ZTRmODE4MTkzMzNkODRjNWQxOTU5YTNkNmNhNmYyODc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDo1ODozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNS4zIC0+IDIwMjUuNAoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCAgIHwgMiArLQogLi4uMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCB8
IDQgKystLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNS4zLmJiID0+IHNoYWRlcmNfMjAyNS40
LmJifSAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3tzaGFk
ZXJjXzIwMjUuMy5iYiA9PiBzaGFkZXJjXzIwMjUuNC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVp
bGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVu
ZGVuY2llcy5wYXRjaAppbmRleCA3N2I4MTYzNWI2Li42MTQ5OTA5Y2I5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVp
bGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1k
ZXBlbmRlbmNpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNkYjA5ZWUwZDBiZjYzOTBl
YjNkY2Q4MzViZDRlZjc4NjE4OGJmMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgw
NGYyODQ3NmZhZTQ1ZTVmMzdlZGQ3NGIxN2YwNTBlNjQwNDg0MDIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERh
dGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21h
a2U6IGRpc2FibGUgYnVpbGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAyLWxpYnNoYWRlcmNfdXRpbC1m
aXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRl
ci1maWxlLWxvY2F0aW9uLnBhdGNoCmluZGV4IDQyOWI1M2MzMDguLmY0MmE0Y2EyNDAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVy
Y191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1n
bHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0
Nzk3NjQyYTYzOTRhZDdlNWEyM2FhYTNiZGY4ZTJkMDExZjY5YWRmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBjZTcyNDVkNzAyY2EyMjM3OWQ0MWU4MDIwMDgxMTFhNTU3NGU1NGIzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9z
ZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1OjU2ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGxpYnNoYWRlcmNfdXRpbDogZml4IGdsc2xhbmcgaGVhZGVyIGZpbGUgbG9j
YXRpb24KQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8cXVh
cmVzbWEuam9zZUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBpbGVy
LmNjIGIvbGlic2hhZGVyY191dGlsL3NyYy9jb21waWxlci5jYwotaW5kZXggOWJmOWE0My4uZGMw
ZWZkMiAxMDA2NDQKK2luZGV4IGYyZWQzYzcuLjU5YjI2MmEgMTAwNjQ0CiAtLS0gYS9saWJzaGFk
ZXJjX3V0aWwvc3JjL2NvbXBpbGVyLmNjCiArKysgYi9saWJzaGFkZXJjX3V0aWwvc3JjL2NvbXBp
bGVyLmNjCiBAQCAtMjAsNyArMjAsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hh
ZGVyYy9zaGFkZXJjXzIwMjUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjUuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjQuYmIKaW5kZXggNjky
ZTg1ZTU2Yy4uODMxMjgzMWI4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3No
YWRlcmMvc2hhZGVyY18yMDI1LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRl
cmMvc2hhZGVyY18yMDI1LjQuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8v
Z2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4
Njk2OGY0MzI3IgogCi1TUkNSRVYgPSAiZWIwYmMyMGQwYzMxMzIwZmU4MzRlNGVlOGViMDI4MDcy
OTJiOTcwMyIKK1NSQ1JFViA9ICIxN2MxODMyYzEzMmNjZmIxMWEzMDUwOTQ1Mzg5ZjY0ZGQ0ODVl
MzI3IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtY21ha2UtZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVy
LWZpbGUtbG9jYXRpb24ucGF0Y2ggXAotLSAKMi40Ny4xCgo=

--===============1547128330115009982==--

