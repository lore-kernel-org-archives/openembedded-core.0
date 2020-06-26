Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.2807.1593155968335621266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m2c2YgnZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id rk21so8387399ejb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2CjMAxVFbfTARwtXuLFmcEMtgibKGFUTHcupEvrZNww=;
        b=m2c2YgnZI3IyX6taWSGBMf5xzrIsr5Y/E2Fj2uVWFtBsKaorbbDnS9VJaRNqJyNsPt
         IOnxbDHtHroWkviEZOx+kpLeXhAR1ZzZNh0Eqz1nQOCsegQPXAhIj3pGcgwwMFHgC5r5
         mup7KbRgTdQUFI1QRAgB7PrM4j9rqBP9REW87MMbTm8uP+RVv5GJsmCMVChh7b7Fqsch
         +9CHkvyaGYR9x73Voxy+n8CSuHCcleaEYnuIb1CdI/f/YXfmtaJAuqDwVK2bxWhYL6PO
         o+3yCVVjGU8wEcBHgq/wgesskiRit4t/6rydIzl2+KMmTdS4ROitznCwDqBvLs9LqFqn
         G3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2CjMAxVFbfTARwtXuLFmcEMtgibKGFUTHcupEvrZNww=;
        b=RV6nD8iTq5/T64ACL+w6eFsosHW4MhfhX2lIOCpl+cxevScXcQzufHgDoaba+YaGab
         q0Mbj2eoyKJ0qI7zt6PbDCamlEYq3+Twq51lOVQZV9a+1s/PRJ/QlxJjc7Pum18huQqH
         c0LUk0Gw30tnJv1w9ceJvhQkIb9fx9C4k7xfzRfnV8dlSGIlrZOZBPz/m7/+dsXkmSeV
         Y0FoaO/mmY5hNu9yBC3BlnJbUBfClbaBwSfDo8AIaBmMbegAdX1U/qnfF0P9z7rnBPr/
         GV9YVBfcYI3RfkpobHVTImSD54poPkvW6LsmI54ZJQbXjDbAVwRXEOi3ADU1Yw4MW+mi
         1gsw==
X-Gm-Message-State: AOAM531TdO7Tl6M6gfIl08rTekjutv1PU9MOY+Qb3W+fT0m++yo0IhuA
	lPmHbIrlxY28GpxMdVt6FhEvzRQYvH4=
X-Google-Smtp-Source: ABdhPJxmVjlpbotuMBlKg4ksfdOxs3WVyCgQtvqliX+7fjD8kCfv4w4qJTvXsM0EGW7OtJsTfTRfeQ==
X-Received: by 2002:a17:906:a058:: with SMTP id bg24mr849912ejb.370.1593155966139;
        Fri, 26 Jun 2020 00:19:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/30] rsync: update 3.1.3 -> 3.2.1
Date: Fri, 26 Jun 2020 09:18:38 +0200
Message-Id: <20200626071844.29134-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop all CVE patches, add the new configure options.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../rsync/files/CVE-2016-9840.patch           |  75 ------
 .../rsync/files/CVE-2016-9841.patch           | 228 ------------------
 .../rsync/files/CVE-2016-9842.patch           |  33 ---
 .../rsync/files/CVE-2016-9843.patch           |  53 ----
 .../rsync/files/makefile-no-rebuild.patch     |  25 +-
 .../rsync/{rsync_3.1.3.bb => rsync_3.2.1.bb}  |  19 +-
 6 files changed, 26 insertions(+), 407 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
 rename meta/recipes-devtools/rsync/{rsync_3.1.3.bb => rsync_3.2.1.bb} (71%)

diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
deleted file mode 100644
index 7581887790..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2016-9840.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 6a043145ca6e9c55184013841a67b2fef87e44c0 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Wed, 21 Sep 2016 23:35:50 -0700
-Subject: [PATCH] Remove offset pointer optimization in inftrees.c.
-
-inftrees.c was subtracting an offset from a pointer to an array,
-in order to provide a pointer that allowed indexing starting at
-the offset. This is not compliant with the C standard, for which
-the behavior of a pointer decremented before its allocated memory
-is undefined. Per the recommendation of a security audit of the
-zlib code by Trail of Bits and TrustInSoft, in support of the
-Mozilla Foundation, this tiny optimization was removed, in order
-to avoid the possibility of undefined behavior.
-
-CVE: CVE-2016-9840
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- inftrees.c | 18 ++++++++----------
- 1 file changed, 8 insertions(+), 10 deletions(-)
-
-diff --git a/zlib/inftrees.c b/zlib/inftrees.c
-index 22fcd666..0d2670d5 100644
---- a/zlib/inftrees.c
-+++ b/zlib/inftrees.c
-@@ -54,7 +54,7 @@ unsigned short FAR *work;
-     code FAR *next;             /* next available space in table */
-     const unsigned short FAR *base;     /* base value table to use */
-     const unsigned short FAR *extra;    /* extra bits table to use */
--    int end;                    /* use base and extra for symbol > end */
-+    unsigned match;             /* use base and extra for symbol >= match */
-     unsigned short count[MAXBITS+1];    /* number of codes of each length */
-     unsigned short offs[MAXBITS+1];     /* offsets in table for each length */
-     static const unsigned short lbase[31] = { /* Length codes 257..285 base */
-@@ -181,19 +181,17 @@ unsigned short FAR *work;
-     switch (type) {
-     case CODES:
-         base = extra = work;    /* dummy value--not used */
--        end = 19;
-+        match = 20;
-         break;
-     case LENS:
-         base = lbase;
--        base -= 257;
-         extra = lext;
--        extra -= 257;
--        end = 256;
-+        match = 257;
-         break;
-     default:            /* DISTS */
-         base = dbase;
-         extra = dext;
--        end = -1;
-+        match = 0;
-     }
- 
-     /* initialize state for loop */
-@@ -216,13 +214,13 @@ unsigned short FAR *work;
-     for (;;) {
-         /* create table entry */
-         here.bits = (unsigned char)(len - drop);
--        if ((int)(work[sym]) < end) {
-+        if (work[sym] + 1 < match) {
-             here.op = (unsigned char)0;
-             here.val = work[sym];
-         }
--        else if ((int)(work[sym]) > end) {
--            here.op = (unsigned char)(extra[work[sym]]);
--            here.val = base[work[sym]];
-+        else if (work[sym] >= match) {
-+            here.op = (unsigned char)(extra[work[sym] - match]);
-+            here.val = base[work[sym] - match];
-         }
-         else {
-             here.op = (unsigned char)(32 + 64);         /* end of block */
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
deleted file mode 100644
index 3942176de5..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2016-9841.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From 9aaec95e82117c1cb0f9624264c3618fc380cecb Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Wed, 21 Sep 2016 22:25:21 -0700
-Subject: [PATCH] Use post-increment only in inffast.c.
-
-An old inffast.c optimization turns out to not be optimal anymore
-with modern compilers, and furthermore was not compliant with the
-C standard, for which decrementing a pointer before its allocated
-memory is undefined. Per the recommendation of a security audit of
-the zlib code by Trail of Bits and TrustInSoft, in support of the
-Mozilla Foundation, this "optimization" was removed, in order to
-avoid the possibility of undefined behavior.
-
-CVE: CVE-2016-9841
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- zlib/inffast.c | 81 +++++++++++++++++++++----------------------------------
- 1 file changed, 31 insertions(+), 50 deletions(-)
-
-diff --git a/zlib/inffast.c b/zlib/inffast.c
-index bda59ceb..f0d163db 100644
---- a/zlib/inffast.c
-+++ b/zlib/inffast.c
-@@ -10,25 +10,6 @@
- 
- #ifndef ASMINF
- 
--/* Allow machine dependent optimization for post-increment or pre-increment.
--   Based on testing to date,
--   Pre-increment preferred for:
--   - PowerPC G3 (Adler)
--   - MIPS R5000 (Randers-Pehrson)
--   Post-increment preferred for:
--   - none
--   No measurable difference:
--   - Pentium III (Anderson)
--   - M68060 (Nikl)
-- */
--#ifdef POSTINC
--#  define OFF 0
--#  define PUP(a) *(a)++
--#else
--#  define OFF 1
--#  define PUP(a) *++(a)
--#endif
--
- /*
-    Decode literal, length, and distance codes and write out the resulting
-    literal and match bytes until either not enough input or output is
-@@ -96,9 +77,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
- 
-     /* copy state to local variables */
-     state = (struct inflate_state FAR *)strm->state;
--    in = strm->next_in - OFF;
-+    in = strm->next_in;
-     last = in + (strm->avail_in - 5);
--    out = strm->next_out - OFF;
-+    out = strm->next_out;
-     beg = out - (start - strm->avail_out);
-     end = out + (strm->avail_out - 257);
- #ifdef INFLATE_STRICT
-@@ -119,9 +100,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-        input data or output space */
-     do {
-         if (bits < 15) {
--            hold += (unsigned long)(PUP(in)) << bits;
-+            hold += (unsigned long)(*in++) << bits;
-             bits += 8;
--            hold += (unsigned long)(PUP(in)) << bits;
-+            hold += (unsigned long)(*in++) << bits;
-             bits += 8;
-         }
-         here = lcode[hold & lmask];
-@@ -134,14 +115,14 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-             Tracevv((stderr, here.val >= 0x20 && here.val < 0x7f ?
-                     "inflate:         literal '%c'\n" :
-                     "inflate:         literal 0x%02x\n", here.val));
--            PUP(out) = (unsigned char)(here.val);
-+            *out++ = (unsigned char)(here.val);
-         }
-         else if (op & 16) {                     /* length base */
-             len = (unsigned)(here.val);
-             op &= 15;                           /* number of extra bits */
-             if (op) {
-                 if (bits < op) {
--                    hold += (unsigned long)(PUP(in)) << bits;
-+                    hold += (unsigned long)(*in++) << bits;
-                     bits += 8;
-                 }
-                 len += (unsigned)hold & ((1U << op) - 1);
-@@ -150,9 +131,9 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-             }
-             Tracevv((stderr, "inflate:         length %u\n", len));
-             if (bits < 15) {
--                hold += (unsigned long)(PUP(in)) << bits;
-+                hold += (unsigned long)(*in++) << bits;
-                 bits += 8;
--                hold += (unsigned long)(PUP(in)) << bits;
-+                hold += (unsigned long)(*in++) << bits;
-                 bits += 8;
-             }
-             here = dcode[hold & dmask];
-@@ -165,10 +146,10 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-                 dist = (unsigned)(here.val);
-                 op &= 15;                       /* number of extra bits */
-                 if (bits < op) {
--                    hold += (unsigned long)(PUP(in)) << bits;
-+                    hold += (unsigned long)(*in++) << bits;
-                     bits += 8;
-                     if (bits < op) {
--                        hold += (unsigned long)(PUP(in)) << bits;
-+                        hold += (unsigned long)(*in++) << bits;
-                         bits += 8;
-                     }
-                 }
-@@ -196,30 +177,30 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
- #ifdef INFLATE_ALLOW_INVALID_DISTANCE_TOOFAR_ARRR
-                         if (len <= op - whave) {
-                             do {
--                                PUP(out) = 0;
-+                                *out++ = 0;
-                             } while (--len);
-                             continue;
-                         }
-                         len -= op - whave;
-                         do {
--                            PUP(out) = 0;
-+                            *out++ = 0;
-                         } while (--op > whave);
-                         if (op == 0) {
-                             from = out - dist;
-                             do {
--                                PUP(out) = PUP(from);
-+                                *out++ = *from++;
-                             } while (--len);
-                             continue;
-                         }
- #endif
-                     }
--                    from = window - OFF;
-+                    from = window;
-                     if (wnext == 0) {           /* very common case */
-                         from += wsize - op;
-                         if (op < len) {         /* some from window */
-                             len -= op;
-                             do {
--                                PUP(out) = PUP(from);
-+                                *out++ = *from++;
-                             } while (--op);
-                             from = out - dist;  /* rest from output */
-                         }
-@@ -230,14 +211,14 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-                         if (op < len) {         /* some from end of window */
-                             len -= op;
-                             do {
--                                PUP(out) = PUP(from);
-+                                *out++ = *from++;
-                             } while (--op);
--                            from = window - OFF;
-+                            from = window;
-                             if (wnext < len) {  /* some from start of window */
-                                 op = wnext;
-                                 len -= op;
-                                 do {
--                                    PUP(out) = PUP(from);
-+                                    *out++ = *from++;
-                                 } while (--op);
-                                 from = out - dist;      /* rest from output */
-                             }
-@@ -248,35 +229,35 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-                         if (op < len) {         /* some from window */
-                             len -= op;
-                             do {
--                                PUP(out) = PUP(from);
-+                                *out++ = *from++;
-                             } while (--op);
-                             from = out - dist;  /* rest from output */
-                         }
-                     }
-                     while (len > 2) {
--                        PUP(out) = PUP(from);
--                        PUP(out) = PUP(from);
--                        PUP(out) = PUP(from);
-+                        *out++ = *from++;
-+                        *out++ = *from++;
-+                        *out++ = *from++;
-                         len -= 3;
-                     }
-                     if (len) {
--                        PUP(out) = PUP(from);
-+                        *out++ = *from++;
-                         if (len > 1)
--                            PUP(out) = PUP(from);
-+                            *out++ = *from++;
-                     }
-                 }
-                 else {
-                     from = out - dist;          /* copy direct from output */
-                     do {                        /* minimum length is three */
--                        PUP(out) = PUP(from);
--                        PUP(out) = PUP(from);
--                        PUP(out) = PUP(from);
-+                        *out++ = *from++;
-+                        *out++ = *from++;
-+                        *out++ = *from++;
-                         len -= 3;
-                     } while (len > 2);
-                     if (len) {
--                        PUP(out) = PUP(from);
-+                        *out++ = *from++;
-                         if (len > 1)
--                            PUP(out) = PUP(from);
-+                            *out++ = *from++;
-                     }
-                 }
-             }
-@@ -313,8 +294,8 @@ unsigned start;         /* inflate()'s starting value for strm->avail_out */
-     hold &= (1U << bits) - 1;
- 
-     /* update state and return */
--    strm->next_in = in + OFF;
--    strm->next_out = out + OFF;
-+    strm->next_in = in;
-+    strm->next_out = out;
-     strm->avail_in = (unsigned)(in < last ? 5 + (last - in) : 5 - (in - last));
-     strm->avail_out = (unsigned)(out < end ?
-                                  257 + (end - out) : 257 - (out - end));
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
deleted file mode 100644
index 810d8a3fdb..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2016-9842.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e54e1299404101a5a9d0cf5e45512b543967f958 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Sat, 5 Sep 2015 17:45:55 -0700
-Subject: [PATCH] Avoid shifts of negative values inflateMark().
-
-The C standard says that bit shifts of negative integers is
-undefined.  This casts to unsigned values to assure a known
-result.
-
-CVE: CVE-2016-9842
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- inflate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/zlib/inflate.c b/zlib/inflate.c
-index 2889e3a0..a7184167 100644
---- a/zlib/inflate.c
-+++ b/zlib/inflate.c
-@@ -1506,9 +1506,10 @@ z_streamp strm;
- {
-     struct inflate_state FAR *state;
- 
--    if (strm == Z_NULL || strm->state == Z_NULL) return -1L << 16;
-+    if (strm == Z_NULL || strm->state == Z_NULL)
-+        return (long)(((unsigned long)0 - 1) << 16);
-     state = (struct inflate_state FAR *)strm->state;
--    return ((long)(state->back) << 16) +
-+    return (long)(((unsigned long)((long)state->back)) << 16) +
-         (state->mode == COPY ? state->length :
-             (state->mode == MATCH ? state->was - state->length : 0));
- }
diff --git a/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch b/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
deleted file mode 100644
index ea2e42fe76..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2016-9843.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d1d577490c15a0c6862473d7576352a9f18ef811 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Wed, 28 Sep 2016 20:20:25 -0700
-Subject: [PATCH] Avoid pre-decrement of pointer in big-endian CRC calculation.
-
-There was a small optimization for PowerPCs to pre-increment a
-pointer when accessing a word, instead of post-incrementing. This
-required prefacing the loop with a decrement of the pointer,
-possibly pointing before the object passed. This is not compliant
-with the C standard, for which decrementing a pointer before its
-allocated memory is undefined. When tested on a modern PowerPC
-with a modern compiler, the optimization no longer has any effect.
-Due to all that, and per the recommendation of a security audit of
-the zlib code by Trail of Bits and TrustInSoft, in support of the
-Mozilla Foundation, this "optimization" was removed, in order to
-avoid the possibility of undefined behavior.
-
-CVE: CVE-2016-9843
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- crc32.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 979a7190..05733f4e 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -278,7 +278,7 @@ local unsigned long crc32_little(crc, buf, len)
- }
- 
- /* ========================================================================= */
--#define DOBIG4 c ^= *++buf4; \
-+#define DOBIG4 c ^= *buf4++; \
-         c = crc_table[4][c & 0xff] ^ crc_table[5][(c >> 8) & 0xff] ^ \
-             crc_table[6][(c >> 16) & 0xff] ^ crc_table[7][c >> 24]
- #define DOBIG32 DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4; DOBIG4
-@@ -300,7 +300,6 @@ local unsigned long crc32_big(crc, buf, len)
-     }
- 
-     buf4 = (const z_crc_t FAR *)(const void FAR *)buf;
--    buf4--;
-     while (len >= 32) {
-         DOBIG32;
-         len -= 32;
-@@ -309,7 +308,6 @@ local unsigned long crc32_big(crc, buf, len)
-         DOBIG4;
-         len -= 4;
-     }
--    buf4++;
-     buf = (const unsigned char FAR *)buf4;
- 
-     if (len) do {
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 3d27fe72cc..038a672095 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,20 +1,26 @@
+From 5ae38baadd40a996da3d19a147f37e7f1f3355bf Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 12 Apr 2016 15:51:54 +0100
+Subject: [PATCH] rsync: remove upstream's rebuild logic
+
 Remove the Makefile rules to reinvoke autoconf, they're not out-of-tree safe and
 generally overcomplicated, and we ensure that autoreconf is invoked if required.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ Makefile.in | 50 --------------------------------------------------
+ 1 file changed, 50 deletions(-)
+
 diff --git a/Makefile.in b/Makefile.in
-index 151247d..8f3fdb6 100644
+index 31ddc43..41c9a93 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -141,58 +141,6 @@ gen: conf proto.h man
+@@ -167,56 +167,6 @@ gen: conf proto.h man
  gensend: gen
- 	rsync -aivzc $(GENFILES) $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/
+ 	rsync -aic $(GENFILES) $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/
  
--conf:
--	cd $(srcdir) && $(MAKE) -f prepare-source.mak conf
--
 -aclocal.m4: $(srcdir)/m4/*.m4
 -	aclocal -I $(srcdir)/m4
 -
@@ -45,6 +51,7 @@ index 151247d..8f3fdb6 100644
 -	    fi \
 -	fi
 -
+-.PHONY: reconfigure
 -reconfigure: configure.sh
 -	./config.status --recheck
 -	./config.status
@@ -64,6 +71,6 @@ index 151247d..8f3fdb6 100644
 -	    fi \
 -	fi
 -
- rsync-ssl: $(srcdir)/rsync-ssl.in Makefile
- 	sed 's;\@bindir\@;$(bindir);g' <$(srcdir)/rsync-ssl.in >rsync-ssl
- 	@chmod +x rsync-ssl
+ stunnel-rsyncd.conf: $(srcdir)/stunnel-rsyncd.conf.in Makefile
+ 	sed 's;\@bindir\@;$(bindir);g' <$(srcdir)/stunnel-rsyncd.conf.in >stunnel-rsyncd.conf
+ 
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.1.bb
similarity index 71%
rename from meta/recipes-devtools/rsync/rsync_3.1.3.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.1.bb
index 152ff02a25..ea6b1ce38f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.1.bb
@@ -3,27 +3,23 @@ HOMEPAGE = "http://rsync.samba.org/"
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
 # GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
+# Includes opennsh and xxhash dynamic link exception
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9e5a4f9b3a253d51520617aa54f8eb26"
 
 DEPENDS = "popt"
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
-           file://CVE-2016-9840.patch \
-           file://CVE-2016-9841.patch \
-           file://CVE-2016-9842.patch \
-           file://CVE-2016-9843.patch \
-"
+           "
 
-SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
-SRC_URI[sha256sum] = "55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0"
+SRC_URI[sha256sum] = "95f2dd62979b500a99b34c1a6453a0787ada0330e4bec7fcffad37b9062d58d3"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_WHITELIST += " CVE-2017-16548 "
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -32,12 +28,17 @@ PACKAGECONFIG ??= "acl attr \
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[xxhash] = "--enable-xxhash,--disable-xxhash,xxhash"
+PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 
 # By default, if crosscompiling, rsync disables a number of
 # capabilities, hardlinking symlinks and special files (i.e. devices)
 CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
 
 EXTRA_OEMAKE = 'STRIP=""'
+EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm"
 
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
-- 
2.27.0

