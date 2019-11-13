Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id BABEE7F6AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d29so1197758plj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xiLvHSrTSEoyZqVLmW5CXcnRPyNxCX5nbUj+DfTLBFE=;
	b=XSqxvIPPbzTsbOW6PPlrZL7ANEbr52OmoU0JWvj++vWXLWJFtsmddozNyQ1kMYidhj
	C8sKGxffTtz2KtVCjQODFLgzxojJ2RXOYBUw3tDOh9ohAbOmKa/qBvNBlfUzTRkF/u5H
	N7Fccc4ITNcc7kgIP8kiGhzXZtoM+iza21L7PNiJPMDdyuGH+x3Bg/sEdELASQNdaqza
	1ANqHuQGZ2Cos+gf0HtznOmQTfY+n4JQltpoLlASw0rdAqr0JooTib32iKlHMtOb+Ypm
	Mz47hNwUd9659kdQlIONKvQkdQS67+UXgNXIAr6x7qYH1A66sonILp6azAtUYD7+HRmp
	yHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xiLvHSrTSEoyZqVLmW5CXcnRPyNxCX5nbUj+DfTLBFE=;
	b=CDscf4eFlVP9SlqdJ8DEyEmI+BZITa3gmkPrBfJ3edYZ0BunTEoK1+pDbCfMVwqFxx
	16g5UU2RT75/9aIfUv3j78grZJV8+2wFp6ZztuT60ddJZM3mSwep6As05COUrkUFVaq4
	T0Src28Z6pp6+X0IoaWV/KRhL21mFpaq38lkvOvzbmJcnG+vxsFhmG/giFG3Iljr89tT
	DupSiqlk6D/uiAg5ScOzYMbeeV04C2SpUINjbXVGiMsMvgGEml0WA3LGYl78SyCOPeuF
	fhEWLGFBceh2HAyleC/GIX9sHVqXLJj1M9StYV8p29mUCn4KqgvXn9P6akLq8XAzcAAE
	cNfA==
X-Gm-Message-State: APjAAAVEHxlpQberB8e5Q2YdGjdYsI7PhsObHCjA30fNwrOU+2DfP4t8
	6B31kfodzpPb972T3B8tC9YIdZj5
X-Google-Smtp-Source: APXvYqx/glItTmPe0/wWSpMxz3OTJFV0PFXsa09LrKo4fan9YnlRoaPOxafX8qu4Gaf4HPkBfvgNmA==
X-Received: by 2002:a17:902:d891:: with SMTP id
	b17mr4336454plz.308.1573658396395; 
	Wed, 13 Nov 2019 07:19:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:13 -0800
Message-Id: <cf26271c34fcbd76f90831955040020c3ee91b6b.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 10/25] tiff: fix CVE-2019-14973
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:55 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

CVE reference: https://nvd.nist.gov/vuln/detail/CVE-2019-14973
Upstream merge: https://gitlab.com/libtiff/libtiff/commit/2218055c

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
[fixup for Warrior context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtiff/tiff/CVE-2019-14973.patch              | 415 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   3 +-
 2 files changed, 417 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
new file mode 100644
index 0000000..8345295
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2019-14973.patch
@@ -0,0 +1,415 @@
+From 95ac1e3fcc6b643b5bd100f2ea54faca0a003315 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 20 Sep 2019 09:33:22 -0400
+Subject: [PATCH] libtiff-fix-CVE-2019-14973
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/commit/2218055ca67d84be596a13080e8f50f22116555c]
+CVE: CVE-2019-14973
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ libtiff/tif_aux.c      | 49 +++++++++++++++++++++++++++++++++++++-----
+ libtiff/tif_getimage.c |  6 ++----
+ libtiff/tif_luv.c      |  8 +------
+ libtiff/tif_pixarlog.c |  7 +-----
+ libtiff/tif_read.c     | 38 +++++++++-----------------------
+ libtiff/tif_strip.c    | 35 ++++--------------------------
+ libtiff/tif_tile.c     | 27 +++--------------------
+ libtiff/tiffiop.h      |  7 +++++-
+ 8 files changed, 71 insertions(+), 106 deletions(-)
+
+diff --git a/libtiff/tif_aux.c b/libtiff/tif_aux.c
+index 4ece162f..33fb8a44 100644
+--- a/libtiff/tif_aux.c
++++ b/libtiff/tif_aux.c
+@@ -57,18 +57,57 @@ _TIFFMultiply64(TIFF* tif, uint64 first, uint64 second, const char* where)
+ 	return bytes;
+ }
+ 
++tmsize_t
++_TIFFMultiplySSize(TIFF* tif, tmsize_t first, tmsize_t second, const char* where)
++{
++    if( first <= 0 || second <= 0 )
++    {
++        if( tif != NULL && where != NULL )
++        {
++            TIFFErrorExt(tif->tif_clientdata, where,
++                        "Invalid argument to _TIFFMultiplySSize() in %s", where);
++        }
++        return 0;
++    }
++
++    if( first > TIFF_TMSIZE_T_MAX / second )
++    {
++        if( tif != NULL && where != NULL )
++        {
++            TIFFErrorExt(tif->tif_clientdata, where,
++                        "Integer overflow in %s", where);
++        }
++        return 0;
++    }
++    return first * second;
++}
++
++tmsize_t _TIFFCastUInt64ToSSize(TIFF* tif, uint64 val, const char* module)
++{
++    if( val > (uint64)TIFF_TMSIZE_T_MAX )
++    {
++        if( tif != NULL && module != NULL )
++        {
++            TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
++        }
++        return 0;
++    }
++    return (tmsize_t)val;
++}
++
+ void*
+ _TIFFCheckRealloc(TIFF* tif, void* buffer,
+ 		  tmsize_t nmemb, tmsize_t elem_size, const char* what)
+ {
+ 	void* cp = NULL;
+-	tmsize_t bytes = nmemb * elem_size;
+-
++        tmsize_t count = _TIFFMultiplySSize(tif, nmemb, elem_size, NULL);
+ 	/*
+-	 * XXX: Check for integer overflow.
++	 * Check for integer overflow.
+ 	 */
+-	if (nmemb && elem_size && bytes / elem_size == nmemb)
+-		cp = _TIFFrealloc(buffer, bytes);
++	if (count != 0)
++	{
++		cp = _TIFFrealloc(buffer, count);
++	}
+ 
+ 	if (cp == NULL) {
+ 		TIFFErrorExt(tif->tif_clientdata, tif->tif_name,
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 6a9d5a7c..2106ca21 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -755,9 +755,8 @@ gtTileSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+ 	uint32 leftmost_tw;
+ 
+ 	tilesize = TIFFTileSize(tif);  
+-	bufsize = TIFFSafeMultiply(tmsize_t,alpha?4:3,tilesize);
++	bufsize = _TIFFMultiplySSize(tif, alpha?4:3,tilesize, "gtTileSeparate");
+ 	if (bufsize == 0) {
+-		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in %s", "gtTileSeparate");
+ 		return (0);
+ 	}
+ 
+@@ -1019,9 +1018,8 @@ gtStripSeparate(TIFFRGBAImage* img, uint32* raster, uint32 w, uint32 h)
+         uint16 colorchannels;
+ 
+ 	stripsize = TIFFStripSize(tif);  
+-	bufsize = TIFFSafeMultiply(tmsize_t,alpha?4:3,stripsize);
++	bufsize = _TIFFMultiplySSize(tif,alpha?4:3,stripsize, "gtStripSeparate");
+ 	if (bufsize == 0) {
+-		TIFFErrorExt(tif->tif_clientdata, TIFFFileName(tif), "Integer overflow in %s", "gtStripSeparate");
+ 		return (0);
+ 	}
+ 
+diff --git a/libtiff/tif_luv.c b/libtiff/tif_luv.c
+index aa35ea07..46d2dff2 100644
+--- a/libtiff/tif_luv.c
++++ b/libtiff/tif_luv.c
+@@ -1264,16 +1264,10 @@ LogL16GuessDataFmt(TIFFDirectory *td)
+ 	return (SGILOGDATAFMT_UNKNOWN);
+ }
+ 
+-
+-#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
+-#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
+-
+ static tmsize_t
+ multiply_ms(tmsize_t m1, tmsize_t m2)
+ {
+-        if( m1 == 0 || m2 > TIFF_TMSIZE_T_MAX / m1 )
+-            return 0;
+-        return m1 * m2;
++        return _TIFFMultiplySSize(NULL, m1, m2, NULL);
+ }
+ 
+ static int
+diff --git a/libtiff/tif_pixarlog.c b/libtiff/tif_pixarlog.c
+index 7438d692..b52a3ee4 100644
+--- a/libtiff/tif_pixarlog.c
++++ b/libtiff/tif_pixarlog.c
+@@ -634,15 +634,10 @@ PixarLogGuessDataFmt(TIFFDirectory *td)
+ 	return guess;
+ }
+ 
+-#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
+-#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
+-
+ static tmsize_t
+ multiply_ms(tmsize_t m1, tmsize_t m2)
+ {
+-        if( m1 == 0 || m2 > TIFF_TMSIZE_T_MAX / m1 )
+-            return 0;
+-        return m1 * m2;
++        return _TIFFMultiplySSize(NULL, m1, m2, NULL);
+ }
+ 
+ static tmsize_t
+diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
+index e63810cc..8db39d7a 100644
+--- a/libtiff/tif_read.c
++++ b/libtiff/tif_read.c
+@@ -29,9 +29,6 @@
+ #include "tiffiop.h"
+ #include <stdio.h>
+ 
+-#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
+-#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
+-
+ int TIFFFillStrip(TIFF* tif, uint32 strip);
+ int TIFFFillTile(TIFF* tif, uint32 tile);
+ static int TIFFStartStrip(TIFF* tif, uint32 strip);
+@@ -49,6 +46,8 @@ TIFFReadRawTile1(TIFF* tif, uint32 tile, void* buf, tmsize_t size, const char* m
+ #define THRESHOLD_MULTIPLIER 10
+ #define MAX_THRESHOLD (THRESHOLD_MULTIPLIER * THRESHOLD_MULTIPLIER * THRESHOLD_MULTIPLIER * INITIAL_THRESHOLD)
+ 
++#define TIFF_INT64_MAX ((((int64)0x7FFFFFFF) << 32) | 0xFFFFFFFF)
++
+ /* Read 'size' bytes in tif_rawdata buffer starting at offset 'rawdata_offset'
+  * Returns 1 in case of success, 0 otherwise. */
+ static int TIFFReadAndRealloc( TIFF* tif, tmsize_t size,
+@@ -734,23 +733,8 @@ TIFFReadRawStrip(TIFF* tif, uint32 strip, void* buf, tmsize_t size)
+ 		return ((tmsize_t)(-1));
+ 	}
+ 	bytecount = td->td_stripbytecount[strip];
+-	if ((int64)bytecount <= 0) {
+-#if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+-		TIFFErrorExt(tif->tif_clientdata, module,
+-			     "%I64u: Invalid strip byte count, strip %lu",
+-			     (unsigned __int64) bytecount,
+-			     (unsigned long) strip);
+-#else
+-		TIFFErrorExt(tif->tif_clientdata, module,
+-			     "%llu: Invalid strip byte count, strip %lu",
+-			     (unsigned long long) bytecount,
+-			     (unsigned long) strip);
+-#endif
+-		return ((tmsize_t)(-1));
+-	}
+-	bytecountm = (tmsize_t)bytecount;
+-	if ((uint64)bytecountm!=bytecount) {
+-		TIFFErrorExt(tif->tif_clientdata, module, "Integer overflow");
++        bytecountm = _TIFFCastUInt64ToSSize(tif, bytecount, module);
++	if (bytecountm == 0) {
+ 		return ((tmsize_t)(-1));
+ 	}
+ 	if (size != (tmsize_t)(-1) && size < bytecountm)
+@@ -774,7 +758,7 @@ TIFFFillStrip(TIFF* tif, uint32 strip)
+ 	if ((tif->tif_flags&TIFF_NOREADRAW)==0)
+ 	{
+ 		uint64 bytecount = td->td_stripbytecount[strip];
+-		if ((int64)bytecount <= 0) {
++		if( bytecount == 0 || bytecount > (uint64)TIFF_INT64_MAX ) {
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 			TIFFErrorExt(tif->tif_clientdata, module,
+ 				"Invalid strip byte count %I64u, strip %lu",
+@@ -801,7 +785,7 @@ TIFFFillStrip(TIFF* tif, uint32 strip)
+ 			    (bytecount - 4096) / 10 > (uint64)stripsize  )
+ 			{
+ 				uint64 newbytecount = (uint64)stripsize * 10 + 4096;
+-				if( (int64)newbytecount >= 0 )
++				if( newbytecount == 0 || newbytecount > (uint64)TIFF_INT64_MAX )
+ 				{
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 					TIFFWarningExt(tif->tif_clientdata, module,
+@@ -1196,10 +1180,8 @@ TIFFReadRawTile(TIFF* tif, uint32 tile, void* buf, tmsize_t size)
+ 	bytecount64 = td->td_stripbytecount[tile];
+ 	if (size != (tmsize_t)(-1) && (uint64)size < bytecount64)
+ 		bytecount64 = (uint64)size;
+-	bytecountm = (tmsize_t)bytecount64;
+-	if ((uint64)bytecountm!=bytecount64)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
++	bytecountm = _TIFFCastUInt64ToSSize(tif, bytecount64, module);
++        if( bytecountm == 0 ) {
+ 		return ((tmsize_t)(-1));
+ 	}
+ 	return (TIFFReadRawTile1(tif, tile, buf, bytecountm, module));
+@@ -1221,7 +1203,7 @@ TIFFFillTile(TIFF* tif, uint32 tile)
+ 	if ((tif->tif_flags&TIFF_NOREADRAW)==0)
+ 	{
+ 		uint64 bytecount = td->td_stripbytecount[tile];
+-		if ((int64)bytecount <= 0) {
++		if( bytecount == 0 || bytecount > (uint64)TIFF_INT64_MAX ) {
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 			TIFFErrorExt(tif->tif_clientdata, module,
+ 				"%I64u: Invalid tile byte count, tile %lu",
+@@ -1248,7 +1230,7 @@ TIFFFillTile(TIFF* tif, uint32 tile)
+ 			    (bytecount - 4096) / 10 > (uint64)stripsize  )
+ 			{
+ 				uint64 newbytecount = (uint64)stripsize * 10 + 4096;
+-				if( (int64)newbytecount >= 0 )
++				if( newbytecount == 0 || newbytecount > (uint64)TIFF_INT64_MAX )
+ 				{
+ #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
+ 					TIFFWarningExt(tif->tif_clientdata, module,
+diff --git a/libtiff/tif_strip.c b/libtiff/tif_strip.c
+index 5b76fba5..2366acf0 100644
+--- a/libtiff/tif_strip.c
++++ b/libtiff/tif_strip.c
+@@ -129,15 +129,8 @@ TIFFVStripSize(TIFF* tif, uint32 nrows)
+ {
+ 	static const char module[] = "TIFFVStripSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFVStripSize64(tif,nrows);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
+-		n=0;
+-	}
+-	return(n);
++        return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+@@ -211,15 +204,8 @@ TIFFStripSize(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFStripSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFStripSize64(tif);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+@@ -330,14 +316,8 @@ TIFFScanlineSize(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFScanlineSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFScanlineSize64(tif);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m) {
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer arithmetic overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+@@ -366,15 +346,8 @@ TIFFRasterScanlineSize(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFRasterScanlineSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFRasterScanlineSize64(tif);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer arithmetic overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /* vim: set ts=8 sts=8 sw=8 noet: */
+diff --git a/libtiff/tif_tile.c b/libtiff/tif_tile.c
+index 58fe9354..661cc771 100644
+--- a/libtiff/tif_tile.c
++++ b/libtiff/tif_tile.c
+@@ -181,15 +181,8 @@ TIFFTileRowSize(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFTileRowSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFTileRowSize64(tif);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+@@ -248,15 +241,8 @@ TIFFVTileSize(TIFF* tif, uint32 nrows)
+ {
+ 	static const char module[] = "TIFFVTileSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFVTileSize64(tif,nrows);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+@@ -272,15 +258,8 @@ TIFFTileSize(TIFF* tif)
+ {
+ 	static const char module[] = "TIFFTileSize";
+ 	uint64 m;
+-	tmsize_t n;
+ 	m=TIFFTileSize64(tif);
+-	n=(tmsize_t)m;
+-	if ((uint64)n!=m)
+-	{
+-		TIFFErrorExt(tif->tif_clientdata,module,"Integer overflow");
+-		n=0;
+-	}
+-	return(n);
++	return _TIFFCastUInt64ToSSize(tif, m, module);
+ }
+ 
+ /*
+diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
+index 186c291f..558484fe 100644
+--- a/libtiff/tiffiop.h
++++ b/libtiff/tiffiop.h
+@@ -77,6 +77,9 @@ extern int snprintf(char* str, size_t size, const char* format, ...);
+ #define	FALSE	0
+ #endif
+ 
++#define TIFF_SIZE_T_MAX ((size_t) ~ ((size_t)0))
++#define TIFF_TMSIZE_T_MAX (tmsize_t)(TIFF_SIZE_T_MAX >> 1)
++
+ typedef struct client_info {
+     struct client_info *next;
+     void *data;
+@@ -258,7 +261,7 @@ struct tiff {
+ #define TIFFhowmany8_64(x) (((x)&0x07)?((uint64)(x)>>3)+1:(uint64)(x)>>3)
+ #define TIFFroundup_64(x, y) (TIFFhowmany_64(x,y)*(y))
+ 
+-/* Safe multiply which returns zero if there is an integer overflow */
++/* Safe multiply which returns zero if there is an *unsigned* integer overflow. This macro is not safe for *signed* integer types */
+ #define TIFFSafeMultiply(t,v,m) ((((t)(m) != (t)0) && (((t)(((v)*(m))/(m))) == (t)(v))) ? (t)((v)*(m)) : (t)0)
+ 
+ #define TIFFmax(A,B) ((A)>(B)?(A):(B))
+@@ -368,6 +371,8 @@ extern TIFFErrorHandlerExt _TIFFerrorHandlerExt;
+ 
+ extern uint32 _TIFFMultiply32(TIFF*, uint32, uint32, const char*);
+ extern uint64 _TIFFMultiply64(TIFF*, uint64, uint64, const char*);
++extern tmsize_t _TIFFMultiplySSize(TIFF*, tmsize_t, tmsize_t, const char*);
++extern tmsize_t _TIFFCastUInt64ToSSize(TIFF*, uint64, const char*);
+ extern void* _TIFFCheckMalloc(TIFF*, tmsize_t, tmsize_t, const char*);
+ extern void* _TIFFCheckRealloc(TIFF*, void*, tmsize_t, tmsize_t, const char*);
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 8e3e227..a526fc0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -8,7 +8,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
            file://CVE-2019-6128.patch \
            file://CVE-2019-7663.patch \
-           "
+           file://CVE-2019-14973.patch \
+"
 SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
 SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
-- 
2.7.4


