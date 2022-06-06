Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C64CCA483
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.31123.1654516896874581292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ErAEbfO5;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k19so19542506wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GRScUJdaj72u5QgA7AAbG8n2nhEkAS3CeGodh5Xv/Ss=;
        b=ErAEbfO5+6skeHzldfughfvZx3oMu0RV+DPgw4gh93zR0wIn7nJVvkqjW6plSqu7Ah
         8xg6PO6bOzNdX5TaHHCUfb/lL9j+zb/hnHjINJ49CQr7BPCeXo7rlXqx6zWvbjZW0dLp
         CGCV/kb7VdmEMprVilLBkS/8xGn+4b4S4pkJVc0NLRB9Nun8173AhvMfWOV8YzQtiQIk
         UpV9axPEykBEpIBUAff4L1S9fn1VU3tXP7F2/FdE/WZx7Y/h0yIYitwg0/xiqXSeuBxF
         T8Fc7oUVGuthmBBVMMupFW0Sdu3ImD8hFcXpQwe1daEJa5KVRc5nQbquYkrSn7PSc4lP
         bSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GRScUJdaj72u5QgA7AAbG8n2nhEkAS3CeGodh5Xv/Ss=;
        b=sqPPakkidm2VzXdAuTmTyh/UyoBWX/KtnJTzq5fTRrDCIVCH0nbYovJNEwgy/WNmML
         dxoVuLQTl/6B6JjUSWuOL8/eFntBb9R4uWFjfVSRLaMCcS1VWyNgzlL4hiz8xo1wwOhJ
         BmZYRr3FPQS76VUKMP0oURYJ67uYzkB3hQ34qeM/79rg3zI0rbIXGO/OnRFCniOailW8
         MzZbxey1xO6ikD/act0NM9h4tMrYLNd1CXBEMLfrU3u2rJ7biDa0Kys9RXmgynGRgZfy
         PWJoKTIbW+cXPV+CTUVAvkRt3Qyjdum+y3YpDvnNSF2AGmFKwgUg9XggrjaTecqarJJB
         8YOw==
X-Gm-Message-State: AOAM531mfW0SMwIrM6fn2vpARCtNQzhstzePu/Tqfif+mGS14P7Ee/80
	CenFk0L2+FG1Zw9I8iBnVmOdcz1QiJDvTA==
X-Google-Smtp-Source: 
 ABdhPJwpj3sRysucdI5XoHBwXnoYi3hdQ2/GGwl826H4vgA1N4Hqx37ODahbKLPZClvWhKCqQPjoww==
X-Received: by 2002:a5d:64c7:0:b0:216:5021:687f with SMTP id
 f7-20020a5d64c7000000b002165021687fmr11414127wri.295.1654516899818;
        Mon, 06 Jun 2022 05:01:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/21] tiff: update 4.3.0 -> 4.4.0
Date: Mon,  6 Jun 2022 14:01:16 +0200
Message-Id: <20220606120126.3381438-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166604

Drop all CVE backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rash-when-reading-a-file-with-multip.patch |  38 ---
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  43 ----
 ...ue-380-and-382-heap-buffer-overflow-.patch | 219 ------------------
 ...-for-return-value-of-limitMalloc-392.patch |  93 --------
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 ---
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 ---
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 -----
 ...99c99f987dc32ae110370cfdd7df7975586b.patch |  30 ---
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch |  32 ---
 .../libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb}  |  16 +-
 10 files changed, 3 insertions(+), 594 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.3.0.bb => tiff_4.4.0.bb} (74%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
deleted file mode 100644
index f1a4ab4251..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-CVE: CVE-2022-0865
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 24 Feb 2022 22:26:02 +0100
-Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
- IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
-
----
- libtiff/tif_jbig.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
-index 74086338..8bfa4cef 100644
---- a/libtiff/tif_jbig.c
-+++ b/libtiff/tif_jbig.c
-@@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
- 	 */
- 	tif->tif_flags |= TIFF_NOBITREV;
- 	tif->tif_flags &= ~TIFF_MAPPED;
-+	/* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP and
-+	 * cleared TIFF_MYBUFFER. It is necessary to restore them to their initial
-+	 * value to be consistent with the state of a non-memory mapped file.
-+	 */
-+	if (tif->tif_flags&TIFF_BUFFERMMAP) {
-+		tif->tif_rawdata = NULL;
-+		tif->tif_rawdatasize = 0;
-+		tif->tif_flags &= ~TIFF_BUFFERMMAP;
-+		tif->tif_flags |= TIFF_MYBUFFER;
-+	}
- 
- 	/* Setup the function pointers for encode, decode, and cleanup. */
- 	tif->tif_setupdecode = JBIGSetupDecode;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
deleted file mode 100644
index 72776f09ba..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-CVE: CVE-2022-22844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 25 Jan 2022 16:25:28 +0000
-Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
- count is required (fixes #355)
-
----
- tools/tiffset.c | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tiffset.c b/tools/tiffset.c
-index 8c9e23c5..e7a88c09 100644
---- a/tools/tiffset.c
-+++ b/tools/tiffset.c
-@@ -146,9 +146,19 @@ main(int argc, char* argv[])
- 
-             arg_index++;
-             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
--                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
--                    fprintf( stderr, "Failed to set %s=%s\n",
--                             TIFFFieldName(fip), argv[arg_index] );
-+                if(TIFFFieldPassCount( fip )) {
-+                    size_t len;
-+                    len = strlen(argv[arg_index]) + 1;
-+                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            (uint16_t)len, argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                } else {
-+                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
-+                            argv[arg_index]) != 1)
-+                        fprintf( stderr, "Failed to set %s=%s\n",
-+                            TIFFFieldName(fip), argv[arg_index] );
-+                }
-             } else if (TIFFFieldWriteCount(fip) > 0
- 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
-                 int     ret = 1;
--- 
-2.25.1
diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
deleted file mode 100644
index 812ffb232d..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-CVE: CVE-2022-0891
-CVE: CVE-2022-1056
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Tue, 8 Mar 2022 17:02:44 +0000
-Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
- extractImageSection
-
----
- tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
- 1 file changed, 36 insertions(+), 56 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index b85c2ce7..302a7e91 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -105,8 +105,8 @@
-  *                of messages to monitor progress without enabling dump logs.
-  */
- 
--static   char tiffcrop_version_id[] = "2.4";
--static   char tiffcrop_rev_date[] = "12-13-2010";
-+static   char tiffcrop_version_id[] = "2.4.1";
-+static   char tiffcrop_rev_date[] = "03-03-2010";
- 
- #include "tif_config.h"
- #include "libport.h"
-@@ -6710,10 +6710,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   uint32_t    img_length;
- #endif
--  uint32_t    j, shift1, shift2, trailing_bits;
-+  uint32_t    j, shift1, trailing_bits;
-   uint32_t    row, first_row, last_row, first_col, last_col;
-   uint32_t    src_offset, dst_offset, row_offset, col_offset;
--  uint32_t    offset1, offset2, full_bytes;
-+  uint32_t    offset1, full_bytes;
-   uint32_t    sect_width;
- #ifdef DEVELMODE
-   uint32_t    sect_length;
-@@ -6723,7 +6723,6 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   int      k;
-   unsigned char bitset;
--  static char *bitarray = NULL;
- #endif
- 
-   img_width = image->width;
-@@ -6741,17 +6740,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-   dst_offset = 0;
- 
- #ifdef DEVELMODE
--  if (bitarray == NULL)
--    {
--    if ((bitarray = (char *)malloc(img_width)) == NULL)
--      {
--      TIFFError ("", "DEBUG: Unable to allocate debugging bitarray");
--      return (-1);
--      }
--    }
-+  char bitarray[39];
- #endif
- 
--  /* rows, columns, width, length are expressed in pixels */
-+  /* rows, columns, width, length are expressed in pixels
-+   * first_row, last_row, .. are index into image array starting at 0 to width-1,
-+   * last_col shall be also extracted.  */
-   first_row = section->y1;
-   last_row  = section->y2;
-   first_col = section->x1;
-@@ -6761,9 +6755,14 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #ifdef DEVELMODE
-   sect_length = last_row - first_row + 1;
- #endif
--  img_rowsize = ((img_width * bps + 7) / 8) * spp;
--  full_bytes = (sect_width * spp * bps) / 8;   /* number of COMPLETE bytes per row in section */
--  trailing_bits = (sect_width * bps) % 8;
-+    /* The read function loadImage() used copy separate plane data into a buffer as interleaved
-+     * samples rather than separate planes so the same logic works to extract regions
-+     * regardless of the way the data are organized in the input file.
-+     * Furthermore, bytes and bits are arranged in buffer according to COMPRESSION=1 and FILLORDER=1 
-+     */
-+    img_rowsize = (((img_width * spp * bps) + 7) / 8);    /* row size in full bytes of source image */
-+    full_bytes = (sect_width * spp * bps) / 8;            /* number of COMPLETE bytes per row in section */
-+    trailing_bits = (sect_width * spp * bps) % 8;         /* trailing bits within the last byte of destination buffer */
- 
- #ifdef DEVELMODE
-     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First col: %"PRIu32", last col: %"PRIu32"\n",
-@@ -6776,10 +6775,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- 
-   if ((bps % 8) == 0)
-     {
--    col_offset = first_col * spp * bps / 8;
-+    col_offset = (first_col * spp * bps) / 8;
-     for (row = first_row; row <= last_row; row++)
-       {
--      /* row_offset = row * img_width * spp * bps / 8; */
-       row_offset = row * img_rowsize;
-       src_offset = row_offset + col_offset;
- 
-@@ -6792,14 +6790,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-     }
-   else
-     { /* bps != 8 */
--    shift1  = spp * ((first_col * bps) % 8);
--    shift2  = spp * ((last_col * bps) % 8);
-+    shift1 = ((first_col * spp * bps) % 8);           /* shift1 = bits to skip in the first byte of source buffer*/
-     for (row = first_row; row <= last_row; row++)
-       {
-       /* pull out the first byte */
-       row_offset = row * img_rowsize;
--      offset1 = row_offset + (first_col * bps / 8);
--      offset2 = row_offset + (last_col * bps / 8);
-+      offset1 = row_offset + ((first_col * spp * bps) / 8);   /* offset1 = offset into source of byte with first bits to be extracted */
- 
- #ifdef DEVELMODE
-       for (j = 0, k = 7; j < 8; j++, k--)
-@@ -6811,12 +6807,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
-       sprintf(&bitarray[9], " ");
-       for (j = 10, k = 7; j < 18; j++, k--)
-         {
--        bitset = *(src_buff + offset2) & (((unsigned char)1 << k)) ? 1 : 0;
-+        bitset = *(src_buff + offset1 + full_bytes) & (((unsigned char)1 << k)) ? 1 : 0;
-         sprintf(&bitarray[j], (bitset) ? "1" : "0");
-         }
-       bitarray[18] = '\0';
--      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Shift2:  %"PRIu32"\n", 
--                 row, offset1, shift1, offset2, shift2); 
-+      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32",    Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n", 
-+                 row, offset1, shift1, offset1+full_bytes, trailing_bits); 
- #endif
- 
-       bytebuff1 = bytebuff2 = 0;
-@@ -6840,11 +6836,12 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- 
-         if (trailing_bits != 0)
-           {
--	  bytebuff2 = src_buff[offset2] & ((unsigned char)255 << (7 - shift2));
-+      /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
-+	  bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
-           sect_buff[dst_offset] = bytebuff2;
- #ifdef DEVELMODE
- 	  TIFFError ("", "        Trailing bits src offset:  %8"PRIu32", Dst offset: %8"PRIu32"\n",
--                              offset2, dst_offset); 
-+          offset1 + full_bytes, dst_offset);
-           for (j = 30, k = 7; j < 38; j++, k--)
-             {
-             bitset = *(sect_buff + dst_offset) & (((unsigned char)1 << k)) ? 1 : 0;
-@@ -6863,8 +6860,10 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #endif
-         for (j = 0; j <= full_bytes; j++) 
-           {
--	  bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
--	  bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (7 - shift1));
-+          /* Skip the first shift1 bits and shift the source up by shift1 bits before save to destination.*/
-+          /* Attention: src_buff size needs to be some bytes larger than image size, because could read behind image here. */
-+          bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
-+          bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (8 - shift1));
-           sect_buff[dst_offset + j] = (bytebuff1 << shift1) | (bytebuff2 >> (8 - shift1));
-           }
- #ifdef DEVELMODE
-@@ -6880,36 +6879,17 @@ extractImageSection(struct image_data *image, struct pageseg *section,
- #endif
-         dst_offset += full_bytes;
- 
-+        /* Copy the trailing_bits for the last byte in the destination buffer. 
-+           Could come from one ore two bytes of the source buffer. */
-         if (trailing_bits != 0)
-           {
- #ifdef DEVELMODE
--	    TIFFError ("", "        Trailing bits   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", offset1 + full_bytes, dst_offset);
--#endif
--	  if (shift2 > shift1)
--            {
--	    bytebuff1 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (7 - shift2));
--            bytebuff2 = bytebuff1 & ((unsigned char)255 << shift1);
--            sect_buff[dst_offset] = bytebuff2;
--#ifdef DEVELMODE
--	    TIFFError ("", "        Shift2 > Shift1\n"); 
-+          TIFFError("", "        Trailing bits %4"PRIu32"   src offset: %8"PRIu32", Dst offset: %8"PRIu32"\n", trailing_bits, offset1 + full_bytes, dst_offset);
- #endif
-+          /* More than necessary bits are already copied into last destination buffer, 
-+           * only masking of last byte in destination buffer is necessary.*/ 
-+          sect_buff[dst_offset] &= ((uint8_t)0xFF << (8 - trailing_bits));
-             }
--          else
--            {
--	    if (shift2 < shift1)
--              {
--              bytebuff2 = ((unsigned char)255 << (shift1 - shift2 - 1));
--	      sect_buff[dst_offset] &= bytebuff2;
--#ifdef DEVELMODE
--	      TIFFError ("", "        Shift2 < Shift1\n"); 
--#endif
--              }
--#ifdef DEVELMODE
--            else
--	      TIFFError ("", "        Shift2 == Shift1\n"); 
--#endif
--            }
--	  }
- #ifdef DEVELMODE
- 	  sprintf(&bitarray[28], " ");
- 	  sprintf(&bitarray[29], " ");
-@@ -7062,7 +7042,7 @@ writeImageSections(TIFF *in, TIFF *out, struct image_data *image,
-     width  = sections[i].x2 - sections[i].x1 + 1;
-     length = sections[i].y2 - sections[i].y1 + 1;
-     sectsize = (uint32_t)
--	    ceil((width * image->bps + 7) / (double)8) * image->spp * length;
-+	    ceil((width * image->bps * image->spp + 7) / (double)8) * length;
-     /* allocate a buffer if we don't have one already */
-     if (createImageSection(sectsize, sect_buff_ptr))
-       {
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
deleted file mode 100644
index a0b856b9e1..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-CVE: CVE-2022-0907
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
-From: Augustus <wangdw.augustus@qq.com>
-Date: Mon, 7 Mar 2022 18:21:49 +0800
-Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
-
----
- tools/tiffcrop.c | 33 +++++++++++++++++++++------------
- 1 file changed, 21 insertions(+), 12 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 302a7e91..e407bf51 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
-   if (!sect_buff)
-     {
-     sect_buff = (unsigned char *)limitMalloc(sectsize);
--    *sect_buff_ptr = sect_buff;
-+    if (!sect_buff)
-+    {
-+        TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
-+        return (-1);
-+    }
-     _TIFFmemset(sect_buff, 0, sectsize);
-     }
-   else
-@@ -7373,15 +7377,15 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
-       else
-         sect_buff = new_buff;
- 
-+      if (!sect_buff)
-+      {
-+          TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
-+          return (-1);
-+      }
-       _TIFFmemset(sect_buff, 0, sectsize);
-       }
-     }
- 
--  if (!sect_buff)
--    {
--    TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
--    return (-1);
--    }
-   prev_sectsize = sectsize;
-   *sect_buff_ptr = sect_buff;
- 
-@@ -7648,7 +7652,11 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
-   if (!crop_buff)
-     {
-     crop_buff = (unsigned char *)limitMalloc(cropsize);
--    *crop_buff_ptr = crop_buff;
-+    if (!crop_buff)
-+    {
-+        TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
-+        return (-1);
-+    }
-     _TIFFmemset(crop_buff, 0, cropsize);
-     prev_cropsize = cropsize;
-     }
-@@ -7664,15 +7672,15 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
-         }
-       else
-         crop_buff = new_buff;
-+      if (!crop_buff)
-+      {
-+          TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
-+          return (-1);
-+      }
-       _TIFFmemset(crop_buff, 0, cropsize);
-       }
-     }
- 
--  if (!crop_buff)
--    {
--    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
--    return (-1);
--    }
-   *crop_buff_ptr = crop_buff;
- 
-   if (crop->crop_mode & CROP_INVERT)
-@@ -9231,3 +9239,4 @@ invertImage(uint16_t photometric, uint16_t spp, uint16_t bps, uint32_t width, ui
-  * fill-column: 78
-  * End:
-  */
-+
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
deleted file mode 100644
index 719dabaecc..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-CVE: CVE-2022-0908
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 17 Feb 2022 15:28:43 +0100
-Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #383)
-
----
- libtiff/tif_dirread.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index d84147a0..4e8ce729 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
- 								_TIFFfree(data);
- 							return(0);
- 						}
--						_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
-+						if (dp->tdir_count > 0 )
-+						{
-+							_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
-+						}
- 						o[(uint32_t)dp->tdir_count]=0;
- 						if (data!=0)
- 							_TIFFfree(data);
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
deleted file mode 100644
index 64dbe9ef92..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-CVE: CVE-2022-0909
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 8 Mar 2022 16:22:04 +0000
-Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
-
----
- libtiff/tif_dir.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
-index a6c254fc..77da6ea4 100644
---- a/libtiff/tif_dir.c
-+++ b/libtiff/tif_dir.c
-@@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
- 		break;
- 	case TIFFTAG_XRESOLUTION:
-         dblval = va_arg(ap, double);
--        if( dblval < 0 )
-+        if( dblval != dblval || dblval < 0 )
-             goto badvaluedouble;
- 		td->td_xresolution = _TIFFClampDoubleToFloat( dblval );
- 		break;
- 	case TIFFTAG_YRESOLUTION:
-         dblval = va_arg(ap, double);
--        if( dblval < 0 )
-+        if( dblval != dblval || dblval < 0 )
-             goto badvaluedouble;
- 		td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
- 		break;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
deleted file mode 100644
index afd5e59960..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-CVE: CVE-2022-0924
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Thu, 10 Mar 2022 08:48:00 +0000
-Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
-
----
- tools/tiffcp.c | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 1f889516..552d8fad 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
- 	tdata_t obuf;
- 	tstrip_t strip = 0;
- 	tsample_t s;
-+	uint16_t bps = 0, bytes_per_sample;
- 
- 	obuf = limitMalloc(stripsize);
- 	if (obuf == NULL)
- 		return (0);
- 	_TIFFmemset(obuf, 0, stripsize);
- 	(void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
-+	(void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
-+	if( bps == 0 )
-+        {
-+            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSample");
-+            _TIFFfree(obuf);
-+            return 0;
-+        }
-+        if( (bps % 8) != 0 )
-+        {
-+            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerSample that is not a multiple of 8");
-+            _TIFFfree(obuf);
-+            return 0;
-+        }
-+	bytes_per_sample = bps/8;
- 	for (s = 0; s < spp; s++) {
- 		uint32_t row;
- 		for (row = 0; row < imagelength; row += rowsperstrip) {
-@@ -1676,7 +1691,7 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
- 
- 			cpContigBufToSeparateBuf(
- 			    obuf, (uint8_t*) buf + row * rowsize + s,
--			    nrows, imagewidth, 0, 0, spp, 1);
-+			    nrows, imagewidth, 0, 0, spp, bytes_per_sample);
- 			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
- 				TIFFError(TIFFFileName(out),
- 				    "Error, can't write strip %"PRIu32,
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
deleted file mode 100644
index 0b41dde606..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 5 Feb 2022 20:36:41 +0100
-Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #362)
-
-Upstream-Status: Backport
-CVE: CVE-2022-0562
-
----
- libtiff/tif_dirread.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 2bbc4585..23194ced 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
-                     goto bad;
-                 }
- 
--                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
-+                if (old_extrasamples > 0)
-+                    memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16_t));
-                 _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
-                 _TIFFfree(new_sampleinfo);
-         }
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
deleted file mode 100644
index 74f9649fdf..0000000000
--- a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 6 Feb 2022 13:08:38 +0100
-Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
- source pointer and size of zero (fixes #362)
-
-Upstream-Status: Backport
-CVE: CVE-2022-0561
-
----
- libtiff/tif_dirread.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 23194ced..50ebf8ac 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
- 			_TIFFfree(data);
- 			return(0);
- 		}
--                _TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
--                _TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
-+		if( dir->tdir_count )
-+			_TIFFmemcpy(resizeddata,data, (uint32_t)dir->tdir_count * sizeof(uint64_t));
-+		_TIFFmemset(resizeddata+(uint32_t)dir->tdir_count, 0, (nstrips - (uint32_t)dir->tdir_count) * sizeof(uint64_t));
- 		_TIFFfree(data);
- 		data=resizeddata;
- 	}
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
similarity index 74%
rename from meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 7a5e4816a6..c82965ffa1 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -8,19 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
-           file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
-           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
-           file://0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch \
-           file://0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch \
-           file://0003-add-checks-for-return-value-of-limitMalloc-392.patch \
-           file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch \
-           file://0005-fix-the-FPE-in-tiffcrop-393.patch \
-           file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
-           "
-
-SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


