Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4535E6526F
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29065.1769951576865457911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gOOPaUvZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DmGFQs6p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c1955c0c5-f7f0495c-8ae8-47b7-88d7-a2c1a2d18505-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pieMmDF5aVjxf29sTg/3gm4EYxTLmuAJKOqsrqG8reo=;
	b=gOOPaUvZiCB0QAOS7sDMrT3fmwl0iAWuSisBASD6UcAVdIpPxF9BWVkXmf6jnOV6
	IZbfilgRoCEXsPGN325wY29OiVYBHDLSMWpR+caawM3Cim9kpDyOTjnU7gEx2hqe2Dv
	CJFpN7lQAn+A+hPHw8NgWmC2mtTMecHXTjB0+6MM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pieMmDF5aVjxf29sTg/3gm4EYxTLmuAJKOqsrqG8reo=;
	b=DmGFQs6pLa3pgf8bMDUdw0Vt7TeoxQaW17JFpGd51MJB1reCbe1Qi6pNp6SrsfVW
	1WzVumqsY7KuQ+Gz27+7C2MzQWP8/F5EJY+HmjokbXqJkc95vJ4UTKfxvFImzpNxNqZ
	Xb/0YlhykmRwnotUnIfY5rU2ZoCQuSorFrSjlUfE=
Content-Type: multipart/mixed; boundary="===============0599791684966602724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2026.1 SUCCEEDED
Message-ID: <0101019c1955c0c5-f7f0495c-8ae8-47b7-88d7-a2c1a2d18505-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230309

--===============0599791684966602724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shaderc* to *2026.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2025.5-2026.1.patch
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
From 3dceabc68ba8498ca7906e6e934cc8e8d4e96512 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 11:49:21 +0000
Subject: [PATCH] shaderc: upgrade 2025.5 -> 2026.1

---
 .../0001-cmake-disable-building-external-dependencies.patch | 6 +++---
 ...2-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2025.5.bb => shaderc_2026.1.bb}        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.5.bb => shaderc_2026.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index cb8bbdd28f..7ba2061a5a 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 29f9099f15755ca8a201a4a02dc1370e21ec936a Mon Sep 17 00:00:00 2001
+From dc918b7ea831ee330f4f778a830e0108f3bc464a Mon Sep 17 00:00:00 2001
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
index 3f030e5c8b..5101ee984f 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 7831df8bb68a8992a07ecc359550879e629e8c79 Mon Sep 17 00:00:00 2001
+From 83fd88fc7729049ad3d90dde4f7ab4130ef67380 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.5.bb b/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.1.bb
index 9ae5defa5f..1d66c2b810 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "bca2fa0bf0242340440d54f8d8e05c5dd2fafcea"
+SRCREV = "75f8c09ada4a69b086afdd2c03d7a8be06242414"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.1


--===============0599791684966602724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shaderc: SRC_URI changed from "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2025.5 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch" to "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v2026.1 file://0001-cmake-disable-building-external-dependencies.patch file://0002-libshaderc_util-fix-glslang-header-file-location.patch"
packages/x86-64-v3-poky-linux/shaderc: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dbg: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-dev: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-doc: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-locale: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: FILELIST: directory renamed /usr/src/debug/shaderc/2025.5/libshaderc_util/src -> /usr/src/debug/shaderc/2026.1/libshaderc_util/src, directory renamed /usr/src/debug/shaderc/2025.5/glslc/src -> /usr/src/debug/shaderc/2026.1/glslc/src, directory renamed /usr/src/debug/shaderc/2025.5/libshaderc_util/include/libshaderc_util -> /usr/src/debug/shaderc/2026.1/libshaderc_util/include/libshaderc_util, directory renamed /usr/src/debug/shaderc/2025.5/libshaderc/include/shaderc -> /usr/src/debug/shaderc/2026.1/libshaderc/include/shaderc, directory renamed /usr/src/debug/shaderc/2025.5/libshaderc/src -> /usr/src/debug/shaderc/2026.1/libshaderc/src
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-src: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3772634 to 3772642 (+0%)
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc-staticdev: PV changed from "2025.5" to "2026.1"
packages/x86-64-v3-poky-linux/shaderc/shaderc: PKGV changed from 2025.5 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/shaderc/shaderc: PV changed from "2025.5" to "2026.1"

--===============0599791684966602724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2025.5-2026.1.patch"

RnJvbSAzZGNlYWJjNjhiYTg0OThjYTc5MDZlNmU5MzRjYzhlOGQ0ZTk2NTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMTo0OToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyNS41IC0+IDIwMjYuMQoKLS0tCiAuLi4vMDAwMS1jbWFrZS1kaXNh
YmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCB8IDYgKysrLS0tCiAuLi4y
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCB8
IDIgKy0KIC4uLi9zaGFkZXJjL3tzaGFkZXJjXzIwMjUuNS5iYiA9PiBzaGFkZXJjXzIwMjYuMS5i
Yn0gICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNf
MjAyNS41LmJiID0+IHNoYWRlcmNfMjAyNi4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGlu
Zy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hh
ZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5j
aWVzLnBhdGNoCmluZGV4IGNiOGJiZGQyOGYuLjdiYTIwNjFhNWEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJsZS1idWlsZGlu
Zy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVu
ZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjlmOTA5OWYxNTc1NWNhOGEyMDFh
NGEwMmRjMTM3MGUyMWVjOTM2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGM5MThi
N2VhODMxZWUzMzBmNGY3NzhhODMwZTAxMDhmM2JjNDY0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
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
OGIuLjUxMDFlZTk4NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L2ZpbGVzLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0
aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA3ODMxZGY4YmI2OGE4OTkyYTA3ZWNjMzU5NTUwODc5ZTYyOWU4
Yzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4M2ZkODhmYzc3MjkwNDlhZDNkOTBk
ZGU0ZjdhYjQxMzBlZjY3MzgwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBR
dWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIx
IDAwOjQ1OjU2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnNoYWRlcmNfdXRpbDogZml4IGds
c2xhbmcgaGVhZGVyIGZpbGUgbG9jYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNS41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3No
YWRlcmMvc2hhZGVyY18yMDI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI1LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyNi4xLmJiCmluZGV4IDlh
ZTVkZWZhNWYuLjFkNjZjMmI4MTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9z
aGFkZXJjL3NoYWRlcmNfMjAyNS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFk
ZXJjL3NoYWRlcmNfMjAyNi4xLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczov
L2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gImJjYTJmYTBiZjAyNDIzNDA0NDBkNTRmOGQ4ZTA1YzVk
ZDJmYWZjZWEiCitTUkNSRVYgPSAiNzVmOGMwOWFkYTRhNjliMDg2YWZkZDJjMDNkN2E4YmUwNjI0
MjQxNCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRl
ci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0gCjIuNDcuMQoK

--===============0599791684966602724==--

