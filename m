Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD007C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:17:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14128.1749035826561144204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8250111c01=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544o5KM014812
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 11:17:05 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q2d45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:17:05 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:17:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:17:02 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/4] ffmpeg: upgrade 5.0.1 -> 5.0.3
Date: Wed, 4 Jun 2025 16:46:56 +0530
Message-ID: <20250604111659.3136031-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -sJ7oZHbHSHxrcElFQvtFWf7Updl4pbU
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68402b31 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=aH8uB08s4XoK1nAJ2LkA:9 a=HLUCug_QN4oeKp6PugZw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NiBTYWx0ZWRfX0GulEjAsHDMQ 3KBciTpxtF/uqL1kPR0x09bXp0UU77+FjuQ+WMpXyT8CzUXZcLOFhhzUj4cEcG1XZrVEKU++uuW K7whIc2LWkIov8DXpjSuVwBKkk7wAXicl/evLOlefR4gngGoyj7AxomuyJuvfmpuuC5HRIILg12
 FGO2gdqILwrBR6Zpw/ry+SsFCni5OLYlay6Lu1I1LKah9Mzp+5O/KxTt9bG5vNPUDEE6i+SiptH jzMdswRCAd8TqRLBlSmn4khxbMHKZo23yTJHl3Y0psjpS2osdigeFDFuMC81rwITSNhRD6+GnpS GNtBDPJosJci25zQFngSoyVqc0B8TN8i4j8FIPiJzawo+Fw7JUxmdFkDrsYPk99/030FvvdTZGm
 CYlRRVaRWJ7+PxkyZReFMQwYvWRpYetXA5mDoKBeS7zAcE6l/NpsqN1bPBjBIHlU90i6kOSv
X-Proofpoint-ORIG-GUID: -sJ7oZHbHSHxrcElFQvtFWf7Updl4pbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217903

From: Archana Polampalli <archana.polampalli@windriver.com>

Refreshed CVE-2024-36613.patch against to the current version
Removed below patches since already fixed in this version

0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch [1]
0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch [2]
0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch [3]
0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch [4]
CVE-2022-48434.patch [5]

[1] https://github.com/FFmpeg/FFmpeg/commit/1eb002596e3761d88de4aeea3158692b82fb6307
[2] https://github.com/FFmpeg/FFmpeg/commit/293dc39bcaa99f213c6b7a703e11f146abf5d3be
[3] https://github.com/FFmpeg/FFmpeg/commit/2cdddcd6ec90c7a248ffe792d85faa4d89eab9f7
[4] https://github.com/FFmpeg/FFmpeg/commit/481e81be1271ac9a0124ee615700390c2371bd89
[5] https://github.com/FFmpeg/FFmpeg/commit/3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch         | 18 +++++++++---------
 .../{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb}       |  7 +------
 2 files changed, 10 insertions(+), 15 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
index 300b8d1e49..8dc43c3b68 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
@@ -1,8 +1,7 @@
 From 1f6fcc64179377114b4ecc3b9f63bd5774a64edf Mon Sep 17 00:00:00 2001
 From: Michael Niedermayer <michael@niedermayer.cc>
 Date: Sat, 30 Sep 2023 00:51:29 +0200
-Subject: [PATCH 2/4] avformat/dxa: Adjust order of operations around block
- align
+Subject: [PATCH] avformat/dxa: Adjust order of operations around block  align
 
 Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
 Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
@@ -22,17 +21,18 @@ Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libavformat/dxa.c b/libavformat/dxa.c
-index 16fbb08..53747c8 100644
+index 474b852..b4d9d00 100644
 --- a/libavformat/dxa.c
 +++ b/libavformat/dxa.c
-@@ -120,7 +120,7 @@ static int dxa_read_header(AVFormatContext *s)
-         }
-         c->bpc = (fsize + c->frames - 1) / c->frames;
-         if(ast->codecpar->block_align)
+@@ -122,7 +122,7 @@ static int dxa_read_header(AVFormatContext *s)
+         if(ast->codecpar->block_align) {
+             if (c->bpc > INT_MAX - ast->codecpar->block_align + 1)
+                 return AVERROR_INVALIDDATA;
 -            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
 +            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
+         }
          c->bytes_left = fsize;
          c->wavpos = avio_tell(pb);
-         avio_seek(pb, c->vidpos, SEEK_SET);
---
+-- 
 2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4b99c0fa21..127552396d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -24,11 +24,6 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
-           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
-           file://CVE-2022-48434.patch \
            file://CVE-2024-32230.patch \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
@@ -53,7 +48,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-25473.patch \
           "
 
-SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
+SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
 
 # CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
 # and not ffmepg itself.
-- 
2.49.0


