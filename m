Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598D4CD3427
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yxyQQEqQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3eDRYuHY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee7da5-079ba905-f06b-4361-bbc1-86ff2791be0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LpKNst+4dM+m7m/WI7a8DzWjYBOgnBnMP+kNqSN5uDE=;
	b=yxyQQEqQvZZxcFu7SxAZmdJ8AFr2vOq61UU8rJWg+kUtYsIkoim6ymxTcpaYVC1T
	nsGmkvHl2SC0oENuraKrvFFPGYE0EB/8TNbe9LaxI2v58Xelt6/Ib6wohs8vuywJRZ0
	ZT6ZAEN7XM+mGKGflgXzMSOg5oDf9P1FkcqIe9+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LpKNst+4dM+m7m/WI7a8DzWjYBOgnBnMP+kNqSN5uDE=;
	b=3eDRYuHYh9yoeJVb/tpQtk2Y5X5vxN7fzA1dix2+gOJh5LiTQer+ZM8W2Rj4WCy9
	AvdjhPIp/DxwxOApGzia2wOwqmksOp6Jf7KmIGr4HJwv5dmU0Zo5aJCMUHUOZXjh0Ks
	DSs3rAf63Fp7SOVKWy1MJ10W0NjXAbmKGGk+wKQQ=
Content-Type: multipart/mixed; boundary="===============5815668265678018455=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2026.2 SUCCEEDED
Message-ID: <0101019de3ee7da5-079ba905-f06b-4361-bbc1-86ff2791be0f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236276

--===============5815668265678018455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2026.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2026.1-2026.2.patch
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
From 34ce52a80429af1beedb11961aeb1f84fb67da2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:13:36 +0000
Subject: [PATCH] shaderc: upgrade 2026.1 -> 2026.2

---
 .../0001-cmake-disable-building-external-dependencies.patch | 6 +++---
 ...2-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2026.1.bb => shaderc_2026.2.bb}        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.1.bb => shaderc_2026.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index cb8bbdd28f..f9731a8eaa 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 29f9099f15755ca8a201a4a02dc1370e21ec936a Mon Sep 17 00:00:00 2001
+From adf7927c3fa5055d33c3970be53fdf1a8853b617 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -53,7 +53,7 @@ index 06f5395..39b8869 100644
  
  function(define_pkg_config_file NAME LIBS)
 diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index b7ce5b8..95b34c5 100755
+index 7adcefc..3eac466 100755
 --- a/utils/update_build_version.py
 +++ b/utils/update_build_version.py
 @@ -30,6 +30,7 @@ import re
@@ -64,7 +64,7 @@ index b7ce5b8..95b34c5 100755
  
  def mkdir_p(directory):
      """Make the directory, and all its ancestors as required.  Any of the
-@@ -121,25 +122,32 @@ def get_version_string(project, directory):
+@@ -123,25 +124,32 @@ def get_version_string(project, directory):
      directory, which consists of software version string and git description
      string."""
      detailed_version_string_lst = [project]
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 3f030e5c8b..d639635766 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 7831df8bb68a8992a07ecc359550879e629e8c79 Mon Sep 17 00:00:00 2001
+From f3915766d382d30c83da6d8077bf183e930a4789 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.1.bb b/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.2.bb
index 1d66c2b810..644db97969 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "75f8c09ada4a69b086afdd2c03d7a8be06242414"
+SRCREV = "baec0c74d6dca70c52d937e2e5bf6ffcd449e430"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============5815668265678018455==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2026.1-2026.2.patch"

RnJvbSAzNGNlNTJhODA0MjlhZjFiZWVkYjExOTYxYWViMWY4NGZiNjdkYTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjoxMzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNi4xIC0+IDIwMjYuMgoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCB8IDYgKysrLS0tCiAuLi4y
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCB8
IDIgKy0KIC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjYuMS5iYiA9PiBzaGFkZXJjXzIwMjYuMi5i
Yn0gICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNf
MjAyNi4xLmJiID0+IHNoYWRlcmNfMjAyNi4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGlu
Zy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hh
ZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5j
aWVzLnBhdGNoCmluZGV4IGNiOGJiZGQyOGYuLmY5NzMxYThlYWEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGlu
Zy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVu
ZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjlmOTA5OWYxNTc1NWNhOGEyMDFh
NGEwMmRjMTM3MGUyMWVjOTM2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWRmNzky
N2MzZmE1MDU1ZDMzYzM5NzBiZTUzZmRmMWE4ODUzYjYxNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0ZTog
U2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTog
ZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKQEAgLTUzLDcgKzUzLDcgQEAg
aW5kZXggMDZmNTM5NS4uMzliODg2OSAxMDA2NDQKICAKICBmdW5jdGlvbihkZWZpbmVfcGtnX2Nv
bmZpZ19maWxlIE5BTUUgTElCUykKIGRpZmYgLS1naXQgYS91dGlscy91cGRhdGVfYnVpbGRfdmVy
c2lvbi5weSBiL3V0aWxzL3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5Ci1pbmRleCBiN2NlNWI4Li45
NWIzNGM1IDEwMDc1NQoraW5kZXggN2FkY2VmYy4uM2VhYzQ2NiAxMDA3NTUKIC0tLSBhL3V0aWxz
L3VwZGF0ZV9idWlsZF92ZXJzaW9uLnB5CiArKysgYi91dGlscy91cGRhdGVfYnVpbGRfdmVyc2lv
bi5weQogQEAgLTMwLDYgKzMwLDcgQEAgaW1wb3J0IHJlCkBAIC02NCw3ICs2NCw3IEBAIGluZGV4
IGI3Y2U1YjguLjk1YjM0YzUgMTAwNzU1CiAgCiAgZGVmIG1rZGlyX3AoZGlyZWN0b3J5KToKICAg
ICAgIiIiTWFrZSB0aGUgZGlyZWN0b3J5LCBhbmQgYWxsIGl0cyBhbmNlc3RvcnMgYXMgcmVxdWly
ZWQuICBBbnkgb2YgdGhlCi1AQCAtMTIxLDI1ICsxMjIsMzIgQEAgZGVmIGdldF92ZXJzaW9uX3N0
cmluZyhwcm9qZWN0LCBkaXJlY3RvcnkpOgorQEAgLTEyMywyNSArMTI0LDMyIEBAIGRlZiBnZXRf
dmVyc2lvbl9zdHJpbmcocHJvamVjdCwgZGlyZWN0b3J5KToKICAgICAgZGlyZWN0b3J5LCB3aGlj
aCBjb25zaXN0cyBvZiBzb2Z0d2FyZSB2ZXJzaW9uIHN0cmluZyBhbmQgZ2l0IGRlc2NyaXB0aW9u
CiAgICAgIHN0cmluZy4iIiIKICAgICAgZGV0YWlsZWRfdmVyc2lvbl9zdHJpbmdfbHN0ID0gW3By
b2plY3RdCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8w
MDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCmluZGV4IDNmMDMwZTVj
OGIuLmQ2Mzk2MzU3NjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0
aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA3ODMxZGY4YmI2OGE4OTkyYTA3ZWNjMzU5NTUwODc5ZTYyOWU4
Yzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMzkxNTc2NmQzODJkMzBjODNkYTZk
ODA3N2JmMTgzZTkzMGE0Nzg5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBR
dWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIx
IDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnNoYWRlcmNfdXRpbDogZml4IGds
c2xhbmcgaGVhZGVyIGZpbGUgbG9jYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3No
YWRlcmMvc2hhZGVyY18yMDI2LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI2LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNi4yLmJiCmluZGV4IDFk
NjZjMmI4MTAuLjY0NGRiOTc5NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9z
aGFkZXJjL3NoYWRlcmNfMjAyNi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL3NoYWRlcmNfMjAyNi4yLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gIjc1ZjhjMDlhZGE0YTY5YjA4NmFmZGQyYzAzZDdhOGJl
MDYyNDI0MTQiCitTUkNSRVYgPSAiYmFlYzBjNzRkNmRjYTcwYzUyZDkzN2UyZTViZjZmZmNkNDQ5
ZTQzMCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRl
ci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============5815668265678018455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.1 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.2 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: FILELIST: directory renamed /usr/src/debug/shaderc/2026.1/libshaderc/include/shaderc -> /usr/src/debug/shaderc/2026.2/libshaderc/include/shaderc, directory renamed /usr/src/debug/shaderc/2026.1/glslc/src -> /usr/src/debug/shaderc/2026.2/glslc/src, directory renamed /usr/src/debug/shaderc/2026.1/libshaderc_util/src -> /usr/src/debug/shaderc/2026.2/libshaderc_util/src, directory renamed /usr/src/debug/shaderc/2026.1/libshaderc_util/include/libshaderc_util -> /usr/src/debug/shaderc/2026.2/libshaderc_util/include/libshaderc_util, directory renamed /usr/src/debug/shaderc/2026.1/libshaderc/src -> /usr/src/debug/shaderc/2026.2/libshaderc/src
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3773698 to 3773706 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2026.1" to "2026.2"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2026.1 [default] to 2026.2 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2026.1" to "2026.2"

--===============5815668265678018455==--

