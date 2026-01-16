Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD21D489BA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1475.1768526746673734983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K/bGVGcG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Fch2B/zH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc468bdbc-d2a7b811-d672-43e9-b936-a299adcd128a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mqZDjQhujEvoEVIAtD2O90syoQxsYGG8+J+54HWpfLs=;
	b=K/bGVGcGZXeGKAfS/nbh2mxCj/uAtmKGDW+0WJ/F3Md3OX1xfekOIKYQYTfJBMVN
	1zllT9X7mgSD2m4aOl+xwDZmqgF0EpEBAPN7Tpdan+X2lceU2mn4KJerleuj3q5mxzq
	zYYynx3Zpa81Xjk6AzdvgfE3FsOAsXfii15ENjtk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526757;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mqZDjQhujEvoEVIAtD2O90syoQxsYGG8+J+54HWpfLs=;
	b=Fch2B/zHUoc/rzvSOUznK5mAmAPWC5Gqnx1HZLft6pjtez7S66dHi91V7ggX3I9N
	9N+uyZqAq5LSXsEPq56gU6lb108kSAU2FLmkl/qh+J3fXAyzak77F05o9wVkHCwDbVc
	C3jYfo6j6Lk8/2FsoNpBOz0UEuJyw825UF+lviAQ=
Content-Type: multipart/mixed; boundary="===============3315636509931818168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.54 SUCCEEDED
Message-ID: <0101019bc468bdbc-d2a7b811-d672-43e9-b936-a299adcd128a-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229506

--===============3315636509931818168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.54* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.53-1.6.54.patch
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
From 5e8cc8ef5871a01db891cc3106eb4f02a4346f56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:47:49 +0000
Subject: [PATCH] libpng: upgrade 1.6.53 -> 1.6.54

---
 .../{libpng_1.6.53.bb => libpng_1.6.54.bb}    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb => libpng_1.6.54.bb} (73%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
similarity index 73%
rename from meta/recipes-multimedia/libpng/libpng_1.6.53.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.54.bb
index a43283eae7..b515b9b514 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
@@ -1,3 +1,27 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -4,8 +4,8 @@
+#  PNG Reference Library License version 2
+#  ---------------------------------------
+#  
+# - * Copyright (c) 1995-2025 The PNG Reference Library Authors.
+# - * Copyright (c) 2018-2025 Cosmin Truta.
+# + * Copyright (c) 1995-2026 The PNG Reference Library Authors.
+# + * Copyright (c) 2018-2026 Cosmin Truta.
+#   * Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson.
+#   * Copyright (c) 1996-1997 Andreas Dilger.
+#   * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+# 
+#
+
 SUMMARY = "PNG image format decoding library"
 DESCRIPTION = "An open source project to develop and maintain the reference \
 library for use in applications that read, create, and manipulate PNG \
@@ -5,7 +29,7 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9dc350edbbbee660c7d9af79487168f2"
 DEPENDS = "zlib"
 
 LIBV = "16"
@@ -14,7 +38,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
+SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============3315636509931818168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/tests/pngstest-large-stride"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.53.0", added "/usr/lib/libpng16.so.16.54.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.53.0 to libpng16.so.16.54.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.53.0 to libpng16.so.16.54.0
  /usr/lib/libpng16.so.16.53.0 moved to /usr/lib/libpng16.so.16.54.0

--===============3315636509931818168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.53-1.6.54.patch"

RnJvbSA1ZThjYzhlZjU4NzFhMDFkYjg5MWNjMzEwNmViNGYwMmE0MzQ2ZjU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6NDc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjUzIC0+IDEuNi41NAoKLS0tCiAuLi4ve2xpYnBuZ18xLjYuNTMu
YmIgPT4gbGlicG5nXzEuNi41NC5iYn0gICAgfCAyOCArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNTMuYmIgPT4gbGlicG5nXzEu
Ni41NC5iYn0gKDczJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJw
bmcvbGlicG5nXzEuNi41My5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJw
bmdfMS42LjU0LmJiCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjUzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41NC5iYgppbmRleCBhNDMyODNlYWU3Li5i
NTE1YjliNTE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGli
cG5nXzEuNi41My5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi41NC5iYgpAQCAtMSwzICsxLDI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RQorIyArKysgTElDRU5TRQorIyBAQCAtNCw4ICs0LDggQEAKKyMgIFBORyBSZWZlcmVuY2UgTGli
cmFyeSBMaWNlbnNlIHZlcnNpb24gMgorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgLSAqIENvcHlyaWdodCAoYykgMTk5NS0yMDI1IFRoZSBQTkcgUmVm
ZXJlbmNlIExpYnJhcnkgQXV0aG9ycy4KKyMgLSAqIENvcHlyaWdodCAoYykgMjAxOC0yMDI1IENv
c21pbiBUcnV0YS4KKyMgKyAqIENvcHlyaWdodCAoYykgMTk5NS0yMDI2IFRoZSBQTkcgUmVmZXJl
bmNlIExpYnJhcnkgQXV0aG9ycy4KKyMgKyAqIENvcHlyaWdodCAoYykgMjAxOC0yMDI2IENvc21p
biBUcnV0YS4KKyMgICAqIENvcHlyaWdodCAoYykgMjAwMC0yMDAyLCAyMDA0LCAyMDA2LTIwMTgg
R2xlbm4gUmFuZGVycy1QZWhyc29uLgorIyAgICogQ29weXJpZ2h0IChjKSAxOTk2LTE5OTcgQW5k
cmVhcyBEaWxnZXIuCisjICAgKiBDb3B5cmlnaHQgKGMpIDE5OTUtMTk5NiBHdXkgRXJpYyBTY2hh
bG5hdCwgR3JvdXAgNDIsIEluYy4KKyMgCisjCisKIFNVTU1BUlkgPSAiUE5HIGltYWdlIGZvcm1h
dCBkZWNvZGluZyBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAiQW4gb3BlbiBzb3VyY2UgcHJvamVj
dCB0byBkZXZlbG9wIGFuZCBtYWludGFpbiB0aGUgcmVmZXJlbmNlIFwKIGxpYnJhcnkgZm9yIHVz
ZSBpbiBhcHBsaWNhdGlvbnMgdGhhdCByZWFkLCBjcmVhdGUsIGFuZCBtYW5pcHVsYXRlIFBORyBc
CkBAIC01LDcgKzI5LDcgQEAgbGlicmFyeSBmb3IgdXNlIGluIGFwcGxpY2F0aW9ucyB0aGF0IHJl
YWQsIGNyZWF0ZSwgYW5kIG1hbmlwdWxhdGUgUE5HIFwKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cu
bGlicG5nLm9yZy8iCiBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkxpYnBuZyIKLUxJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTU1MTZkNzdhM2NmNzVmNTVhMGQzNzI1
NGUzZTY1YTIwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OWRjMzUw
ZWRiYmJlZTY2MGM3ZDlhZjc5NDg3MTY4ZjIiCiBERVBFTkRTID0gInpsaWIiCiAKIExJQlYgPSAi
MTYiCkBAIC0xNCw3ICszOCw3IEBAIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9LyR7
QlBOfS8ke0JQTn0ke0xJQlZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4t
cHRlc3QgXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQzZmI4Y2NjMjkzMmQwNGFhMzY2
M2UyMmVmNWVmNDkwMjQ0MzcwZjRlNTY4ZDc4NTAxNjUwNjg3NzhkOThkNCIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIwMWM5ZDhhMzAzYzk0MWVjMmM1MTFjMTQzMTJhM2IxZDM2Y2VkYjQxZTJmNTE2
OGNjZGFhODVkNTNiODg3ODA1IgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0v
cHJvamVjdC8ke0JQTn0vJHtCUE59JHtMSUJWfS8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2pl
Y3QvJHtCUE59LyR7QlBOfSR7TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEKCg==

--===============3315636509931818168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.53.tar.xz file://run-ptest" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.54.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.53.0", added "/usr/lib/.debug/libpng16.so.16.54.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1558480 to 1558976 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGSIZE changed from 179526 to 179838 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268149 to 268148 (-0%)
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/tests/pngstest-large-stride"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2508933 to 2510546 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.53 -> /usr/src/debug/libpng/1.6.54, directory renamed /usr/src/debug/libpng/1.6.53/contrib/libtests -> /usr/src/debug/libpng/1.6.54/contrib/libtests, directory renamed /usr/src/debug/libpng/1.6.53/contrib/tools -> /usr/src/debug/libpng/1.6.54/contrib/tools
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2141113 to 2143148 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.53" to "1.6.54"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.53.0", added "/usr/lib/libpng16.so.16.54.0"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.53 [default] to 1.6.54 [default]
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.53.0 to libpng16.so.16.54.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.53.0 to libpng16.so.16.54.0
  /usr/lib/libpng16.so.16.53.0 moved to /usr/lib/libpng16.so.16.54.0

--===============3315636509931818168==--

