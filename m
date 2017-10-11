Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B1A5071AD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945779"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:11 +0300
Message-Id: <f2954391be2794c8126fbba8e0d75bf9a69077b2.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/50] ffmpeg: upgrade to 3.3.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 15:38:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade ffmpeg to version 3.3.4. Version 3.3.4 is a bug fix version, and
there's no new feature added.

Compared to version 3.3.3, there are 57 new commits. These 57 commits are
either bug fix or small tweaks.

Drop CVE patches that were backported from 3.3.4.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ffmpeg/ffmpeg/CVE-2017-14054.patch             | 39 ---------
 .../ffmpeg/ffmpeg/CVE-2017-14055.patch             | 34 --------
 .../ffmpeg/ffmpeg/CVE-2017-14056.patch             | 51 ------------
 .../ffmpeg/ffmpeg/CVE-2017-14057.patch             | 44 ----------
 .../ffmpeg/ffmpeg/CVE-2017-14058.patch             | 94 ----------------------
 .../ffmpeg/ffmpeg/CVE-2017-14059.patch             | 40 ---------
 .../ffmpeg/ffmpeg/CVE-2017-14169.patch             | 39 ---------
 .../ffmpeg/ffmpeg/CVE-2017-14170.patch             | 49 -----------
 .../ffmpeg/ffmpeg/CVE-2017-14171.patch             | 44 ----------
 .../ffmpeg/ffmpeg/CVE-2017-14222.patch             | 40 ---------
 .../ffmpeg/ffmpeg/CVE-2017-14223.patch             | 38 ---------
 .../ffmpeg/ffmpeg/CVE-2017-14225.patch             | 49 -----------
 .../ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb}    | 16 +---
 13 files changed, 2 insertions(+), 575 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} (91%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch
deleted file mode 100644
index e8baa188a3d..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 124eb202e70678539544f6268efc98131f19fa49 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=20and=20=E5=BC=A0=E6=B4=AA=E4=BA=AE=28?=
- =?UTF-8?q?=E6=9C=9B=E5=88=9D=29?= <tony.sh and wangchu.zhl@alibaba-inc.com>
-Date: Fri, 25 Aug 2017 01:15:28 +0200
-Subject: [PATCH] avformat/rmdec: Fix DoS due to lack of eof check
-
-Fixes: loop.ivr
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14054
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/rmdec.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libavformat/rmdec.c b/libavformat/rmdec.c
-index 178eaea..d6d7d9c 100644
---- a/libavformat/rmdec.c
-+++ b/libavformat/rmdec.c
-@@ -1223,8 +1223,11 @@ static int ivr_read_header(AVFormatContext *s)
-             av_log(s, AV_LOG_DEBUG, "%s = '%s'\n", key, val);
-         } else if (type == 4) {
-             av_log(s, AV_LOG_DEBUG, "%s = '0x", key);
--            for (j = 0; j < len; j++)
-+            for (j = 0; j < len; j++) {
-+                if (avio_feof(pb))
-+                    return AVERROR_INVALIDDATA;
-                 av_log(s, AV_LOG_DEBUG, "%X", avio_r8(pb));
-+            }
-             av_log(s, AV_LOG_DEBUG, "'\n");
-         } else if (len == 4 && type == 3 && !strncmp(key, "StreamCount", tlen)) {
-             nb_streams = value = avio_rb32(pb);
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch
deleted file mode 100644
index 37d0d1ab7fd..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4f05e2e2dc1a89f38cd9f0960a6561083d714f1e Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Fri, 25 Aug 2017 01:15:30 +0200
-Subject: [PATCH] avformat/mvdec: Fix DoS due to lack of eof check
-
-Fixes: loop.mv
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14055
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/mvdec.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libavformat/mvdec.c b/libavformat/mvdec.c
-index 0e12c8c..f7aa4cb 100644
---- a/libavformat/mvdec.c
-+++ b/libavformat/mvdec.c
-@@ -342,6 +342,8 @@ static int mv_read_header(AVFormatContext *avctx)
-             uint32_t pos   = avio_rb32(pb);
-             uint32_t asize = avio_rb32(pb);
-             uint32_t vsize = avio_rb32(pb);
-+            if (avio_feof(pb))
-+                return AVERROR_INVALIDDATA;
-             avio_skip(pb, 8);
-             av_add_index_entry(ast, pos, timestamp, asize, 0, AVINDEX_KEYFRAME);
-             av_add_index_entry(vst, pos + asize, i, vsize, 0, AVINDEX_KEYFRAME);
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch
deleted file mode 100644
index 088b357b254..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 96f24d1bee7fe7bac08e2b7c74db1a046c9dc0de Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=20and=20=E5=BC=A0=E6=B4=AA=E4=BA=AE=28?=
- =?UTF-8?q?=E6=9C=9B=E5=88=9D=29?= <tony.sh and wangchu.zhl@alibaba-inc.com>
-Date: Fri, 25 Aug 2017 01:15:29 +0200
-Subject: [PATCH] avformat/rl2: Fix DoS due to lack of eof check
-
-Fixes: loop.rl2
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14056
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/rl2.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/libavformat/rl2.c b/libavformat/rl2.c
-index 0bec8f1..eb1682d 100644
---- a/libavformat/rl2.c
-+++ b/libavformat/rl2.c
-@@ -170,12 +170,21 @@ static av_cold int rl2_read_header(AVFormatContext *s)
-     }
- 
-     /** read offset and size tables */
--    for(i=0; i < frame_count;i++)
-+    for(i=0; i < frame_count;i++) {
-+        if (avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-         chunk_size[i] = avio_rl32(pb);
--    for(i=0; i < frame_count;i++)
-+    }
-+    for(i=0; i < frame_count;i++) {
-+        if (avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-         chunk_offset[i] = avio_rl32(pb);
--    for(i=0; i < frame_count;i++)
-+    }
-+    for(i=0; i < frame_count;i++) {
-+        if (avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-         audio_size[i] = avio_rl32(pb) & 0xFFFF;
-+    }
- 
-     /** build the sample index */
-     for(i=0;i<frame_count;i++){
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch
deleted file mode 100644
index b301d233b3c..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7f9ec5593e04827249e7aeb466da06a98a0d7329 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=20and=20=E5=BC=A0=E6=B4=AA=E4=BA=AE=28?=
- =?UTF-8?q?=E6=9C=9B=E5=88=9D=29?= <tony.sh and wangchu.zhl@alibaba-inc.com>
-Date: Fri, 25 Aug 2017 12:37:25 +0200
-Subject: [PATCH] avformat/asfdec: Fix DoS due to lack of eof check
-
-Fixes: loop.asf
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14057
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/asfdec_f.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libavformat/asfdec_f.c b/libavformat/asfdec_f.c
-index be09a92..f3acbae 100644
---- a/libavformat/asfdec_f.c
-+++ b/libavformat/asfdec_f.c
-@@ -749,13 +749,15 @@ static int asf_read_marker(AVFormatContext *s, int64_t size)
-     count = avio_rl32(pb);    // markers count
-     avio_rl16(pb);            // reserved 2 bytes
-     name_len = avio_rl16(pb); // name length
--    for (i = 0; i < name_len; i++)
--        avio_r8(pb); // skip the name
-+    avio_skip(pb, name_len);
- 
-     for (i = 0; i < count; i++) {
-         int64_t pres_time;
-         int name_len;
- 
-+        if (avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-+
-         avio_rl64(pb);             // offset, 8 bytes
-         pres_time = avio_rl64(pb); // presentation time
-         pres_time -= asf->hdr.preroll * 10000;
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch
deleted file mode 100644
index 95803cef557..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 7ec414892ddcad88313848494b6fc5f437c9ca4a Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Sat, 26 Aug 2017 01:26:58 +0200
-Subject: [PATCH] avformat/hls: Fix DoS due to infinite loop
-
-Fixes: loop.m3u
-
-The default max iteration count of 1000 is arbitrary and ideas for a better solution are welcome
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-
-Previous version reviewed-by: Steven Liu <lingjiujianke@gmail.com>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14058
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- doc/demuxers.texi | 18 ++++++++++++++++++
- libavformat/hls.c |  7 +++++++
- 2 files changed, 25 insertions(+)
-
-diff --git a/doc/demuxers.texi b/doc/demuxers.texi
-index 29a23d4..73dc0fe 100644
---- a/doc/demuxers.texi
-+++ b/doc/demuxers.texi
-@@ -300,6 +300,24 @@ used to end the output video at the length of the shortest input file,
- which in this case is @file{input.mp4} as the GIF in this example loops
- infinitely.
- 
-+@section hls
-+
-+HLS demuxer
-+
-+It accepts the following options:
-+
-+@table @option
-+@item live_start_index
-+segment index to start live streams at (negative values are from the end).
-+
-+@item allowed_extensions
-+',' separated list of file extensions that hls is allowed to access.
-+
-+@item max_reload
-+Maximum number of times a insufficient list is attempted to be reloaded.
-+Default value is 1000.
-+@end table
-+
- @section image2
- 
- Image file demuxer.
-diff --git a/libavformat/hls.c b/libavformat/hls.c
-index 01731bd..0995345 100644
---- a/libavformat/hls.c
-+++ b/libavformat/hls.c
-@@ -205,6 +205,7 @@ typedef struct HLSContext {
-     AVDictionary *avio_opts;
-     int strict_std_compliance;
-     char *allowed_extensions;
-+    int max_reload;
- } HLSContext;
- 
- static int read_chomp_line(AVIOContext *s, char *buf, int maxlen)
-@@ -1263,6 +1264,7 @@ static int read_data(void *opaque, uint8_t *buf, int buf_size)
-     HLSContext *c = v->parent->priv_data;
-     int ret, i;
-     int just_opened = 0;
-+    int reload_count = 0;
- 
- restart:
-     if (!v->needed)
-@@ -1294,6 +1296,9 @@ restart:
-         reload_interval = default_reload_interval(v);
- 
- reload:
-+        reload_count++;
-+        if (reload_count > c->max_reload)
-+            return AVERROR_EOF;
-         if (!v->finished &&
-             av_gettime_relative() - v->last_load_time >= reload_interval) {
-             if ((ret = parse_playlist(c, v->url, v, NULL)) < 0) {
-@@ -2150,6 +2155,8 @@ static const AVOption hls_options[] = {
-         OFFSET(allowed_extensions), AV_OPT_TYPE_STRING,
-         {.str = "3gp,aac,avi,flac,mkv,m3u8,m4a,m4s,m4v,mpg,mov,mp2,mp3,mp4,mpeg,mpegts,ogg,ogv,oga,ts,vob,wav"},
-         INT_MIN, INT_MAX, FLAGS},
-+    {"max_reload", "Maximum number of times a insufficient list is attempted to be reloaded",
-+        OFFSET(max_reload), AV_OPT_TYPE_INT, {.i64 = 1000}, 0, INT_MAX, FLAGS},
-     {NULL}
- };
- 
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch
deleted file mode 100644
index 34fde0be77c..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7e80b63ecd259d69d383623e75b318bf2bd491f6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=20and=20=E5=BC=A0=E6=B4=AA=E4=BA=AE=28?=
- =?UTF-8?q?=E6=9C=9B=E5=88=9D=29?= <tony.sh and wangchu.zhl@alibaba-inc.com>
-Date: Fri, 25 Aug 2017 01:15:27 +0200
-Subject: [PATCH] avformat/cinedec: Fix DoS due to lack of eof check
-
-Fixes: loop.cine
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14059
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/cinedec.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/libavformat/cinedec.c b/libavformat/cinedec.c
-index 763b93b..de34fb9 100644
---- a/libavformat/cinedec.c
-+++ b/libavformat/cinedec.c
-@@ -267,8 +267,12 @@ static int cine_read_header(AVFormatContext *avctx)
- 
-     /* parse image offsets */
-     avio_seek(pb, offImageOffsets, SEEK_SET);
--    for (i = 0; i < st->duration; i++)
-+    for (i = 0; i < st->duration; i++) {
-+        if (avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-+
-         av_add_index_entry(st, avio_rl64(pb), i, 0, 0, AVINDEX_KEYFRAME);
-+    }
- 
-     return 0;
- }
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch
deleted file mode 100644
index e1284faa93b..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9d00fb9d70ee8c0cc7002b89318c5be00f1bbdad Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=28=E6=99=93=E9=BB=91=29?=
- <tony.sh@alibaba-inc.com>
-Date: Tue, 29 Aug 2017 23:59:21 +0200
-Subject: [PATCH] avformat/mxfdec: Fix Sign error in mxf_read_primer_pack()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: 20170829B.mxf
-
-Co-Author: 张洪亮(望初)" <wangchu.zhl@alibaba-inc.com>
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14169
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/mxfdec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/mxfdec.c b/libavformat/mxfdec.c
-index 6adb77d..91731a7 100644
---- a/libavformat/mxfdec.c
-+++ b/libavformat/mxfdec.c
-@@ -500,7 +500,7 @@ static int mxf_read_primer_pack(void *arg, AVIOContext *pb, int tag, int size, U
-         avpriv_request_sample(pb, "Primer pack item length %d", item_len);
-         return AVERROR_PATCHWELCOME;
-     }
--    if (item_num > 65536) {
-+    if (item_num > 65536 || item_num < 0) {
-         av_log(mxf->fc, AV_LOG_ERROR, "item_num %d is too large\n", item_num);
-         return AVERROR_INVALIDDATA;
-     }
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch
deleted file mode 100644
index 88601250300..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 900f39692ca0337a98a7cf047e4e2611071810c2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=28=E6=99=93=E9=BB=91=29?=
- <tony.sh@alibaba-inc.com>
-Date: Tue, 29 Aug 2017 23:59:21 +0200
-Subject: [PATCH] avformat/mxfdec: Fix DoS issues in
- mxf_read_index_entry_array()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: 20170829A.mxf
-
-Co-Author: 张洪亮(望初)" <wangchu.zhl@alibaba-inc.com>
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14170
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/mxfdec.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libavformat/mxfdec.c b/libavformat/mxfdec.c
-index f8d0f9e..6adb77d 100644
---- a/libavformat/mxfdec.c
-+++ b/libavformat/mxfdec.c
-@@ -899,6 +899,8 @@ static int mxf_read_index_entry_array(AVIOContext *pb, MXFIndexTableSegment *seg
-     segment->nb_index_entries = avio_rb32(pb);
- 
-     length = avio_rb32(pb);
-+    if(segment->nb_index_entries && length < 11)
-+        return AVERROR_INVALIDDATA;
- 
-     if (!(segment->temporal_offset_entries=av_calloc(segment->nb_index_entries, sizeof(*segment->temporal_offset_entries))) ||
-         !(segment->flag_entries          = av_calloc(segment->nb_index_entries, sizeof(*segment->flag_entries))) ||
-@@ -909,6 +911,8 @@ static int mxf_read_index_entry_array(AVIOContext *pb, MXFIndexTableSegment *seg
-     }
- 
-     for (i = 0; i < segment->nb_index_entries; i++) {
-+        if(avio_feof(pb))
-+            return AVERROR_INVALIDDATA;
-         segment->temporal_offset_entries[i] = avio_r8(pb);
-         avio_r8(pb);                                        /* KeyFrameOffset */
-         segment->flag_entries[i] = avio_r8(pb);
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch
deleted file mode 100644
index e2ae2040cf7..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c24bcb553650b91e9eff15ef6e54ca73de2453b7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=E5=AD=99=E6=B5=A9=28=E6=99=93=E9=BB=91=29?=
- <tony.sh@alibaba-inc.com>
-Date: Tue, 29 Aug 2017 23:59:21 +0200
-Subject: [PATCH] avformat/nsvdec: Fix DoS due to lack of eof check in
- nsvs_file_offset loop.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: 20170829.nsv
-
-Co-Author: 张洪亮(望初)" <wangchu.zhl@alibaba-inc.com>
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14171
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/nsvdec.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libavformat/nsvdec.c b/libavformat/nsvdec.c
-index c6ddb67..d8ce656 100644
---- a/libavformat/nsvdec.c
-+++ b/libavformat/nsvdec.c
-@@ -335,8 +335,11 @@ static int nsv_parse_NSVf_header(AVFormatContext *s)
-         if (!nsv->nsvs_file_offset)
-             return AVERROR(ENOMEM);
- 
--        for(i=0;i<table_entries_used;i++)
-+        for(i=0;i<table_entries_used;i++) {
-+            if (avio_feof(pb))
-+                return AVERROR_INVALIDDATA;
-             nsv->nsvs_file_offset[i] = avio_rl32(pb) + size;
-+        }
- 
-         if(table_entries > table_entries_used &&
-            avio_rl32(pb) == MKTAG('T','O','C','2')) {
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch
deleted file mode 100644
index ee020379488..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9cb4eb772839c5e1de2855d126bf74ff16d13382 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 5 Sep 2017 00:16:29 +0200
-Subject: [PATCH] avformat/mov: Fix DoS in read_tfra()
-
-Fixes: Missing EOF check in loop
-No testcase
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14222
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/mov.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libavformat/mov.c b/libavformat/mov.c
-index 994e9c6..2519707 100644
---- a/libavformat/mov.c
-+++ b/libavformat/mov.c
-@@ -6094,6 +6094,13 @@ static int read_tfra(MOVContext *mov, AVIOContext *f)
-     }
-     for (i = 0; i < index->item_count; i++) {
-         int64_t time, offset;
-+
-+        if (avio_feof(f)) {
-+            index->item_count = 0;
-+            av_freep(&index->items);
-+            return AVERROR_INVALIDDATA;
-+        }
-+
-         if (version == 1) {
-             time   = avio_rb64(f);
-             offset = avio_rb64(f);
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch
deleted file mode 100644
index d1fef6b1445..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From afc9c683ed9db01edb357bc8c19edad4282b3a97 Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Tue, 5 Sep 2017 00:16:29 +0200
-Subject: [PATCH] avformat/asfdec: Fix DoS in asf_build_simple_index()
-
-Fixes: Missing EOF check in loop
-No testcase
-
-Found-by: Xiaohei and Wangchu from Alibaba Security Team
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14223
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libavformat/asfdec_f.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libavformat/asfdec_f.c b/libavformat/asfdec_f.c
-index f3acbae..cc648b9 100644
---- a/libavformat/asfdec_f.c
-+++ b/libavformat/asfdec_f.c
-@@ -1610,6 +1610,11 @@ static int asf_build_simple_index(AVFormatContext *s, int stream_index)
-             int64_t pos       = s->internal->data_offset + s->packet_size * (int64_t)pktnum;
-             int64_t index_pts = FFMAX(av_rescale(itime, i, 10000) - asf->hdr.preroll, 0);
- 
-+            if (avio_feof(s->pb)) {
-+                ret = AVERROR_INVALIDDATA;
-+                goto end;
-+            }
-+
-             if (pos != last_pos) {
-                 av_log(s, AV_LOG_DEBUG, "pktnum:%d, pktct:%d  pts: %"PRId64"\n",
-                        pktnum, pktct, index_pts);
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch
deleted file mode 100644
index ce6845eecf9..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Subject: [PATCH] ffprobe: Fix null pointer dereference with color primaries
-
-Found-by: AD-lab of venustech
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2017-14225
-Upstream-Status: Backport
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- ffprobe.c | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/ffprobe.c b/ffprobe.c
-index a219fc1..df22b30 100644
---- a/ffprobe.c
-+++ b/ffprobe.c
-@@ -1899,6 +1899,16 @@ static void print_pkt_side_data(WriterContext *w,
-     writer_print_section_footer(w);
- }
- 
-+static void print_primaries(WriterContext *w, enum AVColorPrimaries color_primaries)
-+{
-+    const char *val = av_color_primaries_name(color_primaries);
-+    if (!val || color_primaries == AVCOL_PRI_UNSPECIFIED) {
-+	print_str_opt("color_primaries", "unknown");
-+    } else {
-+	print_str("color_primaries", val);
-+    }
-+}
-+
- static void clear_log(int need_lock)
- {
-     int i;
-@@ -2420,10 +2430,7 @@ static int show_stream(WriterContext *w, AVFormatContext *fmt_ctx, int stream_id
-         else
-             print_str_opt("color_transfer", av_color_transfer_name(par->color_trc));
- 
--        if (par->color_primaries != AVCOL_PRI_UNSPECIFIED)
--            print_str("color_primaries", av_color_primaries_name(par->color_primaries));
--        else
--            print_str_opt("color_primaries", av_color_primaries_name(par->color_primaries));
-+        print_primaries(w, par->color_primaries);
- 
-         if (par->chroma_location != AVCHROMA_LOC_UNSPECIFIED)
-             print_str("chroma_location", av_chroma_location_name(par->chroma_location));
--- 
-2.1.0
-
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
similarity index 91%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
index c1ebecf9335..57e0ac04115 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
@@ -26,21 +26,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-build-fix-for-mips.patch \
-           file://CVE-2017-14054.patch \
-           file://CVE-2017-14055.patch \
-           file://CVE-2017-14056.patch \
-           file://CVE-2017-14057.patch \
-           file://CVE-2017-14058.patch \
-           file://CVE-2017-14059.patch \
-           file://CVE-2017-14169.patch \
-           file://CVE-2017-14170.patch \
-           file://CVE-2017-14171.patch \
-           file://CVE-2017-14222.patch \
-           file://CVE-2017-14223.patch \
-           file://CVE-2017-14225.patch \
           "
-SRC_URI[md5sum] = "743dc66ebe67180283b92d029f690d0f"
-SRC_URI[sha256sum] = "d2a9002cdc6b533b59728827186c044ad02ba64841f1b7cd6c21779875453a1e"
+SRC_URI[md5sum] = "e14a0200c78ce5c918427e57cd406a0d"
+SRC_URI[sha256sum] = "98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.14.1


