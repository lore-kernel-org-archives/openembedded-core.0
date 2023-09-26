Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE68E7D252
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:22:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.14088.1695716543014385960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Pd1hYDFa;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695716544; x=1727252544;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TaJN4+l+jR2nybsXNWvG+R+89fbei9/ITeOK5f/TsKw=;
  b=Pd1hYDFa+GnIi9Ld4AfFyLlw/WG8mjsRG4guuEviLe9p60TQijzsMeA1
   b5u/sxdTOowVw16m9eXZJuqCVN+0nzxTKwkg3p8Mn0Rs6hFbjmMNwZCx5
   XH9XqqnoiFeYs2sUZlsMRa17l4I9oqgUnDi8gdjGgCEq+ef9JyEJVXq33
   gvEYBpT8Vmn+ovFyP9ESKHjubsnCoii/xbxW1vV1uNKrAAbYfnHXZTdjL
   Iym03O6/jq1i1kGEmAZb3E3tpU4R/iTOWaNBqTedTBQ23zCoPO6sazsWa
   qMZgF7rm5BmNnhu8TabpXKmPNRMHaBGEP/8vewyFbzBXZKmWX2Se4xtmy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467799840"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="467799840"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 01:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725361708"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="725361708"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:22:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH 3/3] ffmpeg: 5.1.2 -> 5.1.3
Date: Tue, 26 Sep 2023 16:02:43 +0800
Message-Id: <20230926080243.2169021-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230926080243.2169021-1-chee.yang.lee@intel.com>
References: <20230926080243.2169021-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188223

From: Lee Chee Yang <chee.yang.lee@intel.com>

drop patch which is already part of 5.1.3.

0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch(CVE-2022-3964):
https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1eb002596e3761d88de4aeea3158692b82fb6307

0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch(CVE-2022-3965):
https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/293dc39bcaa99f213c6b7a703e11f146abf5d3be

ffmpeg-fix-vulkan.patch :  https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/7268323193d55365f914de39fadd5dbdb1f68976

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 ---------------
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 ------------------
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ------
 .../{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb}      |   5 +-
 4 files changed, 1 insertion(+), 235 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb => ffmpeg_5.1.3.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
deleted file mode 100644
index 2775a81cc8..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Sat, 12 Nov 2022 16:12:00 +0100
-Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
-
-Signed-off-by: <narpat.mali@windriver.com>
-
----
- libavcodec/rpzaenc.c | 22 +++++++++++++++-------
- 1 file changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
-index d710eb4f82..4ced9523e2 100644
---- a/libavcodec/rpzaenc.c
-+++ b/libavcodec/rpzaenc.c
-@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *bi, const uint16_t *block_pt
- 
-     // loop thru and compare pixels
-     for (y = 0; y < bi->block_height; y++) {
--        for (x = 0; x < bi->block_width; x++){
-+        for (x = 0; x < bi->block_width; x++) {
-             // TODO:  optimize
-             min_r = FFMIN(R(block_ptr[x]), min_r);
-             min_g = FFMIN(G(block_ptr[x]), min_g);
-@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, const BlockInfo *bi,
-         return -1;
- 
-     for (i = 0; i < bi->block_height; i++) {
--        for (j = 0; j < bi->block_width; j++){
-+        for (j = 0; j < bi->block_width; j++) {
-             x = GET_CHAN(block_ptr[j], xchannel);
-             y = GET_CHAN(block_ptr[j], ychannel);
-             sumx += x;
-@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *block_ptr, const BlockInfo *bi
-     int max_err = 0;
- 
-     for (i = 0; i < bi->block_height; i++) {
--        for (j = 0; j < bi->block_width; j++){
-+        for (j = 0; j < bi->block_width; j++) {
-             int x_inc, lin_y, lin_x;
-             x = GET_CHAN(block_ptr[j], xchannel);
-             y = GET_CHAN(block_ptr[j], ychannel);
-@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_t *src_pixels,
-                                        uint16_t *dest_pixels,
-                                        const BlockInfo *bi, int block_counter)
- {
--    for (int y = 0; y < 4; y++) {
-+    const int y_size = FFMIN(4, bi->image_height - bi->row * 4);
-+
-+    for (int y = 0; y < y_size; y++) {
-         memcpy(dest_pixels, src_pixels, 8);
-         dest_pixels += bi->rowstride;
-         src_pixels += bi->rowstride;
-@@ -730,14 +732,15 @@ post_skip :
- 
-             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK
-                 uint16_t *row_ptr;
--                int rgb555;
-+                int y_size, rgb555;
- 
-                 block_offset = get_block_info(&bi, block_counter);
- 
-                 row_ptr = &src_pixels[block_offset];
-+                y_size = FFMIN(4, bi.image_height - bi.row * 4);
- 
--                for (int y = 0; y < 4; y++) {
--                    for (int x = 0; x < 4; x++){
-+                for (int y = 0; y < y_size; y++) {
-+                    for (int x = 0; x < 4; x++) {
-                         rgb555 = row_ptr[x] & ~0x8000;
- 
-                         put_bits(&s->pb, 16, rgb555);
-@@ -745,6 +748,11 @@ post_skip :
-                     row_ptr += bi.rowstride;
-                 }
- 
-+                for (int y = y_size; y < 4; y++) {
-+                    for (int x = 0; x < 4; x++)
-+                        put_bits(&s->pb, 16, 0);
-+                }
-+
-                 block_counter++;
-             } else { // FOUR COLOR BLOCK
-                 block_counter += encode_four_color_block(min_color, max_color,
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
deleted file mode 100644
index 923fc6a9c1..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Sat, 12 Nov 2022 15:19:21 +0100
-Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
-
-Signed-off-by: <narpat.mali@windriver.com>
-
----
- libavcodec/smcenc.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
-index f3d26a4e8d..33549b8ab4 100644
---- a/libavcodec/smcenc.c
-+++ b/libavcodec/smcenc.c
-@@ -61,6 +61,7 @@ typedef struct SMCContext {
-         { \
-             row_ptr += stride * 4; \
-             pixel_ptr = row_ptr; \
-+            cur_y += 4; \
-         } \
-     } \
- }
-@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-     const uint8_t *prev_pixels = (const uint8_t *)s->prev_frame->data[0];
-     uint8_t *distinct_values = s->distinct_values;
-     const uint8_t *pixel_ptr, *row_ptr;
-+    const int height = frame->height;
-     const int width = frame->width;
-     uint8_t block_values[16];
-     int block_counter = 0;
-@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-     int color_octet_index = 0;
-     int color_table_index;  /* indexes to color pair, quad, or octet tables */
-     int total_blocks;
-+    int cur_y = 0;
- 
-     memset(s->color_pairs, 0, sizeof(s->color_pairs));
-     memset(s->color_quads, 0, sizeof(s->color_quads));
-     memset(s->color_octets, 0, sizeof(s->color_octets));
- 
-     /* Number of 4x4 blocks in frame. */
--    total_blocks = ((frame->width + 3) / 4) * ((frame->height + 3) / 4);
-+    total_blocks = ((width + 3) / 4) * ((height + 3) / 4);
- 
-     pixel_ptr = row_ptr = src_pixels;
- 
-@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-         int cache_index;
-         int distinct = 0;
-         int blocks = 0;
-+        int frame_y = cur_y;
- 
-         while (prev_pixels && s->key_frame == 0 && block_counter + inter_skip_blocks < total_blocks) {
-+            const int y_size = FFMIN(4, height - cur_y);
-             int compare = 0;
- 
--            for (int y = 0; y < 4; y++) {
-+            for (int y = 0; y < y_size; y++) {
-                 const ptrdiff_t offset = pixel_ptr - src_pixels;
-                 const uint8_t *prev_pixel_ptr = prev_pixels + offset;
- 
-@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         while (block_counter > 0 && block_counter + intra_skip_blocks < total_blocks) {
-+            const int y_size = FFMIN(4, height - cur_y);
-             const ptrdiff_t offset = pixel_ptr - src_pixels;
-             const int sy = offset / stride;
-             const int sx = offset % stride;
-@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
-             const uint8_t *old_pixel_ptr = src_pixels + nx + ny * stride;
-             int compare = 0;
- 
--            for (int y = 0; y < 4; y++) {
-+            for (int y = 0; y < y_size; y++) {
-                 compare |= memcmp(old_pixel_ptr + y * stride, pixel_ptr + y * stride, 4);
-                 if (compare)
-                     break;
-@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         while (block_counter + coded_blocks < total_blocks && coded_blocks < 256) {
--            for (int y = 0; y < 4; y++)
-+            const int y_size = FFMIN(4, height - cur_y);
-+            for (int y = 0; y < y_size; y++)
-                 memcpy(block_values + y * 4, pixel_ptr + y * stride, 4);
- 
-             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_values);
-@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const AVFrame *frame,
- 
-         pixel_ptr = xpixel_ptr;
-         row_ptr = xrow_ptr;
-+        cur_y = frame_y;
- 
-         blocks = coded_blocks;
-         distinct = coded_distinct;
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
deleted file mode 100644
index 95bd608a27..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Lynne <dev@lynne.ee>
-Date: Sun, 25 Dec 2022 00:03:30 +0000 (+0100)
-Subject: hwcontext_vulkan: remove optional encode/decode extensions from the list
-X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690
-
-hwcontext_vulkan: remove optional encode/decode extensions from the list
-
-They're not currently used, so they don't need to be there.
-Vulkan stabilized the decode extensions less than a week ago, and their
-name prefixes were changed from EXT to KHR. It's a bit too soon to be
-depending on it, so rather than bumping, just remove these for now.
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690]
----
-
-diff --git a/libavutil/hwcontext_vulkan.c b/libavutil/hwcontext_vulkan.c
-index f1db1c7291..2a9b5f4aac 100644
---- a/libavutil/hwcontext_vulkan.c
-+++ b/libavutil/hwcontext_vulkan.c
-@@ -358,14 +358,6 @@ static const VulkanOptExtension optional_device_exts[] = {
-     { VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME,            FF_VK_EXT_EXTERNAL_WIN32_MEMORY  },
-     { VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,         FF_VK_EXT_EXTERNAL_WIN32_SEM     },
- #endif
--
--    /* Video encoding/decoding */
--    { VK_KHR_VIDEO_QUEUE_EXTENSION_NAME,                      FF_VK_EXT_NO_FLAG                },
--    { VK_KHR_VIDEO_DECODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
--    { VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
--    { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
- };
- 
- /* Converts return values to strings */
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
index aa5a8681cf..9899e570ad 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
@@ -23,12 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           file://ffmpeg-fix-vulkan.patch \
            "
 
-SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
+SRC_URI[sha256sum] = "1b113593ff907293be7aed95acdda5e785dd73616d7d4ec90a0f6adbc5a0312e"
 
 # CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
 # and not ffmepg itself.
-- 
2.37.3


