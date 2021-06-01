Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.58647.1622557116700598724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KWf5lCZM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 6so10806614pgk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v6p0wprokd2EbIHaLBXpbrHAoahi8xVkJtUEUCprbSA=;
        b=KWf5lCZMxXo+AYLrfZdK3dkerSt2xkZYtrHI3tlqOmuP5fi/o7BBGZA5epBUs7p7Pt
         MyVhhZK1gkniRJqbXkDbb3g114OhlyPZbs4meR6pNihreKASZC9xBSvyrkfz84Wj/hch
         TPi6XSMXXPdCrqgL0QozpaXwklGHQ5tGA68dGb+oBk8C2gaTHZqa/gvZ8hnaxET20WfE
         y/8ZZrqfUpedGQaliacrMTmlY661oG6LoL9/rS2qUVhHNwWEBDxyQh7hpwvOFPZb7g6G
         YpjwIkPEKYDvAbk7vomXoP8zBM/idSLdndJd0ySEvkr3dvRC2/zhDYODZv+lwy+iXs7f
         n77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6p0wprokd2EbIHaLBXpbrHAoahi8xVkJtUEUCprbSA=;
        b=BZNnd6AorwUrOKVHvPNpP0qDsUwhmCgjepGFQ7MHbCWir9kvj2zNeo2sL0q6QoGjNw
         c5fX1oksttR5Gj1kPd/G5a0XmmshiTBhDQr1E18/sCpNk4tJ/NjBDSRPOqVMhhf/L6Cq
         mZoy69V2eBPXU7kYoyZg3leBxszfk85qhcM5X0Wf/8uNPSDf7+IpupjyX9ogllp5zOhE
         tv+0I985rz9WKPhrMAHyH5EmK390D0hxcgsa4qqOf4qqg6ena7FnadFbAjmCuimfL3A2
         viuWSiLLmNjhxqaCBNrsR3oPyNCVayWRO2fm4U3zEU968q9WsRbTSnMuR9Z3qqDoAdNA
         d4OQ==
X-Gm-Message-State: AOAM530BObP4xrxx8zz+8oSv9MkAZYTnVG4GTrlsKUwF7HOBDzP9mvJo
	+//B8WqJQ7yI92OaQjBMV+L0kyAnsXuZ+hf6p3w=
X-Google-Smtp-Source: ABdhPJxb9psfHuxejUjKJi37UA81DYoGWh3FejyX50eTpt4DQpg5LFpYJd90g5UY4iCs9I5+pRwA/Q==
X-Received: by 2002:a63:1109:: with SMTP id g9mr8788342pgl.358.1622557115434;
        Tue, 01 Jun 2021 07:18:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/26] tiff: Add fix for CVE-2020-35521 and CVE-2020-35522
Date: Tue,  1 Jun 2021 04:17:50 -1000
Message-Id: <03a65159093e0b2df4bc867c873b5c43721b9a9c.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akash hadke <akash.hadke@kpit.com>

Added fix for CVE-2020-35521 and CVE-2020-35522
Link: https://gitlab.com/libtiff/libtiff/-/commit/b5a935d96b21cda0f434230cdf8ca958cd8b4eef.patch

Added below support patches for CVE-2020-35521 and CVE-2020-35522

1. 001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
Link: https://gitlab.com/libtiff/libtiff/-/commit/02875964eba5c4a2ea98c41562835428214adfe7.patch

2. 002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
Link: https://gitlab.com/libtiff/libtiff/-/commit/ca70b5e702b9f503333344b2d46691de9feae84e.patch

Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...or_CVE-2020-35521_and_CVE-2020-35522.patch | 148 ++++++++++++++++++
 ...or_CVE-2020-35521_and_CVE-2020-35522.patch |  27 ++++
 .../CVE-2020-35521_and_CVE-2020-35522.patch   | 119 ++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   3 +
 4 files changed, 297 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch

diff --git a/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000000..9b4724a325
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,148 @@
+From 02875964eba5c4a2ea98c41562835428214adfe7 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sat, 7 Mar 2020 13:21:56 +0100
+Subject: [PATCH] tiff2rgba: output usage to stdout when using -h
+
+also uses std C EXIT_FAILURE / EXIT_SUCCESS
+see #17
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 39 ++++++++++++++++++++++++---------------
+ 1 file changed, 24 insertions(+), 15 deletions(-)
+---
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/02875964eba5c4a2ea98c41562835428214adfe7.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index 2eb6f6c4..ef643653 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -39,6 +39,13 @@
+ #include "tiffiop.h"
+ #include "tiffio.h"
+ 
++#ifndef EXIT_SUCCESS
++#define EXIT_SUCCESS 0
++#endif
++#ifndef EXIT_FAILURE
++#define EXIT_FAILURE 1
++#endif
++
+ #define	streq(a,b)	(strcmp(a,b) == 0)
+ #define	CopyField(tag, v) \
+     if (TIFFGetField(in, tag, &v)) TIFFSetField(out, tag, v)
+@@ -68,7 +75,7 @@ main(int argc, char* argv[])
+ 	extern char *optarg;
+ #endif
+ 
+-	while ((c = getopt(argc, argv, "c:r:t:bn8")) != -1)
++	while ((c = getopt(argc, argv, "c:r:t:bn8h")) != -1)
+ 		switch (c) {
+ 			case 'b':
+ 				process_by_block = 1;
+@@ -86,7 +93,7 @@ main(int argc, char* argv[])
+ 				else if (streq(optarg, "zip"))
+ 					compression = COMPRESSION_DEFLATE;
+ 				else
+-					usage(-1);
++					usage(EXIT_FAILURE);
+ 				break;
+ 
+ 			case 'r':
+@@ -105,17 +112,20 @@ main(int argc, char* argv[])
+ 				bigtiff_output = 1;
+ 				break;
+ 
++			case 'h':
++				usage(EXIT_SUCCESS);
++				/*NOTREACHED*/
+ 			case '?':
+-				usage(0);
++				usage(EXIT_FAILURE);
+ 				/*NOTREACHED*/
+ 		}
+ 
+ 	if (argc - optind < 2)
+-		usage(-1);
++		usage(EXIT_FAILURE);
+ 
+ 	out = TIFFOpen(argv[argc-1], bigtiff_output?"w8":"w");
+ 	if (out == NULL)
+-		return (-2);
++		return (EXIT_FAILURE);
+ 
+ 	for (; optind < argc-1; optind++) {
+ 		in = TIFFOpen(argv[optind], "r");
+@@ -132,7 +142,7 @@ main(int argc, char* argv[])
+ 		}
+ 	}
+ 	(void) TIFFClose(out);
+-	return (0);
++	return (EXIT_SUCCESS);
+ }
+ 
+ static int
+@@ -166,7 +176,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     if (tile_width != (rastersize / tile_height) / sizeof( uint32))
+     {
+ 	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+@@ -182,7 +192,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     if (tile_width != wrk_linesize / sizeof (uint32))
+     {
+         TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+@@ -279,7 +289,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     if (width != (rastersize / rowsperstrip) / sizeof( uint32))
+     {
+ 	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+@@ -295,7 +305,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     if (width != wrk_linesize / sizeof (uint32))
+     {
+         TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+@@ -528,7 +538,7 @@ tiffcvt(TIFF* in, TIFF* out)
+             return( cvt_whole_image( in, out ) );
+ }
+ 
+-static char* stuff[] = {
++const static char* stuff[] = {
+     "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+@@ -547,13 +557,12 @@ static char* stuff[] = {
+ static void
+ usage(int code)
+ {
+-	char buf[BUFSIZ];
+ 	int i;
++	FILE * out = (code == EXIT_SUCCESS) ? stdout : stderr;
+ 
+-	setbuf(stderr, buf);
+-        fprintf(stderr, "%s\n\n", TIFFGetVersion());
++        fprintf(out, "%s\n\n", TIFFGetVersion());
+ 	for (i = 0; stuff[i] != NULL; i++)
+-		fprintf(stderr, "%s\n", stuff[i]);
++		fprintf(out, "%s\n", stuff[i]);
+ 	exit(code);
+ }
+ 
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000000..b6e1842a54
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,27 @@
+From ca70b5e702b9f503333344b2d46691de9feae84e Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 3 Oct 2020 18:16:27 +0200
+Subject: [PATCH] tiff2rgba.c: fix -Wold-style-declaration warning
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+---
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ca70b5e702b9f503333344b2d46691de9feae84e.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index ef643653..fbc383aa 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -538,7 +538,7 @@ tiffcvt(TIFF* in, TIFF* out)
+             return( cvt_whole_image( in, out ) );
+ }
+ 
+-const static char* stuff[] = {
++static const char* stuff[] = {
+     "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000000..129721ff3e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,119 @@
+From 98a254f5b92cea22f5436555ff7fceb12afee84d Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sun, 15 Nov 2020 17:02:51 +0100
+Subject: [PATCH 1/2] enforce (configurable) memory limit in tiff2rgba
+
+fixes #207
+fixes #209
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+---
+CVE: CVE-2020-35521
+CVE: CVE-2020-35522
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b5a935d96b21cda0f434230cdf8ca958cd8b4eef.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index fbc383aa..764395f6 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -60,6 +60,10 @@ uint32 rowsperstrip = (uint32) -1;
+ int process_by_block = 0; /* default is whole image at once */
+ int no_alpha = 0;
+ int bigtiff_output = 0;
++#define DEFAULT_MAX_MALLOC (256 * 1024 * 1024)
++/* malloc size limit (in bytes)
++ * disabled when set to 0 */
++static tmsize_t maxMalloc = DEFAULT_MAX_MALLOC;
+ 
+ 
+ static int tiffcvt(TIFF* in, TIFF* out);
+@@ -75,8 +79,11 @@ main(int argc, char* argv[])
+ 	extern char *optarg;
+ #endif
+ 
+-	while ((c = getopt(argc, argv, "c:r:t:bn8h")) != -1)
++	while ((c = getopt(argc, argv, "c:r:t:bn8hM:")) != -1)
+ 		switch (c) {
++			case 'M':
++				maxMalloc = (tmsize_t)strtoul(optarg, NULL, 0) << 20;
++				break;
+ 			case 'b':
+ 				process_by_block = 1;
+ 				break;
+@@ -405,6 +412,12 @@ cvt_whole_image( TIFF *in, TIFF *out )
+ 		  (unsigned long)width, (unsigned long)height);
+         return 0;
+     }
++    if (maxMalloc != 0 && (tmsize_t)pixel_count * (tmsize_t)sizeof(uint32) > maxMalloc) {
++	TIFFError(TIFFFileName(in),
++		  "Raster size " TIFF_UINT64_FORMAT " over memory limit (" TIFF_UINT64_FORMAT "), try -b option.",
++		  (uint64)pixel_count * sizeof(uint32), (uint64)maxMalloc);
++        return 0;
++    }
+ 
+     rowsperstrip = TIFFDefaultStripSize(out, rowsperstrip);
+     TIFFSetField(out, TIFFTAG_ROWSPERSTRIP, rowsperstrip);
+@@ -530,6 +543,13 @@ tiffcvt(TIFF* in, TIFF* out)
+ 	TIFFSetField(out, TIFFTAG_SOFTWARE, TIFFGetVersion());
+ 	CopyField(TIFFTAG_DOCUMENTNAME, stringv);
+ 
++	if (maxMalloc != 0 && TIFFStripSize(in) > maxMalloc)
++	{
++		TIFFError(TIFFFileName(in),
++			  "Strip Size " TIFF_UINT64_FORMAT " over memory limit (" TIFF_UINT64_FORMAT ")",
++			  (uint64)TIFFStripSize(in), (uint64)maxMalloc);
++		return 0;
++	}
+         if( process_by_block && TIFFIsTiled( in ) )
+             return( cvt_by_tile( in, out ) );
+         else if( process_by_block )
+@@ -539,7 +559,7 @@ tiffcvt(TIFF* in, TIFF* out)
+ }
+ 
+ static const char* stuff[] = {
+-    "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
++    "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] [-M size] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+     " zip\t\tZip/Deflate encoding",
+@@ -551,6 +571,7 @@ static const char* stuff[] = {
+     " -b (progress by block rather than as a whole image)",
+     " -n don't emit alpha component.",
+     " -8 write BigTIFF file instead of ClassicTIFF",
++    " -M set the memory allocation limit in MiB. 0 to disable limit",
+     NULL
+ };
+ 
+-- 
+GitLab
+
+
+From e9e504193ef1f87e9cb5e986586b0cbe3254e421 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sun, 15 Nov 2020 17:08:42 +0100
+Subject: [PATCH 2/2] tiff2rgba.1: -M option
+
+---
+ man/tiff2rgba.1 | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/man/tiff2rgba.1 b/man/tiff2rgba.1
+index d9c9baae..fe9ebb2c 100644
+--- a/man/tiff2rgba.1
++++ b/man/tiff2rgba.1
+@@ -87,6 +87,10 @@ Drop the alpha component from the output file, producing a pure RGB file.
+ Currently this does not work if the
+ .B \-b
+ flag is also in effect.
++.TP
++.BI \-M " size"
++Set maximum memory allocation size (in MiB). The default is 256MiB.
++Set to 0 to disable the limit.
+ .SH "SEE ALSO"
+ .BR tiff2bw (1),
+ .BR TIFFReadRGBAImage (3t),
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index cfea18ed29..43f210111d 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2020-35523.patch  \
            file://CVE-2020-35524-1.patch \
            file://CVE-2020-35524-2.patch \
+           file://001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
+           file://002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
+           file://CVE-2020-35521_and_CVE-2020-35522.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1

