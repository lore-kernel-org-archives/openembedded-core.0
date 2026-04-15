Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D96F428F5
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19818.1776261877443292947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=U8QoXsHZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bdCav9AD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91756e11-333d13e2-677d-43d4-86a9-8e745c124dfd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1tcIQeIkrO2MUoFVb1HZzp5QVi5vgXbE02cgOzeCkuA=;
	b=U8QoXsHZnNg2SpIoJoUIH3XED0ZjAJ5zKM2ZDfsznoOJya79rGlo8oUrELtDuNlt
	HpD4DEsp3d7Z2wXbHAj8DAqpbQGVGkk9qGqYJRhti/ssEPK3i7pEM5C31NSOHPdVfoU
	58AQ0H9iPb3tr4ziaJs6Afqw6+YpeYOr1iX5rp9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1tcIQeIkrO2MUoFVb1HZzp5QVi5vgXbE02cgOzeCkuA=;
	b=bdCav9ADJq2x4d3LG6sIzeiGkqaw0Iu9Tttc6iHhtIVbcB5R68jD3siXp3pn57uI
	vUnr4fxzQx3ZmIj4DyN2uvFBI0tcMq2MX5EDITjfILt+YN8sfG3B6Nc3JYL/ofK8HEC
	BYG/MDr0hYBaiyJQPArVB/Pg334ZRXQIJhLCarvc=
Content-Type: multipart/mixed; boundary="===============5365016233969022512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.07.0 SUCCEEDED
Message-ID: <0101019d91756e11-333d13e2-677d-43d4-86a9-8e745c124dfd-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235262

--===============5365016233969022512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ghostscript* to *10.07.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.06.0-10.07.0.patch
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
From c39157782b90c7996b114478dc1dc39533385451 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:51:34 +0000
Subject: [PATCH] ghostscript: upgrade 10.06.0 -> 10.07.0

---
 .../ghostscript/0001-Fix-32-bit-build.patch   | 63 -------------------
 ...ace-static-const-double-with-macros-.patch |  4 +-
 .../avoid-host-contamination.patch            |  4 +-
 .../ghostscript-9.16-Werror-return-type.patch |  2 +-
 .../ghostscript/ghostscript/out-of-tree.patch | 21 ++++---
 ...ript_10.06.0.bb => ghostscript_10.07.0.bb} |  3 +-
 6 files changed, 20 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.06.0.bb => ghostscript_10.07.0.bb} (95%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
deleted file mode 100644
index 8d1e9d46e6..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Fix-32-bit-build.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
-From: Ken Sharp <Ken.Sharp@artifex.com>
-Date: Wed, 10 Sep 2025 08:55:30 +0100
-Subject: [PATCH] Fix 32-bit build
-
-Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
-
-nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
-arithmetic. Previously it was a uint, should be a int64_t, to fit with
-all the other devices.
-
-Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
-that while we're here (signed/unsigned mismatch, we don't really care).
-
-Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f]
-
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- base/gdevdbit.c | 2 +-
- base/gdevmpla.c | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/base/gdevdbit.c b/base/gdevdbit.c
-index e07cc3f3b8..1b5c69325b 100644
---- a/base/gdevdbit.c
-+++ b/base/gdevdbit.c
-@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
-     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
-     row_alpha = data;
-     out_raster = bitmap_raster(width * (size_t)byte_depth);
--    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
-+    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
-         return gs_note_error(gs_error_undefinedresult);
-     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
-     if (gb_buff == 0) {
-diff --git a/base/gdevmpla.c b/base/gdevmpla.c
-index 2f0d522561..ffc5ff42e6 100644
---- a/base/gdevmpla.c
-+++ b/base/gdevmpla.c
-@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
-         int i;
-         int j;
-         intptr_t chunky_sraster;
--        intptr_t nbytes;
-+        int64_t nbytes;
-         byte **line_ptrs;
-         byte *sbuf, *buf;
- 
-         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
--        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
-+        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
-             return gs_note_error(gs_error_undefinedresult);
-         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
-         if (buf == NULL) {
-@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
-         intptr_t i;
-         intptr_t chunky_t_raster;
-         int chunky_t_height;
--        intptr_t nbytes;
-+        int64_t nbytes;
-         byte **line_ptrs;
-         byte *tbuf, *buf;
-         gx_strip_bitmap newtex;
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
index 6f310abf2e..534ddf1fb3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
@@ -1,4 +1,4 @@
-From 0298799777bd179c455e5ce8d6008b2d84732967 Mon Sep 17 00:00:00 2001
+From 002360316bafe474295be83034576478f65a6029 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 7 Apr 2026 22:40:26 -0700
 Subject: [PATCH] psi/ztype.c: replace static const double with macros for
@@ -28,6 +28,6 @@ index a01d83f..d454778 100644
 +
 +#define min_int_real ((double)(ALT_MIN_INT) - 1.0)
 +#define max_int_real ((double)(ALT_MAX_INT) + 1.0)
-
+ 
  #define REAL_CAN_BE_INT(v)\
    ((v) > min_int_real && (v) < max_int_real)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index d191231c7b..0e09eaf4e2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
+From 6d40b14e75d742fbccdcd507f0cd425c995fd6e5 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index a5dbc7a..27b55f2 100644
+index 1e44e8d..f4d95da 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
 @@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 0598c3dcd2..48760a008d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,4 +1,4 @@
-From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
+From 960629e0b80998d393b133a17e0f96d7fdfa229a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
 Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index 202c9d6c7c..d5e19a6154 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,14 +1,21 @@
-Fix the build to do out-of-tree properly.
+From 9345c565e87a2456e4d780dee5f4b76e0e4e4854 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 2 Apr 2026 14:41:42 +0100
+Subject: [PATCH] Fix the build to do out-of-tree properly.
 
 The patches are in progress but are being submitted upstream.
 
 Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709289]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff -rU3 a/configure.ac b/configure.ac
---- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
-+++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
-@@ -400,7 +400,7 @@
+diff --git a/configure.ac b/configure.ac
+index d01807b..dd00e86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -400,7 +400,7 @@ if test x"$with_arch_h" = x""; then
            *)
              ARCH_CONF_HEADER=
              if test x"$host" != x"$build"; then
@@ -17,7 +24,7 @@ diff -rU3 a/configure.ac b/configure.ac
              else
                ARCH_CONF_HEADER=
              fi
-@@ -869,8 +869,8 @@
+@@ -872,8 +872,8 @@ AC_SUBST(PTHREAD_LIBS)
  AC_SUBST(RECURSIVE_MUTEXATTR)
  
  dnl Tesseract/Leptonica detection
@@ -28,7 +35,7 @@ diff -rU3 a/configure.ac b/configure.ac
  OCR_VERSION=0
  OCR_SHARED=0
  LEPTONICAINCLUDE=
-@@ -886,7 +886,7 @@
+@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-tesseract],
  
  if test x$with_tesseract != xno; then
    AC_MSG_CHECKING([for local Tesseract library source])
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
similarity index 95%
rename from meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
index 1363aa281e..1b6cb4aaae 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
@@ -24,12 +24,11 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Fix-32-bit-build.patch \
            file://out-of-tree.patch \
            file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
-SRC_URI[sha256sum] = "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a0af2c19a4e3a318f"
+SRC_URI[sha256sum] = "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0beb897c37885b5cad"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.1


--===============5365016233969022512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.06.0 -> /usr/share/doc/ghostscript/10.07.0
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.06.0/Resource/Encoding -> /usr/share/ghostscript/10.07.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.06.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.06.0/Resource/Init -> /usr/share/ghostscript/10.07.0/Resource/Init, directory renamed /usr/share/ghostscript/10.06.0/Resource/Decoding -> /usr/share/ghostscript/10.07.0/Resource/Decoding, directory renamed /usr/share/ghostscript/10.06.0/iccprofiles -> /usr/share/ghostscript/10.07.0/iccprofiles, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.06.0/Resource/CMap -> /usr/share/ghostscript/10.07.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.06.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.0/Resource/ColorSpace,
  directory renamed /usr/share/ghostscript/10.06.0/lib -> /usr/share/ghostscript/10.07.0/lib, directory renamed /usr/share/ghostscript/10.06.0/Resource/Font -> /usr/share/ghostscript/10.07.0/Resource/Font, directory renamed /usr/share/ghostscript/10.06.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.0/Resource/CIDFSubst, removed "/usr/lib/libgs.so.10.06", added "/usr/lib/libgs.so.10.07"
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so.10.06 moved to /usr/lib/libgs.so.10.07
  /usr/share/ghostscript/10.06.0 moved to /usr/share/ghostscript/10.07.0

--===============5365016233969022512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.06.0-10.07.0.patch"

RnJvbSBjMzkxNTc3ODJiOTBjNzk5NmIxMTQ0NzhkYzFkYzM5NTMzMzg1NDUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6NTE6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wNi4wIC0+IDEwLjA3LjAKCi0tLQogLi4uL2dob3N0c2Ny
aXB0LzAwMDEtRml4LTMyLWJpdC1idWlsZC5wYXRjaCAgIHwgNjMgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4uYWNlLXN0YXRpYy1jb25zdC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoIHwgIDQgKy0K
IC4uLi9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2ggICAgICAgICAgICB8ICA0ICstCiAu
Li4vZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2ggfCAgMiArLQogLi4u
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L291dC1vZi10cmVlLnBhdGNoIHwgMjEgKysrKy0tLQog
Li4ucmlwdF8xMC4wNi4wLmJiID0+IGdob3N0c2NyaXB0XzEwLjA3LjAuYmJ9IHwgIDMgKy0KIDYg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
LzAwMDEtRml4LTMyLWJpdC1idWlsZC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9naG9zdHNjcmlwdC97Z2hvc3RzY3JpcHRfMTAuMDYuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4w
Ny4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdC8wMDAxLUZpeC0zMi1iaXQtYnVpbGQucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvMDAwMS1GaXgtMzItYml0LWJ1aWxk
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4ZDFlOWQ0NmU2Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8w
MDAxLUZpeC0zMi1iaXQtYnVpbGQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2MyArMCwwIEBA
Ci1Gcm9tIDNjMGJlNmU0ZmNmZmE2M2U0YTVhMWIwYWVjMDU3Y2ViYzRkMjU2MmYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLZW4gU2hhcnAgPEtlbi5TaGFycEBhcnRpZmV4LmNvbT4K
LURhdGU6IFdlZCwgMTAgU2VwIDIwMjUgMDg6NTU6MzAgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0g
Rml4IDMyLWJpdCBidWlsZAotCi1CdWcgIzcwODgyNCAiZ2hvc3RzY3JpcHQgMTAuMDYuMCBjb21w
aWxhdGlvbiBmYWlsdXJlIG9uIDMyLWJpdCBhcmNocyIKLQotbmJ5dGVzIHNoaW91bGRuJ3QgYmUg
YW4gaW50cHRyX3QsIGl0IGRvZXNuJ3QgZ2V0IHVzZWQgZm9yIHBvaW50ZXIKLWFyaXRobWV0aWMu
IFByZXZpb3VzbHkgaXQgd2FzIGEgdWludCwgc2hvdWxkIGJlIGEgaW50NjRfdCwgdG8gZml0IHdp
dGgKLWFsbCB0aGUgb3RoZXIgZGV2aWNlcy4KLQotQ2hlY2tlZCBvdGhlciB3YXJuaW5ncywgYW5k
IGZvdW5kIGEgKHZlcnkgbWlub3IpIG9uZSBpbiBnZGV2ZGJpdC5jLCBmaXgKLXRoYXQgd2hpbGUg
d2UncmUgaGVyZSAoc2lnbmVkL3Vuc2lnbmVkIG1pc21hdGNoLCB3ZSBkb24ndCByZWFsbHkgY2Fy
ZSkuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9BcnRp
ZmV4U29mdHdhcmUvZ2hvc3RwZGwvY29tbWl0LzNjMGJlNmU0ZmNmZmE2M2U0YTVhMWIwYWVjMDU3
Y2ViYzRkMjU2MmZdCi0KLVNpZ25lZC1vZmYtYnk6IFZpamF5IEFudXN1cmkgPHZhbnVzdXJpQG12
aXN0YS5jb20+Ci0tLS0KLSBiYXNlL2dkZXZkYml0LmMgfCAyICstCi0gYmFzZS9nZGV2bXBsYS5j
IHwgNiArKystLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKLQotZGlmZiAtLWdpdCBhL2Jhc2UvZ2RldmRiaXQuYyBiL2Jhc2UvZ2RldmRiaXQuYwot
aW5kZXggZTA3Y2MzZjNiOC4uMWI1YzY5MzI1YiAxMDA2NDQKLS0tLSBhL2Jhc2UvZ2RldmRiaXQu
YwotKysrIGIvYmFzZS9nZGV2ZGJpdC5jCi1AQCAtMTkxLDcgKzE5MSw3IEBAIGd4X2RlZmF1bHRf
Y29weV9hbHBoYV9obF9jb2xvcihneF9kZXZpY2UgKiBkZXYsIGNvbnN0IGJ5dGUgKiBkYXRhLCBp
bnQgZGF0YV94LAotICAgICBmaXRfY29weShkZXYsIGRhdGEsIGRhdGFfeCwgcmFzdGVyLCBpZCwg
eCwgeSwgd2lkdGgsIGhlaWdodCk7Ci0gICAgIHJvd19hbHBoYSA9IGRhdGE7Ci0gICAgIG91dF9y
YXN0ZXIgPSBiaXRtYXBfcmFzdGVyKHdpZHRoICogKHNpemVfdClieXRlX2RlcHRoKTsKLS0gICAg
aWYgKGNoZWNrXzY0Yml0X211bHRpcGx5KG91dF9yYXN0ZXIsIG5jb21wcywgJnByb2R1Y3QpICE9
IDApCi0rICAgIGlmIChjaGVja182NGJpdF9tdWx0aXBseShvdXRfcmFzdGVyLCBuY29tcHMsIChp
bnQ2NF90ICopICZwcm9kdWN0KSAhPSAwKQotICAgICAgICAgcmV0dXJuIGdzX25vdGVfZXJyb3Io
Z3NfZXJyb3JfdW5kZWZpbmVkcmVzdWx0KTsKLSAgICAgZ2JfYnVmZiA9IGdzX2FsbG9jX2J5dGVz
KG1lbSwgcHJvZHVjdCwgImNvcHlfYWxwaGFfaGxfY29sb3IoZ2JfYnVmZikiKTsKLSAgICAgaWYg
KGdiX2J1ZmYgPT0gMCkgewotZGlmZiAtLWdpdCBhL2Jhc2UvZ2Rldm1wbGEuYyBiL2Jhc2UvZ2Rl
dm1wbGEuYwotaW5kZXggMmYwZDUyMjU2MS4uZmZjNWZmNDJlNiAxMDA2NDQKLS0tLSBhL2Jhc2Uv
Z2Rldm1wbGEuYwotKysrIGIvYmFzZS9nZGV2bXBsYS5jCi1AQCAtMTk1NCwxMiArMTk1NCwxMiBA
QCBtZW1fcGxhbmFyX3N0cmlwX2NvcHlfcm9wMihneF9kZXZpY2UgKiBkZXYsCi0gICAgICAgICBp
bnQgaTsKLSAgICAgICAgIGludCBqOwotICAgICAgICAgaW50cHRyX3QgY2h1bmt5X3NyYXN0ZXI7
Ci0tICAgICAgICBpbnRwdHJfdCBuYnl0ZXM7Ci0rICAgICAgICBpbnQ2NF90IG5ieXRlczsKLSAg
ICAgICAgIGJ5dGUgKipsaW5lX3B0cnM7Ci0gICAgICAgICBieXRlICpzYnVmLCAqYnVmOwotIAot
ICAgICAgICAgY2h1bmt5X3NyYXN0ZXIgPSBzcmFzdGVyICogKGludHB0cl90KW1kZXYtPm51bV9w
bGFuYXJfcGxhbmVzOwotLSAgICAgICAgaWYgKGNoZWNrXzY0Yml0X211bHRpcGx5KGhlaWdodCwg
Y2h1bmt5X3NyYXN0ZXIsIChzaXplX3QgKikmbmJ5dGVzKSAhPSAwKQotKyAgICAgICAgaWYgKGNo
ZWNrXzY0Yml0X211bHRpcGx5KGhlaWdodCwgY2h1bmt5X3NyYXN0ZXIsICZuYnl0ZXMpICE9IDAp
Ci0gICAgICAgICAgICAgcmV0dXJuIGdzX25vdGVfZXJyb3IoZ3NfZXJyb3JfdW5kZWZpbmVkcmVz
dWx0KTsKLSAgICAgICAgIGJ1ZiA9IGdzX2FsbG9jX2J5dGVzKG1kZXYtPm1lbW9yeSwgbmJ5dGVz
LCAibWVtX3BsYW5hcl9zdHJpcF9jb3B5X3JvcChidWYpIik7Ci0gICAgICAgICBpZiAoYnVmID09
IE5VTEwpIHsKLUBAIC0yMDAzLDcgKzIwMDMsNyBAQCBtZW1fcGxhbmFyX3N0cmlwX2NvcHlfcm9w
MihneF9kZXZpY2UgKiBkZXYsCi0gICAgICAgICBpbnRwdHJfdCBpOwotICAgICAgICAgaW50cHRy
X3QgY2h1bmt5X3RfcmFzdGVyOwotICAgICAgICAgaW50IGNodW5reV90X2hlaWdodDsKLS0gICAg
ICAgIGludHB0cl90IG5ieXRlczsKLSsgICAgICAgIGludDY0X3QgbmJ5dGVzOwotICAgICAgICAg
Ynl0ZSAqKmxpbmVfcHRyczsKLSAgICAgICAgIGJ5dGUgKnRidWYsICpidWY7Ci0gICAgICAgICBn
eF9zdHJpcF9iaXRtYXAgbmV3dGV4OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LzAwMDEtcHNpLXp0eXBlLmMtcmVwbGFjZS1zdGF0aWMt
Y29uc3QtZG91YmxlLXdpdGgtbWFjcm9zLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
aG9zdHNjcmlwdC9naG9zdHNjcmlwdC8wMDAxLXBzaS16dHlwZS5jLXJlcGxhY2Utc3RhdGljLWNv
bnN0LWRvdWJsZS13aXRoLW1hY3Jvcy0ucGF0Y2gKaW5kZXggNmYzMTBhYmYyZS4uNTM0ZGRmMWZi
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2Ny
aXB0LzAwMDEtcHNpLXp0eXBlLmMtcmVwbGFjZS1zdGF0aWMtY29uc3QtZG91YmxlLXdpdGgtbWFj
cm9zLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHQvMDAwMS1wc2ktenR5cGUuYy1yZXBsYWNlLXN0YXRpYy1jb25zdC1kb3VibGUtd2l0aC1t
YWNyb3MtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMjk4Nzk5Nzc3YmQxNzljNDU1ZTVj
ZThkNjAwOGIyZDg0NzMyOTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMDIzNjAz
MTZiYWZlNDc0Mjk1YmU4MzAzNDU3NjQ3OGY2NWE2MDI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPGtoZW0ucmFqQG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBUdWUs
IDcgQXByIDIwMjYgMjI6NDA6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHNpL3p0eXBlLmM6
IHJlcGxhY2Ugc3RhdGljIGNvbnN0IGRvdWJsZSB3aXRoIG1hY3JvcyBmb3IKQEAgLTI4LDYgKzI4
LDYgQEAgaW5kZXggYTAxZDgzZi4uZDQ1NDc3OCAxMDA2NDQKICsKICsjZGVmaW5lIG1pbl9pbnRf
cmVhbCAoKGRvdWJsZSkoQUxUX01JTl9JTlQpIC0gMS4wKQogKyNkZWZpbmUgbWF4X2ludF9yZWFs
ICgoZG91YmxlKShBTFRfTUFYX0lOVCkgKyAxLjApCi0KKyAKICAjZGVmaW5lIFJFQUxfQ0FOX0JF
X0lOVCh2KVwKICAgICgodikgPiBtaW5faW50X3JlYWwgJiYgKHYpIDwgbWF4X2ludF9yZWFsKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
aG9zdHNjcmlwdC9naG9zdHNjcmlwdC9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2gKaW5k
ZXggZDE5MTIzMWM3Yi4uMGUwOWVhZjRlMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZv
aWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NTkwNWNl
M2IxYmM2M2YwYmU5ZWRhOTg4OGU0MGQ4ZTdhODAzZDIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2ZDQwYjE0ZTc1ZDc0MmZiY2NkY2Q1MDdmMGNkNDI1Yzk5NWZkNmU1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUaHUsIDI5IE1hciAyMDE4IDE2OjAyOjA1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGF2b2lkIGhvc3QgY29udGFtaW5hdGlvbgpAQCAtMTUsNyArMTUsNyBAQCBTaWduZWQtb2ZmLWJ5
OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kZXZpY2VzL2Rl
dnMubWFrIGIvZGV2aWNlcy9kZXZzLm1hawotaW5kZXggYTVkYmM3YS4uMjdiNTVmMiAxMDA2NDQK
K2luZGV4IDFlNDRlOGQuLmY0ZDk1ZGEgMTAwNjQ0CiAtLS0gYS9kZXZpY2VzL2RldnMubWFrCiAr
KysgYi9kZXZpY2VzL2RldnMubWFrCiBAQCAtNDAzLDcgKzQwMyw3IEBAICQoREVWT0JKKWdkZXZ4
YWx0LiQoT0JKKSA6ICQoREVWU1JDKWdkZXZ4YWx0LmMgJChHREVWWCkgJChtYXRoX19oKSAkKG1l
bW9yeV9faClcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQt
OS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2gKaW5kZXggMDU5OGMzZGNkMi4uNDg3NjBhMDA4
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC05LjE2
LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzIzYjc4N2Y5
YTM4YmUyY2RjNTcxMzM5MTVjNDAyYjY5YWNlZGQxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTYwNjI5ZTBiODA5OThkMzkzYjEzM2ExN2UwZjk2ZDdmZGZhMjI5YSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIu
Y29tPgogRGF0ZTogTW9uLCA0IE1heSAyMDE1IDIyOjMxOjQ4IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGJhc2UvZ2VuZGV2LmM6IGZpeCBmb3IgLVdlcnJvcj1yZXR1cm4tdHlwZQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L291dC1vZi10
cmVlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
L291dC1vZi10cmVlLnBhdGNoCmluZGV4IDIwMmM5ZDZjN2MuLmQ1ZTE5YTYxNTQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9vdXQtb2Yt
dHJlZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHQvb3V0LW9mLXRyZWUucGF0Y2gKQEAgLTEsMTQgKzEsMjEgQEAKLUZpeCB0aGUgYnVpbGQg
dG8gZG8gb3V0LW9mLXRyZWUgcHJvcGVybHkuCitGcm9tIDkzNDVjNTY1ZTg3YTI0NTZlNGQ3ODBk
ZWU1ZjRiNzZlMGU0ZTQ4NTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KK0RhdGU6IFRodSwgMiBBcHIgMjAyNiAxNDo0MTo0
MiArMDEwMAorU3ViamVjdDogW1BBVENIXSBGaXggdGhlIGJ1aWxkIHRvIGRvIG91dC1vZi10cmVl
IHByb3Blcmx5LgogCiBUaGUgcGF0Y2hlcyBhcmUgaW4gcHJvZ3Jlc3MgYnV0IGFyZSBiZWluZyBz
dWJtaXR0ZWQgdXBzdHJlYW0uCiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2J1Z3MuZ2hvc3RzY3JpcHQuY29tL3Nob3dfYnVnLmNnaT9pZD03MDkyODldCiBTaWduZWQtb2Zm
LWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KKy0tLQorIGNvbmZpZ3VyZS5h
YyB8IDggKysrKy0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQogCi1kaWZmIC1yVTMgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLS0tLSBh
L2NvbmZpZ3VyZS5hYwkyMDI1LTA5LTA5IDEwOjM2OjM5LjAwMDAwMDAwMCArMDEwMAotKysrIGIv
Y29uZmlndXJlLmFjCTIwMjYtMDMtMzEgMTU6MzU6MDguOTg4MjYyNjEyICswMTAwCi1AQCAtNDAw
LDcgKzQwMCw3IEBACitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitp
bmRleCBkMDE4MDdiLi5kZDAwZTg2IDEwMDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9j
b25maWd1cmUuYWMKK0BAIC00MDAsNyArNDAwLDcgQEAgaWYgdGVzdCB4IiR3aXRoX2FyY2hfaCIg
PSB4IiI7IHRoZW4KICAgICAgICAgICAgKikKICAgICAgICAgICAgICBBUkNIX0NPTkZfSEVBREVS
PQogICAgICAgICAgICAgIGlmIHRlc3QgeCIkaG9zdCIgIT0geCIkYnVpbGQiOyB0aGVuCkBAIC0x
Nyw3ICsyNCw3IEBAIGRpZmYgLXJVMyBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwogICAg
ICAgICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIEFSQ0hfQ09ORl9IRUFERVI9CiAgICAgICAg
ICAgICAgZmkKLUBAIC04NjksOCArODY5LDggQEAKK0BAIC04NzIsOCArODcyLDggQEAgQUNfU1VC
U1QoUFRIUkVBRF9MSUJTKQogIEFDX1NVQlNUKFJFQ1VSU0lWRV9NVVRFWEFUVFIpCiAgCiAgZG5s
IFRlc3NlcmFjdC9MZXB0b25pY2EgZGV0ZWN0aW9uCkBAIC0yOCw3ICszNSw3IEBAIGRpZmYgLXJV
MyBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwogIE9DUl9WRVJTSU9OPTAKICBPQ1JfU0hB
UkVEPTAKICBMRVBUT05JQ0FJTkNMVURFPQotQEAgLTg4Niw3ICs4ODYsNyBAQAorQEAgLTg4OSw3
ICs4ODksNyBAQCBBQ19BUkdfV0lUSChbdGVzc2VyYWN0XSwgQVNfSEVMUF9TVFJJTkcoWy0td2l0
aG91dC10ZXNzZXJhY3RdLAogIAogIGlmIHRlc3QgeCR3aXRoX3Rlc3NlcmFjdCAhPSB4bm87IHRo
ZW4KICAgIEFDX01TR19DSEVDS0lORyhbZm9yIGxvY2FsIFRlc3NlcmFjdCBsaWJyYXJ5IHNvdXJj
ZV0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHRfMTAuMDYuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9z
dHNjcmlwdF8xMC4wNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wNi4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDcu
MC5iYgppbmRleCAxMzYzYWEyODFlLi4xYjZjYjRhYWFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDYuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDcuMC5iYgpAQCAt
MjQsMTIgKzI0LDExIEBAIGRlZiBnc192ZXJkaXIodik6CiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvZ2hvc3RwZGwtZG93bmxvYWRzL3JlbGVhc2VzL2Rvd25s
b2FkL2dzJHtAZ3NfdmVyZGlyKCIke1BWfSIpfS8ke0JQTn0tJHtQVn0udGFyLmd6IFwKICAgICAg
ICAgICAgZmlsZTovL2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovL2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCBcCi0gICAg
ICAgICAgIGZpbGU6Ly8wMDAxLUZpeC0zMi1iaXQtYnVpbGQucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vb3V0LW9mLXRyZWUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1wc2ktenR5
cGUuYy1yZXBsYWNlLXN0YXRpYy1jb25zdC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWJkNmRhMzQ3OTQ5MjhjYzdlNjE2
ZjI4OGUzMmJkMGJlN2Y5YTVjYTJkM2MyMDZhMGFmMmMxOWE0ZTNhMzE4ZiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJlZDZlYTYyMDIyZTNmNGQ1YTY1NjliNmVmYzkzNjFiNjNhNmQxMThiZmNhZDhm
MGJlYjg5N2MzNzg4NWI1Y2FkIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJ
R1tndGtdID0gIi0tZW5hYmxlLWd0aywtLWRpc2FibGUtZ3RrLGd0ayszIgotLSAKMi40Ny4xCgo=

--===============5365016233969022512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 209754704 to 210297664 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: FILELIST: removed "/usr/lib/.debug/libgs.so.10.06", added "/usr/lib/.debug/libgs.so.10.07"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11329262 to 11329961 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.06.0 -> /usr/share/doc/ghostscript/10.07.0
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 94968716 to 95068617 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: FILELIST: directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/pcl3/eprn -> /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/eprn, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccstruct -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccstruct, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccutil -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccutil, directory renamed /usr/src/debug/ghostscript/10.06.0/pdf -> /usr/src/debug/ghostscript/10.07.0/pdf, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/include/brotli -> /usr/src/debug/ghostscript/10.07.0/brotli/c/include/brotli, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/dec -> /usr/src/debug/ghostscript/10.07.0/brotli/c/dec, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/eplaser -> /usr/src/debug/ghostscript/10.07.0/contrib/eplaser, directory renamed /usr/src/debug/ghostscript/10
 .06.0/contrib/lips4 -> /usr/src/debug/ghostscript/10.07.0/contrib/lips4, directory renamed /usr/src/debug/ghostscript/10.06.0/jbig2dec -> /usr/src/debug/ghostscript/10.07.0/jbig2dec, directory renamed /usr/src/debug/ghostscript/10.06.0/psi -> /usr/src/debug/ghostscript/10.07.0/psi, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/classify -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/classify, directory renamed /usr/src/debug/ghostscript/10.06.0/zlib -> /usr/src/debug/ghostscript/10.07.0/zlib, directory renamed /usr/src/debug/ghostscript/10.06.0/base -> /usr/src/debug/ghostscript/10.07.0/base, directory renamed /usr/src/debug/ghostscript/10.06.0/urf -> /usr/src/debug/ghostscript/10.07.0/urf, directory renamed /usr/src/debug/ghostscript/10.06.0/leptonica/src -> /usr/src/debug/ghostscript/10.07.0/leptonica/src, directory renamed /usr/src/debug/ghostscript/10.06.0/cups -> /usr/src/debug/ghostscript/10.07.0/cups, directory renamed /usr/src/debug/ghostscript/10.06
 .0/brotli/c/common -> /usr/src/debug/ghostscript/10.07.0/brotli/c/common, directory renamed /usr/src/debug/ghostscript/10.06.0/ijs -> /usr/src/debug/ghostscript/10.07.0/ijs, directory renamed /usr/src/debug/ghostscript/10.06.0/devices/vector -> /usr/src/debug/ghostscript/10.07.0/devices/vector, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/pcl3/src -> /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/src, directory renamed /usr/src/debug/ghostscript/10.06.0/devices -> /usr/src/debug/ghostscript/10.07.0/devices, directory renamed /usr/src/debug/ghostscript/10.06.0/lcms2mt/include -> /usr/src/debug/ghostscript/10.07.0/lcms2mt/include, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/dict -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/dict, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/opvp -> /usr/src/debug/ghostscript/10.07.0/contrib/opvp, directory renamed /usr/src/debug/ghostscript/10.06.0/devices/rinkj -> /usr/src/debug/ghostscrip
 t/10.07.0/devices/rinkj, directory renamed /usr/src/debug/ghostscript/10.06.0/obj -> /usr/src/debug/ghostscript/10.07.0/obj, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/enc -> /usr/src/debug/ghostscript/10.07.0/brotli/c/enc, directory renamed /usr/src/debug/ghostscript/10.06.0/lcms2mt/src -> /usr/src/debug/ghostscript/10.07.0/lcms2mt/src, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/japanese -> /usr/src/debug/ghostscript/10.07.0/contrib/japanese, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/include/tesseract -> /usr/src/debug/ghostscript/10.07.0/tesseract/include/tesseract, directory renamed /usr/src/debug/ghostscript/10.06.0/soobj -> /usr/src/debug/ghostscript/10.07.0/soobj, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/textord -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/textord, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/wordrec -> /usr/src/debug/ghostscript/10.07.0/tesseract/s
 rc/wordrec, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccmain -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccmain, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/api -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/api, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/lstm -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/lstm, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib -> /usr/src/debug/ghostscript/10.07.0/contrib, directory renamed /usr/src/debug/ghostscript/10.06.0/openjpeg/src/lib/openjp2 -> /usr/src/debug/ghostscript/10.07.0/openjpeg/src/lib/openjp2, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/viewer -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/viewer, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/arch -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/arch
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 94585332 to 94314719 (-0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.06.0/Resource/Encoding -> /usr/share/ghostscript/10.07.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.06.0/lib -> /usr/share/ghostscript/10.07.0/lib, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.06.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.06.0/iccprofiles -> /usr/share/ghostscript/10.07.0/iccprofiles, directory renamed /usr/share/ghostscript/10.06.0/Resource/Decoding -> /usr/share/ghostscript/10.07.0/Resource/Decoding, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.06.0/Resource/Init -> /usr/share/ghostscript/10.07.0/Resource/Init, directory renamed /us
 r/share/ghostscript/10.06.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.06.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.06.0/Resource/CMap -> /usr/share/ghostscript/10.07.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.06.0/Resource/Font -> /usr/share/ghostscript/10.07.0/Resource/Font, removed "/usr/lib/libgs.so.10.06", added "/usr/lib/libgs.so.10.07"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/ghostscript-10.06.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://0001-Fix-32-bit-build.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/ghostscript-10.07.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch"
packages/x86-64-v3-poky-linux/ghostscript: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so.10.06 moved to /usr/lib/libgs.so.10.07
  /usr/share/ghostscript/10.06.0 moved to /usr/share/ghostscript/10.07.0

--===============5365016233969022512==--

