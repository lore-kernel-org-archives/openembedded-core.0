Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5E0C2BA2B
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13431.1713248038653455780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BTQ2uude;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MyYXXnTo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6b43-b6497698-78cb-4587-a4c3-102afcd74246-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248037;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dmELbu3joxgqbNy584nFAf3QyhfxJUrMbavAdxMR0S8=;
	b=BTQ2uudeCKpJrLnYRfM4d88DGL1zEbgrGXZORjoePqdv919h6LhqtgBCPRZJE5U8
	LIYF+sVap0NV5VUXaAVYkuUqVAlPCwypiZ3+gzEzDsa+MR6wb9Jf7O5MMZoWTxJX7dA
	8PA7evENMDN0CD+uPSfIwUJUjkGIb14sHNU76Y+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248037;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dmELbu3joxgqbNy584nFAf3QyhfxJUrMbavAdxMR0S8=;
	b=MyYXXnTop2RLKKBeq66p6imuvcsWnLaSSqteAsUowdoBc6sp4RQYwWrz9+bdDXf0
	frNFn3fHGSu7XhZPAf+LcBTTjNB65l33ULy6cFEm1hM2f14BW+Ct4PsgYUlkryZrvtW
	t7EeliJ7WbzQbuQNMqBkYnh76I70oQP124kkhiPQ=
Content-Type: multipart/mixed; boundary="===============6745731632718749590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.29.2 FAILED
Message-ID: <0101018ee58a6b43-b6497698-78cb-4587-a4c3-102afcd74246-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:57 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198273

--===============6745731632718749590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.29.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.28.3-3.29.2.patch
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
From 844b52bc9016ece1d620e09cdb6ba3bf82461973 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:15:52 +0000
Subject: [PATCH] cmake: upgrade 3.28.3 -> 3.29.2

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 .../{cmake_3.28.3.bb => cmake_3.29.2.bb}      | 31 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake_3.28.3.bb => cmake_3.29.2.bb} (64%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05..9cf4e6c248 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
+SRC_URI[sha256sum] = "36db4b6926aab741ba6e4b2ea2d99c9193222132308b4dc824d4123cb730352e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.2.bb
similarity index 64%
rename from meta/recipes-devtools/cmake/cmake_3.28.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.2.bb
index 6a9a3266df..0339887a29 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.29.2.bb
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


--===============6745731632718749590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.28.3-3.29.2.patch"

RnJvbSA4NDRiNTJiYzkwMTZlY2UxZDYyMGUwOWNkYjZiYTNiZjgyNDYxOTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6MTU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI4LjMgLT4gMy4yOS4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICB8ICAyICstCiAuLi4ve2NtYWtlXzMuMjguMy5iYiA9
PiBjbWFrZV8zLjI5LjIuYmJ9ICAgICAgfCAzMSArKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI4LjMuYmIgPT4gY21ha2VfMy4yOS4yLmJi
fSAoNjQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGFiOWY0NTlj
MDUuLjljZjRlNmMyNDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAt
MTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFy
KCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9m
aWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzJiNzU3MGU1Yzg1OTNkZTZhYzRhYjQzM2I3M2VhYjE4YzVm
YjMyODg4MDQ2MGM4NmNlMzI2MDgxNDFhZDVjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNmRi
NGI2OTI2YWFiNzQxYmE2ZTRiMmVhMmQ5OWM5MTkzMjIyMTMyMzA4YjRkYzgyNGQ0MTIzY2I3MzAz
NTJlIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCsp
KylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzMuMjguMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA2NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlXzMuMjguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlXzMuMjkuMi5iYgppbmRleCA2YTlhMzI2NmRmLi4wMzM5ODg3YTI5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yOC4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjIuYmIKQEAgLTEsNyArMSwzMyBAQAor
IyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5
ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUg
dGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGlu
CisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhh
bXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBU
aGUgY2hhbmdlczoKKyMKKyMgLS0tIENvcHlyaWdodC50eHQKKyMgKysrIENvcHlyaWdodC50eHQK
KyMgQEAgLTEsNSArMSw1IEBACisjICBDTWFrZSAtIENyb3NzIFBsYXRmb3JtIE1ha2VmaWxlIEdl
bmVyYXRvcgorIyAtQ29weXJpZ2h0IDIwMDAtMjAyMyBLaXR3YXJlLCBJbmMuIGFuZCBDb250cmli
dXRvcnMKKyMgK0NvcHlyaWdodCAyMDAwLTIwMjQgS2l0d2FyZSwgSW5jLiBhbmQgQ29udHJpYnV0
b3JzCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQg
dXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisK
IHJlcXVpcmUgY21ha2UuaW5jCiAKIGluaGVyaXQgY21ha2UgYmFzaC1jb21wbGV0aW9uCiAKK0xJ
Q19GSUxFU19DSEtTVU0gKz0gImZpbGU6Ly9Db3B5cmlnaHQudHh0O21kNT03MThmMDUxNTU5NDFi
MzM4NjI3MjYzNDhkM2NkNDZjZSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Tb3VyY2Uv
Y21ha2UuaDtiZWdpbmxpbmU9MTtlbmRsaW5lPTI7bWQ1PWE1ZjcwZTFmZWY4NjE0NzM0ZWFlMGQ2
MmI0ZjU4OTFiIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1V0aWxpdGllcy9jbWpzb25j
cHAvTElDRU5TRTttZDU9NWQ3M2MxNjVhMGY5ZTg2YTEzNDJmMzJkMTllYzU5MjYgXAorICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vVXRpbGl0aWVzL2NtbGlicmhhc2gvQ09QWUlORzttZDU9YThj
MmE1NTdhNWM1M2IxYzEyY2RkYmVlOThjMDk5YWYgXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vVXRpbGl0aWVzL2NtbGlidXYvTElDRU5TRTttZDU9YWQ5M2NhMWZmZmU5MzE1MzdmY2Y2NGY2
ZmNjZTA4NGQgXAorICAgICAgICAgICAgICAgICAgICAiCiBERVBFTkRTICs9ICJjdXJsIGV4cGF0
IHpsaWIgbGliYXJjaGl2ZSB4eiBuY3Vyc2VzIGJ6aXAyIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy1uYXRpdmVzZGsgPSAiIFwKQEAgLTEyLDExICszOCw2IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZXNkayA9ICIgXAogIgogCiBMSUNFTlNFOmFwcGVuZCA9ICIgJiBCU0QtMS1DbGF1c2Ug
JiBNSVQiCi1MSUNfRklMRVNfQ0hLU1VNOmFwcGVuZCA9ICIgXAotICAgIGZpbGU6Ly9VdGlsaXRp
ZXMvY21qc29uY3BwL0xJQ0VOU0U7bWQ1PTVkNzNjMTY1YTBmOWU4NmExMzQyZjMyZDE5ZWM1OTI2
IFwKLSAgICBmaWxlOi8vVXRpbGl0aWVzL2NtbGlicmhhc2gvQ09QWUlORzttZDU9YThjMmE1NTdh
NWM1M2IxYzEyY2RkYmVlOThjMDk5YWYgXAotICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJ1di9M
SUNFTlNFO21kNT1hZDkzY2ExZmZmZTkzMTUzN2ZjZjY0ZjZmY2NlMDg0ZCBcCi0iCiAKICMgU3Ry
aXAgJHtwcmVmaXh9IGZyb20gJHtkb2NkaXJ9LCBzZXQgcmVzdWx0IGludG8gZG9jZGlyX3N0cmlw
cGVkCiBweXRob24gKCkgewotLSAKMi40Mi4wCgo=

--===============6745731632718749590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-e976f5f745a5a637575dd3434bfc6491c73e64a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e976f5f745a5a637575dd3434bfc6491c73e64a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 212 Local 116 Mirrors 0 Missed 96 Current 205 (54% match, 76% complete)
Removing 7 stale sstate objects for arch core2-64...done.
Removing 13 stale sstate objects for arch x86_64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 224 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 235 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 237 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 242 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 246 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 283 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 289 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.29.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 295 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 305 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: Running setscene task 306 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 307 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 308 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 338 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-3.29.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 355 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 359 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 217 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe cmake-3.29.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 249 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 251 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 264 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 277 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 279 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_fetch)
NOTE: Running task 283 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 284 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe cmake-3.29.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 288 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 292 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 294 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe openssl-native-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-native-10.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 314 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 316 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_fetch)
NOTE: Running task 320 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: Running task 321 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 322 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 323 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: Running task 324 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: Running task 325 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 385 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.7.1-r0: task do_fetch: Started
NOTE: Running setscene task 387 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 394 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 336 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: recipe curl-8.7.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 374 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 375 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gettext-minimal-native-0.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 379 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 391 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 392 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 393 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 395 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: Running task 397 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_fetch)
NOTE: Running task 398 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 399 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 523 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: Running setscene task 407 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 410 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 670 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 686 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 687 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 688 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 689 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 709 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 720 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 723 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 724 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 726 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: Running task 727 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: Running task 729 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 733 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_unpack)
NOTE: Running task 736 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 737 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe openssl-3.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: Running task 738 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 741 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 742 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 743 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe curl-8.7.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_patch: Started
NOTE: Running task 746 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 749 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 752 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 754 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 783 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe cmake-3.29.2-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_patch)
NOTE: recipe cmake-3.29.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe openssl-3.2.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe curl-8.7.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_patch: Started
NOTE: Running task 833 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_patch)
NOTE: recipe bash-completion-2.12.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe curl-8.7.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe curl-8.7.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz - will attempt other sources if available
NOTE: Running task 841 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe cmake-3.29.2-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_patch)
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.29.2-r0: task do_patch: Started
NOTE: recipe cmake-3.29.2-r0: task do_patch: Succeeded
NOTE: Running task 846 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_generate_toolchain_file)
NOTE: Running task 847 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_populate_lic)
NOTE: recipe cmake-3.29.2-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.29.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.29.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 848 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Failed
NOTE: recipe cmake-3.29.2-r0: task do_populate_lic: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 872 tasks of which 804 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415181531.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415181531.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_populate_lic
Summary: There were 5 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.28.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz
ERROR: cmake-native-3.28.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz\' has sha256 checksum \'72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1\' when \'36db4b6926aab741ba6e4b2ea2d99c9193222132308b4dc824d4123cb730352e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz')
ERROR: cmake-3.29.2-r0 do_populate_lic: QA Issue: cmake: The LIC_FILES_CHKSUM does not match for file://Copyright.txt;md5=9d3d12c5f3b4c1f83650adcc65b59c06
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
cmake: Check if the license information has changed in /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cmake/3.29.2/cmake-3.29.2/Copyright.txt to verify that the LICENSE value "BSD-3-Clause & BSD-1-Clause & MIT" remains valid [license-checksum]
ERROR: cmake-3.29.2-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.28.3/temp/log.do_fetch.850087
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cmake/3.29.2/temp/log.do_populate_lic.853327
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.29.2.bb:do_populate_lic) failed with exit code '1'

--===============6745731632718749590==--

