Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D3E307F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id i12so19400089wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VooIUrpLs4+uSZT9sserExRFDpp7zqihPP2B/Yhfvz8=;
	b=CiWlyg2vPOomDqy/MEjc06ndY1su5/tzMVLyntTqXLW9OzyiJCrJd9GJZV21KeD1/K
	9GxME7dvxCIEc3DuN9Tt1c5/hKgEjNzYcGSjXOBWdT+RQV+JR8WxJqBH0YxEVA3IMApw
	SX7Z9MIq1MW8l7GWqWIt+KTI4rMPHKxWe3Y9XNyxcVkLXK2yzsJZkuJOUskV1LIcsl1W
	/TC46bCMzIKFqw+XCKG4mCOGYXgI4Ezm44wpAbz5Dw8EiMcYoMQAq3dtT3YUsAqZj+0W
	O6uyA/ZBzXv15gWFkDgFie44W6En0GDdniugkaTpvSWexbx8EchkVcqlJKje6d26hW4U
	ZUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VooIUrpLs4+uSZT9sserExRFDpp7zqihPP2B/Yhfvz8=;
	b=kb3TQMcP8qrAKIr9SE9eYoEM1UMTAjIrPDEZnddgNUbXBMkNJuPCHdupkGMwnQ7Osy
	3IeFiNzV+m9eIXpli81DhZ0ht9lSBQtuYyrmfch4KkGsT/cHmu221XqhXSJC5ezMGrIm
	biOLlixuUjZ+7FGmuP+whT/X4dmfO37lw4u74FZ8Vr5oCmT86v+nZOHJYo+0AGklQnPp
	+V6dyLKaWN3dYnEdqGy68yJZsW69DwdMvig2QbKynFxJ2fKoJVywDZtiQ+14POy681oz
	uO0Jp+Wo14/GoUzQrg3BEEMfv6mYvB5NZ3NWEgHhMu4k86kg+FQ+l2w9ut3Otg3k3e55
	i1Yw==
X-Gm-Message-State: APjAAAV/28zrSsVN5vKveQq9FiA85idt5ChI7ngAQ3WkWKKDpN+uGwal
	AQcqiEjATjqAKyiYT7Q6Rfqs5u2j
X-Google-Smtp-Source: APXvYqxlZmsT/syyltfq9W1uTe6ipApYDeWfCcSCu+oc9Qz7heMLiv9zTSlz8m5qU/uRLjE45kkCmQ==
X-Received: by 2002:a5d:490e:: with SMTP id x14mr28852701wrq.75.1574082501743; 
	Mon, 18 Nov 2019 05:08:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:52 +0100
Message-Id: <20191118130801.21860-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/13] tiff: update to 4.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 13:08:22 -0000

Drop backported patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libtiff/tiff/CVE-2019-14973.patch         | 415 ------------------
 .../libtiff/tiff/CVE-2019-17546.patch         | 103 -----
 .../libtiff/tiff/CVE-2019-6128.patch          |  52 ---
 .../libtiff/tiff/CVE-2019-7663.patch          |  77 ----
 .../libtiff/{tiff_4.0.10.bb => tiff_4.1.0.bb} |  10 +-
 5 files changed, 3 insertions(+), 654 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.10.bb => tiff_4.1.0.bb} (85%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
deleted file mode 100644
index 8345295d07b..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
+++ /dev/null
@@ -1,415 +0,0 @@
-From 95ac1e3fcc6b643b5bd100f2ea54faca0a003315 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Fri, 20 Sep 2019 09:33:22 -0400
-Subject: [PATCH] libtiff-fix-CVE-2019-14973
-
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/commit/2218055ca67d84be596a13080e8f50f22116555c]
-CVE: CVE-2019-14973
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
----
- libtiff/tif_aux.c      | 49 +++++++++++++++++++++++++++++++++++++-----
- libtiff/tif_getimage.c |  6 ++----
- libtiff/tif_luv.c      |  8 +------
- libtiff/tif_pixarlog.c |  7 +-----
- libtiff/tif_read.c     | 38 +++++++++-----------------------
- libtiff/tif_strip.c    | 35 ++++--------------------------
- libtiff/tif_tile.c     | 27 +++--------------------
- libtiff/tiffiop.h      |  7 +++++-
- 8 files changed, 71 insertions(+), 106 deletions(-)
-
-diff --git a/libtiff/tif_aux.c b/libtiff/tif_aux.c
-index 4ece162f..33fb8a44 100644
---- a/libtiff/tif_aux.c
-+++ b/libtiff/tif_aux.c
-@@ -57,18 +57,57 @@ _TIFFMultiply64(TIFF* tif, uint64 first, uint64 second, const char* where)
- 	return bytes;
- }
- 
-+tmsize_t
-+_TIFFMultiplySSize(TIFF* tif, tmsize_t first, tmsize_t second, const char* where)
-+{
-+    if( first <= 0 || second <= 0 )
-+    {
-+        if( tif != NULL && where != NULL )
-+        {
-+            TIFFErrorExt(tif->tif_clientdata, where,
-+                        "Invalid argument to _TIFFMultiplySSize() in %s", where);
-+        }
-+        return 0;
-+    }
-+
-+    if( first > TIFF_TMSIZE_T_MAX / second )
-+    {
-+        if( tif != NULL && where != NULL )
-+        {
-+            TIFFErrorExt(tif->tif_clientdata, where,
-+                        "Integer overflow in %s", where);
-+        }
-+        return 0;
-+    }
-+    return first * second;
-+}
-+
-+tmsize_t _TIFFCastUInt64ToSSize(TIFF* tif, uint64 val, const char* module)
-+{
-+    if( val > (uint64)TIFF_TMSIZE_T_MAX )
-+    {
-+        if( tif != NULL && module != NULL )
-+        {
-+            TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
-+        }
-+        return 0;
-+    }
-+    return (tmsize_t)val;
-+}
-+
- void*
- _TIFFCheckRealloc(TIFF* tif, void* buffer,
- 		  tmsize_t nmemb, tmsize_t elem_size, const char* what)
- {
- 	void* cp = NULL;
--	tmsize_t bytes = nmemb * elem_size;
--
-+        tmsize_t count = _TIFFMultiplySSize(tif, nmemb, elem_size, NULL);
- 	/*
--	 * XXX: Check for integer overflow.
-+	 * Check for integer overflow.
- 	 */
--	if (nmemb && elem_size && bytes / elem_size == nmemb)
--		cp = _TIFFrealloc(buffer, bytes);
-+	if (count != 0)
-+	{
-+		cp = _TIFFrealloc(buffer, count);
-+	}
- 
- 	if (cp == NULL) {
- 		TIFFErrorExt(tif->tif_clientdata, tif->tif_name,
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
-index 6a9d5a7c..2106ca21 100644
---- a/libtiff/tif_getimage.c
-+++ b/libtiff/tif_getimage.c
-@@ -755,9 +755,8 @@ gtTileSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 	uint32 leftmost_tw;
- 
- 	tilesize = TIFFTileSize(tif);  
--	bufsize = TIFFSafeMultiply(tmsize_t,alpha?4:3,tilesize);
-+	bufsize = _TIFFMultiplySSize(tif, alpha?4:3,tilesize, "gtTileSeparate");
- 	if (bufsize == 0) {
--		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in %s", "gtTileSeparate");
- 		return (0);
- 	}
- 
-@@ -1019,9 +1018,8 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
-         uint16 colorchannels;
- 
- 	stripsize = TIFFStripSize(tif);  
--	bufsize = TIFFSafeMultiply(tmsize_t,alpha?4:3,stripsize);
-+	bufsize = _TIFFMultiplySSize(tif,alpha?4:3,stripsize, "gtStripSeparate");
- 	if (bufsize == 0) {
--		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in %s", "gtStripSeparate");
- 		return (0);
- 	}
- 
-diff --git a/libtiff/tif_luv.c b/libtiff/tif_luv.c
-index aa35ea07..46d2dff2 100644
---- a/libtiff/tif_luv.c
-+++ b/libtiff/tif_luv.c
-@@ -1264,16 +1264,10 @@ LogL16GuessDataFmt(TIFFDirectory *td)
- 	return (SGILOGDATAFMT_UNKNOWN);
- }
- 
--
--#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
--#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
--
- static tmsize_t
- multiply_ms(tmsize_t m1, tmsize_t m2)
- {
--        if( m1 == 0 || m2 > TIFF_TMSIZE_T_MAX / m1 )
--            return 0;
--        return m1 * m2;
-+        return _TIFFMultiplySSize(NULL, m1, m2, NULL);
- }
- 
- static int
-diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
-index 7438d692..b52a3ee4 100644
---- a/libtiff/tif_pixarlog.c
-+++ b/libtiff/tif_pixarlog.c
-@@ -634,15 +634,10 @@ PixarLogGuessDataFmt(TIFFDirectory *td)
- 	return guess;
- }
- 
--#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
--#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
--
- static tmsize_t
- multiply_ms(tmsize_t m1, tmsize_t m2)
- {
--        if( m1 == 0 || m2 > TIFF_TMSIZE_T_MAX / m1 )
--            return 0;
--        return m1 * m2;
-+        return _TIFFMultiplySSize(NULL, m1, m2, NULL);
- }
- 
- static tmsize_t
-diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
-index e63810cc..8db39d7a 100644
---- a/libtiff/tif_read.c
-+++ b/libtiff/tif_read.c
-@@ -29,9 +29,6 @@
- #include "tiffiop.h"
- #include <stdio.h>
- 
--#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
--#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
--
- int TIFFFillStrip(TIFF* tif, uint32 strip);
- int TIFFFillTile(TIFF* tif, uint32 tile);
- static int TIFFStartStrip(TIFF* tif, uint32 strip);
-@@ -49,6 +46,8 @@ TIFFReadRawTile1(TIFF* tif, uint32 tile, void* buf, tmsize_t size, const char* m
- #define THRESHOLD_MULTIPLIER 10
- #define MAX_THRESHOLD (THRESHOLD_MULTIPLIER * THRESHOLD_MULTIPLIER * THRESHOLD_MULTIPLIER * INITIAL_THRESHOLD)
- 
-+#define TIFF_INT64_MAX ((((int64)0x7FFFFFFF) << 32) | 0xFFFFFFFF)
-+
- /* Read 'size' bytes in tif_rawdata buffer starting at offset 'rawdata_offset'
-  * Returns 1 in case of success, 0 otherwise. */
- static int TIFFReadAndRealloc( TIFF* tif, tmsize_t size,
-@@ -734,23 +733,8 @@ TIFFReadRawStrip(TIFF* tif, uint32 strip, void* buf, tmsize_t size)
- 		return ((tmsize_t)(-1));
- 	}
- 	bytecount = td->td_stripbytecount[strip];
--	if ((int64)bytecount <= 0) {
--#if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
--		TIFFErrorExt(tif->tif_clientdata, module,
--			     "%I64u: Invalid strip byte count, strip %lu",
--			     (unsigned __int64) bytecount,
--			     (unsigned long) strip);
--#else
--		TIFFErrorExt(tif->tif_clientdata, module,
--			     "%llu: Invalid strip byte count, strip %lu",
--			     (unsigned long long) bytecount,
--			     (unsigned long) strip);
--#endif
--		return ((tmsize_t)(-1));
--	}
--	bytecountm = (tmsize_t)bytecount;
--	if ((uint64)bytecountm!=bytecount) {
--		TIFFErrorExt(tif->tif_clientdata, module, "Integer overflow");
-+        bytecountm = _TIFFCastUInt64ToSSize(tif, bytecount, module);
-+	if (bytecountm == 0) {
- 		return ((tmsize_t)(-1));
- 	}
- 	if (size != (tmsize_t)(-1) && size < bytecountm)
-@@ -774,7 +758,7 @@ TIFFFillStrip(TIFF* tif, uint32 strip)
- 	if ((tif->tif_flags&TIFF_NOREADRAW)==0)
- 	{
- 		uint64 bytecount = td->td_stripbytecount[strip];
--		if ((int64)bytecount <= 0) {
-+		if( bytecount == 0 || bytecount > (uint64)TIFF_INT64_MAX ) {
- #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
- 			TIFFErrorExt(tif->tif_clientdata, module,
- 				"Invalid strip byte count %I64u, strip %lu",
-@@ -801,7 +785,7 @@ TIFFFillStrip(TIFF* tif, uint32 strip)
- 			    (bytecount - 4096) / 10 > (uint64)stripsize  )
- 			{
- 				uint64 newbytecount = (uint64)stripsize * 10 + 4096;
--				if( (int64)newbytecount >= 0 )
-+				if( newbytecount == 0 || newbytecount > (uint64)TIFF_INT64_MAX )
- 				{
- #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
- 					TIFFWarningExt(tif->tif_clientdata, module,
-@@ -1196,10 +1180,8 @@ TIFFReadRawTile(TIFF* tif, uint32 tile, void* buf, tmsize_t size)
- 	bytecount64 = td->td_stripbytecount[tile];
- 	if (size != (tmsize_t)(-1) && (uint64)size < bytecount64)
- 		bytecount64 = (uint64)size;
--	bytecountm = (tmsize_t)bytecount64;
--	if ((uint64)bytecountm!=bytecount64)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
-+	bytecountm = _TIFFCastUInt64ToSSize(tif, bytecount64, module);
-+        if( bytecountm == 0 ) {
- 		return ((tmsize_t)(-1));
- 	}
- 	return (TIFFReadRawTile1(tif, tile, buf, bytecountm, module));
-@@ -1221,7 +1203,7 @@ TIFFFillTile(TIFF* tif, uint32 tile)
- 	if ((tif->tif_flags&TIFF_NOREADRAW)==0)
- 	{
- 		uint64 bytecount = td->td_stripbytecount[tile];
--		if ((int64)bytecount <= 0) {
-+		if( bytecount == 0 || bytecount > (uint64)TIFF_INT64_MAX ) {
- #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
- 			TIFFErrorExt(tif->tif_clientdata, module,
- 				"%I64u: Invalid tile byte count, tile %lu",
-@@ -1248,7 +1230,7 @@ TIFFFillTile(TIFF* tif, uint32 tile)
- 			    (bytecount - 4096) / 10 > (uint64)stripsize  )
- 			{
- 				uint64 newbytecount = (uint64)stripsize * 10 + 4096;
--				if( (int64)newbytecount >= 0 )
-+				if( newbytecount == 0 || newbytecount > (uint64)TIFF_INT64_MAX )
- 				{
- #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
- 					TIFFWarningExt(tif->tif_clientdata, module,
-diff --git a/libtiff/tif_strip.c b/libtiff/tif_strip.c
-index 5b76fba5..2366acf0 100644
---- a/libtiff/tif_strip.c
-+++ b/libtiff/tif_strip.c
-@@ -129,15 +129,8 @@ TIFFVStripSize(TIFF* tif, uint32 nrows)
- {
- 	static const char module[] = "TIFFVStripSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFVStripSize64(tif,nrows);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
--		n=0;
--	}
--	return(n);
-+        return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-@@ -211,15 +204,8 @@ TIFFStripSize(TIFF* tif)
- {
- 	static const char module[] = "TIFFStripSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFStripSize64(tif);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-@@ -330,14 +316,8 @@ TIFFScanlineSize(TIFF* tif)
- {
- 	static const char module[] = "TIFFScanlineSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFScanlineSize64(tif);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m) {
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer arithmetic overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-@@ -366,15 +346,8 @@ TIFFRasterScanlineSize(TIFF* tif)
- {
- 	static const char module[] = "TIFFRasterScanlineSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFRasterScanlineSize64(tif);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer arithmetic overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /* vim: set ts=8 sts=8 sw=8 noet: */
-diff --git a/libtiff/tif_tile.c b/libtiff/tif_tile.c
-index 58fe9354..661cc771 100644
---- a/libtiff/tif_tile.c
-+++ b/libtiff/tif_tile.c
-@@ -181,15 +181,8 @@ TIFFTileRowSize(TIFF* tif)
- {
- 	static const char module[] = "TIFFTileRowSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFTileRowSize64(tif);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-@@ -248,15 +241,8 @@ TIFFVTileSize(TIFF* tif, uint32 nrows)
- {
- 	static const char module[] = "TIFFVTileSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFVTileSize64(tif,nrows);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-@@ -272,15 +258,8 @@ TIFFTileSize(TIFF* tif)
- {
- 	static const char module[] = "TIFFTileSize";
- 	uint64 m;
--	tmsize_t n;
- 	m=TIFFTileSize64(tif);
--	n=(tmsize_t)m;
--	if ((uint64)n!=m)
--	{
--		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
--		n=0;
--	}
--	return(n);
-+	return _TIFFCastUInt64ToSSize(tif, m, module);
- }
- 
- /*
-diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
-index 186c291f..558484fe 100644
---- a/libtiff/tiffiop.h
-+++ b/libtiff/tiffiop.h
-@@ -77,6 +77,9 @@ extern int snprintf(char* str, size_t size, const char* format, ...);
- #define	FALSE	0
- #endif
- 
-+#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
-+#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
-+
- typedef struct client_info {
-     struct client_info *next;
-     void *data;
-@@ -258,7 +261,7 @@ struct tiff {
- #define TIFFhowmany8_64(x) (((x)&0x07)?((uint64)(x)>>3)+1:(uint64)(x)>>3)
- #define TIFFroundup_64(x, y) (TIFFhowmany_64(x,y)*(y))
- 
--/* Safe multiply which returns zero if there is an integer overflow */
-+/* Safe multiply which returns zero if there is an *unsigned* integer overflow. This macro is not safe for *signed* integer types */
- #define TIFFSafeMultiply(t,v,m) ((((t)(m) != (t)0) && (((t)(((v)*(m))/(m))) == (t)(v))) ? (t)((v)*(m)) : (t)0)
- 
- #define TIFFmax(A,B) ((A)>(B)?(A):(B))
-@@ -368,6 +371,8 @@ extern TIFFErrorHandlerExt _TIFFerrorHandlerExt;
- 
- extern uint32 _TIFFMultiply32(TIFF*, uint32, uint32, const char*);
- extern uint64 _TIFFMultiply64(TIFF*, uint64, uint64, const char*);
-+extern tmsize_t _TIFFMultiplySSize(TIFF*, tmsize_t, tmsize_t, const char*);
-+extern tmsize_t _TIFFCastUInt64ToSSize(TIFF*, uint64, const char*);
- extern void* _TIFFCheckMalloc(TIFF*, tmsize_t, tmsize_t, const char*);
- extern void* _TIFFCheckRealloc(TIFF*, void*, tmsize_t, tmsize_t, const char*);
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
deleted file mode 100644
index 04c5410930a..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-libtiff: fix CVE-2019-17546
-
-Added after 4.0.10 release.
-
-CVE: CVE-2019-17546
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-commit 4bb584a35f87af42d6cf09d15e9ce8909a839145
-Author: Even Rouault <even.rouault@spatialys.com>
-Date:   Thu Aug 15 15:05:28 2019 +0200
-
-    RGBA interface: fix integer overflow potentially causing write heap buffer overflow, especially on 32 bit builds. Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16443. Credit to OSS Fuzz
-
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
-index c88b5fa..4da785d 100644
---- a/libtiff/tif_getimage.c
-+++ b/libtiff/tif_getimage.c
-@@ -949,16 +949,23 @@ gtStripContig(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 	fromskew = (w < imagewidth ? imagewidth - w : 0);
- 	for (row = 0; row < h; row += nrow)
- 	{
-+		uint32 temp;
- 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
- 		nrow = (row + rowstoread > h ? h - row : rowstoread);
- 		nrowsub = nrow;
- 		if ((nrowsub%subsamplingver)!=0)
- 			nrowsub+=subsamplingver-nrowsub%subsamplingver;
-+		temp = (row + img->row_offset)%rowsperstrip + nrowsub;
-+		if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
-+		{
-+			TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripContig");
-+			return 0;
-+		}
- 		if (_TIFFReadEncodedStripAndAllocBuffer(tif,
- 		    TIFFComputeStrip(tif,row+img->row_offset, 0),
- 		    (void**)(&buf),
-                     maxstripsize,
--		    ((row + img->row_offset)%rowsperstrip + nrowsub) * scanline)==(tmsize_t)(-1)
-+		    temp * scanline)==(tmsize_t)(-1)
- 		    && (buf == NULL || img->stoponerr))
- 		{
- 			ret = 0;
-@@ -1051,15 +1058,22 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 	fromskew = (w < imagewidth ? imagewidth - w : 0);
- 	for (row = 0; row < h; row += nrow)
- 	{
-+                uint32 temp;
- 		rowstoread = rowsperstrip - (row + img->row_offset) % rowsperstrip;
- 		nrow = (row + rowstoread > h ? h - row : rowstoread);
- 		offset_row = row + img->row_offset;
-+                temp = (row + img->row_offset)%rowsperstrip + nrow;
-+                if( scanline > 0 && temp > (size_t)(TIFF_TMSIZE_T_MAX / scanline) )
-+                {
-+                        TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in gtStripSeparate");
-+                        return 0;
-+                }
-                 if( buf == NULL )
-                 {
-                     if (_TIFFReadEncodedStripAndAllocBuffer(
-                             tif, TIFFComputeStrip(tif, offset_row, 0),
-                             (void**) &buf, bufsize,
--                            ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
-+                            temp * scanline)==(tmsize_t)(-1)
-                         && (buf == NULL || img->stoponerr))
-                     {
-                             ret = 0;
-@@ -1079,7 +1093,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
-                     }
-                 }
- 		else if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 0),
--		    p0, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
-+		    p0, temp * scanline)==(tmsize_t)(-1)
- 		    && img->stoponerr)
- 		{
- 			ret = 0;
-@@ -1087,7 +1101,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 		}
- 		if (colorchannels > 1 
-                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 1),
--                                            p1, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
-+                                            p1, temp * scanline) == (tmsize_t)(-1)
- 		    && img->stoponerr)
- 		{
- 			ret = 0;
-@@ -1095,7 +1109,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 		}
- 		if (colorchannels > 1 
-                     && TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, 2),
--                                            p2, ((row + img->row_offset)%rowsperstrip + nrow) * scanline) == (tmsize_t)(-1)
-+                                            p2, temp * scanline) == (tmsize_t)(-1)
- 		    && img->stoponerr)
- 		{
- 			ret = 0;
-@@ -1104,7 +1118,7 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
- 		if (alpha)
- 		{
- 			if (TIFFReadEncodedStrip(tif, TIFFComputeStrip(tif, offset_row, colorchannels),
--			    pa, ((row + img->row_offset)%rowsperstrip + nrow) * scanline)==(tmsize_t)(-1)
-+			    pa, temp * scanline)==(tmsize_t)(-1)
- 			    && img->stoponerr)
- 			{
- 				ret = 0;
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
deleted file mode 100644
index 6f1fd4d4478..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-6128.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-CVE: CVE-2019-6128
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0c74a9f49b8d7a36b17b54a7428b3526d20f88a8 Mon Sep 17 00:00:00 2001
-From: Scott Gayou <github.scott@gmail.com>
-Date: Wed, 23 Jan 2019 15:03:53 -0500
-Subject: [PATCH] Fix for simple memory leak that was assigned CVE-2019-6128.
-
-pal2rgb failed to free memory on a few errors. This was reported
-here: http://bugzilla.maptools.org/show_bug.cgi?id=2836.
----
- tools/pal2rgb.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
-index 01d8502ec..9492f1cf1 100644
---- a/tools/pal2rgb.c
-+++ b/tools/pal2rgb.c
-@@ -118,12 +118,14 @@ main(int argc, char* argv[])
- 	    shortv != PHOTOMETRIC_PALETTE) {
- 		fprintf(stderr, "%s: Expecting a palette image.\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	if (!TIFFGetField(in, TIFFTAG_COLORMAP, &rmap, &gmap, &bmap)) {
- 		fprintf(stderr,
- 		    "%s: No colormap (not a valid palette image).\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	bitspersample = 0;
-@@ -131,11 +133,14 @@ main(int argc, char* argv[])
- 	if (bitspersample != 8) {
- 		fprintf(stderr, "%s: Sorry, can only handle 8-bit images.\n",
- 		    argv[optind]);
-+		(void) TIFFClose(in);
- 		return (-1);
- 	}
- 	out = TIFFOpen(argv[optind+1], "w");
--	if (out == NULL)
-+	if (out == NULL) {
-+		(void) TIFFClose(in);
- 		return (-2);
-+	}
- 	cpTags(in, out);
- 	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &imagewidth);
- 	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
--- 
-2.21.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
deleted file mode 100644
index f244fb2f324..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-7663.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-CVE: CVE-2019-7663
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From c6fc6c1fa895024c86285c58efd6424cf8078f32 Mon Sep 17 00:00:00 2001
-From: Thomas Bernard <miniupnp@free.fr>
-Date: Mon, 11 Feb 2019 10:05:33 +0100
-Subject: [PATCH 1/2] check that (Tile Width)*(Samples/Pixel) do no overflow
-
-fixes bug 2833
----
- tools/tiffcp.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 2f406e2d..f0ee2c02 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -1408,7 +1408,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
- 	int status = 1;
- 	uint32 imagew = TIFFRasterScanlineSize(in);
- 	uint32 tilew = TIFFTileRowSize(in);
--	int iskew  = imagew - tilew*spp;
-+	int iskew;
- 	tsize_t tilesize = TIFFTileSize(in);
- 	tdata_t tilebuf;
- 	uint8* bufp = (uint8*) buf;
-@@ -1416,6 +1416,12 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
- 	uint32 row;
- 	uint16 bps = 0, bytes_per_sample;
- 
-+	if (spp > (0x7fffffff / tilew))
-+	{
-+		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
-+		return 0;
-+	}
-+	iskew = imagew - tilew*spp;
- 	tilebuf = _TIFFmalloc(tilesize);
- 	if (tilebuf == 0)
- 		return 0;
--- 
-2.20.1
-
-
-From da6454aa80b9bb3154dfab4e8b21637de47531e0 Mon Sep 17 00:00:00 2001
-From: Thomas Bernard <miniupnp@free.fr>
-Date: Mon, 11 Feb 2019 21:42:03 +0100
-Subject: [PATCH 2/2] tiffcp.c: use INT_MAX
-
----
- tools/tiffcp.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index f0ee2c02..8c81aa4f 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -41,6 +41,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <limits.h>
- 
- #include <ctype.h>
- 
-@@ -1416,7 +1417,7 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
- 	uint32 row;
- 	uint16 bps = 0, bytes_per_sample;
- 
--	if (spp > (0x7fffffff / tilew))
-+	if (spp > (INT_MAX / tilew))
- 	{
- 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
- 		return 0;
--- 
-2.20.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
similarity index 85%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 5c008c53fed..1f92c185131 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -5,13 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2019-6128.patch \
-           file://CVE-2019-7663.patch \
-           file://CVE-2019-14973.patch \
-           file://CVE-2019-17546.patch \
-"
-SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
-SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
+          "
+SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
+SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


