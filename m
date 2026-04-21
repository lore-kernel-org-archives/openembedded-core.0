Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1661CF5A8D4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20383.1776765377636059577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AxcmYDx7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765382; x=1808301382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6synv1MRGtQuHToZ8/F3iqnY2OwebRpqnVODSWbCbM=;
  b=AxcmYDx7u8691ULCdmMKD5p4VCWVXFumDcIfpGCS4hk9I86qHEplWT66
   aL5E2ycN64LD0Z3k5MxRoKAox2bxRI5mE6R1/K3nqN6CzY0DkJOhydVyK
   dQEh24shNPAbHWEgdKIIjTp2EYuFRWCwZeFqQGtj/gMNj5MvlDdpM067H
   h7V9munvrdxymGTpLoqzw/st+i37woTBHVMg81sEXVoq+F2FQJ+sFddU3
   UtbYPA1A0BvPK1oCqV/FXFaiAUJR7VNiMU6efQ4QKxpscihG9Gb2AyQXu
   juKwHo+RIwKhcTAX7NT8pKKcy5pwH5HEjDI1MULA79SSxvoYzBVI2GYRS
   A==;
X-CSE-ConnectionGUID: WPWlUXyJSu23R/fG0NIi5w==
X-CSE-MsgGUID: 1lcNwpt/S06b8GCmoM/zCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608197"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608197"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:21 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ADDEF1C1C703
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 65614C00820
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 06EC014002C2;
	Tue, 21 Apr 2026 09:56:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/49] ghostscript: upgrade 10.06.0 -> 10.07.0
Date: Tue, 21 Apr 2026 17:55:19 +0800
Message-ID: <20260421095559.1856-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235617

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-32-bit-build.patch
removed since it's included in 10.07.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ghostscript/0001-Fix-32-bit-build.patch   | 63 -------------------
 ...ript_10.06.0.bb => ghostscript_10.07.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
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
2.43.0


