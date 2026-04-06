Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82308EF4EA4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:33:01 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49616.1775457172623637190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: wuKT+rG6Tyas3mt3ubElBg==
X-CSE-MsgGUID: NOEpi5mRTRyK0csAVRL7Yg==
X-IPAS-Result: =?us-ascii?q?A0BiBQART9Np/4//Ja1agjQQHIJRcV5DSZZLgxWIYpQ0A?=
 =?us-ascii?q?QEBD0QNBAEBPwKEAI1yAiY4EwECBAEBAQEDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDUkBDAGGAwEtCwEYARAdJgYDAQJPAgkjIYMCAYI5AQM2A?=
 =?us-ascii?q?xG0I4F5FgUCFoEBgygBgVOxXgoZKA1xgWEBCxQBgTiEeCkdQQGCN4UjWxgBh?=
 =?us-ascii?q?HonG32BEIEVg2iBBYEaQgKIJASDHBSBYR6FQYEXh2cIBx8SCAEcBgoCSBUSA?=
 =?us-ascii?q?wQDBAQBAgsTCQMDAg4CCAMCCAYZAT8SBBMKAwoLBwUfCgIMFAooIhIrCgM1E?=
 =?us-ascii?q?g8bFQEIBgICBAQCBAwCCQICBQcCEQMEAQEIAgItAwEDGQgJCAILBREYDAsHM?=
 =?us-ascii?q?QMQCQMfFxoIAUUIBhYBGgcFBgs4FQUMEQEBAkcCCAcEAwEHAwMMAgIQAgQEA?=
 =?us-ascii?q?gMRAwMEAxADAQIpAwMHCAMCBwQWChkEBQIBLgMFBwIEAQcBAwMHAwIMAgIRB?=
 =?us-ascii?q?QQGAgEDDAMEAwUFCy0RBxMKBgQHBQICAhQGAhISAwMEBAIBAgICOgQOGg4EC?=
 =?us-ascii?q?AcDBwEYBQIDAgUBAwEHBxICCggDDgEdAgIEAgkBAQoOAgIGAgIBAwgYAwQfB?=
 =?us-ascii?q?AMDBwICDAkDBA0CEgoSGwMOAw0PAgQDDAowEAQCBxACCQgGChgCAgIGAgMDA?=
 =?us-ascii?q?wQJAQIBAQEBAQEBAgcDAwMCAwYDDwoDBQcGAwQGAQQEAwMGAwMFBQEDAwUFB?=
 =?us-ascii?q?QcCAwYDBgcHBAgDBwsBAQEBAQMCAgkBAwgDDAkEAwUDJA8DCwkIBwwBPAwHC?=
 =?us-ascii?q?igENgEUFAcEJRlnBweLQieCLwcxShMBBQ4YgSBoDDoQkwYHgyOPEp5KgVNxa?=
 =?us-ascii?q?IM+jB6PPoV8GjOEBJQVklILmHuOCYQJkVkFaYRoNoFJJYFZMxojgQGCNglJG?=
 =?us-ascii?q?Q+OOINpxkAmMgIJMgEBBwIHDQMLgWiJMYhMAQE?=
IronPort-Data: A9a23:QM9draIfs1t19tZLFE+RjZQlxSXFcZb7ZxGr2PjKsXjdYENShTMFx
 zAXXGzUP//ba2r2f9ElaYuy8hlVuceGz4VlGwEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+kfzWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9h2Yqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFbJb24OEO1fhjd2a1BbDbyDxydhqJk5jaOX0+s4vaY1P3
 eYTJDZIalWIgPi7herlDOJtnc8kasLsOevzuFk5kmqfVqlgG82eBfyWvre03x9o7ixKNf/FZ
 8sCcjowRB/BeBZIfFwQDfrSmc/33CejLWUG8A79SawfxU/+1A0s1YLRCsv2IteRbPtvuhmpq
 TeTl4j+KlRAXDCF8hKd+3Kliu7TkCj7WY86G7ix9/osi1qWrkQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:j4+4sK3iW3wXDXZf+QtFtQqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZq/z/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3ANwXVYmtMEXAc1f04/mTC15mJ6Is6b17hj23/fXO?=
 =?us-ascii?q?pAH0yTaHOVFW9/Ilrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AcXzUVw7x9u3u07V2n5KDqjeExoxOxIm2CR0Iq6k?=
 =?us-ascii?q?8qurcPjdZBQ250wW4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="726460604"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 06:32:51 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 7185718000244;
	Mon,  6 Apr 2026 06:32:51 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id 1E204CC1288; Sun,  5 Apr 2026 23:32:51 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ashissh7@cisco.com,
	Ashish Sharma <pahaditechie@gmail.com>
Subject: [OE-core][scarthgap][PATCH] libpng: Fix CVE-2026-33416
Date: Sun,  5 Apr 2026 23:32:49 -0700
Message-ID: <20260406063250.3479054-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21720.cisco.com [10.128.165.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234665

Backports upstream fix for use-after-free vulnerability in
png_set_tRNS() where png_ptr->trans_alpha was aliased to
info_ptr->trans_alpha. If png_free_data() freed the info_ptr buffer,
png_ptr held a dangling pointer causing UAF in png_do_expand_palette().

Fix gives png_struct its own independent allocation, decoupling
the two lifetimes.

CVE: CVE-2026-33416
CVSS: 7.5 (HIGH)

Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
---
 .../libpng/files/CVE-2026-33416.patch         | 143 ++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch
new file mode 100644
index 0000000000..c563d977e3
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416.patch
@@ -0,0 +1,143 @@
+From 7c1c160358b839bd177d1134acede9891e256027 Mon Sep 17 00:00:00 2001
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
+
+Reviewed-by: Cosmin Truta <ctruta@gmail.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+(cherry picked from commit 23019269764e35ed8458e517f1897bd3c54820eb)
+Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
+---
+ pngread.c  | 11 +++++------
+ pngrutil.c |  4 ----
+ pngset.c   | 31 +++++++++++++++++++------------
+ pngwrite.c |  6 ++++++
+ 4 files changed, 30 insertions(+), 22 deletions(-)
+
+diff --git a/pngread.c b/pngread.c
+index 008a41856..b8a64a6e7 100644
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
+index d31dc21da..2128b2a66 100644
+--- a/pngrutil.c
++++ b/pngrutil.c
+@@ -1905,10 +1905,6 @@ png_handle_tRNS(png_structrp png_ptr, png_inforp info_ptr, png_uint_32 length)
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
+index eb1c8c7a3..3ae16f4e1 100644
+--- a/pngset.c
++++ b/pngset.c
+@@ -990,28 +990,35 @@ png_set_tRNS(png_structrp png_ptr, png_inforp info_ptr,
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
+index 77e412f43..e4e2973f8 100644
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
+-- 
+2.44.4
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 7471315fdd..4d8be5d843 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
            file://CVE-2026-25646.patch \
+           file://CVE-2026-33416.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.44.4


