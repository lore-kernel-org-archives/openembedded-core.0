Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F39BC52D7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131434.1723748334879712346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SRAGq/zG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=M+0YIBwq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157683a6a-f20c943f-6cad-4252-aa6d-8b9648d53e92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g9WWH2Y+x6jOCMSk/6vIxagLdgzCnpzcBFd+Sjj4E8U=;
	b=SRAGq/zGevVWo46yS+yRtYPAR6efN4e4BuFOiZxCl2njLRWrAPakhDDoempn4TNG
	SvmcTKPxDKKS3EPNGURlY46W95Uvb07mqFzpXnzq8LNFaq2K32V7kApBTBJsWN3oWzY
	gHXLZGolDe+wd+6NjfqFwkd6qdpIqIGJr3HBAlek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g9WWH2Y+x6jOCMSk/6vIxagLdgzCnpzcBFd+Sjj4E8U=;
	b=M+0YIBwqpKRhd37hRrlbk4NDTrHL0Y5DVlmSoZXhwxWodNrN9Hiw4A0jFsJcZ9Vl
	gG+jYrzga3LijhLPL7ytrMW+S/TGi1O17G7GZ91yon/532ZF/BlEP6AEtJIKphMdbX/
	KcaZVoqqwc7tIkLPz/s2oUMvct24HJ8ZnqkMkCVI=
Content-Type: multipart/mixed; boundary="===============3798787313377897867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.0.1 FAILED
Message-ID: <0101019157683a6a-f20c943f-6cad-4252-aa6d-8b9648d53e92-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203383

--===============3798787313377897867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.26.4-2.0.1.patch
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
From 842b1e425541c39a2121104b6a4e0039fa947bc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:56:10 +0000
Subject: [PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.1

---
 ...-and-so-on-for-libraries-by-default-.patch |  5 ++--
 ...1-numpy-core-Define-RISCV-32-support.patch | 23 ++++++++-----------
 .../python3-numpy/fix_reproducibility.patch   | 23 ++++++++++++-------
 ...numpy_1.26.4.bb => python3-numpy_2.0.1.bb} | 23 +++++++++++++++++--
 4 files changed, 48 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.1.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index bbe309c556..9cb2617399 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
+From 8a1cf08ca668844122f8d833d20a701005d1fe08 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,13 +8,12 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index feb28f6..a48d6d1 100644
+index edf5690..3b55df1 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
 @@ -327,44 +327,14 @@ def add_system_root(library_root):
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3af..2077bede3f 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From fec1f30e23b54e664c3f089038e4e5d206eadc45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -8,14 +8,14 @@ Helps compile on riscv32
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 3 +++
- numpy/core/include/numpy/npy_endian.h | 1 +
+ numpy/_core/include/numpy/npy_cpu.h    | 3 +++
+ numpy/_core/include/numpy/npy_endian.h | 1 +
  2 files changed, 4 insertions(+)
 
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
+diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
+index a19f8e6..d824d4e 100644
+--- a/numpy/_core/include/numpy/npy_cpu.h
++++ b/numpy/_core/include/numpy/npy_cpu.h
 @@ -19,6 +19,7 @@
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
@@ -33,10 +33,10 @@ index 78d229e..04be511 100644
  #elif defined(__loongarch__)
      #define NPY_CPU_LOONGARCH
  #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
+diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
 index 5e58a7f..0926212 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
+--- a/numpy/_core/include/numpy/npy_endian.h
++++ b/numpy/_core/include/numpy/npy_endian.h
 @@ -49,6 +49,7 @@
              || defined(NPY_CPU_PPC64LE)       \
              || defined(NPY_CPU_ARCEL)         \
@@ -45,6 +45,3 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_LOONGARCH)     \
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index d952aed00c..7b9c98f0ba 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From e97d5d615d49105a98391eb9f72dd5e6df13c2cb Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Sep 2023 22:53:24 +0100
+Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
+ not.
 
 It includes "od", which happens to be a substring of "reproducible"
-but not "qemux86-world". 
+but not "qemux86-world".
 
 The regex will run against all compiler options including things like:
 
@@ -17,12 +21,15 @@ reproducible target ran first and won the race to populate sstate.
 
 Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-===================================================================
---- numpy-1.26.0.orig/numpy/distutils/ccompiler_opt.py
-+++ numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-@@ -990,7 +990,7 @@ class _CCompiler:
+---
+ numpy/distutils/ccompiler_opt.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
+index b1a6fa3..7b0302b 100644
+--- a/numpy/distutils/ccompiler_opt.py
++++ b/numpy/distutils/ccompiler_opt.py
+@@ -991,7 +991,7 @@ def __init__(self):
              ("cc_is_nocc",     "", ""),
          )
          detect_args = (
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.1.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.0.1.bb
index 914245507c..db6226724a 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.0.1.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2005-2023, NumPy Developers.
+# +Copyright (c) 2005-2024, NumPy Developers.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
 
 SRCNAME = "numpy"
 
@@ -13,7 +32,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
+SRC_URI[sha256sum] = "485b87235796410c3519a699cfe1faab097e509e90ebb05dcd098db2ae87e7b3"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.44.0


--===============3798787313377897867==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.26.4-2.0.1.patch"

RnJvbSA4NDJiMWU0MjU1NDFjMzlhMjEyMTEwNGI2YTRlMDAzOWZhOTQ3YmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6NTY6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjYuNCAtPiAyLjAuMQoKLS0tCiAuLi4tYW5kLXNvLW9u
LWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2ggfCAgNSArKy0tCiAuLi4xLW51bXB5LWNv
cmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2ggfCAyMyArKysrKysrKy0tLS0tLS0tLS0t
CiAuLi4vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgfCAyMyArKysr
KysrKysrKystLS0tLS0tCiAuLi5udW1weV8xLjI2LjQuYmIgPT4gcHl0aG9uMy1udW1weV8yLjAu
MS5iYn0gfCAyMyArKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2Vy
dGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtbnVtcHlfMS4yNi40LmJiID0+IHB5dGhvbjMtbnVtcHlfMi4wLjEuYmJ9
ICg3NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1k
ZWZhdWx0LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVs
dC0ucGF0Y2gKaW5kZXggYmJlMzA5YzU1Ni4uOWNiMjYxNzM5OSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVz
ci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNy
LWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0NmVlYTY2NGNmODlkMDYwMmU3ZmYxNmQ1ODdjMzdjMDQ1YjEyNWI3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YTFjZjA4Y2E2Njg4NDQxMjJmOGQ4MzNkMjBhNzAxMDA1
ZDFmZTA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEwIERlYyAyMDE1IDEzOjIwOjMw
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJjaCAvdXNyIGFuZCBzbyBvbiBmb3Ig
bGlicmFyaWVzIGJ5IGRlZmF1bHQgdG8KQEAgLTgsMTMgKzgsMTIgQEAgU3ViamVjdDogW1BBVENI
XSBEb24ndCBzZWFyY2ggL3VzciBhbmQgc28gb24gZm9yIGxpYnJhcmllcyBieSBkZWZhdWx0IHRv
CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgKEFzIHRoZSBjb2RlIHN0YW5kcywgdGhp
cyBpcyBhIGhhY2spCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50
ZWwuY29tPgogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+Ci0KIC0tLQogIG51bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weSB8IDQyICsr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL251bXB5L2Rpc3R1dGls
cy9zeXN0ZW1faW5mby5weSBiL251bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weQotaW5kZXgg
ZmViMjhmNi4uYTQ4ZDZkMSAxMDA2NDQKK2luZGV4IGVkZjU2OTAuLjNiNTVkZjEgMTAwNjQ0CiAt
LS0gYS9udW1weS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkKICsrKyBiL251bXB5L2Rpc3R1dGls
cy9zeXN0ZW1faW5mby5weQogQEAgLTMyNyw0NCArMzI3LDE0IEBAIGRlZiBhZGRfc3lzdGVtX3Jv
b3QobGlicmFyeV9yb290KToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weS8wMDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1u
dW1weS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoCmluZGV4IDY3NmJkYmIzYWYu
LjIwNzdiZWRlM2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1udW1weS8wMDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtbnVt
cHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZWI2ZDY1NzkxNTBiZjQ2ODQ2MDNjZTM3N2M1MWU5MGFkM2JiODEwOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZmVjMWYzMGUyM2I1NGU2NjRjM2YwODkwMzhlNGU1ZDIwNmVhZGM0
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBTdW4sIDE1IE5vdiAyMDIwIDE1OjMyOjM5IC0wODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIG51bXB5L2NvcmU6IERlZmluZSBSSVNDVi0zMiBzdXBwb3J0CkBAIC04LDE0ICs4LDE0
IEBAIEhlbHBzIGNvbXBpbGUgb24gcmlzY3YzMgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vZ2l0aHViLmNvbS9udW1weS9udW1weS9wdWxsLzE3NzgwXQogU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0tLQotIG51bXB5L2NvcmUvaW5jbHVk
ZS9udW1weS9ucHlfY3B1LmggICAgfCAzICsrKwotIG51bXB5L2NvcmUvaW5jbHVkZS9udW1weS9u
cHlfZW5kaWFuLmggfCAxICsKKyBudW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9jcHUuaCAg
ICB8IDMgKysrCisgbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfZW5kaWFuLmggfCAxICsK
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCi1kaWZmIC0tZ2l0IGEvbnVtcHkv
Y29yZS9pbmNsdWRlL251bXB5L25weV9jcHUuaCBiL251bXB5L2NvcmUvaW5jbHVkZS9udW1weS9u
cHlfY3B1LmgKLWluZGV4IDc4ZDIyOWUuLjA0YmU1MTEgMTAwNjQ0Ci0tLS0gYS9udW1weS9jb3Jl
L2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oCi0rKysgYi9udW1weS9jb3JlL2luY2x1ZGUvbnVtcHkv
bnB5X2NwdS5oCitkaWZmIC0tZ2l0IGEvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1
LmggYi9udW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9jcHUuaAoraW5kZXggYTE5ZjhlNi4u
ZDgyNGQ0ZSAxMDA2NDQKKy0tLSBhL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5o
CisrKysgYi9udW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9jcHUuaAogQEAgLTE5LDYgKzE5
LDcgQEAKICAgKiAgICAgICAgICAgICAgTlBZX0NQVV9BUkNFQgogICAqICAgICAgICAgICAgICBO
UFlfQ1BVX1JJU0NWNjQKQEAgLTMzLDEwICszMywxMCBAQCBpbmRleCA3OGQyMjllLi4wNGJlNTEx
IDEwMDY0NAogICNlbGlmIGRlZmluZWQoX19sb29uZ2FyY2hfXykKICAgICAgI2RlZmluZSBOUFlf
Q1BVX0xPT05HQVJDSAogICNlbGlmIGRlZmluZWQoX19FTVNDUklQVEVOX18pCi1kaWZmIC0tZ2l0
IGEvbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25weV9lbmRpYW4uaCBiL251bXB5L2NvcmUvaW5j
bHVkZS9udW1weS9ucHlfZW5kaWFuLmgKK2RpZmYgLS1naXQgYS9udW1weS9fY29yZS9pbmNsdWRl
L251bXB5L25weV9lbmRpYW4uaCBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2VuZGlh
bi5oCiBpbmRleCA1ZTU4YTdmLi4wOTI2MjEyIDEwMDY0NAotLS0tIGEvbnVtcHkvY29yZS9pbmNs
dWRlL251bXB5L25weV9lbmRpYW4uaAotKysrIGIvbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25w
eV9lbmRpYW4uaAorLS0tIGEvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfZW5kaWFuLmgK
KysrKyBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2VuZGlhbi5oCiBAQCAtNDksNiAr
NDksNyBAQAogICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZX0NQVV9QUEM2NExFKSAgICAgICBc
CiAgICAgICAgICAgICAgfHwgZGVmaW5lZChOUFlfQ1BVX0FSQ0VMKSAgICAgICAgIFwKQEAgLTQ1
LDYgKzQ1LDMgQEAgaW5kZXggNWU1OGE3Zi4uMDkyNjIxMiAxMDA2NDQKICAgICAgICAgICAgICB8
fCBkZWZpbmVkKE5QWV9DUFVfTE9PTkdBUkNIKSAgICAgXAogICAgICAgICAgICAgIHx8IGRlZmlu
ZWQoTlBZX0NQVV9XQVNNKQogICAgICAgICAgI2RlZmluZSBOUFlfQllURV9PUkRFUiBOUFlfTElU
VExFX0VORElBTgotLS0gCi0yLjIwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0
eS5wYXRjaAppbmRleCBkOTUyYWVkMDBjLi43YjljOThmMGJhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4
X3JlcHJvZHVjaWJpbGl0eS5wYXRjaApAQCAtMSw3ICsxLDExIEBACi1UaGlzIHJlZ2V4IGRlY2lk
ZXMgd2hldGhlciB0byB1c2UgTzMgb3BpbWlzYXRpb24gb24gbnVtcHkgb3Igbm90LgorRnJvbSBl
OTdkNWQ2MTVkNDkxMDVhOTgzOTFlYjlmNzJkZDVlNmRmMTNjMmNiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CitEYXRlOiBGcmksIDI5IFNlcCAyMDIzIDIyOjUzOjI0ICswMTAwCitTdWJqZWN0
OiBbUEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlv
biBvbiBudW1weSBvcgorIG5vdC4KIAogSXQgaW5jbHVkZXMgIm9kIiwgd2hpY2ggaGFwcGVucyB0
byBiZSBhIHN1YnN0cmluZyBvZiAicmVwcm9kdWNpYmxlIgotYnV0IG5vdCAicWVtdXg4Ni13b3Js
ZCIuIAorYnV0IG5vdCAicWVtdXg4Ni13b3JsZCIuCiAKIFRoZSByZWdleCB3aWxsIHJ1biBhZ2Fp
bnN0IGFsbCBjb21waWxlciBvcHRpb25zIGluY2x1ZGluZyB0aGluZ3MgbGlrZToKIApAQCAtMTcs
MTIgKzIxLDE1IEBAIHJlcHJvZHVjaWJsZSB0YXJnZXQgcmFuIGZpcnN0IGFuZCB3b24gdGhlIHJh
Y2UgdG8gcG9wdWxhdGUgc3N0YXRlLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W3Vwc3RyZWFtIGhhdmUgZHJvcHBlZCBkaXN0dXRpbHMgYW5kIHN3aXRjaGVkIHRvIG1lc29uXQog
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Ci0KLUluZGV4OiBudW1weS0xLjI2LjAvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxl
cl9vcHQucHkKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KLS0tLSBudW1weS0xLjI2LjAub3JpZy9udW1weS9kaXN0dXRp
bHMvY2NvbXBpbGVyX29wdC5weQotKysrIG51bXB5LTEuMjYuMC9udW1weS9kaXN0dXRpbHMvY2Nv
bXBpbGVyX29wdC5weQotQEAgLTk5MCw3ICs5OTAsNyBAQCBjbGFzcyBfQ0NvbXBpbGVyOgorLS0t
CisgbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkgfCAyICstCisgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9udW1weS9k
aXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weSBiL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0
LnB5CitpbmRleCBiMWE2ZmEzLi43YjAzMDJiIDEwMDY0NAorLS0tIGEvbnVtcHkvZGlzdHV0aWxz
L2Njb21waWxlcl9vcHQucHkKKysrKyBiL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5
CitAQCAtOTkxLDcgKzk5MSw3IEBAIGRlZiBfX2luaXRfXyhzZWxmKToKICAgICAgICAgICAgICAo
ImNjX2lzX25vY2MiLCAgICAgIiIsICIiKSwKICAgICAgICAgICkKICAgICAgICAgIGRldGVjdF9h
cmdzID0gKApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjYuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weV8yLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4wLjEuYmIKaW5kZXggOTE0
MjQ1NTA3Yy4uZGI2MjI2NzI0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW51bXB5XzEuMjYuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4wLjEuYmIKQEAgLTEsOSArMSwyOCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UudHh0CisjICsrKyBMSUNFTlNFLnR4dAorIyBAQCAtMSw0ICsx
LDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAwNS0yMDIzLCBOdW1QeSBEZXZlbG9wZXJzLgorIyAr
Q29weXJpZ2h0IChjKSAyMDA1LTIwMjQsIE51bVB5IERldmVsb3BlcnMuCisjICBBbGwgcmlnaHRz
IHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQg
YmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisKIFNVTU1BUlkgPSAiQSBzb3Bo
aXN0aWNhdGVkIE51bWVyaWMgUHJvY2Vzc2luZyBQYWNrYWdlIGZvciBQeXRob24iCiBIT01FUEFH
RSA9ICJodHRwczovL251bXB5Lm9yZy8iCiBERVNDUklQVElPTiA9ICJOdW1QeSBpcyB0aGUgZnVu
ZGFtZW50YWwgcGFja2FnZSBuZWVkZWQgZm9yIHNjaWVudGlmaWMgY29tcHV0aW5nIHdpdGggUHl0
aG9uLiIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2Ug
JiBCU0QtMi1DbGF1c2UgJiBQU0YtMi4wICYgQXBhY2hlLTIuMCAmIE1JVCIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1hNzUyZWIyMDQ1OWNmNzRhOWQ4NGVlNDgy
NWU4MzE3YyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0xZGU4
NjNjMzdhODNlNzFiMWU5N2I2NGQwMzZlYTc4YiIKIAogU1JDTkFNRSA9ICJudW1weSIKIApAQCAt
MTMsNyArMzIsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQ
Vn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vZml4X3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmEwMmFiYTllZDEyZTRhYzRlYjNlYTk0MjFj
NDIwMzAxYTBjNjQ2MGQ5ODMwZDc0YTlkZjg3ZWZhNDkxMjAxMCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI0ODViODcyMzU3OTY0MTBjMzUxOWE2OTljZmUxZmFhYjA5N2U1MDllOTBlYmIwNWRjZDA5
OGRiMmFlODdlN2IzIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFn
L3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIuNDQuMAoK

--===============3798787313377897867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-a2a586b5c238fd839416374cee9c023ae53b00f7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a2a586b5c238fd839416374cee9c023ae53b00f7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 342 Local 329 Mirrors 0 Missed 13 Current 416 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 489 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1283 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_fetch)
NOTE: recipe python3-numpy-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1612 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_unpack)
NOTE: Running task 1613 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2109 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_patch)
NOTE: Running task 2110 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2112 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_check_backend)
NOTE: Running task 2113 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-2.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_check_backend: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-numpy-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_deploy_source_date_epoch unihash changed to 2902edaa97d5017dd7c1763533d39327fb43309eb7d8333874d0c1efa813512a
NOTE: Setscene tasks completed
NOTE: Running task 2114 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_configure)
NOTE: recipe python3-numpy-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_populate_lic unihash changed to 7321dc18dfac1ef449b5fa6e1ec3378295dce8a052f42e5fe5536184986b968a
NOTE: recipe python3-numpy-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2116 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_compile)
NOTE: recipe python3-numpy-2.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/numpy-2.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551, line 181
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551, line 171
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551, line 185
NOTE: recipe python3-numpy-2.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2116 tasks of which 2105 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815115554.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815115554.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-numpy-2.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-numpy-2.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/run.do_compile.53551', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.1/temp/log.do_compile.53551
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.1.bb:do_compile) failed with exit code '1'

--===============3798787313377897867==--

