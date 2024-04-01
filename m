Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C575CD13DB
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44638.1711994601286965224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RWBZQoHM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vxhoG5NW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad47ce1-37d0f329-2d28-4c9b-a535-9e28c26cfa3a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=h67CfIObRdxcNttQT8s0tpBUEU60+cpnU4AGM9F0MQ8=;
	b=RWBZQoHMmEMPdj5DnKxsIbLJ+CS85jxG0oQJk0HbTZw/O3p0UItLSBwdE8m8DYkx
	eOyc/0XgLxWkCnSTQlI//HyW1Pnrhj/HCVqHGqRClO5Mh2jYcqXttLNjMIoGVGd4z3s
	aU0QeOhhNJEwoxnMp9wgfuk3xaZS5CpiZJQE7R5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=h67CfIObRdxcNttQT8s0tpBUEU60+cpnU4AGM9F0MQ8=;
	b=vxhoG5NWqXtZ+FzzpGu4QJpaucmgWTmU733O1QfLp0JWnTeimR/FhzpzBowcT4Xm
	7RFMXiKWMJKOCgBHs0LDQZZmWeEP5riiDiWgdZECHElu4F9xW7nMWlGEiRYEUmTHu7a
	aFxVVcyWEBxmSjp+0i78ZszIhddkLG+km27eA8LU=
Content-Type: multipart/mixed; boundary="===============6351622121483258043=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.29.0 FAILED
Message-ID: <0101018e9ad47ce1-37d0f329-2d28-4c9b-a535-9e28c26cfa3a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197706

--===============6351622121483258043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.29.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.28.3-3.29.0.patch
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
From 24b63e4ff346f81f6537107bd04ee832ead307a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 06:50:25 +0000
Subject: [PATCH] cmake: upgrade 3.28.3 -> 3.29.0

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 .../{cmake_3.28.3.bb => cmake_3.29.0.bb}      | 31 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake_3.28.3.bb => cmake_3.29.0.bb} (64%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05..9abe69484c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
+SRC_URI[sha256sum] = "a0669630aae7baa4a8228048bf30b622f9e9fd8ee8cedb941754e9e38686c778"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.0.bb
similarity index 64%
rename from meta/recipes-devtools/cmake/cmake_3.28.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.0.bb
index 6a9a3266df..0339887a29 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.29.0.bb
@@ -1,7 +1,33 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Copyright.txt
+# +++ Copyright.txt
+# @@ -1,5 +1,5 @@
+#  CMake - Cross Platform Makefile Generator
+# -Copyright 2000-2023 Kitware, Inc. and Contributors
+# +Copyright 2000-2024 Kitware, Inc. and Contributors
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 require cmake.inc
 
 inherit cmake bash-completion
 
+LIC_FILES_CHKSUM += "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
+                    file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
+                    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
+                    file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
+                    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
+                    "
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
@@ -12,11 +38,6 @@ SRC_URI:append:class-nativesdk = " \
 "
 
 LICENSE:append = " & BSD-1-Clause & MIT"
-LIC_FILES_CHKSUM:append = " \
-    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
-    file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
-"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.42.0


--===============6351622121483258043==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.28.3-3.29.0.patch"

RnJvbSAyNGI2M2U0ZmYzNDZmODFmNjUzNzEwN2JkMDRlZTgzMmVhZDMwN2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNjo1MDoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjguMyAtPiAzLjI5LjAKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgIHwgIDIgKy0KIC4uLi97Y21ha2VfMy4yOC4zLmJiID0+
IGNtYWtlXzMuMjkuMC5iYn0gICAgICB8IDMxICsrKysrKysrKysrKysrKystLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjguMy5iYiA9PiBjbWFrZV8zLjI5LjAuYmJ9
ICg2NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggYWI5ZjQ1OWMw
NS4uOWFiZTY5NDg0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0x
OSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIo
J1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2Zp
bGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI3MmI3NTcwZTVjODU5M2RlNmFjNGFiNDMzYjczZWFiMThjNWZi
MzI4ODgwNDYwYzg2Y2UzMjYwODE0MWFkNWMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNjY5
NjMwYWFlN2JhYTRhODIyODA0OGJmMzBiNjIyZjllOWZkOGVlOGNlZGI5NDE3NTRlOWUzODY4NmM3
NzgiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVyPlxkKyhcLlxkKykr
KVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Vf
My4yOC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjkuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDY0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2VfMy4yOC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2VfMy4yOS4wLmJiCmluZGV4IDZhOWEzMjY2ZGYuLjAzMzk4ODdhMjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI4LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjkuMC5iYgpAQCAtMSw3ICsxLDMzIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ29weXJpZ2h0LnR4dAorIyArKysgQ29weXJpZ2h0LnR4dAor
IyBAQCAtMSw1ICsxLDUgQEAKKyMgIENNYWtlIC0gQ3Jvc3MgUGxhdGZvcm0gTWFrZWZpbGUgR2Vu
ZXJhdG9yCisjIC1Db3B5cmlnaHQgMjAwMC0yMDIzIEtpdHdhcmUsIEluYy4gYW5kIENvbnRyaWJ1
dG9ycworIyArQ29weXJpZ2h0IDIwMDAtMjAyNCBLaXR3YXJlLCBJbmMuIGFuZCBDb250cmlidXRv
cnMKKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwog
cmVxdWlyZSBjbWFrZS5pbmMKIAogaW5oZXJpdCBjbWFrZSBiYXNoLWNvbXBsZXRpb24KIAorTElD
X0ZJTEVTX0NIS1NVTSArPSAiZmlsZTovL0NvcHlyaWdodC50eHQ7bWQ1PTcxOGYwNTE1NTk0MWIz
Mzg2MjcyNjM0OGQzY2Q0NmNlIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1NvdXJjZS9j
bWFrZS5oO2JlZ2lubGluZT0xO2VuZGxpbmU9MjttZDU9YTVmNzBlMWZlZjg2MTQ3MzRlYWUwZDYy
YjRmNTg5MWIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vVXRpbGl0aWVzL2NtanNvbmNw
cC9MSUNFTlNFO21kNT01ZDczYzE2NWEwZjllODZhMTM0MmYzMmQxOWVjNTkyNiBcCisgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJyaGFzaC9DT1BZSU5HO21kNT1hOGMy
YTU1N2E1YzUzYjFjMTJjZGRiZWU5OGMwOTlhZiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9VdGlsaXRpZXMvY21saWJ1di9MSUNFTlNFO21kNT1hZDkzY2ExZmZmZTkzMTUzN2ZjZjY0ZjZm
Y2NlMDg0ZCBcCisgICAgICAgICAgICAgICAgICAgICIKIERFUEVORFMgKz0gImN1cmwgZXhwYXQg
emxpYiBsaWJhcmNoaXZlIHh6IG5jdXJzZXMgYnppcDIiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZXNkayA9ICIgXApAQCAtMTIsMTEgKzM4LDYgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3Mt
bmF0aXZlc2RrID0gIiBcCiAiCiAKIExJQ0VOU0U6YXBwZW5kID0gIiAmIEJTRC0xLUNsYXVzZSAm
IE1JVCIKLUxJQ19GSUxFU19DSEtTVU06YXBwZW5kID0gIiBcCi0gICAgZmlsZTovL1V0aWxpdGll
cy9jbWpzb25jcHAvTElDRU5TRTttZDU9NWQ3M2MxNjVhMGY5ZTg2YTEzNDJmMzJkMTllYzU5MjYg
XAotICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJyaGFzaC9DT1BZSU5HO21kNT1hOGMyYTU1N2E1
YzUzYjFjMTJjZGRiZWU5OGMwOTlhZiBcCi0gICAgZmlsZTovL1V0aWxpdGllcy9jbWxpYnV2L0xJ
Q0VOU0U7bWQ1PWFkOTNjYTFmZmZlOTMxNTM3ZmNmNjRmNmZjY2UwODRkIFwKLSIKIAogIyBTdHJp
cCAke3ByZWZpeH0gZnJvbSAke2RvY2Rpcn0sIHNldCByZXN1bHQgaW50byBkb2NkaXJfc3RyaXBw
ZWQKIHB5dGhvbiAoKSB7Ci0tIAoyLjQyLjAKCg==

--===============6351622121483258043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b6e1deaf5af37226d7be34c2bd2a8d7483e74fe5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b6e1deaf5af37226d7be34c2bd2a8d7483e74fe5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 241 Local 142 Mirrors 0 Missed 99 Current 176 (58% match, 76% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 17 stale sstate objects for arch core2-64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 195 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 208 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 210 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 215 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 219 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 227 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 236 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 237 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 253 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 256 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 262 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 269 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 275 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 280 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 281 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 282 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 285 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 322 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 323 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 325 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 334 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 335 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 342 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 343 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 344 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 346 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 351 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe openssl-native-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 366 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 369 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 378 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 380 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 387 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_create_spdx_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 103 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 175 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_recipe_qa)
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-native-3.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 294 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 357 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 358 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-native-3.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 390 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_fetch)
NOTE: Running noexec task 454 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 460 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: Running task 462 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 468 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 470 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 476 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_fetch)
NOTE: Running task 479 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: Running task 480 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 482 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: Running task 490 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_recipe_qa unihash changed to 03d94cfaf3a2c4979083373b424269f4341bcc82a82f8e95b4d9da120825f0fe
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.12.2-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.12.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.19.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 391 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 505 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: Running task 506 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 517 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_unpack)
NOTE: Running task 518 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Running task 519 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 520 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 522 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: Running task 530 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_unpack)
NOTE: Running task 531 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 532 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running task 539 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: Running task 548 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_unpack)
NOTE: Running task 568 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_unpack: Started
NOTE: Running noexec task 570 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: Running task 572 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_unpack: Started
NOTE: recipe python3-native-3.12.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 573 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 574 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 575 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 576 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running setscene task 413 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 415 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 577 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 578 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Started
NOTE: Running task 608 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 611 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 612 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: Running task 618 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 621 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 622 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 623 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: Running task 653 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 655 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: Running task 656 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 676 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Started
NOTE: Running task 678 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 679 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 680 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_patch)
NOTE: Running task 681 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 684 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 691 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 692 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: Running task 693 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_patch)
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.3-r0: task do_patch: Started
NOTE: Running task 695 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 696 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 699 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.3-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 715 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 717 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 721 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 722 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: Running task 723 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 727 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_fetch)
NOTE: Running task 728 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 729 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: Running task 731 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz - will attempt other sources if available
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: Running task 738 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe curl-8.6.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: Running task 739 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe curl-8.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 743 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe curl-8.6.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: Running task 746 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe python3-native-3.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 747 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 748 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: Running task 751 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_fetch)
NOTE: Running task 754 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 756 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 758 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 761 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 763 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_recipe_qa)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 764 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 765 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_unpack)
NOTE: recipe rpm-native-1_4.19.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: Running task 766 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_generate_toolchain_file)
NOTE: recipe python3-native-3.12.2-r0: task do_patch: Started
NOTE: Running task 768 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe cmake-3.29.0-r0: task do_recipe_qa: Started
NOTE: recipe curl-8.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_patch)
NOTE: recipe bash-completion-2.12.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.19.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-8.6.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running task 842 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 843 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_patch: Succeeded
NOTE: Running task 845 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe bash-completion-2.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_patch)
NOTE: recipe curl-8.6.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe cmake-3.29.0-r0: task do_fetch: Started
NOTE: recipe cmake-3.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe cmake-3.29.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.12.2-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe cmake-3.29.0-r0: task do_unpack: Succeeded
NOTE: Running task 859 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_patch)
NOTE: recipe cmake-3.29.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.0-r0: task do_patch: Succeeded
NOTE: Running task 861 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_generate_toolchain_file)
NOTE: Running task 863 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_populate_lic)
NOTE: recipe cmake-3.29.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.29.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.29.0-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.29.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.29.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 864 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: recipe cmake-3.29.0-r0: task do_populate_lic: Failed
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 865 tasks of which 757 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401064958.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401064958.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_populate_lic
Summary: There were 5 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.28.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz
ERROR: cmake-native-3.28.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz\' has sha256 checksum \'72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1\' when \'a0669630aae7baa4a8228048bf30b622f9e9fd8ee8cedb941754e9e38686c778\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz')
ERROR: cmake-3.29.0-r0 do_populate_lic: QA Issue: cmake: The LIC_FILES_CHKSUM does not match for file://Copyright.txt;md5=9d3d12c5f3b4c1f83650adcc65b59c06
cmake: The new md5 checksum is 718f05155941b33862726348d3cd46ce
cmake: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
CMake - Cross Platform Makefile Generator
Copyright 2000-2024 Kitware, Inc. and Contributors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
...
   as part of the Insight Segmentation and Registration Toolkit (ITK).

 * US National Labs (Los Alamos, Livermore, Sandia) ASC Parallel
   Visualization Initiative.

 * National Alliance for Medical Image Computing (NAMIC) is funded by the
   National Institutes of Health through the NIH Roadmap for Medical Research,
   Grant U54 EB005149.

 * Kitware, Inc.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cmake: Check if the license information has changed in /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cmake/3.29.0/cmake-3.29.0/Copyright.txt to verify that the LICENSE value "BSD-3-Clause & BSD-1-Clause & MIT" remains valid [license-checksum]
ERROR: cmake-3.29.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.28.3/temp/log.do_fetch.2717118
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cmake/3.29.0/temp/log.do_populate_lic.2724308
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.0.bb:do_populate_lic) failed with exit code '1'

--===============6351622121483258043==--

