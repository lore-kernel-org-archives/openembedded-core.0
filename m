Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D12C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:19:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.24487.1704179987466227426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145060744"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145060744"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:19:46 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 205F8D7AC6
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:19:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 459ED105FF2
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:19:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCC292008E696
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:19:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 554961A0070;
	Tue,  2 Jan 2024 15:19:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ffmpeg: upgrade 6.1 -> 6.1.1
Date: Tue,  2 Jan 2024 15:19:34 +0800
Message-Id: <1704179974-8384-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-1.645800-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yUIIxwDaU5mrMoS2PLq1B76hi3aCP/U5K+LS
	dVP2tZn541dJZOx9EPLbFjrWAJZ013b7237U7CUnLTHwnYOikQ1N8rmPQRlvKwJYTORviFLhjz4
	83V7O52xKlbh1OIhWFRI46MP/Q3NkjEzPyiMtgj3cgUVP3Cp+vc/rSr8VfmGwV+Wy/X6EXDBBtL
	7tfNShjbdPbbIB+Pkw5fLD25wGz7CjpzeDGKpgq/IZFs9yb02SjlRp8uau9oZF44mD/VSmfUhHY
	yAr1i3EVe4KLENUt69aDnFlk18U+/vlwQ3r+q9MYO2LBxTMwiBUENBIMyKD0QfxTM57BPHD7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG/ioIsi7Sa0gS6QizeDUeN5/wVJ
	vMu+9/oHN5yaW8cN9Lmth8cTQ473lRxm3A2wKuhRFJJyf5BJegMf23PO6/W/6C0ePs7A07Q2y0J
	eZ/zsc5K78GnZeG5aGKAm4rlD6h75H7o2AzcSGWys1A9xXSTd3rl5hZPnfOjIetxJkBt+8GZONv
	1PrlSd+G8/SuPCbqfikZf6AszfJ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193207

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- avcodec/mpegvideo_enc: Dont copy beyond the image
- avfilter/vf_minterpolate: Check pts before division
- avfilter/avf_showwaves: Check history_nb_samples
- avformat/flacdec: Avoid double AVERRORS
- avfilter/vf_vidstabdetect: Avoid double AVERRORS
- avcodec/vaapi_encode: Avoid double AVERRORS
- avfilter/vf_swaprect: round coordinates down
- avfilter/vf_swaprect: Use height for vertical variables
- avfilter/vf_swaprect: assert that rectangles are within memory
- avfilter/af_alimiter: Check nextpos before use
- avfilter/f_reverse: Apply PTS compensation only when pts is available
- avfilter/af_stereowiden: Check length
- avformat/mov: Fix MSAN issue with stsd_id
- avcodec/jpegxl_parser: Check get_vlc2()
- avfilter/vf_weave: Fix odd height handling
- avfilter/edge_template: Fix small inputs with gaussian_blur()
- avfilter/vf_gradfun: Do not overread last line
- avfilter/avf_showspectrum: fix off by 1 error
- avcodec/jpegxl_parser: Add padding to cs_buffer
- avformat/mov: do not set sign bit for chunk_offsets
- avcodec/jpeglsdec: Check Jpeg-LS LSE
- avcodec/osq: Implement flush()
- configure: Enable section_data_rel_ro for FreeBSD and NetBSD aarch64 / arm
- avcodec/cbs_h266: more restrictive check on pps_tile_idx_delta_val
- avcodec/jpeg2000htdec: check if block decoding will exceed internal precision
- tools/target_dec_fuzzer: Adjust threshold for VMIX
- avcodec/av1dec: Fix resolving zero divisor
- avformat/mov: Ignore duplicate ftyp
- avformat/mov: Fix integer overflow in mov_read_packet().
- lavc/qsvdec: return 0 if more data is required
- avcodec/jpegxl_parser: check ANS cluster alphabet size vs bundle size
- libavformat/vvc: Make probe more conservative
- hwcontext_vulkan: guard unistd.h include
- lavc/Makefile: build vulkan decode code if vulkan_av1 has been enabled
- lavc/dvdsubenc: only check canvas size when it is actually set
- avcodec/decode: validate hw_frames_ctx when AVHWAccel.free_frame_priv is used
- avcoded/fft: Fix memory leak if ctx2 is used
- avcodec/fft: Use av_mallocz to avoid invalid free/uninit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ffmpeg/{ffmpeg_6.1.bb => ffmpeg_6.1.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.bb => ffmpeg_6.1.1.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 162eb414b1..aa59755034 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "488c76e57dd9b3bee901f71d5c95eaf1db4a5a31fe46a28654e837144207c270"
+SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
 
 # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
 # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
-- 
2.34.1


