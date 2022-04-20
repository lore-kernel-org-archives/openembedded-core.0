Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A745C636CF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.8051.1650463772794502649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1LwPJJRP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id k14so1757888pga.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=prmqBsO0AhCu/fQEYlL2TH8E4SfNdzFVRcdxOnsdFic=;
        b=1LwPJJRPUPry+XzGsrSlAfWK8sb9k8SYaOUfbc+K7dfw5X6sPr+y+Jc7/WccdLf0mB
         O0ciPKaPtnWJbv0BWYkRHtnvijFz4ZTv++3IaEFF7DBRO/0yMbKq/7xue9nXBB4blIqM
         K3Tisx9j0dUU8DoEPJ4dMxnMyLBEPhPcRgreTayBL6XVpIODZVunQzlE7Y1E1RVp8zu6
         9KztqRo541Y2XpUqYxKFw+Wul0QRn4XClCz04S1xO5QJqPGg9jf+sEwjJ2pMYRCApKJ0
         m0OEFmPnW6yXSoUA7P4NciAc4fT5lvOIqqUeZaQP6jl6w4DjqQiUmBuDykfYM+Xu1dBn
         w02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prmqBsO0AhCu/fQEYlL2TH8E4SfNdzFVRcdxOnsdFic=;
        b=l3uSvdZW0a1MX510gIyLQIL0FndLNPoZaR3rdz+E1ZhMKtkH8cVczE0+yMytLYWdmb
         k7tCyl5zkaUamKV2UWZsi/2nxIzoF2BL8xSrgDAvCHsuhmHKZYic+s5MpTRMeQcI7cyG
         uEtLrrxwUxAu8E23MskqogUGqojXHH/PC/ZxC6jpAwfw7xNM8g+sOg+9PmHH5Cf6IyU9
         4vp/WqNimaGdHaltsnV0EkwwtgRZqc+Ww+GdZ9pmmxiSp73NVfeqplHTxbGfO4pdUcEe
         DPIWm1ANt1xbBWezWRPPcfx95Rgc3kRy9GJ+ADqxj/lAMw8chO4WzD4gW+VNyLEwosw/
         IF/w==
X-Gm-Message-State: AOAM533Z+69JoVdH2kC3bPk8jNKb7siGAsRbAZwfmkFEA+SQfv7z9oBy
	x1JaZxBIHEOhKnGC0vCgmX4xw5WzH/3KC+brLdE=
X-Google-Smtp-Source: 
 ABdhPJzKYbEJoyuhSsuevVP4maPsHywTClnmiv9/gTkW7MEjKp4RiLUDcz9FPg6279r7sL+NPLMBZQ==
X-Received: by 2002:a63:a804:0:b0:398:e7d7:29ab with SMTP id
 o4-20020a63a804000000b00398e7d729abmr18955763pgf.138.1650463771734;
        Wed, 20 Apr 2022 07:09:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/27] zlib: upgrade to 1.2.12
Date: Wed, 20 Apr 2022 04:08:09 -1000
Message-Id: 
 <2fae9bc71734dc42b4a9b2551653e518e3ed04ba.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164689

From: Ross Burton <ross@burtonini.com>

First upstream release since 2017!
- Fix a deflate bug when using the Z_FIXED strategy that can result in out-of-bound accesses.
- Fix a deflate bug when the window is full in deflate_stored().
- Speed up CRC-32 computations by a factor of 1.5 to 3.
- Use the hardware CRC-32 instruction on ARMv8 processors.
- Speed up crc32_combine() with powers of x tables.
- Add crc32_combine_gen() and crc32_combine_op() for fast combines.

Drop CVE-2018-25032 as this is in the .12 release.

Rebase 0001-configure-Pass-LDFLAGS-to-link-tests.patch to apply cleanly.

Backport cc.patch to fix compilation with our CC.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4055d9fc81661d375c1721ffd502536c1ba74e02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...configure-Pass-LDFLAGS-to-link-tests.patch |  25 +-
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ------------------
 meta/recipes-core/zlib/zlib/cc.patch          |  27 ++
 .../zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb}   |   7 +-
 4 files changed, 43 insertions(+), 363 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 create mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 rename meta/recipes-core/zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb} (83%)

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
index 91a1b4a09a..e6cc915ba5 100644
--- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
+++ b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
@@ -1,4 +1,7 @@
-From 001971eef84485562f912d8edd4fc7688acfad91 Mon Sep 17 00:00:00 2001
+Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f15584918a7fbbe3cc794ad59100e5e8153ea9f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Mar 2022 22:38:47 -0800
 Subject: [PATCH] configure: Pass LDFLAGS to link tests
@@ -9,18 +12,16 @@ using LDFLAGS on compiler commandline along with CFLAGS to ensure the
 tests perform correctly. Without this some tests may fail resulting in
 wrong confgure result, ending in miscompiling the package
 
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
-
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index e974d1f..69dfa3f 100755
+index 52ff4a0..d04ee59 100755
 --- a/configure
 +++ b/configure
-@@ -410,7 +410,7 @@ if test $shared -eq 1; then
+@@ -427,7 +427,7 @@ if test $shared -eq 1; then
    echo Checking for shared library support... | tee -a configure.log
    # we must test in two steps (cc then ld), required at least on SunOS 4.x
    if try $CC -w -c $SFLAGS $test.c &&
@@ -29,7 +30,7 @@ index e974d1f..69dfa3f 100755
      echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
    elif test -z "$old_cc" -a -z "$old_cflags"; then
      echo No shared library support. | tee -a configure.log
-@@ -492,7 +492,7 @@ int main(void) {
+@@ -503,7 +503,7 @@ int main(void) {
  }
  EOF
    fi
@@ -37,8 +38,8 @@ index e974d1f..69dfa3f 100755
 +  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
      sizet=`./$test`
      echo "Checking for a pointer-size integer type..." $sizet"." | tee -a configure.log
-   else
-@@ -530,7 +530,7 @@ int main(void) {
+     CFLAGS="${CFLAGS} -DNO_SIZE_T=${sizet}"
+@@ -537,7 +537,7 @@ int main(void) {
    return 0;
  }
  EOF
@@ -47,7 +48,7 @@ index e974d1f..69dfa3f 100755
      echo "Checking for fseeko... Yes." | tee -a configure.log
    else
      CFLAGS="${CFLAGS} -DNO_FSEEKO"
-@@ -547,7 +547,7 @@ cat > $test.c <<EOF
+@@ -554,7 +554,7 @@ cat > $test.c <<EOF
  #include <errno.h>
  int main() { return strlen(strerror(errno)); }
  EOF
@@ -56,7 +57,7 @@ index e974d1f..69dfa3f 100755
    echo "Checking for strerror... Yes." | tee -a configure.log
  else
    CFLAGS="${CFLAGS} -DNO_STRERROR"
-@@ -654,7 +654,7 @@ int main()
+@@ -661,7 +661,7 @@ int main()
    return (mytest("Hello%d\n", 1));
  }
  EOF
@@ -65,7 +66,7 @@ index e974d1f..69dfa3f 100755
      echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configure.log
  
      echo >> configure.log
-@@ -744,7 +744,7 @@ int main()
+@@ -751,7 +751,7 @@ int main()
  }
  EOF
  
@@ -75,5 +76,5 @@ index e974d1f..69dfa3f 100755
  
      echo >> configure.log
 -- 
-2.35.1
+2.25.1
 
diff --git a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch b/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
deleted file mode 100644
index 5cb6183641..0000000000
--- a/meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
+++ /dev/null
@@ -1,347 +0,0 @@
-CVE: CVE-2018-25032
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5c44459c3b28a9bd3283aaceab7c615f8020c531 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Tue, 17 Apr 2018 22:09:22 -0700
-Subject: [PATCH] Fix a bug that can crash deflate on some input when using
- Z_FIXED.
-
-This bug was reported by Danilo Ramos of Eideticom, Inc. It has
-lain in wait 13 years before being found! The bug was introduced
-in zlib 1.2.2.2, with the addition of the Z_FIXED option. That
-option forces the use of fixed Huffman codes. For rare inputs with
-a large number of distant matches, the pending buffer into which
-the compressed data is written can overwrite the distance symbol
-table which it overlays. That results in corrupted output due to
-invalid distances, and can result in out-of-bound accesses,
-crashing the application.
-
-The fix here combines the distance buffer and literal/length
-buffers into a single symbol buffer. Now three bytes of pending
-buffer space are opened up for each literal or length/distance
-pair consumed, instead of the previous two bytes. This assures
-that the pending buffer cannot overwrite the symbol table, since
-the maximum fixed code compressed length/distance is 31 bits, and
-since there are four bytes of pending space for every three bytes
-of symbol space.
----
- deflate.c | 74 ++++++++++++++++++++++++++++++++++++++++---------------
- deflate.h | 25 +++++++++----------
- trees.c   | 50 +++++++++++--------------------------
- 3 files changed, 79 insertions(+), 70 deletions(-)
-
-diff --git a/deflate.c b/deflate.c
-index 425babc00..19cba873a 100644
---- a/deflate.c
-+++ b/deflate.c
-@@ -255,11 +255,6 @@ int ZEXPORT deflateInit2_(strm, level, method, windowBits, memLevel, strategy,
-     int wrap = 1;
-     static const char my_version[] = ZLIB_VERSION;
- 
--    ushf *overlay;
--    /* We overlay pending_buf and d_buf+l_buf. This works since the average
--     * output size for (length,distance) codes is <= 24 bits.
--     */
--
-     if (version == Z_NULL || version[0] != my_version[0] ||
-         stream_size != sizeof(z_stream)) {
-         return Z_VERSION_ERROR;
-@@ -329,9 +324,47 @@ int ZEXPORT deflateInit2_(strm, level, method, windowBits, memLevel, strategy,
- 
-     s->lit_bufsize = 1 << (memLevel + 6); /* 16K elements by default */
- 
--    overlay = (ushf *) ZALLOC(strm, s->lit_bufsize, sizeof(ush)+2);
--    s->pending_buf = (uchf *) overlay;
--    s->pending_buf_size = (ulg)s->lit_bufsize * (sizeof(ush)+2L);
-+    /* We overlay pending_buf and sym_buf. This works since the average size
-+     * for length/distance pairs over any compressed block is assured to be 31
-+     * bits or less.
-+     *
-+     * Analysis: The longest fixed codes are a length code of 8 bits plus 5
-+     * extra bits, for lengths 131 to 257. The longest fixed distance codes are
-+     * 5 bits plus 13 extra bits, for distances 16385 to 32768. The longest
-+     * possible fixed-codes length/distance pair is then 31 bits total.
-+     *
-+     * sym_buf starts one-fourth of the way into pending_buf. So there are
-+     * three bytes in sym_buf for every four bytes in pending_buf. Each symbol
-+     * in sym_buf is three bytes -- two for the distance and one for the
-+     * literal/length. As each symbol is consumed, the pointer to the next
-+     * sym_buf value to read moves forward three bytes. From that symbol, up to
-+     * 31 bits are written to pending_buf. The closest the written pending_buf
-+     * bits gets to the next sym_buf symbol to read is just before the last
-+     * code is written. At that time, 31*(n-2) bits have been written, just
-+     * after 24*(n-2) bits have been consumed from sym_buf. sym_buf starts at
-+     * 8*n bits into pending_buf. (Note that the symbol buffer fills when n-1
-+     * symbols are written.) The closest the writing gets to what is unread is
-+     * then n+14 bits. Here n is lit_bufsize, which is 16384 by default, and
-+     * can range from 128 to 32768.
-+     *
-+     * Therefore, at a minimum, there are 142 bits of space between what is
-+     * written and what is read in the overlain buffers, so the symbols cannot
-+     * be overwritten by the compressed data. That space is actually 139 bits,
-+     * due to the three-bit fixed-code block header.
-+     *
-+     * That covers the case where either Z_FIXED is specified, forcing fixed
-+     * codes, or when the use of fixed codes is chosen, because that choice
-+     * results in a smaller compressed block than dynamic codes. That latter
-+     * condition then assures that the above analysis also covers all dynamic
-+     * blocks. A dynamic-code block will only be chosen to be emitted if it has
-+     * fewer bits than a fixed-code block would for the same set of symbols.
-+     * Therefore its average symbol length is assured to be less than 31. So
-+     * the compressed data for a dynamic block also cannot overwrite the
-+     * symbols from which it is being constructed.
-+     */
-+
-+    s->pending_buf = (uchf *) ZALLOC(strm, s->lit_bufsize, 4);
-+    s->pending_buf_size = (ulg)s->lit_bufsize * 4;
- 
-     if (s->window == Z_NULL || s->prev == Z_NULL || s->head == Z_NULL ||
-         s->pending_buf == Z_NULL) {
-@@ -340,8 +373,12 @@ int ZEXPORT deflateInit2_(strm, level, method, windowBits, memLevel, strategy,
-         deflateEnd (strm);
-         return Z_MEM_ERROR;
-     }
--    s->d_buf = overlay + s->lit_bufsize/sizeof(ush);
--    s->l_buf = s->pending_buf + (1+sizeof(ush))*s->lit_bufsize;
-+    s->sym_buf = s->pending_buf + s->lit_bufsize;
-+    s->sym_end = (s->lit_bufsize - 1) * 3;
-+    /* We avoid equality with lit_bufsize*3 because of wraparound at 64K
-+     * on 16 bit machines and because stored blocks are restricted to
-+     * 64K-1 bytes.
-+     */
- 
-     s->level = level;
-     s->strategy = strategy;
-@@ -552,7 +589,7 @@ int ZEXPORT deflatePrime (strm, bits, value)
- 
-     if (deflateStateCheck(strm)) return Z_STREAM_ERROR;
-     s = strm->state;
--    if ((Bytef *)(s->d_buf) < s->pending_out + ((Buf_size + 7) >> 3))
-+    if (s->sym_buf < s->pending_out + ((Buf_size + 7) >> 3))
-         return Z_BUF_ERROR;
-     do {
-         put = Buf_size - s->bi_valid;
-@@ -1113,7 +1150,6 @@ int ZEXPORT deflateCopy (dest, source)
- #else
-     deflate_state *ds;
-     deflate_state *ss;
--    ushf *overlay;
- 
- 
-     if (deflateStateCheck(source) || dest == Z_NULL) {
-@@ -1133,8 +1169,7 @@ int ZEXPORT deflateCopy (dest, source)
-     ds->window = (Bytef *) ZALLOC(dest, ds->w_size, 2*sizeof(Byte));
-     ds->prev   = (Posf *)  ZALLOC(dest, ds->w_size, sizeof(Pos));
-     ds->head   = (Posf *)  ZALLOC(dest, ds->hash_size, sizeof(Pos));
--    overlay = (ushf *) ZALLOC(dest, ds->lit_bufsize, sizeof(ush)+2);
--    ds->pending_buf = (uchf *) overlay;
-+    ds->pending_buf = (uchf *) ZALLOC(dest, ds->lit_bufsize, 4);
- 
-     if (ds->window == Z_NULL || ds->prev == Z_NULL || ds->head == Z_NULL ||
-         ds->pending_buf == Z_NULL) {
-@@ -1148,8 +1183,7 @@ int ZEXPORT deflateCopy (dest, source)
-     zmemcpy(ds->pending_buf, ss->pending_buf, (uInt)ds->pending_buf_size);
- 
-     ds->pending_out = ds->pending_buf + (ss->pending_out - ss->pending_buf);
--    ds->d_buf = overlay + ds->lit_bufsize/sizeof(ush);
--    ds->l_buf = ds->pending_buf + (1+sizeof(ush))*ds->lit_bufsize;
-+    ds->sym_buf = ds->pending_buf + ds->lit_bufsize;
- 
-     ds->l_desc.dyn_tree = ds->dyn_ltree;
-     ds->d_desc.dyn_tree = ds->dyn_dtree;
-@@ -1925,7 +1959,7 @@ local block_state deflate_fast(s, flush)
-         FLUSH_BLOCK(s, 1);
-         return finish_done;
-     }
--    if (s->last_lit)
-+    if (s->sym_next)
-         FLUSH_BLOCK(s, 0);
-     return block_done;
- }
-@@ -2056,7 +2090,7 @@ local block_state deflate_slow(s, flush)
-         FLUSH_BLOCK(s, 1);
-         return finish_done;
-     }
--    if (s->last_lit)
-+    if (s->sym_next)
-         FLUSH_BLOCK(s, 0);
-     return block_done;
- }
-@@ -2131,7 +2165,7 @@ local block_state deflate_rle(s, flush)
-         FLUSH_BLOCK(s, 1);
-         return finish_done;
-     }
--    if (s->last_lit)
-+    if (s->sym_next)
-         FLUSH_BLOCK(s, 0);
-     return block_done;
- }
-@@ -2170,7 +2204,7 @@ local block_state deflate_huff(s, flush)
-         FLUSH_BLOCK(s, 1);
-         return finish_done;
-     }
--    if (s->last_lit)
-+    if (s->sym_next)
-         FLUSH_BLOCK(s, 0);
-     return block_done;
- }
-diff --git a/deflate.h b/deflate.h
-index 23ecdd312..d4cf1a98b 100644
---- a/deflate.h
-+++ b/deflate.h
-@@ -217,7 +217,7 @@ typedef struct internal_state {
-     /* Depth of each subtree used as tie breaker for trees of equal frequency
-      */
- 
--    uchf *l_buf;          /* buffer for literals or lengths */
-+    uchf *sym_buf;        /* buffer for distances and literals/lengths */
- 
-     uInt  lit_bufsize;
-     /* Size of match buffer for literals/lengths.  There are 4 reasons for
-@@ -239,13 +239,8 @@ typedef struct internal_state {
-      *   - I can't count above 4
-      */
- 
--    uInt last_lit;      /* running index in l_buf */
--
--    ushf *d_buf;
--    /* Buffer for distances. To simplify the code, d_buf and l_buf have
--     * the same number of elements. To use different lengths, an extra flag
--     * array would be necessary.
--     */
-+    uInt sym_next;      /* running index in sym_buf */
-+    uInt sym_end;       /* symbol table full when sym_next reaches this */
- 
-     ulg opt_len;        /* bit length of current block with optimal trees */
-     ulg static_len;     /* bit length of current block with static trees */
-@@ -325,20 +320,22 @@ void ZLIB_INTERNAL _tr_stored_block OF((deflate_state *s, charf *buf,
- 
- # define _tr_tally_lit(s, c, flush) \
-   { uch cc = (c); \
--    s->d_buf[s->last_lit] = 0; \
--    s->l_buf[s->last_lit++] = cc; \
-+    s->sym_buf[s->sym_next++] = 0; \
-+    s->sym_buf[s->sym_next++] = 0; \
-+    s->sym_buf[s->sym_next++] = cc; \
-     s->dyn_ltree[cc].Freq++; \
--    flush = (s->last_lit == s->lit_bufsize-1); \
-+    flush = (s->sym_next == s->sym_end); \
-    }
- # define _tr_tally_dist(s, distance, length, flush) \
-   { uch len = (uch)(length); \
-     ush dist = (ush)(distance); \
--    s->d_buf[s->last_lit] = dist; \
--    s->l_buf[s->last_lit++] = len; \
-+    s->sym_buf[s->sym_next++] = dist; \
-+    s->sym_buf[s->sym_next++] = dist >> 8; \
-+    s->sym_buf[s->sym_next++] = len; \
-     dist--; \
-     s->dyn_ltree[_length_code[len]+LITERALS+1].Freq++; \
-     s->dyn_dtree[d_code(dist)].Freq++; \
--    flush = (s->last_lit == s->lit_bufsize-1); \
-+    flush = (s->sym_next == s->sym_end); \
-   }
- #else
- # define _tr_tally_lit(s, c, flush) flush = _tr_tally(s, 0, c)
-diff --git a/trees.c b/trees.c
-index 4f4a65011..decaeb7c3 100644
---- a/trees.c
-+++ b/trees.c
-@@ -416,7 +416,7 @@ local void init_block(s)
- 
-     s->dyn_ltree[END_BLOCK].Freq = 1;
-     s->opt_len = s->static_len = 0L;
--    s->last_lit = s->matches = 0;
-+    s->sym_next = s->matches = 0;
- }
- 
- #define SMALLEST 1
-@@ -948,7 +948,7 @@ void ZLIB_INTERNAL _tr_flush_block(s, buf, stored_len, last)
- 
-         Tracev((stderr, "\nopt %lu(%lu) stat %lu(%lu) stored %lu lit %u ",
-                 opt_lenb, s->opt_len, static_lenb, s->static_len, stored_len,
--                s->last_lit));
-+                s->sym_next / 3));
- 
-         if (static_lenb <= opt_lenb) opt_lenb = static_lenb;
- 
-@@ -1017,8 +1017,9 @@ int ZLIB_INTERNAL _tr_tally (s, dist, lc)
-     unsigned dist;  /* distance of matched string */
-     unsigned lc;    /* match length-MIN_MATCH or unmatched char (if dist==0) */
- {
--    s->d_buf[s->last_lit] = (ush)dist;
--    s->l_buf[s->last_lit++] = (uch)lc;
-+    s->sym_buf[s->sym_next++] = dist;
-+    s->sym_buf[s->sym_next++] = dist >> 8;
-+    s->sym_buf[s->sym_next++] = lc;
-     if (dist == 0) {
-         /* lc is the unmatched char */
-         s->dyn_ltree[lc].Freq++;
-@@ -1033,30 +1034,7 @@ int ZLIB_INTERNAL _tr_tally (s, dist, lc)
-         s->dyn_ltree[_length_code[lc]+LITERALS+1].Freq++;
-         s->dyn_dtree[d_code(dist)].Freq++;
-     }
--
--#ifdef TRUNCATE_BLOCK
--    /* Try to guess if it is profitable to stop the current block here */
--    if ((s->last_lit & 0x1fff) == 0 && s->level > 2) {
--        /* Compute an upper bound for the compressed length */
--        ulg out_length = (ulg)s->last_lit*8L;
--        ulg in_length = (ulg)((long)s->strstart - s->block_start);
--        int dcode;
--        for (dcode = 0; dcode < D_CODES; dcode++) {
--            out_length += (ulg)s->dyn_dtree[dcode].Freq *
--                (5L+extra_dbits[dcode]);
--        }
--        out_length >>= 3;
--        Tracev((stderr,"\nlast_lit %u, in %ld, out ~%ld(%ld%%) ",
--               s->last_lit, in_length, out_length,
--               100L - out_length*100L/in_length));
--        if (s->matches < s->last_lit/2 && out_length < in_length/2) return 1;
--    }
--#endif
--    return (s->last_lit == s->lit_bufsize-1);
--    /* We avoid equality with lit_bufsize because of wraparound at 64K
--     * on 16 bit machines and because stored blocks are restricted to
--     * 64K-1 bytes.
--     */
-+    return (s->sym_next == s->sym_end);
- }
- 
- /* ===========================================================================
-@@ -1069,13 +1047,14 @@ local void compress_block(s, ltree, dtree)
- {
-     unsigned dist;      /* distance of matched string */
-     int lc;             /* match length or unmatched char (if dist == 0) */
--    unsigned lx = 0;    /* running index in l_buf */
-+    unsigned sx = 0;    /* running index in sym_buf */
-     unsigned code;      /* the code to send */
-     int extra;          /* number of extra bits to send */
- 
--    if (s->last_lit != 0) do {
--        dist = s->d_buf[lx];
--        lc = s->l_buf[lx++];
-+    if (s->sym_next != 0) do {
-+        dist = s->sym_buf[sx++] & 0xff;
-+        dist += (unsigned)(s->sym_buf[sx++] & 0xff) << 8;
-+        lc = s->sym_buf[sx++];
-         if (dist == 0) {
-             send_code(s, lc, ltree); /* send a literal byte */
-             Tracecv(isgraph(lc), (stderr," '%c' ", lc));
-@@ -1100,11 +1079,10 @@ local void compress_block(s, ltree, dtree)
-             }
-         } /* literal or match pair ? */
- 
--        /* Check that the overlay between pending_buf and d_buf+l_buf is ok: */
--        Assert((uInt)(s->pending) < s->lit_bufsize + 2*lx,
--               "pendingBuf overflow");
-+        /* Check that the overlay between pending_buf and sym_buf is ok: */
-+        Assert(s->pending < s->lit_bufsize + sx, "pendingBuf overflow");
- 
--    } while (lx < s->last_lit);
-+    } while (sx < s->sym_next);
- 
-     send_code(s, END_BLOCK, ltree);
- }
diff --git a/meta/recipes-core/zlib/zlib/cc.patch b/meta/recipes-core/zlib/zlib/cc.patch
new file mode 100644
index 0000000000..8fb974ded4
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/cc.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Mon, 28 Mar 2022 18:34:10 -0700
+Subject: [PATCH] Fix configure issue that discarded provided CC definition.
+
+---
+ configure | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure b/configure
+index 52ff4a04e..3fa3e8618 100755
+--- a/configure
++++ b/configure
+@@ -174,7 +174,10 @@ if test -z "$CC"; then
+   else
+     cc=${CROSS_PREFIX}cc
+   fi
++else
++  cc=${CC}
+ fi
++
+ cflags=${CFLAGS-"-O3"}
+ # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
+ case "$cc" in
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
similarity index 83%
rename from meta/recipes-core/zlib/zlib_1.2.11.bb
rename to meta/recipes-core/zlib/zlib_1.2.12.bb
index f8bcc0abcf..95e873584b 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -6,16 +6,15 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://zlib.net/${BP}.tar.xz \
+           file://cc.patch \
            file://ldflags-tests.patch \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
-           file://CVE-2018-25032.patch \
            file://run-ptest \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[md5sum] = "85adef240c5f370b308da8c938951a68"
-SRC_URI[sha256sum] = "4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066"
+SRC_URI[sha256sum] = "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
 
 CFLAGS += "-D_REENTRANT"
 
-- 
2.25.1


