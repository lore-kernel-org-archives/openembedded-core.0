Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F7FC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 06:15:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7557.1741155332041972898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 22:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5159052c86=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5255xLZh030495
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 22:15:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa09ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 22:15:31 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 4 Mar 2025 22:15:30 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 4 Mar 2025 22:15:29 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 1/1] ffmpeg: upgrade 7.1 -> 7.1.1
Date: Wed, 5 Mar 2025 06:15:27 +0000
Message-ID: <20250305061527.1156730-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MuIz_jGoLlDe_HtjH99ajZMvP9VcA0bK
X-Proofpoint-GUID: MuIz_jGoLlDe_HtjH99ajZMvP9VcA0bK
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67c7ec03 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=ozaSBnvfAAAA:8 a=pGLkceISAAAA:8
 a=aRV8ZeC6vOEFVMhX9LEA:9 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22 a=rDKww-0BVBkzFv7kH2DS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212295

From: Archana Polampalli <archana.polampalli@windriver.com>

Remove 0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch as it merged to 7.1.1
https://github.com/FFmpeg/FFmpeg/commit/4ea558152f05e41f15a548e2aab8e5d40546af5f

Changelog:
https://github.com/FFmpeg/FFmpeg/blob/n7.1.1/Changelog

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...e-RISC-V-fn-pointers-to-.data.rel.ro.patch | 26 -------------------
 .../ffmpeg/{ffmpeg_7.1.bb => ffmpeg_7.1.1.bb} |  6 ++---
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.bb => ffmpeg_7.1.1.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch
deleted file mode 100644
index 9dc10f1219..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 93f277f05cc71f69930bd680ac6eae5457b963f3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
-Date: Sat, 16 Nov 2024 08:57:54 +0200
-Subject: [PATCH] lavc/h264dsp: move RISC-V fn pointers to .data.rel.ro
-
-This should fix PIC builds.
-
-Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/c3051d94a7939de93acd647d3a1719ce56c0c4f5]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libavcodec/riscv/h264dsp_rvv.S | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavcodec/riscv/h264dsp_rvv.S b/libavcodec/riscv/h264dsp_rvv.S
-index 422ac02..97c6708 100644
---- a/libavcodec/riscv/h264dsp_rvv.S
-+++ b/libavcodec/riscv/h264dsp_rvv.S
-@@ -176,7 +176,7 @@ endfunc
- 
-         .global ff_h264_weight_funcs_8_rvv
-         .hidden ff_h264_weight_funcs_8_rvv
--const ff_h264_weight_funcs_8_rvv
-+const ff_h264_weight_funcs_8_rvv, relocate=1
-         .irp    w, 16, 8, 4, 2
- #if __riscv_xlen == 32
-         .word   ff_h264_weight_pixels\w\()_8_rvv
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
index c8f226ff3a..4314ab9f31 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
@@ -22,11 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0001-lavc-h264dsp-move-RISC-V-fn-pointers-to-.data.rel.ro.patch \
-           "
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "40973d44970dbc83ef302b0609f2e74982be2d85916dd2ee7472d30678a7abe6"
+SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.40.0


