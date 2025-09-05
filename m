Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F0BCA101C
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 05:41:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14514.1757050862290575661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 22:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PF7Q5IWl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1343f3b5a0=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5852SJrS010934
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Sep 2025 22:41:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TbxH61SzJq2pOufd+atz3pBZFtrPlzC503fKdVZoc5Y=; b=PF7Q5IWl2oe8
	DaB9KwiLBy1ZUGmPH1MJnzchu66uOdv80plx5UMK7qLAw/swK9bn8UWhuEKfKj/Y
	L3/VBeBAvEmT0Fyn591NDb9FobC5R67+H3z5+U0AgLsZSbWwzQGgu1m0RR28ovMc
	rXcZ6sYFpstH9lIaIeMbg/CKtjyOhwnK0+u/ib+Bwf772HRW0pIIC3QJzI/5EVTi
	Yl0cqnS2AM3ENVBW1Y3acwLvw5U9llG4k4tE+nvWVeH/IR9Q9M8AuGJ8P8E5f/Sn
	k+EsYHNZaJv6yuvqm95m6FazntGTjXX/c9/FPpom3wl9mOQPBTyVTQuYE8U0me5k
	iZJsV/IDAw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb1cr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 22:41:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 4 Sep 2025 22:40:57 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 4 Sep 2025 22:40:56 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/3] ffmpeg: fix multiple CVEs
Date: Fri, 5 Sep 2025 11:10:44 +0530
Message-ID: <20250905054045.1220093-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250905054045.1220093-1-archana.polampalli@windriver.com>
References: <20250905054045.1220093-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA1MyBTYWx0ZWRfX4qwkVWgEd+nz
 6bWWbN1rCzbA/qt/+1CxCA9YfTXF1GbDmYlEohQBN8y90l398T3oB3bJAvLz/rUXrYKXhT9PXaR
 CqL8vHRQFDxpBlvtPNqYbIoToSm9KsC4Uvt9JLvw7xOA0B+owPYa9y4+/OAYihFmdoQ+GE1rsyN
 zETRCgA+XPwmRIuE9KebIkAy/7wzqY3XCpaAT94eFOFumux1AyxOC/fHnrhVuIgnOppT1PDzQiI
 GOPyVMK62NhpJMitoz8/kjclNLzsBXSsBA0/DgiE2fnUU4dP3VWnX11v0y96iFc9s0pBCDEDTRL
 wmkLECJzu02EC1jgWUxKxJKY0XYtBworNMY0CDQFZhA39JI3wR+PjWq6x7fGYc=
X-Proofpoint-GUID: oRkPW9UB-DmSdY-HihHKsl6aNck8wFfy
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68ba77ed cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8
 a=G6bJ-gVI8A6Ol63X_0AA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oRkPW9UB-DmSdY-HihHKsl6aNck8wFfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 05:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222971

From: Archana Polampalli <archana.polampalli@windriver.com>

CVE-2023-6605:
A flaw was found in FFmpeg's DASH playlist support. This vulnerability allows arbitrary HTTP GET
requests to be made on behalf of the machine running FFmpeg via a crafted DASH playlist containing malicious URLs.

CVE-2023-6604:
A flaw was found in FFmpeg. This vulnerability allows unexpected additional CPU load
and storage consumption, potentially leading to degraded performance or denial of service
via the demuxing of arbitrary data as XBIN-formatted data without proper format validation.

CVE-2023-6602:
flaw was found in FFmpeg's TTY Demuxer. This vulnerability allows possible data exfiltration
via improper parsing of non-TTY-compliant input files in HLS playlists.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...602-CVE-2023-6604-CVE-2023-6605-0001.patch |  79 ++++++++++
 ...602-CVE-2023-6604-CVE-2023-6605-0002.patch | 142 ++++++++++++++++++
 ...602-CVE-2023-6604-CVE-2023-6605-0003.patch |  45 ++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   3 +
 4 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
new file mode 100644
index 0000000000..2b28eeada5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
@@ -0,0 +1,79 @@
+From 3ef588940eef62742d28171bf212a474206f8e03 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 15 May 2023 00:54:50 +0200
+Subject: [PATCH] avformat: add ff_match_url_ext()
+
+Match url against a list of extensions similar to av_match_ext()
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit a7b06bfc5d20b12ff0122702c09517cf359fbb66)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6604 CVE-2023-6602 CVE-2023-6605
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3ef588940ee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/format.c   | 25 +++++++++++++++++++++++++
+ libavformat/internal.h |  9 +++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/libavformat/format.c b/libavformat/format.c
+index 52b85c1..5e057d7 100644
+--- a/libavformat/format.c
++++ b/libavformat/format.c
+@@ -48,6 +48,31 @@ int av_match_ext(const char *filename, const char *extensions)
+     return 0;
+ }
+
++int ff_match_url_ext(const char *url, const char *extensions)
++{
++    const char *ext;
++    URLComponents uc;
++    int ret;
++    char scratchpad[128];
++
++    if (!url)
++        return 0;
++
++    ret = ff_url_decompose(&uc, url, NULL);
++    if (ret < 0 || !URL_COMPONENT_HAVE(uc, scheme))
++        return ret;
++    for (ext = uc.query; *ext != '.' && ext > uc.path; ext--)
++        ;
++
++    if (*ext != '.')
++        return 0;
++    if (uc.query - ext > sizeof(scratchpad))
++        return AVERROR(ENOMEM); //not enough memory in our scratchpad
++    av_strlcpy(scratchpad, ext + 1, FFMIN(sizeof(scratchpad), uc.query - ext));
++
++    return av_match_name(scratchpad, extensions);
++}
++
+ const AVOutputFormat *av_guess_format(const char *short_name, const char *filename,
+                                       const char *mime_type)
+ {
+diff --git a/libavformat/internal.h b/libavformat/internal.h
+index bffb8e6..584b979 100644
+--- a/libavformat/internal.h
++++ b/libavformat/internal.h
+@@ -1015,6 +1015,15 @@ int ff_unlock_avformat(void);
+  */
+ void ff_format_set_url(AVFormatContext *s, char *url);
+
++/**
++ * Return a positive value if the given url has one of the given
++ * extensions, negative AVERROR on error, 0 otherwise.
++ *
++ * @param url        url to check against the given extensions
++ * @param extensions a comma-separated list of filename extensions
++ */
++int ff_match_url_ext(const char *url, const char *extensions);
++
+ void avpriv_register_devices(const AVOutputFormat * const o[], const AVInputFormat * const i[]);
+
+ /**
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
new file mode 100644
index 0000000000..1ba1006197
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
@@ -0,0 +1,142 @@
+From 9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 16 Jan 2025 01:28:46 +0100
+Subject: [PATCH] avformat/hls: Be more picky on extensions
+
+This blocks disallowed extensions from probing
+It also requires all available segments to have matching extensions to the format
+mpegts is treated independent of the extension
+
+It is recommended to set the whitelists correctly
+instead of depending on extensions, but this should help a bit,
+and this is easier to backport
+
+Fixes: CVE-2023-6602 II. HLS Force TTY Demuxer
+Fixes: CVE-2023-6602 IV. HLS XBIN Demuxer DoS Amplification
+
+The other parts of CVE-2023-6602 have been fixed by prior commits
+
+Found-by: Harvey Phillips of Amazon Element55 (element55)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 91d96dc8ddaebe0b6cb393f672085e6bfaf15a31)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ doc/demuxers.texi |  7 +++++++
+ libavformat/hls.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 57 insertions(+)
+
+diff --git a/doc/demuxers.texi b/doc/demuxers.texi
+index 26ae768..6e0b25e 100644
+--- a/doc/demuxers.texi
++++ b/doc/demuxers.texi
+@@ -365,6 +365,13 @@ segment index to start live streams at (negative values are from the end).
+ @item allowed_extensions
+ ',' separated list of file extensions that hls is allowed to access.
+
++@item extension_picky
++This blocks disallowed extensions from probing
++It also requires all available segments to have matching extensions to the format
++except mpegts, which is always allowed.
++It is recommended to set the whitelists correctly instead of depending on extensions
++Enabled by default.
++
+ @item max_reload
+ Maximum number of times a insufficient list is attempted to be reloaded.
+ Default value is 1000.
+diff --git a/libavformat/hls.c b/libavformat/hls.c
+index d5e9b21..e1bb677 100644
+--- a/libavformat/hls.c
++++ b/libavformat/hls.c
+@@ -214,6 +214,7 @@ typedef struct HLSContext {
+     AVDictionary *avio_opts;
+     AVDictionary *seg_format_opts;
+     char *allowed_extensions;
++    int extension_picky;
+     int max_reload;
+     int http_persistent;
+     int http_multiple;
+@@ -716,6 +717,40 @@ static int open_url(AVFormatContext *s, AVIOContext **pb, const char *url,
+     return ret;
+ }
+
++static int test_segment(AVFormatContext *s, const AVInputFormat *in_fmt, struct playlist *pls, struct segment *seg)
++{
++    HLSContext *c = s->priv_data;
++    int matchA = 3;
++    int matchF = 0;
++
++    if (!c->extension_picky)
++        return 0;
++
++    if (strcmp(c->allowed_extensions, "ALL"))
++        matchA =      av_match_ext    (seg->url, c->allowed_extensions)
++                 + 2*(ff_match_url_ext(seg->url, c->allowed_extensions) > 0);
++
++    if (!matchA) {
++        av_log(s, AV_LOG_ERROR, "URL %s is not in allowed_extensions\n", seg->url);
++        return AVERROR_INVALIDDATA;
++    }
++
++    if (in_fmt) {
++        if (in_fmt->extensions) {
++            matchF =      av_match_ext(    seg->url, in_fmt->extensions)
++                     + 2*(ff_match_url_ext(seg->url, in_fmt->extensions) > 0);
++        } else if (!strcmp(in_fmt->name, "mpegts"))
++            matchF = 3;
++
++        if (!(matchA & matchF)) {
++            av_log(s, AV_LOG_ERROR, "detected format extension %s mismatches allowed extensions in url %s\n", in_fmt->extensions ? in_fmt->extensions : "none", seg->url);
++            return AVERROR_INVALIDDATA;
++        }
++    }
++
++    return 0;
++}
++
+ static int parse_playlist(HLSContext *c, const char *url,
+                           struct playlist *pls, AVIOContext *in)
+ {
+@@ -959,6 +994,14 @@ static int parse_playlist(HLSContext *c, const char *url,
+                     goto fail;
+                 }
+
++                ret = test_segment(c->ctx, pls->ctx ? pls->ctx->iformat : NULL, pls, seg);
++                if (ret < 0) {
++                    av_free(seg->url);
++                    av_free(seg->key);
++                    av_free(seg);
++                    goto fail;
++                }
++
+                 if (duration < 0.001 * AV_TIME_BASE) {
+                     av_log(c->ctx, AV_LOG_WARNING, "Cannot get correct #EXTINF value of segment %s,"
+                                     " set to default value to 1ms.\n", seg->url);
+@@ -2040,6 +2083,11 @@ static int hls_read_header(AVFormatContext *s)
+             pls->ctx->interrupt_callback = s->interrupt_callback;
+             url = av_strdup(pls->segments[0]->url);
+             ret = av_probe_input_buffer(&pls->pb.pub, &in_fmt, url, NULL, 0, 0);
++
++            for (int n = 0; n < pls->n_segments; n++)
++                if (ret >= 0)
++                    ret = test_segment(s, in_fmt, pls, pls->segments[n]);
++
+             if (ret < 0) {
+                 /* Free the ctx - it isn't initialized properly at this point,
+                 * so avformat_close_input shouldn't be called. If
+@@ -2467,6 +2515,8 @@ static const AVOption hls_options[] = {
+         OFFSET(allowed_extensions), AV_OPT_TYPE_STRING,
+         {.str = "3gp,aac,avi,ac3,eac3,flac,mkv,m3u8,m4a,m4s,m4v,mpg,mov,mp2,mp3,mp4,mpeg,mpegts,ogg,ogv,oga,ts,vob,wav"},
+         INT_MIN, INT_MAX, FLAGS},
++    {"extension_picky", "Be picky with all extensions matching",
++        OFFSET(extension_picky), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, FLAGS},
+     {"max_reload", "Maximum number of times a insufficient list is attempted to be reloaded",
+         OFFSET(max_reload), AV_OPT_TYPE_INT, {.i64 = 1000}, 0, INT_MAX, FLAGS},
+     {"m3u8_hold_counters", "The maximum number of times to load m3u8 when it refreshes without new segments",
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch
new file mode 100644
index 0000000000..0a2488814f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch
@@ -0,0 +1,45 @@
+From 800f5f818e858c864db86c174114d13f44d59044 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 16 Jan 2025 00:22:05 +0100
+Subject: [PATCH] avformat/dashdec: Check whitelist
+
+Fixes: CVE-2023-6602, V. DASH Playlist SSRF
+
+Found-by: Harvey Phillips of Amazon Element55 (element55)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 4c96d6bf75357ab13808efc9f08c1b41b1bf5bdf)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6604
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/097131a6474bd6294ff337fa92025df60dff907a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/dashdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/dashdec.c b/libavformat/dashdec.c
+index 797fe74..78118de 100644
+--- a/libavformat/dashdec.c
++++ b/libavformat/dashdec.c
+@@ -442,7 +442,7 @@ static int open_url(AVFormatContext *s, AVIOContext **pb, const char *url,
+     av_freep(pb);
+     av_dict_copy(&tmp, *opts, 0);
+     av_dict_copy(&tmp, opts2, 0);
+-    ret = avio_open2(pb, url, AVIO_FLAG_READ, c->interrupt_callback, &tmp);
++    ret = ffio_open_whitelist(pb, url, AVIO_FLAG_READ, c->interrupt_callback, &tmp, s->protocol_whitelist, s->protocol_blacklist);
+     if (ret >= 0) {
+         // update cookies on http response with setcookies.
+         char *new_cookies = NULL;
+@@ -1217,7 +1217,7 @@ static int parse_manifest(AVFormatContext *s, const char *url, AVIOContext *in)
+         close_in = 1;
+
+         av_dict_copy(&opts, c->avio_opts, 0);
+-        ret = avio_open2(&in, url, AVIO_FLAG_READ, c->interrupt_callback, &opts);
++        ret = ffio_open_whitelist(&in, url, AVIO_FLAG_READ, c->interrupt_callback, &opts, s->protocol_whitelist, s->protocol_blacklist);
+         av_dict_free(&opts);
+         if (ret < 0)
+             return ret;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index f205c4a5db..27a9a80e8c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -49,6 +49,9 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-22919.patch \
            file://CVE-2025-22921.patch \
            file://CVE-2025-7700.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.40.0


