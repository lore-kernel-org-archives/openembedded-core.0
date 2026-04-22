Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A06F94CBB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 02:59:49 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65001.1776826781613824205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 19:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YWOEfGZW;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5322; q=dns/txt;
  s=iport01; t=1776826781; x=1778036381;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9cOvRgQ2L176iZj+NT9YEWOOCff3xtScMcTxpQO2Uw4=;
  b=YWOEfGZWQArlAKwypmf8MpbUXbvCM5mNiHbPZom3/x6We99hkgCTvtvU
   tDe4iv4qoXD5ociSgpXg2QpxUXsow5XwlSM9KIhLal7/KeZ6YpxQv/vsZ
   x9wk3B0rfxXYMR3W4hsGM43TG/+BZO6/hAqdY+knV4INKBXDZIeRqOQO1
   NRV3ujYjYg6ZHjsxOv1xeiMvEygfQIjGUdzIE+5duvBtNLhEYHG6rHFah
   5+sF4XBuxm+E8NDYbSJewpBDf2Kc7j/RxG5QFP7vPzFLOE5yYf3xvdz4C
   AdYH+rrOL4Ljmf6k7OgPdt+DPNZNhUtGp0YbOOCoLDxHn2lKQgevJt4un
   Q==;
X-CSE-ConnectionGUID: rJrbbhnXRu+SCwyCyOByyA==
X-CSE-MsgGUID: x2o/lxxOTcqeQ9RDY08ylw==
X-IPAS-Result: =?us-ascii?q?A0B4AwDdOOhp/5L/Ja1aglmCV3FfQkkDlCeCIYtnkjYUg?=
 =?us-ascii?q?WsPAQEBD0QNBAEBhECNdAImNgcOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgE4ARgBWQMBAk8LIyGDAgGCOgM2AgERBrJUgiyBA?=
 =?us-ascii?q?YMoAT8CQ0/YRw2CUgELFAGBOIU/gnmFI1sYAYR6JxsbgXKBFYNogQWBGkIBA?=
 =?us-ascii?q?QGBIocBBIIigQ6BYB6FAIIZhXlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBS4Q2bWqBC4MxgTs1AwsYDUgRLDcUGwQ+bgeKMiEQgiuBDgEpA?=
 =?us-ascii?q?nsENUkLJB4wknGSNaAdcQoog3SMHo8+hXwaM4QElBWSUguYe44JhAmSR4Rog?=
 =?us-ascii?q?W8EMYFHCwdwFYMiCUoZD44qAwsLg1+Bf4MUvyojNQIJAy8BAQcCBw0DC4Fok?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:KmHK4qItIh3MTF/mFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgjAHy
 TdJXziDaaqNZjGgctp0Pozn/ElUv5PQzNBqGVAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9h2Qtajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10Lls8N40eytxqQlpl6
 u0zORcnfwGq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLolgeu1g3P/ehVTqUmeouw85G27IAlZj+K0YYSFJIzVLSlTtlbCo
 SXC73TePhoDOeXO8xa0qiK9gvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:8k8DEK8jKLBpgg4WpMJuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcLK7WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3A36D4jGrCn4FtIEfH9PXo0BXmUdoHaHfXzHHgGVL?=
 =?us-ascii?q?7Mk12WZaEbnWB6Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:1lSycwYZEszpJOBTp2XrwzVyJOBU6L2jMRE3vaRe69iAKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,192,1770595200"; 
   d="scan'208";a="721968687"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Apr 2026 02:59:40 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 8781718000200
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:59:40 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id E9D74CC12B5; Tue, 21 Apr 2026 19:59:39 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] libpng: fix CVE-2026-33636
Date: Tue, 21 Apr 2026 19:57:52 -0700
Message-ID: <20260422025751.2868856-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235689

From: Sudhir Dumbhare <sudumbha@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://github.com/pnggroup/libpng/commit/aba9f18eba870d14fb52c5ba5d73451349e339c3
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33636

Reference:
https://security-tracker.debian.org/tracker/CVE-2026-33636
https://www.suse.com/security/cve/CVE-2026-33636.html

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../libpng/files/CVE-2026-33636.patch         | 99 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
new file mode 100644
index 0000000000..3bd6aae2a4
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33636.patch
@@ -0,0 +1,99 @@
+From 9ff847dfcbb54f6dee3fd4e408150ae944278391 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Sat, 21 Mar 2026 23:48:49 +0200
+Subject: [PATCH] fix(arm): Resolve out-of-bounds read/write in NEON palette
+ expansion
+
+Both `png_do_expand_palette_rgba8_neon` and
+`png_do_expand_palette_rgb8_neon` advanced in fixed-size chunks without
+guarding the final iteration, allowing out-of-bounds reads and writes
+when the row width is not a multiple of the chunk size.
+
+Restrict the NEON loop to full chunks only, remove the now-unnecessary
+post-loop adjustment, and undo the `*ddp` pre-adjustment before the
+pointer handoff to the scalar fallback.
+
+CVE: CVE-2026-33636
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/aba9f18eba870d14fb52c5ba5d73451349e339c3]
+
+Reported-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
+Co-authored-by: Amemoyoi <Amemoyoi@users.noreply.github.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+(cherry picked from commit aba9f18eba870d14fb52c5ba5d73451349e339c3)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ arm/palette_neon_intrinsics.c | 29 +++++++++++++----------------
+ 1 file changed, 13 insertions(+), 16 deletions(-)
+
+diff --git a/arm/palette_neon_intrinsics.c b/arm/palette_neon_intrinsics.c
+index 92c7d6f9f..bdd15849d 100644
+--- a/arm/palette_neon_intrinsics.c
++++ b/arm/palette_neon_intrinsics.c
+@@ -1,7 +1,7 @@
+ 
+ /* palette_neon_intrinsics.c - NEON optimised palette expansion functions
+  *
+- * Copyright (c) 2018-2019 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 2017-2018 Arm Holdings. All rights reserved.
+  * Written by Richard Townsend <Richard.Townsend@arm.com>, February 2017.
+  *
+@@ -80,7 +80,7 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
+     */
+    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_uint_32)) - 1);
+ 
+-   for (i = 0; i < row_width; i += pixels_per_chunk)
++   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
+    {
+       uint32x4_t cur;
+       png_bytep sp = *ssp - i, dp = *ddp - (i << 2);
+@@ -90,13 +90,12 @@ png_do_expand_palette_rgba8_neon(png_structrp png_ptr, png_row_infop row_info,
+       cur = vld1q_lane_u32(riffled_palette + *(sp - 0), cur, 3);
+       vst1q_u32((void *)dp, cur);
+    }
+-   if (i != row_width)
+-   {
+-      /* Remove the amount that wasn't processed. */
+-      i -= pixels_per_chunk;
+-   }
+ 
+-   /* Decrement output pointers. */
++   /* Undo the pre-adjustment of *ddp before the pointer handoff,
++    * so the scalar fallback in pngrtran.c receives a dp that points
++    * to the correct position.
++    */
++   *ddp = *ddp + (pixels_per_chunk * 4 - 1);
+    *ssp = *ssp - i;
+    *ddp = *ddp - (i << 2);
+    return i;
+@@ -121,7 +120,7 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
+    /* Seeking this back by 8 pixels x 3 bytes. */
+    *ddp = *ddp - ((pixels_per_chunk * sizeof(png_color)) - 1);
+ 
+-   for (i = 0; i < row_width; i += pixels_per_chunk)
++   for (i = 0; i + pixels_per_chunk <= row_width; i += pixels_per_chunk)
+    {
+       uint8x8x3_t cur;
+       png_bytep sp = *ssp - i, dp = *ddp - ((i << 1) + i);
+@@ -136,13 +135,11 @@ png_do_expand_palette_rgb8_neon(png_structrp png_ptr, png_row_infop row_info,
+       vst3_u8((void *)dp, cur);
+    }
+ 
+-   if (i != row_width)
+-   {
+-      /* Remove the amount that wasn't processed. */
+-      i -= pixels_per_chunk;
+-   }
+-
+-   /* Decrement output pointers. */
++   /* Undo the pre-adjustment of *ddp before the pointer handoff,
++    * so the scalar fallback in pngrtran.c receives a dp that points
++    * to the correct position.
++    */
++   *ddp = *ddp + (pixels_per_chunk * 3 - 1);
+    *ssp = *ssp - i;
+    *ddp = *ddp - ((i << 1) + i);
+    return i;
+-- 
+2.44.4
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 7471315fdd..923ed79896 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
            file://CVE-2026-25646.patch \
+           file://CVE-2026-33636.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
-- 
2.44.4


