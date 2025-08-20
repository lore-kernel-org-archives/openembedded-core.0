Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7010CA0EFC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 06:58:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14092.1755673105174233824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 23:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YvpnWhO4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=032789f14d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K65wTJ3178423
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 23:58:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Oi5XaGWzuwaNB5GyPoDm
	declAznHCGvjdVDp8J7CpXY=; b=YvpnWhO4rwFgiHD3VMLZsHsGDKGm2FZg8yeW
	UzX56BZ14UT8Pe/I1cAigfpEk/UW4Mdj1/QdLWbxaLcyBu6sX2Mm1+bUaEYskMwz
	S5qwWfqW5uGQQSe0+Z5em4gux8Ok3DkTVlSYjVVSPhD0egi1hRNEK647+pwBDuxx
	p54YdDduyJ7HDPFetSpAIQb8lkeuBSh0AUMJMVFfwPFaksPUBUbdTPudwLAiYCmu
	ka4r2SgmvFkqNybT+QU4oRleICejpy0RiEV5v+zvkX5R2fH+RI3NbJMgXDLWGCTm
	Jb0+ZI95x1s/2X1JiH1GfCtM4WJyqafsd4ADpVbU4dmrlTrdtw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq8eub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 23:58:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 19 Aug 2025 23:58:15 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 19 Aug 2025 23:58:13 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/2] ffmpeg: upgrade 6.1.2 -> 6.1.3
Date: Wed, 20 Aug 2025 12:28:11 +0530
Message-ID: <20250820065812.1818560-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA1NyBTYWx0ZWRfX2GJuKr/1+P2S
 Y3Rsq5mrxHOy5LJqyCtgjEB84S8zdNmDcaeJwuqVOscAOEl64rK7EOXgX1jf9hkfGO18QgdR2Kc
 wuJfP1x4LB/nt23gX3RqLgH4kNQjYc9A0Owtju/52iPw090SQRGarzWrOGMxUR3K4bcELVMVBMi
 EC+D5rxdAiLppBNJKt582BJDRurGlLrsAh5wVnGY4mJ8+qCgFZeU+VacV3LGBKkCCykOzu1ohEt
 vCz0VdOs4BthnAf42AVvjuT0xmH8TF0fBhh9rn1SDA0ct+HLaBCAqk5naXupEqUcPDeYyhSqKag
 YSanznZpVkUsp4FlqhVM7Wk1xEU0t1AS8fOR79LoFyy7xQkUkyPN23vKTiofmQLAfDg1OBSxODv
 TTUl87pTIEfWH54F+/6s6frqGs3+eQ==
X-Proofpoint-GUID: qI6eLGekoA9cZGutyGbCMiRl_rHLMhxt
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a57210 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=PYnjg3YJAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=D_Rn6OYrAAAA:8 a=GvQkQWPkAAAA:8
 a=UqCG9HQmAAAA:8 a=-uYbXFN5AAAA:8 a=W0rQPOqy_D729X6dC50A:9
 a=Az6bMa3S-vkOzydl:21 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=18H_3BTqaHK4wdj7XoK2:22 a=BgOh09bUvQbaRh_aUNoE:22
X-Proofpoint-ORIG-GUID: qI6eLGekoA9cZGutyGbCMiRl_rHLMhxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222155

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes:
CVE-2023-6604
CVE-2023-6602
CVE-2025-7700

Changelog:
https://github.com/FFmpeg/FFmpeg/blob/n6.1.3/Changelog

Removed the CVE patches which are already fixed with this upgrade

ref:
https://github.com/FFmpeg/FFmpeg/commit/c104119c6b5e00496c5ff14071c85f95c98b7ae5
https://github.com/FFmpeg/FFmpeg/commit/7d79d0a43b5533ff584249332bc1db7fedbab1d2
https://github.com/FFmpeg/FFmpeg/commit/a4b6e37ad5f50454974fa22cc8f19d83cdaff0eb
https://github.com/FFmpeg/FFmpeg/commit/efedc1d1b6aef2481cf613a11992b1dce6320055
https://github.com/FFmpeg/FFmpeg/commit/dcf34f13f516aa0e214384f3185aff306feba01d
https://github.com/FFmpeg/FFmpeg/commit/bed04417b4d38af7a1b477b24ea6e26547e32373
https://github.com/FFmpeg/FFmpeg/commit/b43a12363c1fef0efa7eac15b6b830417656db15
https://github.com/FFmpeg/FFmpeg/commit/e2b20632b8c71a4e174511f8ff6e8342e0c63bd3
https://github.com/FFmpeg/FFmpeg/commit/43f64690ad9df72976bcbd6ea9e41b2542db2464

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        |  30 -----
 .../ffmpeg/ffmpeg/CVE-2023-49502.patch        | 107 ------------------
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        |  78 -------------
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        |  29 -----
 .../ffmpeg/ffmpeg/CVE-2024-31578.patch        |  49 --------
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        |  34 ------
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        |  47 --------
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        |  41 -------
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         |  34 ------
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        |  39 -------
 .../{ffmpeg_6.1.2.bb => ffmpeg_6.1.3.bb}      |  12 +-
 11 files changed, 1 insertion(+), 499 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.2.bb => ffmpeg_6.1.3.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
deleted file mode 100644
index 80d542952a..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4adb93dff05dd947878c67784d98c9a4e13b57a7 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Thu, 23 Nov 2023 14:58:35 +0100
-Subject: [PATCH] avfilter/asrc_afirsrc: fix by one smaller allocation of
- buffer
-
-CVE: CVE-2023-49501
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/4adb93dff05dd947878c67784d98c9a4e13b57a7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/asrc_afirsrc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavfilter/asrc_afirsrc.c b/libavfilter/asrc_afirsrc.c
-index e2359c1..ea04c35 100644
---- a/libavfilter/asrc_afirsrc.c
-+++ b/libavfilter/asrc_afirsrc.c
-@@ -480,7 +480,7 @@ static av_cold int config_eq_output(AVFilterLink *outlink)
-         if (ret < 0)
-             return ret;
-
--        s->magnitude = av_calloc(s->nb_magnitude, sizeof(*s->magnitude));
-+        s->magnitude = av_calloc(s->nb_magnitude + 1, sizeof(*s->magnitude));
-         if (!s->magnitude)
-             return AVERROR(ENOMEM);
-         memcpy(s->magnitude, eq_presets[s->preset].gains, sizeof(*s->magnitude) * s->nb_magnitude);
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
deleted file mode 100644
index bc78a46d03..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49502.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 737ede405b11a37fdd61d19cf25df296a0cb0b75 Mon Sep 17 00:00:00 2001
-From: Cosmin Stejerean <cosmin@cosmin.at>
-Date: Wed, 6 Dec 2023 18:39:32 +0800
-Subject: [PATCH] avfilter/bwdif: account for chroma sub-sampling in min size
- calculation
-
-The current logic for detecting frames that are too small for the
-algorithm does not account for chroma sub-sampling, and so a sample
-where the luma plane is large enough, but the chroma planes are not
-will not be rejected. In that event, a heap overflow will occur.
-
-This change adjusts the logic to consider the chroma planes and makes
-the change to all three bwdif implementations.
-
-Fixes #10688
-
-Signed-off-by: Cosmin Stejerean <cosmin@cosmin.at>
-Reviewed-by: Thomas Mundt <tmundt75@gmail.com>
-Signed-off-by: Philip Langdale <philipl@overt.org>
-
-CVE: CVE-2023-49502
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/737ede405b11a37f]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/vf_bwdif.c        |  9 +++++----
- libavfilter/vf_bwdif_cuda.c   | 11 ++++++-----
- libavfilter/vf_bwdif_vulkan.c | 11 +++++------
- 3 files changed, 16 insertions(+), 15 deletions(-)
-
-diff --git a/libavfilter/vf_bwdif.c b/libavfilter/vf_bwdif.c
-index 137cd5e..353cd0b 100644
---- a/libavfilter/vf_bwdif.c
-+++ b/libavfilter/vf_bwdif.c
-@@ -191,13 +191,14 @@ static int config_props(AVFilterLink *link)
-         return ret;
-     }
-
--    if (link->w < 3 || link->h < 4) {
--        av_log(ctx, AV_LOG_ERROR, "Video of less than 3 columns or 4 lines is not supported\n");
-+    yadif->csp = av_pix_fmt_desc_get(link->format);
-+    yadif->filter = filter;
-+
-+    if (AV_CEIL_RSHIFT(link->w, yadif->csp->log2_chroma_w) < 3 || AV_CEIL_RSHIFT(link->h, yadif->csp->log2_chroma_h) < 4) {
-+        av_log(ctx, AV_LOG_ERROR, "Video with planes less than 3 columns or 4 lines is not supported\n");
-         return AVERROR(EINVAL);
-     }
-
--    yadif->csp = av_pix_fmt_desc_get(link->format);
--    yadif->filter = filter;
-     ff_bwdif_init_filter_line(&s->dsp, yadif->csp->comp[0].depth);
-
-     return 0;
-diff --git a/libavfilter/vf_bwdif_cuda.c b/libavfilter/vf_bwdif_cuda.c
-index a5ecfba..418f15f 100644
---- a/libavfilter/vf_bwdif_cuda.c
-+++ b/libavfilter/vf_bwdif_cuda.c
-@@ -296,15 +296,16 @@ static int config_output(AVFilterLink *link)
-         link->frame_rate = av_mul_q(ctx->inputs[0]->frame_rate,
-                                     (AVRational){2, 1});
-
--    if (link->w < 3 || link->h < 3) {
--        av_log(ctx, AV_LOG_ERROR, "Video of less than 3 columns or lines is not supported\n");
--        ret = AVERROR(EINVAL);
--        goto exit;
--    }
-
-     y->csp = av_pix_fmt_desc_get(output_frames->sw_format);
-     y->filter = filter;
-
-+    if (AV_CEIL_RSHIFT(link->w, y->csp->log2_chroma_w) < 3 || AV_CEIL_RSHIFT(link->h, y->csp->log2_chroma_h) < 3) {
-+        av_log(ctx, AV_LOG_ERROR, "Video with planes less than 3 columns or lines is not supported\n");
-+        ret = AVERROR(EINVAL);
-+        goto exit;
-+    }
-+
-     ret = CHECK_CU(cu->cuCtxPushCurrent(s->hwctx->cuda_ctx));
-     if (ret < 0)
-         goto exit;
-diff --git a/libavfilter/vf_bwdif_vulkan.c b/libavfilter/vf_bwdif_vulkan.c
-index 690a89c..c51df9a 100644
---- a/libavfilter/vf_bwdif_vulkan.c
-+++ b/libavfilter/vf_bwdif_vulkan.c
-@@ -362,15 +362,14 @@ static int bwdif_vulkan_config_output(AVFilterLink *outlink)
-         outlink->frame_rate = av_mul_q(avctx->inputs[0]->frame_rate,
-                                        (AVRational){2, 1});
-
--    if (outlink->w < 4 || outlink->h < 4) {
--        av_log(avctx, AV_LOG_ERROR, "Video of less than 4 columns or lines is not "
--               "supported\n");
--        return AVERROR(EINVAL);
--    }
--
-     y->csp = av_pix_fmt_desc_get(vkctx->frames->sw_format);
-     y->filter = bwdif_vulkan_filter_frame;
-
-+    if (AV_CEIL_RSHIFT(outlink->w, y->csp->log2_chroma_w) < 4 || AV_CEIL_RSHIFT(outlink->h, y->csp->log2_chroma_h) < 4) {
-+        av_log(avctx, AV_LOG_ERROR, "Video with planes less than 4 columns or lines is not supported\n");
-+        return AVERROR(EINVAL);
-+    }
-+
-     return init_filter(avctx);
- }
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
deleted file mode 100644
index d86e39707e..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From b1942734c7cbcdc9034034373abcc9ecb9644c47 Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Mon, 27 Nov 2023 11:45:34 +0100
-Subject: [PATCH 2/3] avfilter/af_afwtdn: fix crash with EOF handling
-
-CVE: CVE-2023-50007
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/af_afwtdn.c | 34 +++++++++++++++++++---------------
- 1 file changed, 19 insertions(+), 15 deletions(-)
-
-diff --git a/libavfilter/af_afwtdn.c b/libavfilter/af_afwtdn.c
-index 0fcfa77..63b7f5f 100644
---- a/libavfilter/af_afwtdn.c
-+++ b/libavfilter/af_afwtdn.c
-@@ -408,6 +408,7 @@ typedef struct AudioFWTDNContext {
-
-     uint64_t sn;
-     int64_t eof_pts;
-+    int eof;
-
-     int wavelet_type;
-     int channels;
-@@ -1069,7 +1070,7 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
-         s->drop_samples = 0;
-     } else {
-         if (s->padd_samples < 0 && eof) {
--            out->nb_samples += s->padd_samples;
-+            out->nb_samples = FFMAX(0, out->nb_samples + s->padd_samples);
-             s->padd_samples = 0;
-         }
-         if (!eof)
-@@ -1208,23 +1209,26 @@ static int activate(AVFilterContext *ctx)
-
-     FF_FILTER_FORWARD_STATUS_BACK(outlink, inlink);
-
--    ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
--    if (ret < 0)
--        return ret;
--    if (ret > 0)
--        return filter_frame(inlink, in);
-+    if (!s->eof) {
-+        ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
-+        if (ret < 0)
-+            return ret;
-+        if (ret > 0)
-+            return filter_frame(inlink, in);
-+    }
-
-     if (ff_inlink_acknowledge_status(inlink, &status, &pts)) {
--        if (status == AVERROR_EOF) {
--            while (s->padd_samples != 0) {
--                ret = filter_frame(inlink, NULL);
--                if (ret < 0)
--                    return ret;
--            }
--            ff_outlink_set_status(outlink, status, pts);
--            return ret;
--        }
-+        if (status == AVERROR_EOF)
-+            s->eof = 1;
-     }
-+
-+    if (s->eof && s->padd_samples != 0) {
-+        return filter_frame(inlink, NULL);
-+    } else if (s->eof) {
-+        ff_outlink_set_status(outlink, AVERROR_EOF, s->eof_pts);
-+        return 0;
-+    }
-+
-     FF_FILTER_FORWARD_WANTED(outlink, inlink);
-
-     return FFERROR_NOT_READY;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
deleted file mode 100644
index 4b8935628f..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5f87a68cf70dafeab2fb89b42e41a4c29053b89b Mon Sep 17 00:00:00 2001
-From: Paul B Mahol <onemda@gmail.com>
-Date: Mon, 27 Nov 2023 12:08:20 +0100
-Subject: [PATCH] avfilter/vf_colorcorrect: fix memory leaks
-
-CVE: CVE-2023-50008
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/5f87a68cf70dafeab2fb89b42e41a4c29053b89b]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/vf_colorcorrect.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libavfilter/vf_colorcorrect.c b/libavfilter/vf_colorcorrect.c
-index 1c4dea5..6bdec2c 100644
---- a/libavfilter/vf_colorcorrect.c
-+++ b/libavfilter/vf_colorcorrect.c
-@@ -497,6 +497,8 @@ static av_cold void uninit(AVFilterContext *ctx)
-     ColorCorrectContext *s = ctx->priv;
-
-     av_freep(&s->analyzeret);
-+    av_freep(&s->uhistogram);
-+    av_freep(&s->vhistogram);
- }
-
- static const AVFilterPad colorcorrect_inputs[] = {
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
deleted file mode 100644
index f8e7e1283b..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31578.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From edeeb35cecb5bc0d433b14dd0e544ae826b7ece5 Mon Sep 17 00:00:00 2001
-From: Zhao Zhili <zhilizhao@tencent.com>
-Date: Tue, 20 Feb 2024 20:08:55 +0800
-Subject: [PATCH] avutil/hwcontext: Don't assume frames_uninit is reentrant
-
-Fix heap use after free when vulkan_frames_init failed.
-
-Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
-
-CVE: CVE-2024-31578
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/3bb00c0a420c3ce83]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavutil/hwcontext.c | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/libavutil/hwcontext.c b/libavutil/hwcontext.c
-index 3650d46..0ef3479 100644
---- a/libavutil/hwcontext.c
-+++ b/libavutil/hwcontext.c
-@@ -363,7 +363,7 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
-     if (ctx->internal->hw_type->frames_init) {
-         ret = ctx->internal->hw_type->frames_init(ctx);
-         if (ret < 0)
--            goto fail;
-+            return ret;
-     }
-
-     if (ctx->internal->pool_internal && !ctx->pool)
-@@ -373,14 +373,10 @@ int av_hwframe_ctx_init(AVBufferRef *ref)
-     if (ctx->initial_pool_size > 0) {
-         ret = hwframe_pool_prealloc(ref);
-         if (ret < 0)
--            goto fail;
-+            return ret;
-     }
-
-     return 0;
--fail:
--    if (ctx->internal->hw_type->frames_uninit)
--        ctx->internal->hw_type->frames_uninit(ctx);
--    return ret;
- }
-
- int av_hwframe_transfer_get_formats(AVBufferRef *hwframe_ref,
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
deleted file mode 100644
index 2ade3ab6b1..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1d1a05b393ece9fa3df825bfef3724b7370aefdc Mon Sep 17 00:00:00 2001
-From: Zhao Zhili <zhilizhao@tencent.com>
-Date: Fri, 29 Dec 2023 05:56:43 +0800
-Subject: [PATCH] avfilter/vf_codecview: fix heap buffer overflow
-
-And improve the performance by a little bit.
-
-Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
-
-CVE: CVE-2024-31582
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/vf_codecview.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/libavfilter/vf_codecview.c b/libavfilter/vf_codecview.c
-index 55d9c8c..f65ccbd 100644
---- a/libavfilter/vf_codecview.c
-+++ b/libavfilter/vf_codecview.c
-@@ -216,9 +216,6 @@ static void draw_block_rectangle(uint8_t *buf, int sx, int sy, int w, int h, ptr
-         buf[sx + w - 1] = color;
-         buf += stride;
-     }
--
--    for (int x = sx; x < sx + w; x++)
--        buf[x] = color;
- }
-
- static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
deleted file mode 100644
index a1bec43c66..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 09e6840cf7a3ee07a73c3ae88a020bf27ca1a667 Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Wed, 13 Mar 2024 02:10:26 +0100
-Subject: [PATCH] avcodec/ppc/vp8dsp_altivec: Fix out-of-bounds access
-
-h_subpel_filters_inner[i] and h_subpel_filters_outer[i / 2]
-belong together and the former allows the range 0..6,
-so the latter needs to support 0..3. But it has only three
-elements. Add another one.
-The value for the last element has been guesstimated
-from subpel_filters in libavcodec/vp8dsp.c.
-
-This is also intended to fix FATE-failures with UBSan here:
-https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
-
-Tested-by: Sean McGovern <gseanmcg@gmail.com>
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35367
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/ppc/vp8dsp_altivec.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libavcodec/ppc/vp8dsp_altivec.c b/libavcodec/ppc/vp8dsp_altivec.c
-index 12dac8b..061914f 100644
---- a/libavcodec/ppc/vp8dsp_altivec.c
-+++ b/libavcodec/ppc/vp8dsp_altivec.c
-@@ -50,11 +50,12 @@ static const vec_s8 h_subpel_filters_inner[7] =
- // for 6tap filters, these are the outer two taps
- // The zeros mask off pixels 4-7 when filtering 0-3
- // and vice-versa
--static const vec_s8 h_subpel_filters_outer[3] =
-+static const vec_s8 h_subpel_filters_outer[4] =
- {
-     REPT4(0, 0, 2, 1),
-     REPT4(0, 0, 3, 3),
-     REPT4(0, 0, 1, 2),
-+    REPT4(0, 0, 0, 0),
- };
-
- #define LOAD_H_SUBPEL_FILTER(i) \
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
deleted file mode 100644
index 7b802762eb..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4513300989502090c4fd6560544dce399a8cd53c Mon Sep 17 00:00:00 2001
-From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-Date: Sun, 24 Sep 2023 13:15:48 +0200
-Subject: [PATCH] avcodec/rkmppdec: Fix double-free on error
-
-After having created the AVBuffer that is put into frame->buf[0],
-ownership of several objects (namely an AVDRMFrameDescriptor,
-an MppFrame and some AVBufferRefs framecontextref and decoder_ref)
-has passed to the AVBuffer and therefore to the frame.
-Yet it has nevertheless been freed manually on error
-afterwards, which would lead to a double-free as soon
-as the AVFrame is unreferenced.
-
-Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
-
-CVE: CVE-2024-35368
-
-Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/4513300989502090c4fd6560544dce399a8cd53c]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavcodec/rkmppdec.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavcodec/rkmppdec.c b/libavcodec/rkmppdec.c
-index 5768568..2ca368e 100644
---- a/libavcodec/rkmppdec.c
-+++ b/libavcodec/rkmppdec.c
-@@ -462,8 +462,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
-
-             frame->hw_frames_ctx = av_buffer_ref(decoder->frames_ref);
-             if (!frame->hw_frames_ctx) {
--                ret = AVERROR(ENOMEM);
--                goto fail;
-+                av_frame_unref(frame);
-+                return AVERROR(ENOMEM);
-             }
-
-             return 0;
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
deleted file mode 100644
index d3e02bebe6..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
-From: Michael Niedermayer <michael@niedermayer.cc>
-Date: Mon, 6 Jan 2025 22:01:39 +0100
-Subject: [PATCH] avfilter/af_pan: Fix sscanf() use
-
-Fixes: Memory Data Leak
-
-Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
-Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
-
-CVE: CVE-2025-0518
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/af_pan.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
-index cfed9f1..ffcd214 100644
---- a/libavfilter/af_pan.c
-+++ b/libavfilter/af_pan.c
-@@ -165,7 +165,7 @@ static av_cold int init(AVFilterContext *ctx)
-         sign = 1;
-         while (1) {
-             gain = 1;
--            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
-+            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
-                 arg += len;
-             if (parse_channel_name(&arg, &in_ch_id, &named)){
-                 av_log(ctx, AV_LOG_ERROR,
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
deleted file mode 100644
index f895576de3..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1446e37d3d032e1452844778b3e6ba2c20f0c322 Mon Sep 17 00:00:00 2001
-From: James Almer <jamrial@gmail.com>
-Date: Mon, 30 Dec 2024 00:25:41 -0300
-Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
-
-A sample rate <= 0 is invalid.
-
-Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
-Fixes ticket #11385.
-
-Signed-off-by: James Almer <jamrial@gmail.com>
-
-CVE: CVE-2025-22919
-
-Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1446e37d3d032e1452844778b3e6ba2c20f0c322]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- libavfilter/buffersrc.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
-index 453fc0f..f49aa91 100644
---- a/libavfilter/buffersrc.c
-+++ b/libavfilter/buffersrc.c
-@@ -401,6 +401,11 @@ FF_ENABLE_DEPRECATION_WARNINGS
-         av_channel_layout_describe(&s->ch_layout, buf, sizeof(buf));
-     }
-
-+    if (s->sample_rate <= 0) {
-+        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
-+        return AVERROR(EINVAL);
-+    }
-+
-     if (!s->time_base.num)
-         s->time_base = (AVRational){1, s->sample_rate};
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
index a789980dde..c0112757f0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
@@ -27,26 +27,16 @@ SRC_URI = " \
     file://av1_ordering_info.patch \
     file://vulkan_av1_stable_API.patch \
     file://vulkan_fix_gcc14.patch \
-    file://CVE-2023-49502.patch \
-    file://CVE-2024-31578.patch \
-    file://CVE-2024-31582.patch \
-    file://CVE-2023-50008.patch \
-    file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
-    file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
-    file://CVE-2024-35367.patch \
-    file://CVE-2024-35368.patch \
     file://CVE-2024-35365.patch \
     file://CVE-2024-36618.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
-    file://CVE-2025-22919.patch \
     file://CVE-2025-22921.patch \
-    file://CVE-2025-0518.patch \
 "
 
-SRC_URI[sha256sum] = "3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63dca4e38"
+SRC_URI[sha256sum] = "bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.40.0


