Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143A4CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 16:13:04 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.1065.1758816778511888693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 09:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XjUtkDmy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250925161252469696e3200002074c-is8tmf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250925161252469696e3200002074c
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 18:12:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FoANTO3hrgs/o6ppye5D45paGrOzKbbnPV/Nx75763Y=;
 b=XjUtkDmyxJoEZOOI8zmgcQSXgvt3+y22ldDtyxpjILFScL+t9MlX9xiHnYux0TgFCNqgdq
 NiQqzacqiGJagTtpIGNzBkMBYsFeFnqjz5j8IpSLxoKDPZBH3PM6c54xsbpH6E98ihulhioQ
 OOqcU3uO0qsgaD4ZiAbm11Jdmhu3aLOqXMm8NW/dy//UpwiVE+gUaAwSGQBtaodakRTXI6Np
 TfuIc8aeXvk85mDtT8pXMXv/lempOXlt+ZRZKOr2YkMpVOf5pqjuJFABKzbj3e65wxz/wN0E
 n9zm4Gw/z0SdmkcwT8JV3AorhjRWvELyc/RatbavXv94mDtIGSv37+EQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] tiff: upgrade 4.7.0 -> 4.7.1
Date: Thu, 25 Sep 2025 18:12:04 +0200
Message-Id: <20250925161206.975177-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 16:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224045

From: Peter Marko <peter.marko@siemens.com>

Removed patches included in this new release

License-Update: BSD license added based on [1]

[1] https://gitlab.com/libtiff/libtiff/-/commit/a0b623c7809ea2aa4978d5d7b7bd10e519294c78

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2024-13978_1.patch       | 77 -------------------
 .../libtiff/tiff/CVE-2024-13978_2.patch       | 45 -----------
 .../libtiff/tiff/CVE-2025-8176_1.patch        | 61 ---------------
 .../libtiff/tiff/CVE-2025-8176_2.patch        | 31 --------
 .../libtiff/tiff/CVE-2025-8176_3.patch        | 28 -------
 .../libtiff/tiff/CVE-2025-8177_1.patch        | 36 ---------
 .../libtiff/tiff/CVE-2025-8177_2.patch        | 29 -------
 .../libtiff/tiff/CVE-2025-8534.patch          | 62 ---------------
 .../libtiff/{tiff_4.7.0.bb => tiff_4.7.1.bb}  | 14 +---
 9 files changed, 3 insertions(+), 380 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.7.0.bb => tiff_4.7.1.bb} (85%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
deleted file mode 100644
index 8bb7cf280d1..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 6dd7006103f9612fbd22e9c7c1b93d16691370a4 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Fri, 27 Sep 2024 11:21:57 -0700
-Subject: [PATCH 1/7] Fix issue #649 in fax2ps caused by regression in commit
- https://gitlab.com/libtiff/libtiff/-/commit/28c38d648b64a66c3218778c4745225fe3e3a06d
- where TIFFTAG_FAXFILLFUNC is being used rather than an output buffer.
-
-CVE: CVE-2024-13978
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/7be20ccaab97455f192de0ac561ceda7cd9e12d1]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- libtiff/tif_read.c | 21 ++++++++++++++++-----
- 1 file changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
-index 7efab59..964f119 100644
---- a/libtiff/tif_read.c
-+++ b/libtiff/tif_read.c
-@@ -466,7 +466,9 @@ int TIFFReadScanline(TIFF *tif, void *buf, uint32_t row, uint16_t sample)
-     }
-     else
-     {
--        memset(buf, 0, (size_t)tif->tif_scanlinesize);
-+        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
-+        if (buf)
-+            memset(buf, 0, (size_t)tif->tif_scanlinesize);
-     }
-     return (e > 0 ? 1 : -1);
- }
-@@ -554,7 +556,10 @@ tmsize_t TIFFReadEncodedStrip(TIFF *tif, uint32_t strip, void *buf,
-         stripsize = size;
-     if (!TIFFFillStrip(tif, strip))
-     {
--        memset(buf, 0, (size_t)stripsize);
-+        /* The output buf may be NULL, in particular if TIFFTAG_FAXFILLFUNC
-+           is being used. Thus, memset must be conditional on buf not NULL. */
-+        if (buf)
-+            memset(buf, 0, (size_t)stripsize);
-         return ((tmsize_t)(-1));
-     }
-     if ((*tif->tif_decodestrip)(tif, buf, stripsize, plane) <= 0)
-@@ -976,7 +981,9 @@ tmsize_t TIFFReadEncodedTile(TIFF *tif, uint32_t tile, void *buf, tmsize_t size)
-         size = tilesize;
-     if (!TIFFFillTile(tif, tile))
-     {
--        memset(buf, 0, (size_t)size);
-+        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
-+        if (buf)
-+            memset(buf, 0, (size_t)size);
-         return ((tmsize_t)(-1));
-     }
-     else if ((*tif->tif_decodetile)(tif, (uint8_t *)buf, size,
-@@ -1569,7 +1576,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
-         if (!TIFFStartTile(tif, strile))
-         {
-             ret = 0;
--            memset(outbuf, 0, (size_t)outsize);
-+            /* See related TIFFReadEncodedStrip comment. */
-+            if (outbuf)
-+                memset(outbuf, 0, (size_t)outsize);
-         }
-         else if (!(*tif->tif_decodetile)(
-                      tif, (uint8_t *)outbuf, outsize,
-@@ -1596,7 +1605,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
-             if (!TIFFStartStrip(tif, strile))
-             {
-                 ret = 0;
--                memset(outbuf, 0, (size_t)outsize);
-+                /* See related TIFFReadEncodedStrip comment. */
-+                if (outbuf)
-+                    memset(outbuf, 0, (size_t)outsize);
-             }
-             else if (!(*tif->tif_decodestrip)(
-                          tif, (uint8_t *)outbuf, outsize,
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
deleted file mode 100644
index a022fd41e24..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a80b9eb70a8137e2571b2f32bd05d1a22a5603c4 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 5 Oct 2024 09:45:30 -0700
-Subject: [PATCH 2/7] Check TIFFTAG_TILELENGTH and TIFFTAGTILEWIDTH for valid
- input, addresses issue #650
-
-CVE: CVE-2024-13978
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiff2pdf.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
-index 6dfc239..2010fee 100644
---- a/tools/tiff2pdf.c
-+++ b/tools/tiff2pdf.c
-@@ -1371,8 +1371,24 @@ void t2p_read_tiff_init(T2P *t2p, TIFF *input)
-             t2p->pdf_xrefcount += (t2p->tiff_tiles[i].tiles_tilecount - 1) * 2;
-             TIFFGetField(input, TIFFTAG_TILEWIDTH,
-                          &(t2p->tiff_tiles[i].tiles_tilewidth));
-+            if (t2p->tiff_tiles[i].tiles_tilewidth < 1)
-+            {
-+                TIFFError(TIFF2PDF_MODULE, "Invalid tile width (%d), %s",
-+                          t2p->tiff_tiles[i].tiles_tilewidth,
-+                          TIFFFileName(input));
-+                t2p->t2p_error = T2P_ERR_ERROR;
-+                return;
-+            }
-             TIFFGetField(input, TIFFTAG_TILELENGTH,
-                          &(t2p->tiff_tiles[i].tiles_tilelength));
-+            if (t2p->tiff_tiles[i].tiles_tilelength < 1)
-+            {
-+                TIFFError(TIFF2PDF_MODULE, "Invalid tile length (%d), %s",
-+                          t2p->tiff_tiles[i].tiles_tilelength,
-+                          TIFFFileName(input));
-+                t2p->t2p_error = T2P_ERR_ERROR;
-+                return;
-+            }
-             t2p->tiff_tiles[i].tiles_tiles = (T2P_TILE *)_TIFFmalloc(
-                 TIFFSafeMultiply(tmsize_t, t2p->tiff_tiles[i].tiles_tilecount,
-                                  sizeof(T2P_TILE)));
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
deleted file mode 100644
index 14d3cb445e3..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ed35364de1e3ad444e6f954514ee68eb9be496d2 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Mon, 19 May 2025 10:53:30 -0700
-Subject: [PATCH 3/7] Don't skip the first line of the input image. Addresses
- issue #703
-
-CVE: CVE-2025-8176
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiffdither.c | 4 ++--
- tools/tiffmedian.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/tiffdither.c b/tools/tiffdither.c
-index 714fe03..bfed6df 100644
---- a/tools/tiffdither.c
-+++ b/tools/tiffdither.c
-@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
-     nextptr = nextline;
-     for (j = 0; j < imagewidth; ++j)
-         *nextptr++ = *inptr++;
--    for (i = 1; i < imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         tmpptr = thisline;
-         thisline = nextline;
-@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
-                     nextptr[0] += v / 16;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             goto skip_on_error;
-     }
-     goto exit_label;
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 02b0bc2..f6cf26c 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 1; i <= imagelength; ++i)
-+    for (i = 0; i <= imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
-@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-                 nextptr += 3;
-             }
-         }
--        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
-+        if (TIFFWriteScanline(out, outline, i, 0) < 0)
-             break;
-     }
- bad:
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
deleted file mode 100644
index 74cf5ae277b..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c090daf37e7f2ad09ec7e9cfabd1c5fde3dee6eb Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:25:16 -0700
-Subject: [PATCH 4/7] Fix tiffmedian bug #707
-
-CVE: CVE-2025-8176
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiffmedian.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index f6cf26c..8c9978b 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
-     for (i = 0; i < imagelength; i++)
-     {
-         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
--            break;
-+        {
-+            fprintf(stderr, "Error reading scanline\n");
-+            exit(EXIT_FAILURE);
-+        }
-         inptr = inputline;
-         for (j = imagewidth; j-- > 0;)
-         {
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
deleted file mode 100644
index e0f41f8d716..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From bd645550275963797343e8e91a9a8fee318428e0 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Sat, 24 May 2025 21:38:09 -0700
-Subject: [PATCH 5/7] conflict resolution
-
-CVE: CVE-2025-8176
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/tiffmedian.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
-index 8c9978b..47e0524 100644
---- a/tools/tiffmedian.c
-+++ b/tools/tiffmedian.c
-@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
-     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
- 
-     GetInputLine(in, 0, goto bad); /* get first line */
--    for (i = 0; i <= imagelength; ++i)
-+    for (i = 0; i < imagelength; ++i)
-     {
-         SWAP(short *, thisline, nextline);
-         lastline = (i >= imax);
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
deleted file mode 100644
index 9437ffcc208..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 01bf5ba7f4a27c5e28ce467a66b13e066556e545 Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Thu, 19 Jun 2025 11:51:33 -0700
-Subject: [PATCH 6/7] Fix for thumbnail issue #715
-
-CVE: CVE-2025-8177
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/75d8eca6f106c01aadf76b8500a7d062b12f2d82]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/thumbnail.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/tools/thumbnail.c b/tools/thumbnail.c
-index b4cb114..432d172 100644
---- a/tools/thumbnail.c
-+++ b/tools/thumbnail.c
-@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
-             }
-             acc += bits[*src & mask1];
-         }
--        *row++ = cmap[(255 * acc) / area];
-+        if (255 * acc / area < 256)
-+        {
-+            *row++ = cmap[(255 * acc) / area];
-+        }
-+        else
-+        {
-+            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
-+            row++;
-+        }
-     }
- }
- 
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
deleted file mode 100644
index 356e3ba4024..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c3ad38afb9986b9ddcd7d95367ded152488260cd Mon Sep 17 00:00:00 2001
-From: Lee Howard <faxguy@howardsilvan.com>
-Date: Mon, 23 Jun 2025 10:09:07 -0700
-Subject: [PATCH 7/7] set a default value - assumes cmap[0] was not, itself,
- uninitialized
-
-CVE: CVE-2025-8177
-Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22]
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- tools/thumbnail.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/thumbnail.c b/tools/thumbnail.c
-index 432d172..110ea42 100644
---- a/tools/thumbnail.c
-+++ b/tools/thumbnail.c
-@@ -627,7 +627,7 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
-         else
-         {
-             fprintf(stderr, "acc=%d, area=%d\n", acc, area);
--            row++;
-+            *row++ = cmap[0];
-         }
-     }
- }
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
deleted file mode 100644
index b3bc0e0d942..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 6ba36f159fd396ad11bf6b7874554197736ecc8b Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Sat, 2 Aug 2025 18:55:54 +0200
-Subject: [PATCH] tiff2ps: check return of TIFFGetFiled() for 
- TIFFTAG_STRIPBYTECOUNTS and TIFFTAG_TILEBYTECOUNTS to avoid NULL pointer 
- dereference.
-
-Closes #718
-
-CVE: CVE-2025-8534
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tools/tiff2ps.c | 20 +++++++++++++++++---
- 1 file changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tiff2ps.c b/tools/tiff2ps.c
-index e5425bf..5c54205 100644
---- a/tools/tiff2ps.c
-+++ b/tools/tiff2ps.c
-@@ -2432,12 +2432,22 @@ int PS_Lvl2page(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
-     if (tiled_image)
-     {
-         num_chunks = TIFFNumberOfTiles(tif);
--        TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc);
-+        if (!TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc))
-+        {
-+            TIFFError(filename,
-+                      "Can't read bytecounts of tiles at PS_Lvl2page()");
-+            return (FALSE);
-+        }
-     }
-     else
-     {
-         num_chunks = TIFFNumberOfStrips(tif);
--        TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
-+        if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
-+        {
-+            TIFFError(filename,
-+                      "Can't read bytecounts of strips at PS_Lvl2page()");
-+            return (FALSE);
-+        }
-     }
- 
-     if (use_rawdata)
-@@ -3107,7 +3117,11 @@ void PSRawDataBW(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
-     (void)w;
-     (void)h;
-     TIFFGetFieldDefaulted(tif, TIFFTAG_FILLORDER, &fillorder);
--    TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
-+    if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
-+    {
-+        TIFFError(filename, "Can't read bytecounts of strips at PSRawDataBW()");
-+        return;
-+    }
- 
-     /*
-      * Find largest strip:
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
similarity index 85%
rename from meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 4fb74f387eb..f46c806cf25 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -3,23 +3,15 @@ DESCRIPTION = "Library provides support for the Tag Image File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE = "http://www.libtiff.org/"
-LICENSE = "libtiff"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
+LICENSE = "libtiff & BSD-4.3TAHOE"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-	   file://CVE-2024-13978_1.patch \
-	   file://CVE-2024-13978_2.patch \
-	   file://CVE-2025-8176_1.patch \
-	   file://CVE-2025-8176_2.patch \
-	   file://CVE-2025-8176_3.patch \
-	   file://CVE-2025-8177_1.patch \
-	   file://CVE-2025-8177_2.patch \
-           file://CVE-2025-8534.patch \
 	   "
 
-SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
+SRC_URI[sha256sum] = "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"

