Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65614C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 05:26:25 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.15490.1677648381444018450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 21:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=IXCOMfIF;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677648380; x=1709184380;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AtVUIhXwjrsphf1sf9o/vupFDfcLXqkmFv9MjWk0Xxk=;
  b=IXCOMfIF7URGW1kzgH2HA7SoQNwi58As1uwb2nEqh5LHhm1sSGbumHVN
   /tg/Fj1NAb5P12BIcNs/qEhtyI+C4+3+FuGCnwRi6/qKTL3Baz3GinDJf
   MLWjjGh/eYd6pSZD8M2srYIptFmTtZeIkNU/nbuKRX6ExaHf9yWC/+ofD
   jztu91v4ZuOm7qwRpnr7pXBBN4TH2TnGcDVvLFie/o7Gs0wB2P/nFaznY
   46u/d0WXFUzAP39hUNG3y0gca+lLOcg+XPqbfkddOpIe9FAEt/qRGopyB
   iV88GU4cTrY0uk8KGkTxmU521JFamUoEHPmVqj98MjZa2DEGCci23cHhm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396892088"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="396892088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 21:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="784193366"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="784193366"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 21:26:18 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [patch][dunfell] tiff: fix multiple CVEs
Date: Wed,  1 Mar 2023 13:26:10 +0800
Message-Id: <20230301052610.937798-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 05:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177865

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patches from debian
http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz

fix multiple CVEs:
CVE-2022-3570
CVE-2022-3597
CVE-2022-3598
CVE-2022-3599
CVE-2022-3626
CVE-2022-3627
CVE-2022-3970
CVE-2022-48281
CVE-2023-0795
CVE-2023-0796
CVE-2023-0797
CVE-2023-0798
CVE-2023-0799
CVE-2023-0800
CVE-2023-0801
CVE-2023-0802
CVE-2023-0803
CVE-2023-0804

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libtiff/files/CVE-2022-3570_3598.patch    | 659 ++++++++++++++++++
 .../files/CVE-2022-3597_3626_3627.patch       | 123 ++++
 .../libtiff/files/CVE-2022-3599.patch         | 277 ++++++++
 .../libtiff/files/CVE-2022-3970.patch         |  45 ++
 .../libtiff/files/CVE-2022-48281.patch        |  26 +
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 157 +++++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 135 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   7 +
 8 files changed, 1429 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3570_3598.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3597_3626_3627.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3570_3598.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3570_3598.patch
new file mode 100644
index 0000000000..760e20dd2b
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3570_3598.patch
@@ -0,0 +1,659 @@
+From 226e336cdceec933da2e9f72b6578c7a1bea450b Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Thu, 13 Oct 2022 14:33:27 +0000
+Subject: [PATCH] tiffcrop subroutines require a larger buffer (fixes #271,
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2022-3570 CVE-2022-3598
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/cfbb883bf6ea7bedcb04177cc4e52d304522fdff
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/24d3b2425af24432e0e4e2fd58b33f3b04c4bfa4
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-01-17
+
+ #381, #386, #388, #389, #435)
+
+---
+ tools/tiffcrop.c | 209 ++++++++++++++++++++++++++---------------------
+ 1 file changed, 117 insertions(+), 92 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c7877aa..c923920 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -126,6 +126,7 @@ static   char tiffcrop_rev_date[] = "03-03-2010";
+ 
+ #ifdef HAVE_STDINT_H
+ # include <stdint.h>
++# include <inttypes.h>
+ #endif
+ 
+ #ifndef HAVE_GETOPT
+@@ -212,6 +213,10 @@ extern int getopt(int argc, char * const argv[], const char *optstring);
+ 
+ #define TIFF_DIR_MAX  65534
+ 
++/* Some conversion subroutines require image buffers, which are at least 3 bytes
++ * larger than the necessary size for the image itself. */
++#define NUM_BUFF_OVERSIZE_BYTES   3
++
+ /* Offsets into buffer for margins and fixed width and length segments */
+ struct offset {
+   uint32  tmargin;
+@@ -233,7 +238,7 @@ struct offset {
+  */
+ 
+ struct  buffinfo {
+-  uint32 size;           /* size of this buffer */
++  size_t size;           /* size of this buffer */
+   unsigned char *buffer; /* address of the allocated buffer */
+ };
+ 
+@@ -771,8 +776,8 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8* buf,
+   uint32 dst_rowsize, shift_width;
+   uint32 bytes_per_sample, bytes_per_pixel;
+   uint32 trailing_bits, prev_trailing_bits;
+-  uint32 tile_rowsize  = TIFFTileRowSize(in);
+-  uint32 src_offset, dst_offset;
++  tmsize_t tile_rowsize  = TIFFTileRowSize(in);
++  tmsize_t src_offset, dst_offset;
+   uint32 row_offset, col_offset;
+   uint8 *bufp = (uint8*) buf;
+   unsigned char *src = NULL;
+@@ -822,7 +827,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8* buf,
+       TIFFError("readContigTilesIntoBuffer", "Integer overflow when calculating buffer size.");
+       exit(-1);
+   }
+-  tilebuf = _TIFFmalloc(tile_buffsize + 3);
++  tilebuf = _TIFFmalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf == 0)
+     return 0;
+   tilebuf[tile_buffsize] = 0;
+@@ -986,7 +991,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in, uint8 *obuf,
+   for (sample = 0; (sample < spp) && (sample < MAX_SAMPLES); sample++)
+     {
+     srcbuffs[sample] = NULL;
+-    tbuff = (unsigned char *)_TIFFmalloc(tilesize + 8);
++    tbuff = (unsigned char *)_TIFFmalloc(tilesize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!tbuff)
+       {
+       TIFFError ("readSeparateTilesIntoBuffer", 
+@@ -1181,7 +1186,8 @@ writeBufferToSeparateStrips (TIFF* out, uint8* buf,
+   }
+   rowstripsize = rowsperstrip * bytes_per_sample * (width + 1); 
+ 
+-  obuf = _TIFFmalloc (rowstripsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  obuf = _TIFFmalloc (rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (obuf == NULL)
+     return 1;
+   
+@@ -1194,7 +1200,7 @@ writeBufferToSeparateStrips (TIFF* out, uint8* buf,
+       stripsize = TIFFVStripSize(out, nrows);
+       src = buf + (row * rowsize);
+       total_bytes += stripsize;
+-      memset (obuf, '\0', rowstripsize);
++      memset (obuf, '\0',rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (extractContigSamplesToBuffer(obuf, src, nrows, width, s, spp, bps, dump))
+         {
+         _TIFFfree(obuf);
+@@ -1202,10 +1208,15 @@ writeBufferToSeparateStrips (TIFF* out, uint8* buf,
+ 	}
+       if ((dump->outfile != NULL) && (dump->level == 1))
+         {
+-        dump_info(dump->outfile, dump->format,"", 
++          if ((uint64_t)scanlinesize > 0x0ffffffffULL) {
++              dump_info(dump->infile, dump->format, "loadImage",
++                  "Attention: scanlinesize %"PRIu64" is larger than UINT32_MAX.\nFollowing dump might be wrong.",
++                  (uint64_t)scanlinesize);
++          }
++          dump_info(dump->outfile, dump->format,"",
+                   "Sample %2d, Strip: %2d, bytes: %4d, Row %4d, bytes: %4d, Input offset: %6d", 
+-                  s + 1, strip + 1, stripsize, row + 1, scanlinesize, src - buf);
+-        dump_buffer(dump->outfile, dump->format, nrows, scanlinesize, row, obuf);
++                  s + 1, strip + 1, stripsize, row + 1, (uint32)scanlinesize, src - buf);
++        dump_buffer(dump->outfile, dump->format, nrows, (uint32)scanlinesize, row, obuf);
+ 	}
+ 
+       if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0)
+@@ -1232,7 +1243,7 @@ static int writeBufferToContigTiles (TIFF* out, uint8* buf, uint32 imagelength,
+   uint32 tl, tw;
+   uint32 row, col, nrow, ncol;
+   uint32 src_rowsize, col_offset;
+-  uint32 tile_rowsize  = TIFFTileRowSize(out);
++  tmsize_t tile_rowsize  = TIFFTileRowSize(out);
+   uint8* bufp = (uint8*) buf;
+   tsize_t tile_buffsize = 0;
+   tsize_t tilesize = TIFFTileSize(out);
+@@ -1275,9 +1286,11 @@ static int writeBufferToContigTiles (TIFF* out, uint8* buf, uint32 imagelength,
+   }
+   src_rowsize = ((imagewidth * spp * bps) + 7U) / 8;
+ 
+-  tilebuf = _TIFFmalloc(tile_buffsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tilebuf = _TIFFmalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf == 0)
+     return 1;
++  memset(tilebuf, 0, tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   for (row = 0; row < imagelength; row += tl)
+     {
+     nrow = (row + tl > imagelength) ? imagelength - row : tl;
+@@ -1323,7 +1336,8 @@ static int writeBufferToSeparateTiles (TIFF* out, uint8* buf, uint32 imagelength
+ 				       uint32 imagewidth, tsample_t spp, 
+                                        struct dump_opts * dump)
+   {
+-  tdata_t obuf = _TIFFmalloc(TIFFTileSize(out));
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tdata_t obuf = _TIFFmalloc(TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BYTES);
+   uint32 tl, tw;
+   uint32 row, col, nrow, ncol;
+   uint32 src_rowsize, col_offset;
+@@ -1333,6 +1347,7 @@ static int writeBufferToSeparateTiles (TIFF* out, uint8* buf, uint32 imagelength
+ 
+   if (obuf == NULL)
+     return 1;
++  memset(obuf, 0, TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BYTES);
+ 
+   TIFFGetField(out, TIFFTAG_TILELENGTH, &tl);
+   TIFFGetField(out, TIFFTAG_TILEWIDTH, &tw);
+@@ -1754,14 +1769,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+                       
+                     *opt_offset = '\0';
+                     /* convert option to lowercase */
+-                    end = strlen (opt_ptr);
++                    end = (unsigned int)strlen (opt_ptr);
+                     for (i = 0; i < end; i++)
+                       *(opt_ptr + i) = tolower((int) *(opt_ptr + i));
+                     /* Look for dump format specification */
+                     if (strncmp(opt_ptr, "for", 3) == 0)
+                       {
+ 		      /* convert value to lowercase */
+-                      end = strlen (opt_offset + 1);
++                      end = (unsigned int)strlen (opt_offset + 1);
+                       for (i = 1; i <= end; i++)
+                         *(opt_offset + i) = tolower((int) *(opt_offset + i));
+                       /* check dump format value */
+@@ -2213,6 +2228,8 @@ main(int argc, char* argv[])
+   size_t length;
+   char   temp_filename[PATH_MAX + 16]; /* Extra space keeps the compiler from complaining */
+ 
++  assert(NUM_BUFF_OVERSIZE_BYTES >= 3);
++
+   little_endian = *((unsigned char *)&little_endian) & '1';
+ 
+   initImageData(&image);
+@@ -3114,13 +3131,13 @@ extractContigSamples32bits (uint8 *in, uint8 *out, uint32 cols,
+       /* If we have a full buffer's worth, write it out */
+       if (ready_bits >= 32)
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -3495,13 +3512,13 @@ extractContigSamplesShifted32bits (uint8 *in, uint8 *out, uint32 cols,
+         }
+       else  /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -3678,10 +3695,10 @@ extractContigSamplesToTileBuffer(uint8 *out, uint8 *in, uint32 rows, uint32 cols
+ static int readContigStripsIntoBuffer (TIFF* in, uint8* buf)
+ {
+         uint8* bufp = buf;
+-        int32  bytes_read = 0;
++        tmsize_t  bytes_read = 0;
+         uint32 strip, nstrips   = TIFFNumberOfStrips(in);
+-        uint32 stripsize = TIFFStripSize(in);
+-        uint32 rows = 0;
++        tmsize_t stripsize = TIFFStripSize(in);
++        tmsize_t rows = 0;
+         uint32 rps = TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rps);
+         tsize_t scanline_size = TIFFScanlineSize(in);
+ 
+@@ -3694,13 +3711,12 @@ static int readContigStripsIntoBuffer (TIFF* in, uint8* buf)
+                 bytes_read = TIFFReadEncodedStrip (in, strip, bufp, -1);
+                 rows = bytes_read / scanline_size;
+                 if ((strip < (nstrips - 1)) && (bytes_read != (int32)stripsize))
+-                        TIFFError("", "Strip %d: read %lu bytes, strip size %lu",
+-                                  (int)strip + 1, (unsigned long) bytes_read,
+-                                  (unsigned long)stripsize);
++                        TIFFError("", "Strip %"PRIu32": read %"PRId64" bytes, strip size %"PRIu64,
++                                  strip + 1, bytes_read, stripsize);
+ 
+                 if (bytes_read < 0 && !ignore) {
+-                        TIFFError("", "Error reading strip %lu after %lu rows",
+-                                  (unsigned long) strip, (unsigned long)rows);
++                        TIFFError("", "Error reading strip %"PRIu32" after %"PRIu64" rows",
++                                  strip, rows);
+                         return 0;
+                 }
+                 bufp += stripsize;
+@@ -4164,13 +4180,13 @@ combineSeparateSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >= 32)
+ 	  {
+-	  bytebuff1 = (buff2 >> 56);
++	  bytebuff1 = (uint8)(buff2 >> 56);
+ 	  *dst++ = bytebuff1;
+-	  bytebuff2 = (buff2 >> 48);
++	  bytebuff2 = (uint8)(buff2 >> 48);
+ 	  *dst++ = bytebuff2;
+-	  bytebuff3 = (buff2 >> 40);
++	  bytebuff3 = (uint8)(buff2 >> 40);
+ 	  *dst++ = bytebuff3;
+-	  bytebuff4 = (buff2 >> 32);
++	  bytebuff4 = (uint8)(buff2 >> 32);
+ 	  *dst++ = bytebuff4;
+ 	  ready_bits -= 32;
+                     
+@@ -4213,10 +4229,10 @@ combineSeparateSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst offset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+ 
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits); 
+@@ -4689,13 +4705,13 @@ combineSeparateTileSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >= 32)
+ 	  {
+-	  bytebuff1 = (buff2 >> 56);
++	  bytebuff1 = (uint8)(buff2 >> 56);
+ 	  *dst++ = bytebuff1;
+-	  bytebuff2 = (buff2 >> 48);
++	  bytebuff2 = (uint8)(buff2 >> 48);
+ 	  *dst++ = bytebuff2;
+-	  bytebuff3 = (buff2 >> 40);
++	  bytebuff3 = (uint8)(buff2 >> 40);
+ 	  *dst++ = bytebuff3;
+-	  bytebuff4 = (buff2 >> 32);
++	  bytebuff4 = (uint8)(buff2 >> 32);
+ 	  *dst++ = bytebuff4;
+ 	  ready_bits -= 32;
+                     
+@@ -4738,10 +4754,10 @@ combineSeparateTileSamples32bits (uint8 *in[], uint8 *out, uint32 cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst offset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+ 
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits); 
+@@ -4764,7 +4780,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8 *obuf, uint32 length,
+   {
+   int i, bytes_per_sample, bytes_per_pixel, shift_width, result = 1;
+   uint32 j;
+-  int32  bytes_read = 0;
++  tmsize_t  bytes_read = 0;
+   uint16 bps = 0, planar;
+   uint32 nstrips;
+   uint32 strips_per_sample;
+@@ -4830,7 +4846,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8 *obuf, uint32 length,
+   for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+     {
+     srcbuffs[s] = NULL;
+-    buff = _TIFFmalloc(stripsize + 3);
++    buff = _TIFFmalloc(stripsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!buff)
+       {
+       TIFFError ("readSeparateStripsIntoBuffer", 
+@@ -4853,7 +4869,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8 *obuf, uint32 length,
+       buff = srcbuffs[s];
+       strip = (s * strips_per_sample) + j; 
+       bytes_read = TIFFReadEncodedStrip (in, strip, buff, stripsize);
+-      rows_this_strip = bytes_read / src_rowsize;
++      rows_this_strip = (uint32)(bytes_read / src_rowsize);
+       if (bytes_read < 0 && !ignore)
+         {
+         TIFFError(TIFFFileName(in),
+@@ -5860,13 +5876,14 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   uint16   input_compression = 0, input_photometric = 0;
+   uint16   subsampling_horiz, subsampling_vert;
+   uint32   width = 0, length = 0;
+-  uint32   stsize = 0, tlsize = 0, buffsize = 0, scanlinesize = 0;
++  tmsize_t   stsize = 0, tlsize = 0, buffsize = 0;
++  tmsize_t   scanlinesize = 0;
+   uint32   tw = 0, tl = 0;       /* Tile width and length */
+-  uint32   tile_rowsize = 0;
++  tmsize_t   tile_rowsize = 0;
+   unsigned char *read_buff = NULL;
+   unsigned char *new_buff  = NULL;
+   int      readunit = 0;
+-  static   uint32  prev_readsize = 0;
++  static   tmsize_t  prev_readsize = 0;
+ 
+   TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+   TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -6168,7 +6185,7 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+         TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+         return (-1);
+     }
+-    read_buff = (unsigned char *)_TIFFmalloc(buffsize+3);
++    read_buff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   }
+   else
+     {
+@@ -6179,11 +6196,11 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+           TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+           return (-1);
+       }
+-      new_buff = _TIFFrealloc(read_buff, buffsize+3);
++      new_buff = _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+ 	free (read_buff);
+-        read_buff = (unsigned char *)_TIFFmalloc(buffsize+3);
++        read_buff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         read_buff = new_buff;
+@@ -6256,8 +6273,13 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+     dump_info  (dump->infile, dump->format, "", 
+                 "Bits per sample %d, Samples per pixel %d", bps, spp);
+ 
++    if ((uint64_t)scanlinesize > 0x0ffffffffULL) {
++        dump_info(dump->infile, dump->format, "loadImage",
++            "Attention: scanlinesize %"PRIu64" is larger than UINT32_MAX.\nFollowing dump might be wrong.",
++            (uint64_t)scanlinesize);
++    }
+     for (i = 0; i < length; i++)
+-      dump_buffer(dump->infile, dump->format, 1, scanlinesize, 
++      dump_buffer(dump->infile, dump->format, 1, (uint32)scanlinesize, 
+                   i, read_buff + (i * scanlinesize));
+     }
+   return (0);
+@@ -7277,13 +7299,13 @@ writeSingleSection(TIFF *in, TIFF *out, struct image_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen = strlen(inknames) + 1;
++	 int inknameslen = (int)strlen(inknames) + 1;
+ 	 const char* cp = inknames;
+ 	 while (ninks > 1) {
+ 	   cp = strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen += (strlen(cp) + 1);
++	     inknameslen += ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -7346,23 +7368,23 @@ createImageSection(uint32 sectsize, unsigned char **sect_buff_ptr)
+ 
+   if (!sect_buff)
+     {
+-    sect_buff = (unsigned char *)_TIFFmalloc(sectsize);
++    sect_buff = (unsigned char *)_TIFFmalloc(sectsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!sect_buff)
+     {
+         TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+         return (-1);
+     }
+-    _TIFFmemset(sect_buff, 0, sectsize);
++    _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+     }
+   else
+     {
+     if (prev_sectsize < sectsize)
+       {
+-      new_buff = _TIFFrealloc(sect_buff, sectsize);
++      new_buff = _TIFFrealloc(sect_buff, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+ 	free (sect_buff);
+-        sect_buff = (unsigned char *)_TIFFmalloc(sectsize);
++        sect_buff = (unsigned char *)_TIFFmalloc(sectsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         sect_buff = new_buff;
+@@ -7372,7 +7394,7 @@ createImageSection(uint32 sectsize, unsigned char **sect_buff_ptr)
+           TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+           return (-1);
+       }
+-      _TIFFmemset(sect_buff, 0, sectsize);
++      _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+ 
+@@ -7403,17 +7425,17 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     cropsize = crop->bufftotal;
+     crop_buff = seg_buffs[0].buffer; 
+     if (!crop_buff)
+-      crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++      crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     else
+       {
+       prev_cropsize = seg_buffs[0].size;
+       if (prev_cropsize < cropsize)
+         {
+-        next_buff = _TIFFrealloc(crop_buff, cropsize);
++        next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+         if (! next_buff)
+           {
+           _TIFFfree (crop_buff);
+-          crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++          crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+           }
+         else
+           crop_buff = next_buff;
+@@ -7426,7 +7448,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+       return (-1);
+       }
+  
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     seg_buffs[0].buffer = crop_buff;
+     seg_buffs[0].size = cropsize;
+ 
+@@ -7505,17 +7527,17 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+       cropsize = crop->bufftotal;
+       crop_buff = seg_buffs[i].buffer; 
+       if (!crop_buff)
+-        crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++        crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       else
+         {
+         prev_cropsize = seg_buffs[0].size;
+         if (prev_cropsize < cropsize)
+           {
+-          next_buff = _TIFFrealloc(crop_buff, cropsize);
++          next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+           if (! next_buff)
+             {
+             _TIFFfree (crop_buff);
+-            crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++            crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+             }
+           else
+             crop_buff = next_buff;
+@@ -7528,7 +7550,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         return (-1);
+         }
+  
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       seg_buffs[i].buffer = crop_buff;
+       seg_buffs[i].size = cropsize;
+ 
+@@ -7641,24 +7663,24 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   crop_buff = *crop_buff_ptr;
+   if (!crop_buff)
+     {
+-    crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++    crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!crop_buff)
+     {
+         TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+         return (-1);
+     }
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     prev_cropsize = cropsize;
+     }
+   else
+     {
+     if (prev_cropsize < cropsize)
+       {
+-      new_buff = _TIFFrealloc(crop_buff, cropsize);
++      new_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+ 	free (crop_buff);
+-        crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
++        crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         crop_buff = new_buff;
+@@ -7667,7 +7689,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+           TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+           return (-1);
+       }
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+ 
+@@ -7965,13 +7987,13 @@ writeCroppedImage(TIFF *in, TIFF *out, struct image_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen = strlen(inknames) + 1;
++	 int inknameslen = (int)strlen(inknames) + 1;
+ 	 const char* cp = inknames;
+ 	 while (ninks > 1) {
+ 	   cp = strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen += (strlen(cp) + 1);
++	     inknameslen += ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -8356,13 +8378,13 @@ rotateContigSamples32bits(uint16 rotation, uint16 spp, uint16 bps, uint32 width,
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -8431,12 +8453,13 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
+               return (-1);
+     }
+ 
+-  if (!(rbuff = (unsigned char *)_TIFFmalloc(buffsize)))
++  /* Add 3 padding bytes for extractContigSamplesShifted32bits */
++  if (!(rbuff = (unsigned char *)_TIFFmalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES)))
+     {
+-    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u bytes", buffsize);
++    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u bytes", buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     return (-1);
+     }
+-  _TIFFmemset(rbuff, '\0', buffsize);
++  _TIFFmemset(rbuff, '\0', buffsize + NUM_BUFF_OVERSIZE_BYTES);
+ 
+   ibuff = *ibuff_ptr;
+   switch (rotation)
+@@ -8964,13 +8987,13 @@ reverseSamples32bits (uint16 spp, uint16 bps, uint32 width,
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -9061,12 +9084,13 @@ mirrorImage(uint16 spp, uint16 bps, uint16 mirror, uint32 width, uint32 length,
+     {
+     case MIRROR_BOTH:
+     case MIRROR_VERT: 
+-             line_buff = (unsigned char *)_TIFFmalloc(rowsize);
++             line_buff = (unsigned char *)_TIFFmalloc(rowsize + NUM_BUFF_OVERSIZE_BYTES);
+              if (line_buff == NULL)
+                {
+-	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffer of %1u bytes", rowsize);
++	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffer of %1u bytes", rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                return (-1);
+                }
++             _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+ 
+              dst = ibuff + (rowsize * (length - 1));
+              for (row = 0; row < length / 2; row++)
+@@ -9098,11 +9122,12 @@ mirrorImage(uint16 spp, uint16 bps, uint16 mirror, uint32 width, uint32 length,
+ 		}
+ 	      else
+                 { /* non 8 bit per sample  data */
+-                if (!(line_buff = (unsigned char *)_TIFFmalloc(rowsize + 1)))
++                if (!(line_buff = (unsigned char *)_TIFFmalloc(rowsize + NUM_BUFF_OVERSIZE_BYTES)))
+                   {
+                   TIFFError("mirrorImage", "Unable to allocate mirror line buffer");
+                   return (-1);
+                   }
++                _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                 bytes_per_sample = (bps + 7) / 8;
+                 bytes_per_pixel  = ((bps * spp) + 7) / 8;
+                 if (bytes_per_pixel < (bytes_per_sample + 1))
+@@ -9114,7 +9139,7 @@ mirrorImage(uint16 spp, uint16 bps, uint16 mirror, uint32 width, uint32 length,
+                   {
+ 		  row_offset = row * rowsize;
+                   src = ibuff + row_offset;
+-                  _TIFFmemset (line_buff, '\0', rowsize);
++                  _TIFFmemset (line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                   switch (shift_width)
+                     {
+                     case 1: if (reverseSamples16bits(spp, bps, width, src, line_buff))
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3597_3626_3627.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3597_3626_3627.patch
new file mode 100644
index 0000000000..18a4b4e0ff
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3597_3626_3627.patch
@@ -0,0 +1,123 @@
+From f7c06c395daf1b2c52ab431e00db2d9fc2ac993e Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 10 May 2022 20:03:17 +0000
+Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2022-3597 CVE-2022-3626 CVE-2022-3627
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/e319508023580e2f70e6e626f745b5b2a1707313
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/8fe3735942ea1d90d8cef843b55b3efe8ab6feaf
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/bad48e90b410df32172006c7876da449ba62cdba
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/236b7191f04c60d09ee836ae13b50f812c841047
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-01-17
+
+---
+ tools/tiffcrop.c | 50 ++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 42 insertions(+), 8 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c923920..a0789a3 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -103,7 +103,12 @@
+  *                selects which functions dump data, with higher numbers selecting
+  *                lower level, scanline level routines. Debug reports a limited set
+  *                of messages to monitor progess without enabling dump logs.
+- */
++ *
++ * Note 1:  The (-X|-Y), -Z, -z and -S options are mutually exclusive.
++ *          In no case should the options be applied to a given selection successively.
++ * Note 2:  Any of the -X, -Y, -Z and -z options together with other PAGE_MODE_x options
++ *          such as -H, -V, -P, -J or -K are not supported and may cause buffer overflows.
++  */
+ 
+ static   char tiffcrop_version_id[] = "2.4.1";
+ static   char tiffcrop_rev_date[] = "03-03-2010";
+@@ -176,12 +181,12 @@ extern int getopt(int argc, char * const argv[], const char *optstring);
+ #define ROTATECW_270 32
+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
+ 
+-#define CROP_NONE     0
+-#define CROP_MARGINS  1
+-#define CROP_WIDTH    2
+-#define CROP_LENGTH   4
+-#define CROP_ZONES    8
+-#define CROP_REGIONS 16
++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->rows/->cols != 0 */
++#define CROP_MARGINS  1     /* "-m" */
++#define CROP_WIDTH    2     /* "-X" */
++#define CROP_LENGTH   4     /* "-Y" */
++#define CROP_ZONES    8     /* "-Z" */
++#define CROP_REGIONS 16     /* "-z" */
+ #define CROP_ROTATE  32
+ #define CROP_MIRROR  64
+ #define CROP_INVERT 128
+@@ -323,7 +328,7 @@ struct crop_mask {
+ #define PAGE_MODE_RESOLUTION   1
+ #define PAGE_MODE_PAPERSIZE    2
+ #define PAGE_MODE_MARGINS      4
+-#define PAGE_MODE_ROWSCOLS     8
++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
+ 
+ #define INVERT_DATA_ONLY      10
+ #define INVERT_DATA_AND_TAG   11
+@@ -754,6 +759,12 @@ static   char* usage_info[] = {
+ "             The four debug/dump options are independent, though it makes little sense to",
+ "             specify a dump file without specifying a detail level.",
+ " ",
++"Note 1:      The (-X|-Y), -Z, -z and -S options are mutually exclusive.",
++"             In no case should the options be applied to a given selection successively.",
++" ",
++"Note 2:      Any of the -X, -Y, -Z and -z options together with other PAGE_MODE_x options",
++"             such as - H, -V, -P, -J or -K are not supported and may cause buffer overflows.",
++" ",
+ NULL
+ };
+ 
+@@ -2112,6 +2123,27 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and -S are mutually exclusive) --*/
++    char XY, Z, R, S;
++    XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH)) ? 1 : 0;
++    Z = (crop_data->crop_mode & CROP_ZONES) ? 1 : 0;
++    R = (crop_data->crop_mode & CROP_REGIONS) ? 1 : 0;
++    S = (page->mode & PAGE_MODE_ROWSCOLS) ? 1 : 0;
++    if (XY + Z + R + S > 1) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->exit");
++        exit(EXIT_FAILURE);
++    }
++
++    /* Check for not allowed combination:
++     * Any of the -X, -Y, -Z and -z options together with other PAGE_MODE_x options
++     * such as -H, -V, -P, -J or -K are not supported and may cause buffer overflows.
++.    */
++    if ((XY + Z + R > 0) && page->mode != PAGE_MODE_NONE) {
++        TIFFError("tiffcrop input error",
++            "Any of the crop options -X, -Y, -Z and -z together with other PAGE_MODE_x options such as - H, -V, -P, -J or -K is not supported and may cause buffer overflows..->exit");
++        exit(EXIT_FAILURE);
++    }
++
+   }  /* end process_command_opts */
+ 
+ /* Start a new output file if one has not been previously opened or
+@@ -2384,6 +2416,7 @@ main(int argc, char* argv[])
+         exit (-1);
+ 	}
+ 
++      /* Crop input image and copy zones and regions from input image into seg_buffs or crop_buff. */
+       if (crop.selections > 0)
+         {
+         if (processCropSelections(&image, &crop, &read_buff, seg_buffs))
+@@ -2400,6 +2433,7 @@ main(int argc, char* argv[])
+           exit (-1);
+ 	  }
+ 	}
++      /* Format and write selected image parts to output file(s). */
+       if (page.mode == PAGE_MODE_NONE)
+         {  /* Whole image or sections not based on output page size */
+         if (crop.selections > 0)
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
new file mode 100644
index 0000000000..9689a99638
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
@@ -0,0 +1,277 @@
+From 01bca7e6f608da7696949fca6acda78b9935ba19 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 30 Aug 2022 16:56:48 +0200
+Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2022-3599
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-01-17
+
+ TIFFTAG_NUMBEROFINKS value
+
+In order to solve the buffer overflow issues related to TIFFTAG_INKNAMES and related TIFFTAG_NUMBEROFINKS value, a revised handling of those tags within LibTiff is proposed:
+
+Behaviour for writing:
+    `NumberOfInks`  MUST fit to the number of inks in the `InkNames` string.
+    `NumberOfInks` is automatically set when `InkNames` is set.
+    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
+    If `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
+
+Behaviour for reading:
+    When reading `InkNames` from a TIFF file, the `NumberOfInks` will be set automatically to the number of inks in `InkNames` string.
+    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
+    If  `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
+
+This allows the safe use of the NumberOfInks value to read out the InkNames without buffer overflow
+
+This MR will close the following issues:  #149, #150, #152, #168 (to be checked), #250, #269, #398 and #456.
+
+It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
+
+---
+ libtiff/tif_dir.c      | 120 ++++++++++++++++++++++++-----------------
+ libtiff/tif_dir.h      |   2 +
+ libtiff/tif_dirinfo.c  |   2 +-
+ libtiff/tif_dirwrite.c |   5 ++
+ libtiff/tif_print.c    |   4 ++
+ 5 files changed, 83 insertions(+), 50 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index 39aeeb4..9d8267a 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -29,6 +29,7 @@
+  * (and also some miscellaneous stuff)
+  */
+ #include "tiffiop.h"
++# include <inttypes.h>
+ 
+ /*
+  * These are used in the backwards compatibility code...
+@@ -137,32 +138,30 @@ setExtraSamples(TIFF* tif, va_list ap, uint32* v)
+ }
+ 
+ /*
+- * Confirm we have "samplesperpixel" ink names separated by \0.  Returns 
++ * Count ink names separated by \0.  Returns
+  * zero if the ink names are not as expected.
+  */
+-static uint32
+-checkInkNamesString(TIFF* tif, uint32 slen, const char* s)
++static uint16
++countInkNamesString(TIFF *tif, uint32 slen, const char *s)
+ {
+-	TIFFDirectory* td = &tif->tif_dir;
+-	uint16 i = td->td_samplesperpixel;
++	uint16 i = 0;
++	const char *ep = s + slen;
++	const char *cp = s;
+ 
+ 	if (slen > 0) {
+-		const char* ep = s+slen;
+-		const char* cp = s;
+-		for (; i > 0; i--) {
++		do {
+ 			for (; cp < ep && *cp != '\0'; cp++) {}
+ 			if (cp >= ep)
+ 				goto bad;
+ 			cp++;				/* skip \0 */
+-		}
+-		return ((uint32)(cp-s));
++			i++;
++		} while (cp < ep);
++		return (i);
+ 	}
+ bad:
+ 	TIFFErrorExt(tif->tif_clientdata, "TIFFSetField",
+-	    "%s: Invalid InkNames value; expecting %d names, found %d",
+-	    tif->tif_name,
+-	    td->td_samplesperpixel,
+-	    td->td_samplesperpixel-i);
++		"%s: Invalid InkNames value; no NUL at given buffer end location %"PRIu32", after %"PRIu16" ink",
++		tif->tif_name, slen, i);
+ 	return (0);
+ }
+ 
+@@ -476,13 +475,61 @@ _TIFFVSetField(TIFF* tif, uint32 tag, va_list ap)
+ 		_TIFFsetFloatArray(&td->td_refblackwhite, va_arg(ap, float*), 6);
+ 		break;
+ 	case TIFFTAG_INKNAMES:
+-		v = (uint16) va_arg(ap, uint16_vap);
+-		s = va_arg(ap, char*);
+-		v = checkInkNamesString(tif, v, s);
+-		status = v > 0;
+-		if( v > 0 ) {
+-			_TIFFsetNString(&td->td_inknames, s, v);
+-			td->td_inknameslen = v;
++		{
++			v = (uint16) va_arg(ap, uint16_vap);
++			s = va_arg(ap, char*);
++			uint16 ninksinstring;
++			ninksinstring = countInkNamesString(tif, v, s);
++			status = ninksinstring > 0;
++			if(ninksinstring > 0 ) {
++				_TIFFsetNString(&td->td_inknames, s, v);
++				td->td_inknameslen = v;
++				/* Set NumberOfInks to the value ninksinstring */
++				if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++				{
++					if (td->td_numberofinks != ninksinstring) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the number of inks %"PRIu16".\n  -> NumberOfInks value adapted to %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, ninksinstring, ninksinstring);
++						td->td_numberofinks = ninksinstring;
++					}
++				} else {
++					td->td_numberofinks = ninksinstring;
++					TIFFSetFieldBit(tif, FIELD_NUMBEROFINKS);
++				}
++				if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++				{
++					if (td->td_numberofinks != td->td_samplesperpixel) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, td->td_samplesperpixel);
++					}
++				}
++			}
++		}
++		break;
++	case TIFFTAG_NUMBEROFINKS:
++		v = (uint16)va_arg(ap, uint16_vap);
++		/* If InkNames already set also NumberOfInks is set accordingly and should be equal */
++		if (TIFFFieldSet(tif, FIELD_INKNAMES))
++		{
++			if (v != td->td_numberofinks) {
++				TIFFErrorExt(tif->tif_clientdata, module,
++					"Error %s; Tag %s:\n  It is not possible to set the value %"PRIu32" for NumberOfInks\n  which is different from the number of inks in the InkNames tag (%"PRIu16")",
++					tif->tif_name, fip->field_name, v, td->td_numberofinks);
++				/* Do not set / overwrite number of inks already set by InkNames case accordingly. */
++				status = 0;
++			}
++		} else {
++			td->td_numberofinks = (uint16)v;
++			if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++			{
++				if (td->td_numberofinks != td->td_samplesperpixel) {
++					TIFFErrorExt(tif->tif_clientdata, module,
++						"Warning %s; Tag %s:\n  Value %"PRIu32" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
++						tif->tif_name, fip->field_name, v, td->td_samplesperpixel);
++				}
++			}
+ 		}
+ 		break;
+ 	case TIFFTAG_PERSAMPLE:
+@@ -887,34 +934,6 @@ _TIFFVGetField(TIFF* tif, uint32 tag, va_list ap)
+ 	if (fip->field_bit == FIELD_CUSTOM) {
+ 		standard_tag = 0;
+ 	}
+-	
+-        if( standard_tag == TIFFTAG_NUMBEROFINKS )
+-        {
+-            int i;
+-            for (i = 0; i < td->td_customValueCount; i++) {
+-                uint16 val;
+-                TIFFTagValue *tv = td->td_customValues + i;
+-                if (tv->info->field_tag != standard_tag)
+-                    continue;
+-                if( tv->value == NULL )
+-                    return 0;
+-                val = *(uint16 *)tv->value;
+-                /* Truncate to SamplesPerPixel, since the */
+-                /* setting code for INKNAMES assume that there are SamplesPerPixel */
+-                /* inknames. */
+-                /* Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2599 */
+-                if( val > td->td_samplesperpixel )
+-                {
+-                    TIFFWarningExt(tif->tif_clientdata,"_TIFFVGetField",
+-                                   "Truncating NumberOfInks from %u to %u",
+-                                   val, td->td_samplesperpixel);
+-                    val = td->td_samplesperpixel;
+-                }
+-                *va_arg(ap, uint16*) = val;
+-                return 1;
+-            }
+-            return 0;
+-        }
+ 
+ 	switch (standard_tag) {
+ 		case TIFFTAG_SUBFILETYPE:
+@@ -1092,6 +1111,9 @@ _TIFFVGetField(TIFF* tif, uint32 tag, va_list ap)
+ 		case TIFFTAG_INKNAMES:
+ 			*va_arg(ap, char**) = td->td_inknames;
+ 			break;
++		case TIFFTAG_NUMBEROFINKS:
++			*va_arg(ap, uint16 *) = td->td_numberofinks;
++			break;
+ 		default:
+ 			{
+ 				int i;
+diff --git a/libtiff/tif_dir.h b/libtiff/tif_dir.h
+index e7f0667..7cad679 100644
+--- a/libtiff/tif_dir.h
++++ b/libtiff/tif_dir.h
+@@ -117,6 +117,7 @@ typedef struct {
+ 	/* CMYK parameters */
+ 	int     td_inknameslen;
+ 	char*   td_inknames;
++	uint16 td_numberofinks;                 /* number of inks in InkNames string */
+ 
+ 	int     td_customValueCount;
+         TIFFTagValue *td_customValues;
+@@ -174,6 +175,7 @@ typedef struct {
+ #define FIELD_TRANSFERFUNCTION         44
+ #define FIELD_INKNAMES                 46
+ #define FIELD_SUBIFD                   49
++#define FIELD_NUMBEROFINKS             50
+ /*      FIELD_CUSTOM (see tiffio.h)    65 */
+ /* end of support for well-known tags; codec-private tags follow */
+ #define FIELD_CODEC                    66  /* base of codec-private tags */
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index fbfaaf0..bf7de70 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -104,7 +104,7 @@ tiffFields[] = {
+ 	{ TIFFTAG_SUBIFD, -1, -1, TIFF_IFD8, 0, TIFF_SETGET_C16_IFD8, TIFF_SETGET_UNDEFINED, FIELD_SUBIFD, 1, 1, "SubIFD", (TIFFFieldArray*) &tiffFieldArray },
+ 	{ TIFFTAG_INKSET, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "InkSet", NULL },
+ 	{ TIFFTAG_INKNAMES, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_C16_ASCII, TIFF_SETGET_UNDEFINED, FIELD_INKNAMES, 1, 1, "InkNames", NULL },
+-	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "NumberOfInks", NULL },
++	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_NUMBEROFINKS, 1, 0, "NumberOfInks", NULL },
+ 	{ TIFFTAG_DOTRANGE, 2, 2, TIFF_SHORT, 0, TIFF_SETGET_UINT16_PAIR, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "DotRange", NULL },
+ 	{ TIFFTAG_TARGETPRINTER, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_ASCII, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "TargetPrinter", NULL },
+ 	{ TIFFTAG_EXTRASAMPLES, -1, -1, TIFF_SHORT, 0, TIFF_SETGET_C16_UINT16, TIFF_SETGET_UNDEFINED, FIELD_EXTRASAMPLES, 0, 1, "ExtraSamples", NULL },
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 9e4d306..a2dbc3b 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -677,6 +677,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
+ 				if (!TIFFWriteDirectoryTagAscii(tif,&ndir,dir,TIFFTAG_INKNAMES,tif->tif_dir.td_inknameslen,tif->tif_dir.td_inknames))
+ 					goto bad;
+ 			}
++			if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++			{
++				if (!TIFFWriteDirectoryTagShort(tif, &ndir, dir, TIFFTAG_NUMBEROFINKS, tif->tif_dir.td_numberofinks))
++					goto bad;
++			}
+ 			if (TIFFFieldSet(tif,FIELD_SUBIFD))
+ 			{
+ 				if (!TIFFWriteDirectoryTagSubifd(tif,&ndir,dir))
+diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
+index a073794..a9f05a7 100644
+--- a/libtiff/tif_print.c
++++ b/libtiff/tif_print.c
+@@ -402,6 +402,10 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
+ 		}
+                 fputs("\n", fd);
+ 	}
++	if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS)) {
++		fprintf(fd, "  NumberOfInks: %d\n",
++			td->td_numberofinks);
++	}
+ 	if (TIFFFieldSet(tif,FIELD_THRESHHOLDING)) {
+ 		fprintf(fd, "  Thresholding: ");
+ 		switch (td->td_threshholding) {
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
new file mode 100644
index 0000000000..ea70827cbe
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
@@ -0,0 +1,45 @@
+From 7e87352217d1f0c77eee7033ac59e3aab08532bb Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2022-3970
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Last-Update: 2023-01-17
+
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 96ab146..0b90dcc 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3042,15 +3042,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32 col, uint32 row, uint32 * raster, int stop
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32) * tile_xsize );
+     }
+ 
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
new file mode 100644
index 0000000000..5747202bd9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
@@ -0,0 +1,26 @@
+From 424c82b5b33256e7f03faace51dc8010f3ded9ff Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz]
+CVE: CVE-2022-48281
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index a0789a3..8aed9cd 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7564,7 +7564,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         crop_buff = (unsigned char *)_TIFFmalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       else
+         {
+-        prev_cropsize = seg_buffs[0].size;
++        prev_cropsize = seg_buffs[i].size;
+         if (prev_cropsize < cropsize)
+           {
+           next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
new file mode 100644
index 0000000000..253018525a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
@@ -0,0 +1,157 @@
+From 7808740e100ba30ffb791044f3b14dec3e85ed6f Mon Sep 17 00:00:00 2001
+From: Markus Koschany <apo@debian.org>
+Date: Tue, 21 Feb 2023 14:26:43 +0100
+Subject: [PATCH] CVE-2023-0795
+
+This is also the fix for CVE-2023-0796, CVE-2023-0797, CVE-2023-0798,
+CVE-2023-0799.
+
+Bug-Debian: https://bugs.debian.org/1031632
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/afaabc3e50d4e5d80a94143f7e3c997e7e410f68
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798 CVE-2023-0799
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 51 ++++++++++++++++++++++++++++--------------------
+ 1 file changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 8aed9cd..f21a7d7 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -277,7 +277,6 @@ struct  region {
+   uint32 width;     /* width in pixels */
+   uint32 length;    /* length in pixels */
+   uint32 buffsize;  /* size of buffer needed to hold the cropped region */
+-  unsigned char *buffptr; /* address of start of the region */
+ };
+ 
+ /* Cropping parameters from command line and image data 
+@@ -532,7 +531,7 @@ static int rotateContigSamples24bits(uint16, uint16, uint16, uint32,
+ static int rotateContigSamples32bits(uint16, uint16, uint16, uint32, 
+                                      uint32,   uint32, uint8 *, uint8 *);
+ static int rotateImage(uint16, struct image_data *, uint32 *, uint32 *,
+- 		       unsigned char **);
++ 		       unsigned char **, int);
+ static int mirrorImage(uint16, uint16, uint16, uint32, uint32,
+ 		       unsigned char *);
+ static int invertImage(uint16, uint16, uint16, uint32, uint32,
+@@ -5112,7 +5111,6 @@ initCropMasks (struct crop_mask *cps)
+      cps->regionlist[i].width = 0;
+      cps->regionlist[i].length = 0;
+      cps->regionlist[i].buffsize = 0;
+-     cps->regionlist[i].buffptr = NULL;
+      cps->zonelist[i].position = 0;
+      cps->zonelist[i].total = 0;
+      }
+@@ -6358,8 +6356,13 @@ static int  correct_orientation(struct image_data *image, unsigned char **work_b
+                   image->adjustments & ROTATE_ANY);
+       return (-1);
+       }
+- 
+-    if (rotateImage(rotation, image, &image->width, &image->length, work_buff_ptr))
++
++      /* Dummy variable in order not to switch two times the
++       * image->width,->length within rotateImage(),
++       * but switch xres, yres there. */
++      uint32_t width = image->width;
++      uint32_t length = image->length;
++      if (rotateImage(rotation, image, &width, &length, work_buff_ptr, TRUE))
+       {
+       TIFFError ("correct_orientation", "Unable to rotate image");
+       return (-1);
+@@ -6427,7 +6430,6 @@ extractCompositeRegions(struct image_data *image,  struct crop_mask *crop,
+     /* These should not be needed for composite images */
+     crop->regionlist[i].width = crop_width;
+     crop->regionlist[i].length = crop_length;
+-    crop->regionlist[i].buffptr = crop_buff;
+ 
+     src_rowsize = ((img_width * bps * spp) + 7) / 8;
+     dst_rowsize = (((crop_width * bps * count) + 7) / 8);
+@@ -6664,7 +6666,6 @@ extractSeparateRegion(struct image_data *image,  struct crop_mask *crop,
+ 
+   crop->regionlist[region].width = crop_width;
+   crop->regionlist[region].length = crop_length;
+-  crop->regionlist[region].buffptr = crop_buff;
+ 
+   src = read_buff;
+   dst = crop_buff;
+@@ -7542,7 +7543,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+       {
+       if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                      &crop->combined_length, &crop_buff))
++                      &crop->combined_length, &crop_buff, FALSE))
+         {
+         TIFFError("processCropSelections", 
+                   "Failed to rotate composite regions by %d degrees", crop->rotation);
+@@ -7648,7 +7649,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+       if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+         {
+ 	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
+-			&crop->regionlist[i].length, &crop_buff))
++			&crop->regionlist[i].length, &crop_buff, FALSE))
+           {
+           TIFFError("processCropSelections", 
+                     "Failed to rotate crop region by %d degrees", crop->rotation);
+@@ -7780,7 +7781,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
+     {
+     if (rotateImage(crop->rotation, image, &crop->combined_width, 
+-                    &crop->combined_length, crop_buff_ptr))
++                    &crop->combined_length, crop_buff_ptr, TRUE))
+       {
+       TIFFError("createCroppedImage", 
+                 "Failed to rotate image or cropped selection by %d degrees", crop->rotation);
+@@ -8443,7 +8444,7 @@ rotateContigSamples32bits(uint16 rotation, uint16 spp, uint16 bps, uint32 width,
+ /* Rotate an image by a multiple of 90 degrees clockwise */
+ static int
+ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width, 
+-            uint32 *img_length, unsigned char **ibuff_ptr)
++            uint32 *img_length, unsigned char **ibuff_ptr, int rot_image_params)
+   {
+   int      shift_width;
+   uint32   bytes_per_pixel, bytes_per_sample;
+@@ -8634,11 +8635,15 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
+ 
+               *img_width = length;
+               *img_length = width;
+-              image->width = length;
+-              image->length = width;
+-              res_temp = image->xres;
+-              image->xres = image->yres;
+-              image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+ 	      break;
+ 
+     case 270: if ((bps % 8) == 0) /* byte aligned data */
+@@ -8711,11 +8716,15 @@ rotateImage(uint16 rotation, struct image_data *image, uint32 *img_width,
+ 
+               *img_width = length;
+               *img_length = width;
+-              image->width = length;
+-              image->length = width;
+-              res_temp = image->xres;
+-              image->xres = image->yres;
+-              image->yres = res_temp;
++            /* Only toggle image parameters if whole input image is rotated. */
++            if (rot_image_params)
++            {
++                image->width = length;
++                image->length = width;
++                res_temp = image->xres;
++                image->xres = image->yres;
++                image->yres = res_temp;
++            }
+               break;
+     default:
+               break;
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
new file mode 100644
index 0000000000..bf1a439b4d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
@@ -0,0 +1,135 @@
+From e18be834497e0ebf68d443abb9e18187f36cd3bf Mon Sep 17 00:00:00 2001
+From: Markus Koschany <apo@debian.org>
+Date: Tue, 21 Feb 2023 14:39:52 +0100
+Subject: [PATCH] CVE-2023-0800
+
+This is also the fix for CVE-2023-0801, CVE-2023-0802, CVE-2023-0803,
+CVE-2023-0804.
+
+Bug-Debian: https://bugs.debian.org/1031632
+Origin: https://gitlab.com/libtiff/libtiff/-/commit/33aee1275d9d1384791d2206776eb8152d397f00
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
+CVE: CVE-2023-0800 CVE-2023-0801 CVE-2023-0802 CVE-2023-0803 CVE-2023-0804 
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 73 +++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 69 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index f21a7d7..742615a 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5250,18 +5250,40 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 
+       crop->regionlist[i].buffsize = buffsize;
+       crop->bufftotal += buffsize;
++
++      /* For composite images with more than one region, the
++       * combined_length or combined_width always needs to be equal,
++       * respectively.
++       * Otherwise, even the first section/region copy
++       * action might cause buffer overrun. */
+       if (crop->img_mode == COMPOSITE_IMAGES)
+         {
+         switch (crop->edge_ref)
+           {
+           case EDGE_LEFT:
+           case EDGE_RIGHT:
++               if (i > 0 && zlength != crop->combined_length)
++               {
++                   TIFFError(
++                       "computeInputPixelOffsets",
++                       "Only equal length regions can be combined for "
++                       "-E left or right");
++                   return (-1);
++               }
+                crop->combined_length = zlength;
+                crop->combined_width += zwidth;
+                break;
+           case EDGE_BOTTOM:
+           case EDGE_TOP:  /* width from left, length from top */
+           default:
++               if (i > 0 && zwidth != crop->combined_width)
++                {
++                    TIFFError("computeInputPixelOffsets",
++                              "Only equal width regions can be "
++                              "combined for -E "
++                              "top or bottom");
++                    return (-1);
++                }
+                crop->combined_width = zwidth;
+                crop->combined_length += zlength;
+ 	       break;
+@@ -6416,6 +6438,47 @@ extractCompositeRegions(struct image_data *image,  struct crop_mask *crop,
+   crop->combined_width = 0;
+   crop->combined_length = 0;
+ 
++    /* If there is more than one region, check beforehand whether all the width
++     * and length values of the regions are the same, respectively. */
++    switch (crop->edge_ref)
++    {
++        default:
++        case EDGE_TOP:
++        case EDGE_BOTTOM:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_width0 =
++                    crop->regionlist[i - 1].x2 - crop->regionlist[i - 1].x1 + 1;
++                uint32_t crop_width1 =
++                    crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++                if (crop_width0 != crop_width1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal width regions can be combined for -E "
++                              "top or bottom");
++                    return (1);
++                }
++            }
++            break;
++        case EDGE_LEFT:
++        case EDGE_RIGHT:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_length0 =
++                    crop->regionlist[i - 1].y2 - crop->regionlist[i - 1].y1 + 1;
++                uint32_t crop_length1 =
++                    crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
++                if (crop_length0 != crop_length1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal length regions can be combined for "
++                              "-E left or right");
++                    return (1);
++                }
++            }
++   }
++
++
+   for (i = 0; i < crop->selections; i++)
+     {
+     /* rows, columns, width, length are expressed in pixels */
+@@ -6439,8 +6502,9 @@ extractCompositeRegions(struct image_data *image,  struct crop_mask *crop,
+       default:
+       case EDGE_TOP:
+       case EDGE_BOTTOM:
+-	   if ((i > 0) && (crop_width != crop->regionlist[i - 1].width))
+-             {
++         if ((crop->selections > i + 1) &&
++                    (crop_width != crop->regionlist[i + 1].width))
++         {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal width regions can be combined for -E top or bottom");
+ 	     return (1);
+@@ -6520,8 +6584,9 @@ extractCompositeRegions(struct image_data *image,  struct crop_mask *crop,
+ 	   break;
+       case EDGE_LEFT:  /* splice the pieces of each row together, side by side */
+       case EDGE_RIGHT:
+-	   if ((i > 0) && (crop_length != crop->regionlist[i - 1].length))
+-             {
++         if ((crop->selections > i + 1) &&
++                    (crop_length != crop->regionlist[i + 1].length))
++         {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal length regions can be combined for -E left or right");
+ 	     return (1);
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 74ececb113..4b48d81e2b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -29,6 +29,13 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
            file://CVE-2022-1354.patch \
            file://CVE-2022-1355.patch \
+           file://CVE-2022-3570_3598.patch \
+           file://CVE-2022-3597_3626_3627.patch \
+           file://CVE-2022-3599.patch \
+           file://CVE-2022-3970.patch \
+           file://CVE-2022-48281.patch \
+           file://CVE-2023-0795_0796_0797_0798_0799.patch \
+           file://CVE-2023-0800_0801_0802_0803_0804.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.37.3


