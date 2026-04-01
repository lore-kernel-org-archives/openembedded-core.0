Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EC910FCAF8
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14663.1775054168212264077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1qiQxxx9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hUN+Sy4Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d49791e82-2ab93635-311c-44fb-b9b4-1cf09445f4eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FQGIILorz4QTVjfihWxPJdv/Rm5PTeDVZ7jJwp72j74=;
	b=1qiQxxx9hewO6q74rGlEjF3nGOqt/l1vzFT+vMuGL1G5y85ZN03P3S2VQAkoSkWd
	Y27rWIaxbwwWtNo+NDycd5QhBZ9kKYVaMAS+7xwhh73HjHDbzN6tBVcFhpawTkJgtH6
	JSsUMOFazjhuS7LbGGFRCmrgmg9qGFq4gFcdHi1Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FQGIILorz4QTVjfihWxPJdv/Rm5PTeDVZ7jJwp72j74=;
	b=hUN+Sy4Y17KjJNnq65+kRVHun78U61/E0lP+6H94MMGS5JeLxRNW/K+T/SIFP2SZ
	u8WZRODT29TGclxuNryACxpFzMdhHaU9rnUEOYLaoyzYhi62xq8KMnxkiHNA1Uhaf9B
	dB8ld8lkFM3UhfUibBbgKJxOz+uSg4/oxTkfhLjM=
Content-Type: multipart/mixed; boundary="===============9221543171771029632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.07.0 SUCCEEDED
Message-ID: <0101019d49791e82-2ab93635-311c-44fb-b9b4-1cf09445f4eb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234400

--===============9221543171771029632==
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
From 4d8a05d18c402b48e46920807c4dfe7e90af21bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:16:06 +0000
Subject: [PATCH] ghostscript: upgrade 10.06.0 -> 10.07.0

---
 .../ghostscript/0001-Fix-32-bit-build.patch   | 63 -------------------
 .../avoid-host-contamination.patch            |  4 +-
 .../ghostscript-9.16-Werror-return-type.patch |  2 +-
 ...ript_10.06.0.bb => ghostscript_10.07.0.bb} |  3 +-
 4 files changed, 4 insertions(+), 68 deletions(-)
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index d191231c7b..05e5414555 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
+From ff8e6580b0680adef5b34fbb6ae98033d68b7705 Mon Sep 17 00:00:00 2001
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
index 0598c3dcd2..89e3d0b8eb 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,4 +1,4 @@
-From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
+From 3a09ecd55e452802d9949fcf282c141abe95251c Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
 Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
similarity index 95%
rename from meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
index b0951d79f5..10a1b6fd07 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
@@ -24,10 +24,9 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Fix-32-bit-build.patch \
            "
 
-SRC_URI[sha256sum] = "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a0af2c19a4e3a318f"
+SRC_URI[sha256sum] = "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0beb897c37885b5cad"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.1


--===============9221543171771029632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.06.0 -> /usr/share/doc/ghostscript/10.07.0
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.06.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.06.0/Resource/Font -> /usr/share/ghostscript/10.07.0/Resource/Font, directory renamed /usr/share/ghostscript/10.06.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.06.0/Resource/Init -> /usr/share/ghostscript/10.07.0/Resource/Init, directory renamed /usr/share/ghostscript/10.06.0/Resource/Encoding -> /usr/share/ghostscript/10.07.0/Resource/Encoding, directory renamed /usr/share/ghostscript/10.06.0/iccprofiles -> /usr/share/ghostscript/10.07.0/iccprofiles, directory renamed /usr/share/ghostscript/10.06.0/Resource/CMap -> /usr/share/ghostscript/10.07.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.06.0/lib -> /usr/share/ghostscript/10.07.0/lib, directory renamed /usr/share/ghos
 tscript/10.06.0/Resource/Decoding -> /usr/share/ghostscript/10.07.0/Resource/Decoding, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.06.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.0/Resource/CIDFont, removed "/usr/lib/libgs.so.10.06", added "/usr/lib/libgs.so.10.07"
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so.10.06 moved to /usr/lib/libgs.so.10.07
  /usr/share/ghostscript/10.06.0 moved to /usr/share/ghostscript/10.07.0

--===============9221543171771029632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 210987472 to 211529320 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: FILELIST: removed "/usr/lib/.debug/libgs.so.10.06", added "/usr/lib/.debug/libgs.so.10.07"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11329262 to 11329961 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.06.0 -> /usr/share/doc/ghostscript/10.07.0
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 95486075 to 95585976 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: FILELIST: directory renamed /usr/src/debug/ghostscript/10.06.0/extract/include/extract -> /usr/src/debug/ghostscript/10.07.0/extract/include/extract, directory renamed /usr/src/debug/ghostscript/10.06.0/zlib -> /usr/src/debug/ghostscript/10.07.0/zlib, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/include/brotli -> /usr/src/debug/ghostscript/10.07.0/brotli/c/include/brotli, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccutil -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccutil, directory renamed /usr/src/debug/ghostscript/10.06.0/pdf -> /usr/src/debug/ghostscript/10.07.0/pdf, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/pcl3/eprn -> /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/eprn, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccstruct -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccstruct, directory renamed /usr/src/debug/ghostscript/10
 .06.0/tesseract/src/classify -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/classify, directory renamed /usr/src/debug/ghostscript/10.06.0/psi -> /usr/src/debug/ghostscript/10.07.0/psi, directory renamed /usr/src/debug/ghostscript/10.06.0/jbig2dec -> /usr/src/debug/ghostscript/10.07.0/jbig2dec, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/lips4 -> /usr/src/debug/ghostscript/10.07.0/contrib/lips4, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/eplaser -> /usr/src/debug/ghostscript/10.07.0/contrib/eplaser, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/dec -> /usr/src/debug/ghostscript/10.07.0/brotli/c/dec, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib -> /usr/src/debug/ghostscript/10.07.0/contrib, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/lstm -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/lstm, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/api -> /usr/src/debug/ghostsc
 ript/10.07.0/tesseract/src/api, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/arch -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/arch, directory renamed /usr/src/debug/ghostscript/10.06.0/openjpeg/src/lib/openjp2 -> /usr/src/debug/ghostscript/10.07.0/openjpeg/src/lib/openjp2, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/viewer -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/viewer, directory renamed /usr/src/debug/ghostscript/10.06.0/lcms2mt/src -> /usr/src/debug/ghostscript/10.07.0/lcms2mt/src, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/japanese -> /usr/src/debug/ghostscript/10.07.0/contrib/japanese, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/ccmain -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccmain, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/include/tesseract -> /usr/src/debug/ghostscript/10.07.0/tesseract/include/tesseract, directory renamed /usr/src/debug/gh
 ostscript/10.06.0/tesseract/src/textord -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/textord, directory renamed /usr/src/debug/ghostscript/10.06.0/soobj -> /usr/src/debug/ghostscript/10.07.0/soobj, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/wordrec -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/wordrec, directory renamed /usr/src/debug/ghostscript/10.06.0/devices/rinkj -> /usr/src/debug/ghostscript/10.07.0/devices/rinkj, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/opvp -> /usr/src/debug/ghostscript/10.07.0/contrib/opvp, directory renamed /usr/src/debug/ghostscript/10.06.0/obj -> /usr/src/debug/ghostscript/10.07.0/obj, directory renamed /usr/src/debug/ghostscript/10.06.0/contrib/pcl3/src -> /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/src, directory renamed /usr/src/debug/ghostscript/10.06.0/devices -> /usr/src/debug/ghostscript/10.07.0/devices, directory renamed /usr/src/debug/ghostscript/10.06.0/extract/src -> /usr/src/debug/g
 hostscript/10.07.0/extract/src, directory renamed /usr/src/debug/ghostscript/10.06.0/lcms2mt/include -> /usr/src/debug/ghostscript/10.07.0/lcms2mt/include, directory renamed /usr/src/debug/ghostscript/10.06.0/tesseract/src/dict -> /usr/src/debug/ghostscript/10.07.0/tesseract/src/dict, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/enc -> /usr/src/debug/ghostscript/10.07.0/brotli/c/enc, directory renamed /usr/src/debug/ghostscript/10.06.0/ijs -> /usr/src/debug/ghostscript/10.07.0/ijs, directory renamed /usr/src/debug/ghostscript/10.06.0/devices/vector -> /usr/src/debug/ghostscript/10.07.0/devices/vector, directory renamed /usr/src/debug/ghostscript/10.06.0/base -> /usr/src/debug/ghostscript/10.07.0/base, directory renamed /usr/src/debug/ghostscript/10.06.0/cups -> /usr/src/debug/ghostscript/10.07.0/cups, directory renamed /usr/src/debug/ghostscript/10.06.0/brotli/c/common -> /usr/src/debug/ghostscript/10.07.0/brotli/c/common, directory renamed /usr/src/debug/ghostscrip
 t/10.06.0/urf -> /usr/src/debug/ghostscript/10.07.0/urf, directory renamed /usr/src/debug/ghostscript/10.06.0/leptonica/src -> /usr/src/debug/ghostscript/10.07.0/leptonica/src
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 95153012 to 94872735 (-0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.06.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.0/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.06.0/Resource/Font -> /usr/share/ghostscript/10.07.0/Resource/Font, directory renamed /usr/share/ghostscript/10.06.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.0/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.06.0/Resource/CMap -> /usr/share/ghostscript/10.07.0/Resource/CMap, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.0/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.06.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.0/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.06.0/lib -> /usr/share/ghostscript/10.07.0/lib, directory renamed /usr/share/ghostscript/10.06.0/Resource/Encoding -> /usr/share/ghostscript/10.07.0/Resource/Encoding, directory ren
 amed /usr/share/ghostscript/10.06.0/Resource/Init -> /usr/share/ghostscript/10.07.0/Resource/Init, directory renamed /usr/share/ghostscript/10.06.0/iccprofiles -> /usr/share/ghostscript/10.07.0/iccprofiles, directory renamed /usr/share/ghostscript/10.06.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.0/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.06.0/Resource/Decoding -> /usr/share/ghostscript/10.07.0/Resource/Decoding, removed "/usr/lib/libgs.so.10.06", added "/usr/lib/libgs.so.10.07"
packages/x86-64-v3-poky-linux/ghostscript: PKGV changed from 10.06.0 [default] to 10.07.0 [default]
packages/x86-64-v3-poky-linux/ghostscript: PV changed from "10.06.0" to "10.07.0"
packages/x86-64-v3-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/ghostscript-10.06.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://0001-Fix-32-bit-build.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/ghostscript-10.07.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch"
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/lib/libgs.so.10 changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so changed symlink target from libgs.so.10.06 to libgs.so.10.07
  /usr/lib/libgs.so.10.06 moved to /usr/lib/libgs.so.10.07
  /usr/share/ghostscript/10.06.0 moved to /usr/share/ghostscript/10.07.0

--===============9221543171771029632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.06.0-10.07.0.patch"

RnJvbSA0ZDhhMDVkMThjNDAyYjQ4ZTQ2OTIwODA3YzRkZmU3ZTkwYWYyMWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMToxNjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdo
b3N0c2NyaXB0OiB1cGdyYWRlIDEwLjA2LjAgLT4gMTAuMDcuMAoKLS0tCiAuLi4vZ2hvc3RzY3Jp
cHQvMDAwMS1GaXgtMzItYml0LWJ1aWxkLnBhdGNoICAgfCA2MyAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAuLi4vYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoICAgICAgICAgICAgfCAgNCArLQog
Li4uL2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoIHwgIDIgKy0KIC4u
LnJpcHRfMTAuMDYuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wNy4wLmJifSB8ICAzICstCiA0IGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNjggZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LzAw
MDEtRml4LTMyLWJpdC1idWlsZC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9n
aG9zdHNjcmlwdC97Z2hvc3RzY3JpcHRfMTAuMDYuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wNy4w
LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlw
dC9naG9zdHNjcmlwdC8wMDAxLUZpeC0zMi1iaXQtYnVpbGQucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvMDAwMS1GaXgtMzItYml0LWJ1aWxkLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4ZDFlOWQ0NmU2Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8wMDAx
LUZpeC0zMi1iaXQtYnVpbGQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2MyArMCwwIEBACi1G
cm9tIDNjMGJlNmU0ZmNmZmE2M2U0YTVhMWIwYWVjMDU3Y2ViYzRkMjU2MmYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBLZW4gU2hhcnAgPEtlbi5TaGFycEBhcnRpZmV4LmNvbT4KLURh
dGU6IFdlZCwgMTAgU2VwIDIwMjUgMDg6NTU6MzAgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4
IDMyLWJpdCBidWlsZAotCi1CdWcgIzcwODgyNCAiZ2hvc3RzY3JpcHQgMTAuMDYuMCBjb21waWxh
dGlvbiBmYWlsdXJlIG9uIDMyLWJpdCBhcmNocyIKLQotbmJ5dGVzIHNoaW91bGRuJ3QgYmUgYW4g
aW50cHRyX3QsIGl0IGRvZXNuJ3QgZ2V0IHVzZWQgZm9yIHBvaW50ZXIKLWFyaXRobWV0aWMuIFBy
ZXZpb3VzbHkgaXQgd2FzIGEgdWludCwgc2hvdWxkIGJlIGEgaW50NjRfdCwgdG8gZml0IHdpdGgK
LWFsbCB0aGUgb3RoZXIgZGV2aWNlcy4KLQotQ2hlY2tlZCBvdGhlciB3YXJuaW5ncywgYW5kIGZv
dW5kIGEgKHZlcnkgbWlub3IpIG9uZSBpbiBnZGV2ZGJpdC5jLCBmaXgKLXRoYXQgd2hpbGUgd2Un
cmUgaGVyZSAoc2lnbmVkL3Vuc2lnbmVkIG1pc21hdGNoLCB3ZSBkb24ndCByZWFsbHkgY2FyZSku
Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4
U29mdHdhcmUvZ2hvc3RwZGwvY29tbWl0LzNjMGJlNmU0ZmNmZmE2M2U0YTVhMWIwYWVjMDU3Y2Vi
YzRkMjU2MmZdCi0KLVNpZ25lZC1vZmYtYnk6IFZpamF5IEFudXN1cmkgPHZhbnVzdXJpQG12aXN0
YS5jb20+Ci0tLS0KLSBiYXNlL2dkZXZkYml0LmMgfCAyICstCi0gYmFzZS9nZGV2bXBsYS5jIHwg
NiArKystLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL2Jhc2UvZ2RldmRiaXQuYyBiL2Jhc2UvZ2RldmRiaXQuYwotaW5k
ZXggZTA3Y2MzZjNiOC4uMWI1YzY5MzI1YiAxMDA2NDQKLS0tLSBhL2Jhc2UvZ2RldmRiaXQuYwot
KysrIGIvYmFzZS9nZGV2ZGJpdC5jCi1AQCAtMTkxLDcgKzE5MSw3IEBAIGd4X2RlZmF1bHRfY29w
eV9hbHBoYV9obF9jb2xvcihneF9kZXZpY2UgKiBkZXYsIGNvbnN0IGJ5dGUgKiBkYXRhLCBpbnQg
ZGF0YV94LAotICAgICBmaXRfY29weShkZXYsIGRhdGEsIGRhdGFfeCwgcmFzdGVyLCBpZCwgeCwg
eSwgd2lkdGgsIGhlaWdodCk7Ci0gICAgIHJvd19hbHBoYSA9IGRhdGE7Ci0gICAgIG91dF9yYXN0
ZXIgPSBiaXRtYXBfcmFzdGVyKHdpZHRoICogKHNpemVfdClieXRlX2RlcHRoKTsKLS0gICAgaWYg
KGNoZWNrXzY0Yml0X211bHRpcGx5KG91dF9yYXN0ZXIsIG5jb21wcywgJnByb2R1Y3QpICE9IDAp
Ci0rICAgIGlmIChjaGVja182NGJpdF9tdWx0aXBseShvdXRfcmFzdGVyLCBuY29tcHMsIChpbnQ2
NF90ICopICZwcm9kdWN0KSAhPSAwKQotICAgICAgICAgcmV0dXJuIGdzX25vdGVfZXJyb3IoZ3Nf
ZXJyb3JfdW5kZWZpbmVkcmVzdWx0KTsKLSAgICAgZ2JfYnVmZiA9IGdzX2FsbG9jX2J5dGVzKG1l
bSwgcHJvZHVjdCwgImNvcHlfYWxwaGFfaGxfY29sb3IoZ2JfYnVmZikiKTsKLSAgICAgaWYgKGdi
X2J1ZmYgPT0gMCkgewotZGlmZiAtLWdpdCBhL2Jhc2UvZ2Rldm1wbGEuYyBiL2Jhc2UvZ2Rldm1w
bGEuYwotaW5kZXggMmYwZDUyMjU2MS4uZmZjNWZmNDJlNiAxMDA2NDQKLS0tLSBhL2Jhc2UvZ2Rl
dm1wbGEuYwotKysrIGIvYmFzZS9nZGV2bXBsYS5jCi1AQCAtMTk1NCwxMiArMTk1NCwxMiBAQCBt
ZW1fcGxhbmFyX3N0cmlwX2NvcHlfcm9wMihneF9kZXZpY2UgKiBkZXYsCi0gICAgICAgICBpbnQg
aTsKLSAgICAgICAgIGludCBqOwotICAgICAgICAgaW50cHRyX3QgY2h1bmt5X3NyYXN0ZXI7Ci0t
ICAgICAgICBpbnRwdHJfdCBuYnl0ZXM7Ci0rICAgICAgICBpbnQ2NF90IG5ieXRlczsKLSAgICAg
ICAgIGJ5dGUgKipsaW5lX3B0cnM7Ci0gICAgICAgICBieXRlICpzYnVmLCAqYnVmOwotIAotICAg
ICAgICAgY2h1bmt5X3NyYXN0ZXIgPSBzcmFzdGVyICogKGludHB0cl90KW1kZXYtPm51bV9wbGFu
YXJfcGxhbmVzOwotLSAgICAgICAgaWYgKGNoZWNrXzY0Yml0X211bHRpcGx5KGhlaWdodCwgY2h1
bmt5X3NyYXN0ZXIsIChzaXplX3QgKikmbmJ5dGVzKSAhPSAwKQotKyAgICAgICAgaWYgKGNoZWNr
XzY0Yml0X211bHRpcGx5KGhlaWdodCwgY2h1bmt5X3NyYXN0ZXIsICZuYnl0ZXMpICE9IDApCi0g
ICAgICAgICAgICAgcmV0dXJuIGdzX25vdGVfZXJyb3IoZ3NfZXJyb3JfdW5kZWZpbmVkcmVzdWx0
KTsKLSAgICAgICAgIGJ1ZiA9IGdzX2FsbG9jX2J5dGVzKG1kZXYtPm1lbW9yeSwgbmJ5dGVzLCAi
bWVtX3BsYW5hcl9zdHJpcF9jb3B5X3JvcChidWYpIik7Ci0gICAgICAgICBpZiAoYnVmID09IE5V
TEwpIHsKLUBAIC0yMDAzLDcgKzIwMDMsNyBAQCBtZW1fcGxhbmFyX3N0cmlwX2NvcHlfcm9wMihn
eF9kZXZpY2UgKiBkZXYsCi0gICAgICAgICBpbnRwdHJfdCBpOwotICAgICAgICAgaW50cHRyX3Qg
Y2h1bmt5X3RfcmFzdGVyOwotICAgICAgICAgaW50IGNodW5reV90X2hlaWdodDsKLS0gICAgICAg
IGludHB0cl90IG5ieXRlczsKLSsgICAgICAgIGludDY0X3QgbmJ5dGVzOwotICAgICAgICAgYnl0
ZSAqKmxpbmVfcHRyczsKLSAgICAgICAgIGJ5dGUgKnRidWYsICpidWY7Ci0gICAgICAgICBneF9z
dHJpcF9iaXRtYXAgbmV3dGV4OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2do
b3N0c2NyaXB0L2dob3N0c2NyaXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9hdm9pZC1ob3N0LWNv
bnRhbWluYXRpb24ucGF0Y2gKaW5kZXggZDE5MTIzMWM3Yi4uMDVlNTQxNDU1NSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2F2b2lkLWhv
c3QtY29udGFtaW5hdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3Rz
Y3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA4NTkwNWNlM2IxYmM2M2YwYmU5ZWRhOTg4OGU0MGQ4ZTdhODAzZDIxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZjhlNjU4MGIwNjgwYWRlZjViMzRmYmI2YWU5
ODAzM2Q2OGI3NzA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGth
aS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDI5IE1hciAyMDE4IDE2OjAyOjA1ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIGhvc3QgY29udGFtaW5hdGlvbgpAQCAtMTUsNyAr
MTUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9kZXZpY2VzL2RldnMubWFrIGIvZGV2aWNlcy9kZXZzLm1hawotaW5kZXggYTVk
YmM3YS4uMjdiNTVmMiAxMDA2NDQKK2luZGV4IDFlNDRlOGQuLmY0ZDk1ZGEgMTAwNjQ0CiAtLS0g
YS9kZXZpY2VzL2RldnMubWFrCiArKysgYi9kZXZpY2VzL2RldnMubWFrCiBAQCAtNDAzLDcgKzQw
Myw3IEBAICQoREVWT0JKKWdkZXZ4YWx0LiQoT0JKKSA6ICQoREVWU1JDKWdkZXZ4YWx0LmMgJChH
REVWWCkgJChtYXRoX19oKSAkKG1lbW9yeV9faClcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3It
cmV0dXJuLXR5cGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2gKaW5kZXgg
MDU5OGMzZGNkMi4uODllM2QwYjhlYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10
eXBlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYzIzYjc4N2Y5YTM4YmUyY2RjNTcxMzM5MTVjNDAyYjY5YWNlZGQxYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2EwOWVjZDU1ZTQ1MjgwMmQ5OTQ5ZmNmMjgyYzE0
MWFiZTk1MjUxYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxs
aWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCA0IE1heSAyMDE1IDIyOjMxOjQ4
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJhc2UvZ2VuZGV2LmM6IGZpeCBmb3IgLVdlcnJvcj1y
ZXR1cm4tdHlwZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0
L2dob3N0c2NyaXB0XzEwLjA2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHRfMTAuMDcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDYuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
XzEwLjA3LjAuYmIKaW5kZXggYjA5NTFkNzlmNS4uMTBhMWI2ZmQwNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA2LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA3LjAu
YmIKQEAgLTI0LDEwICsyNCw5IEBAIGRlZiBnc192ZXJkaXIodik6CiBTUkNfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvZ2hvc3RwZGwtZG93bmxvYWRzL3JlbGVhc2Vz
L2Rvd25sb2FkL2dzJHtAZ3NfdmVyZGlyKCIke1BWfSIpfS8ke0JQTn0tJHtQVn0udGFyLmd6IFwK
ICAgICAgICAgICAgZmlsZTovL2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaCBc
Ci0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC0zMi1iaXQtYnVpbGQucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YmQ2ZGEzNDc5NDkyOGNjN2U2MTZmMjg4
ZTMyYmQwYmU3ZjlhNWNhMmQzYzIwNmEwYWYyYzE5YTRlM2EzMThmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImVkNmVhNjIwMjJlM2Y0ZDVhNjU2OWI2ZWZjOTM2MWI2M2E2ZDExOGJmY2FkOGYwYmVi
ODk3YzM3ODg1YjVjYWQiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2d0
a10gPSAiLS1lbmFibGUtZ3RrLC0tZGlzYWJsZS1ndGssZ3RrKzMiCi0tIAoyLjQ3LjEKCg==

--===============9221543171771029632==--

