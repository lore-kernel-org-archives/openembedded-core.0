Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55137CD5BCF
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 06:49:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31857.1779778138356335408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 23:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RcN5VAGD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bd80b3aa13so67317955ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 23:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779778137; x=1780382937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4i5U+Ut7cn5XHvOiaBLCeIqBIm/7wK7nTgSSs14+GOc=;
        b=RcN5VAGDKfj6eVatIB1Cknh+sq2vYnSVJGgu24z9dCStEn2QNQlMaoy9RvyVnQIHzI
         hhR0mgXQJPVPUGpPhATsyFKxmWEY2W3E1rC2A6+ntiUPLIzsnkO2s+peeI7uKz+uxLBV
         ZpVYgNwOH1uvV0ZXC4IsLF6utCN8WBk2+loLmVEyqKXaRNuwUzbffingQNNHPwQSdW+X
         7da0JB8L/k9jsENNgseW3eF36arXUdmNZHk87izmnBx/Yzx4y4qgz3m0uahmMtPStci6
         7goAbRe7ycl6vxpHkF6q7dhaAttZPwkYcXcORRXLxfR16eF/1V+FT8e8BBEwOpH+8HXn
         yVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779778137; x=1780382937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4i5U+Ut7cn5XHvOiaBLCeIqBIm/7wK7nTgSSs14+GOc=;
        b=PKVeHC+S3hSCoykb/ovloNDVa2DYd00pB+VUCXfmL+TeSjXdETXXF6mbltDG6jiNzL
         f2yD/8euMsEAXieVShMKuTNQ+6pQlVFgzWEGv27oUfgJsncDfmGH4z5poFWljayXgSFP
         1k5E2WYdUPiUY/Sl5eM3AKxmvAkGyibS3mxEjWN0X/4wHr5r9XJrkNTXU+EhC69NyUlY
         m4ZkonBeV1W5AVNwijlG+Q+Kq8V135RXaF4CVF/57ouT5QThpNeYEhSDXs6YI8MO0KkK
         7i7mTQAEvNUTfhyISaZNnhTxQ19XXbtomP9XZXVF9MsWhhiaOGeHmu/IG7tFjhdkKo2+
         S1og==
X-Gm-Message-State: AOJu0YzsL2MktxedmntNrBB/EmNHs7ME5tE3j9F+zeC/riKLByNjMfSt
	lU2laPvW5qpoONkS9d2HjGiB/vX4micvwW9RAwCi71h2L4w4XKiGVJelTbaC/w==
X-Gm-Gg: Acq92OF5kwDzjyKogRvWgeXQpVWVTC+xOhjjmteOUdiJlhziSICJnMZ3ytQbZ/N+PtK
	Y71b9l0o7sXqmkzzmjW8gcaymM4ujsKbRdttzFlXRXHgXkDjPzn9xjRuXk6SjU94/hyyRvg2bP2
	6MlX9XziJzY98ClrEygMThYuNYVebfa/5Xdjzg2MG0BENGG7zKN5VlF+J4S4NPGtmSP7665z6er
	KqTC+W35Vb3AoQHCp4D0ngyDO5DQLIYEjv2Vzyfa5DxRx930UOeksVQ/f7Hgz7erV9uL2YKiJk5
	Sal4MXZgLLSaeWJps+E8V8ZCsSBrYvAShB8hNPeBN9BatzYC3vsZBNXOQDFVVnBzvAJsXXffLwj
	4xcmvRuBu7Vgyx4Ii0xOZL0g6CtIAdgm11LM0aupjLPJ/FE6/FYb01ujDmFq6Nb8R4rRu6+WcyU
	RtHJ/U4/JYpGUUjAK83cg6s+L5bxqKlLDoHiQgiwRK
X-Received: by 2002:a17:903:198c:b0:2bd:2de3:519a with SMTP id d9443c01a7336-2beb06ea5e1mr190812285ad.7.1779778137077;
        Mon, 25 May 2026 23:48:57 -0700 (PDT)
Received: from L-17367L.kpit.com ([49.47.218.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beca535bc1sm66942905ad.56.2026.05.25.23.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:48:56 -0700 (PDT)
From: Zahir Hussain <mail2szahir@gmail.com>
X-Google-Original-From: Zahir Hussain <zahir.basha@kpit.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Cc: souravkumar.pramanik@bmwtechworks.in,
	pramanik.souravkumar@gmail.com
Subject: [OE-core][scarthgap][PATCH] libpng: Fix CVE-2026-33416
Date: Tue, 26 May 2026 12:17:23 +0530
Message-Id: <20260526064723.1329974-1-zahir.basha@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 06:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237586

Backport fixes for CVE-2026-33416

Backport patches from security debian tracker [1] also mentioned at NVD Report [2]

[1] https://security-tracker.debian.org/tracker/CVE-2026-33416
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33416

Add below patches to fix the CVE:

CVE-2026-33416-01.patch
CVE-2026-33416-02.patch
CVE-2026-33416-03.patch
CVE-2026-33416-04.patch

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 .../libpng/files/CVE-2026-33416-01.patch      | 143 +++++++++++++++
 .../libpng/files/CVE-2026-33416-02.patch      |  53 ++++++
 .../libpng/files/CVE-2026-33416-03.patch      | 163 ++++++++++++++++++
 .../libpng/files/CVE-2026-33416-04.patch      |  53 ++++++
 .../libpng/libpng_1.6.42.bb                   |   4 +
 5 files changed, 416 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
new file mode 100644
index 0000000000..a60a8d6b5b
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-01.patch
@@ -0,0 +1,143 @@
+From 23019269764e35ed8458e517f1897bd3c54820eb Mon Sep 17 00:00:00 2001
+From: Oblivionsage <cookieandcream560@gmail.com>
+Date: Sun, 15 Mar 2026 10:35:29 +0100
+Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->trans_alpha`
+
+The function `png_set_tRNS` sets `png_ptr->trans_alpha` to point at
+`info_ptr->trans_alpha` directly, so both structs share the same heap
+buffer. If the application calls `png_free_data(PNG_FREE_TRNS)`, or if
+`png_set_tRNS` is called a second time, the buffer is freed through
+`info_ptr` while `png_ptr` still holds a dangling reference. Any
+subsequent row read that hits the function `png_do_expand_palette` will
+dereference freed memory.
+
+The fix gives `png_struct` its own allocation instead of aliasing the
+`info_ptr` pointer. This was already flagged with a TODO in
+`png_handle_tRNS` ("horrible side effect ... Fix this.") but it was
+never addressed.
+
+Verified with AddressSanitizer. All 34 existing tests pass without
+regressions.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/23019269764e35ed8458e517f1897bd3c54820eb]
+Comment: Refreshed hunk to match latest scarthgap
+
+Reviewed-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngread.c  | 11 +++++------
+ pngrutil.c |  4 ----
+ pngset.c   | 31 +++++++++++++++++++------------
+ pngwrite.c |  6 ++++++
+ 4 files changed, 30 insertions(+), 22 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 01b731d8eb..0086edf6cf 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -968,12 +968,11 @@ png_read_destroy(png_structrp png_ptr)
+ 
+ #if defined(PNG_tRNS_SUPPORTED) || \
+     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
+-   if ((png_ptr->free_me & PNG_FREE_TRNS) != 0)
+-   {
+-      png_free(png_ptr, png_ptr->trans_alpha);
+-      png_ptr->trans_alpha = NULL;
+-   }
+-   png_ptr->free_me &= ~PNG_FREE_TRNS;
++   /* png_ptr->trans_alpha is always independently allocated (not aliased
++    * with info_ptr->trans_alpha), so free it unconditionally.
++    */
++   png_free(png_ptr, png_ptr->trans_alpha);
++   png_ptr->trans_alpha = NULL;
+ #endif
+ 
+    inflateEnd(&png_ptr->zstream);
+diff --git a/pngrutil.c b/pngrutil.c
+index 366379b991..a19507bf1b 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -1905,10 +1905,6 @@ png_handle_tRNS(png_structrp png_ptr, pn
+       return;
+    }
+ 
+-   /* TODO: this is a horrible side effect in the palette case because the
+-    * png_struct ends up with a pointer to the tRNS buffer owned by the
+-    * png_info.  Fix this.
+-    */
+    png_set_tRNS(png_ptr, info_ptr, readbuf, png_ptr->num_trans,
+        &(png_ptr->trans_color));
+ }
+diff --git a/pngset.c b/pngset.c
+index 4b78b8960c..47883684e4 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -990,28 +990,36 @@ png_set_tRNS(png_structrp png_ptr, png_i
+ 
+    if (trans_alpha != NULL)
+    {
+-       /* It may not actually be necessary to set png_ptr->trans_alpha here;
+-        * we do it for backward compatibility with the way the png_handle_tRNS
+-        * function used to do the allocation.
+-        *
+-        * 1.6.0: The above statement is incorrect; png_handle_tRNS effectively
+-        * relies on png_set_tRNS storing the information in png_struct
+-        * (otherwise it won't be there for the code in pngrtran.c).
+-        */
+-
+        png_free_data(png_ptr, info_ptr, PNG_FREE_TRNS, 0);
+ 
+        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
+        {
+-         /* Changed from num_trans to PNG_MAX_PALETTE_LENGTH in version 1.2.1 */
++          /* Allocate info_ptr's copy of the transparency data. */
+           info_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
+           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+-
+           info_ptr->free_me |= PNG_FREE_TRNS;
+           info_ptr->valid |= PNG_INFO_tRNS;
++
++
++          /* Allocate an independent copy for png_struct, so that the
++           * lifetime of png_ptr->trans_alpha is decoupled from the
++           * lifetime of info_ptr->trans_alpha.  Previously these two
++           * pointers were aliased, which caused a use-after-free if
++           * png_free_data freed info_ptr->trans_alpha while
++           * png_ptr->trans_alpha was still in use by the row transform
++           * functions (e.g. png_do_expand_palette).
++           */
++          png_free(png_ptr, png_ptr->trans_alpha);
++          png_ptr->trans_alpha = png_voidcast(png_bytep,
++              png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++          memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
++       }
++       else
++       {
++          png_free(png_ptr, png_ptr->trans_alpha);
++          png_ptr->trans_alpha = NULL;
+        }
+-       png_ptr->trans_alpha = info_ptr->trans_alpha;
+    }
+ 
+    if (trans_color != NULL)
+diff --git a/pngwrite.c b/pngwrite.c
+index 5fc77d91f7..84af1e73fb 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -977,6 +977,12 @@ png_write_destroy(png_structrp png_ptr)
+    png_ptr->chunk_list = NULL;
+ #endif
+ 
++#if defined(PNG_tRNS_SUPPORTED)
++   /* Free the independent copy of trans_alpha owned by png_struct. */
++   png_free(png_ptr, png_ptr->trans_alpha);
++   png_ptr->trans_alpha = NULL;
++#endif
++
+    /* The error handling and memory handling information is left intact at this
+     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
+     * for how this happens.
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
new file mode 100644
index 0000000000..e746293bf2
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-02.patch
@@ -0,0 +1,53 @@
+From a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25 Mon Sep 17 00:00:00 2001
+From: Oblivionsage <cookieandcream560@gmail.com>
+Date: Tue, 17 Mar 2026 08:55:18 +0100
+Subject: [PATCH] fix: Initialize tail bytes in `trans_alpha` buffers
+
+Although the arrays `info_ptr->trans_alpha` and `png_ptr->trans_alpha`
+are allocated 256 bytes, only `num_trans` bytes are copied.
+The remaining entries were left uninitialized. Set them to 0xff (fully
+opaque) before copying, which matches the conventional treatment of
+entries beyond `num_trans`.
+
+This is a follow-up to the previous use-after-free fix.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/a3a21443ed12bfa1ef46fa0d4fb2b74a0fa34a25]
+Comment: Refreshed hunk to match latest scarthgap
+
+Reported-by: Cosmin Truta <ctruta@gmail.com>
+Reviewed-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngset.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/pngset.c b/pngset.c
+index 47883684e4..dccc6498d7 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -994,9 +994,13 @@ png_set_tRNS(png_structrp png_ptr, png_i
+ 
+        if (num_trans > 0 && num_trans <= PNG_MAX_PALETTE_LENGTH)
+        {
+-          /* Allocate info_ptr's copy of the transparency data. */
++	       /* Allocate info_ptr's copy of the transparency data.
++           * Initialize all entries to fully opaque (0xff), then overwrite
++           * the first num_trans entries with the actual values.
++           */
+           info_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++	       memset(info_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
+           memcpy(info_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+           info_ptr->free_me |= PNG_FREE_TRNS;
+           info_ptr->valid |= PNG_INFO_tRNS;
+@@ -1013,6 +1017,7 @@ png_set_tRNS(png_structrp png_ptr, png_i
+           png_free(png_ptr, png_ptr->trans_alpha);
+           png_ptr->trans_alpha = png_voidcast(png_bytep,
+               png_malloc(png_ptr, PNG_MAX_PALETTE_LENGTH));
++	       memset(png_ptr->trans_alpha, 0xff, PNG_MAX_PALETTE_LENGTH);
+           memcpy(png_ptr->trans_alpha, trans_alpha, (size_t)num_trans);
+        }
+        else
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
new file mode 100644
index 0000000000..21ce35dcd1
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-03.patch
@@ -0,0 +1,163 @@
+From 7ea9eea884a2328cc7fdcb3c0c00246a50d90667 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 20 Mar 2026 17:37:22 +0200
+Subject: [PATCH] fix: Resolve use-after-free on `png_ptr->palette`
+
+Give `png_struct` its own independently-allocated copy of the palette
+buffer, decoupling it from `info_struct`'s palette. Allocate both
+copies with `png_calloc` to zero-fill, because the ARM NEON palette
+riffle reads all 256 entries unconditionally.
+
+In function `png_set_PLTE`, `png_ptr->palette` was aliased directly to
+`info_ptr->palette`: a single heap buffer shared across two structs
+with independent lifetimes. If the buffer was freed through `info_ptr`
+(via `png_free_data(PNG_FREE_PLTE)` or a second call to `png_set_PLTE`),
+`png_ptr->palette` became a dangling pointer. Subsequent row reads,
+performed in `png_do_expand_palette` and in other transform functions,
+dereferenced (and in the bit-shift path, wrote to) freed memory.
+
+Also fix `png_set_quantize` to allocate an owned copy of the caller's
+palette rather than aliasing the user pointer, so that the unconditional
+free in `png_read_destroy` does not free unmanaged memory.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/7ea9eea884a2328cc7fdcb3c0c00246a50d90667]
+Comment: Refreshed hunk to match latest scarthgap
+
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngread.c  | 11 +++++------
+ pngrtran.c |  8 +++++++-
+ pngrutil.c | 13 -------------
+ pngset.c   | 28 +++++++++++++++++++---------
+ pngwrite.c |  4 ++++
+ 5 files changed, 35 insertions(+), 29 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 0086edf6cf..e1d38d578a 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -959,12 +959,11 @@ png_read_destroy(png_structrp png_ptr)
+    png_ptr->quantize_index = NULL;
+ #endif
+ 
+-   if ((png_ptr->free_me & PNG_FREE_PLTE) != 0)
+-   {
+-      png_zfree(png_ptr, png_ptr->palette);
+-      png_ptr->palette = NULL;
+-   }
+-   png_ptr->free_me &= ~PNG_FREE_PLTE;
++   /* png_ptr->palette is always independently allocated (not aliased
++    * with info_ptr->palette), so free it unconditionally.
++    */
++   png_free(png_ptr, png_ptr->palette);
++   png_ptr->palette = NULL;
+ 
+ #if defined(PNG_tRNS_SUPPORTED) || \
+     defined(PNG_READ_EXPAND_SUPPORTED) || defined(PNG_READ_BACKGROUND_SUPPORTED)
+diff --git a/pngrtran.c b/pngrtran.c
+index bfb7d423b7..fd736ab672 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -750,7 +750,13 @@ png_set_quantize(png_structrp png_ptr, p
+    }
+    if (png_ptr->palette == NULL)
+    {
+-      png_ptr->palette = palette;
++      /* Allocate an owned copy rather than aliasing the caller's pointer,
++       * so that png_read_destroy can free png_ptr->palette unconditionally.
++       */
++      png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
++          PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++      memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
++          (sizeof (png_color)));
+    }
+    png_ptr->num_palette = (png_uint_16)num_palette;
+
+diff --git a/pngrutil.c b/pngrutil.c
+index a19507bf1b..3a35fe9de2 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -1047,14 +1047,6 @@ png_handle_PLTE(png_structrp png_ptr, pn
+    }
+ #endif
+ 
+-   /* TODO: png_set_PLTE has the side effect of setting png_ptr->palette to its
+-    * own copy of the palette.  This has the side effect that when png_start_row
+-    * is called (this happens after any call to png_read_update_info) the
+-    * info_ptr palette gets changed.  This is extremely unexpected and
+-    * confusing.
+-    *
+-    * Fix this by not sharing the palette in this way.
+-    */
+    png_set_PLTE(png_ptr, info_ptr, palette, num);
+ 
+    /* The three chunks, bKGD, hIST and tRNS *must* appear after PLTE and before
+diff --git a/pngset.c b/pngset.c
+index dccc6498d7..b9ccb7fb15 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -595,28 +595,38 @@ png_set_PLTE(png_structrp png_ptr, png_i
+       png_error(png_ptr, "Invalid palette");
+    }
+ 
+-   /* It may not actually be necessary to set png_ptr->palette here;
+-    * we do it for backward compatibility with the way the png_handle_tRNS
+-    * function used to do the allocation.
+-    *
+-    * 1.6.0: the above statement appears to be incorrect; something has to set
+-    * the palette inside png_struct on read.
+-    */
+    png_free_data(png_ptr, info_ptr, PNG_FREE_PLTE, 0);
+ 
+    /* Changed in libpng-1.2.1 to allocate PNG_MAX_PALETTE_LENGTH instead
+     * of num_palette entries, in case of an invalid PNG file or incorrect
+     * call to png_set_PLTE() with too-large sample values.
++    *
++    * Allocate independent buffers for info_ptr and png_ptr so that the
++    * lifetime of png_ptr->palette is decoupled from the lifetime of
++    * info_ptr->palette.  Previously, these two pointers were aliased,
++    * which caused a use-after-free vulnerability if png_free_data freed
++    * info_ptr->palette while png_ptr->palette was still in use by the
++    * row transform functions (e.g. png_do_expand_palette).
++    *
++    * Both buffers are allocated with png_calloc to zero-fill, because
++    * the ARM NEON palette riffle reads all 256 entries unconditionally,
++    * regardless of num_palette.
+     */
++   png_free(png_ptr, png_ptr->palette);
+    png_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
+        PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++   info_ptr->palette = png_voidcast(png_colorp, png_calloc(png_ptr,
++       PNG_MAX_PALETTE_LENGTH * (sizeof (png_color))));
++   png_ptr->num_palette = info_ptr->num_palette = (png_uint_16)num_palette;
+ 
+    if (num_palette > 0)
++      {
++      memcpy(info_ptr->palette, palette, (unsigned int)num_palette *
++          (sizeof (png_color)));
+       memcpy(png_ptr->palette, palette, (unsigned int)num_palette *
+           (sizeof (png_color)));
++      }
+ 
+-   info_ptr->palette = png_ptr->palette;
+-   info_ptr->num_palette = png_ptr->num_palette = (png_uint_16)num_palette;
+    info_ptr->free_me |= PNG_FREE_PLTE;
+    info_ptr->valid |= PNG_INFO_PLTE;
+ }
+diff --git a/pngwrite.c b/pngwrite.c
+index 84af1e73fb..348763e940 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -982,6 +982,10 @@ png_write_destroy(png_structrp png_ptr)
+    png_free(png_ptr, png_ptr->trans_alpha);
+    png_ptr->trans_alpha = NULL;
+ #endif
++   
++   /* Free the independent copy of the palette owned by png_struct. */
++   png_free(png_ptr, png_ptr->palette);
++   png_ptr->palette = NULL;
+ 
+    /* The error handling and memory handling information is left intact at this
+     * point: the jmp_buf may still have to be freed.  See png_destroy_png_struct
diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
new file mode 100644
index 0000000000..ff7db53c81
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-04.patch
@@ -0,0 +1,53 @@
+From c1b0318b393c90679e6fa5bc1d329fd5d5012ec1 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 20 Mar 2026 21:25:12 +0200
+Subject: [PATCH] fix: Sync `info_ptr->palette` after in-place transforms
+
+Copy `png_ptr->palette` into `info_ptr->palette` upon entering
+the function that runs immediately after the in-place transforms.
+
+The palette decoupling in the previous commit gave `png_struct`
+and `png_info` independently-allocated palette buffers, fixing a
+use-after-free vulnerability. However, `png_init_read_transformations`
+modifies `png_ptr->palette` in place (e.g. for gamma correction or
+background compositing), and the old aliasing made those modifications
+visible through `png_get_PLTE`. With independent buffers,
+`info_ptr->palette` retained the original values, causing our tests to
+fail on indexed-colour background compositing.
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/c1b0318b393c90679e6fa5bc1d329fd5d5012ec1]
+Comment: Refreshed hunk to match latest scarthgap
+
+Signed-off-by: Sourav Kumar Pramanik <Souravkumar.Pramanik@bmwtechworks.in>
+Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
+---
+ pngrtran.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index fd736ab672..978dac5888 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1984,6 +1984,21 @@ png_read_transform_info(png_structrp png
+ {
+    png_debug(1, "in png_read_transform_info");
+ 
++   if (png_ptr->transformations != 0)
++   {
++      if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE &&
++          info_ptr->palette != NULL && png_ptr->palette != NULL)
++      {
++         /* Sync info_ptr->palette with png_ptr->palette.
++          * The function png_init_read_transformations may have modified
++          * png_ptr->palette in place (e.g. for gamma correction or for
++          * background compositing).
++          */
++         memcpy(info_ptr->palette, png_ptr->palette,
++             PNG_MAX_PALETTE_LENGTH * (sizeof (png_color)));
++      }
++   }
++
+ #ifdef PNG_READ_EXPAND_SUPPORTED
+    if ((png_ptr->transformations & PNG_EXPAND) != 0)
+    {
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 923ed79896..e4cc63686e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -25,6 +25,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-22801.patch \
            file://CVE-2026-25646.patch \
            file://CVE-2026-33636.patch \
+           file://CVE-2026-33416-01.patch \
+           file://CVE-2026-33416-02.patch \
+           file://CVE-2026-33416-03.patch \
+           file://CVE-2026-33416-04.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.34.1


