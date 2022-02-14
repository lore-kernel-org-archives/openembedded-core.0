Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD1CC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:55:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.3292.1644882917494575617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vQnJULAw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644882915; i=@fujitsu.com;
	bh=BIWUdwEYv+GP2Qirp5LxFSbcrb+w8UuxBEDHw34ZcNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vQnJULAwcndKk6Q7/u8E0HU/Gp9lp/CXvazUcs3lTflX+HvN47QJPs/GpF0ThgPc9
	 Uh90OFNpL2rvqsM+KGHd2hJc0qx157iz18JKnXsSkRLO8HTg+Yemxuzl1SiNK0j6aj
	 ay1yNPbNCCgIuYI1qI+VB1F+OGmckONbZvAuTbeBISKs+XVKSFnSMitNXRsDmtF9N/
	 RLLjTRudHlj78Tnu7/PnRAfjkOFOJrdEaGBh5aOtN/9f3R22Xj0TlbkR/jWMn18yDQ
	 LbsoFjWei+wvfJP9PbngPOeLl6vijU0qWvcTozw/7nOWwe0GPxzsXoCoQxiK97Bsu7
	 9tN8eC0aobSGg==
Received: from [100.115.37.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id B2/DB-12680-3EBEA026;
 Mon, 14 Feb 2022 23:55:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsViZ8ORqPvoNVe
  SwZu9VhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bVjtqCs8oVfR/6GBsYt8h3MXJxCAk8ZpRo
  +fuLBcI5zyRx/s9HVgjnBKPElvkz2LoYOTnYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAp8fBsCwuIzSKgKrF/QRcjiM0r4Cgxc+djZhBbQkBBYsrD92A2p4CTxJsJs8BqhIBqfl
  3qYoOoF5Q4OfMJC8R8CYmDL15A9SpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsqWtkaKyXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxCnF6ld3MG5e9VPvEKMkB5OSKG/MHq4kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8Uo+AcoJFqempFWmZOcCIgklLcPAoifDeeACU5i0uSMwtzkyHSJ1idOX4cOjKXmaOq1
  dA5A0wefA/iFzw+9peZiGWvPy8VClxXv/bQM0CIM0ZpXlwo2HJ4BKjrJQwLyMDA4MQT0FqUW5
  mCar8K0ZxDkYlYV6zV0BTeDLzSuAueAV0HBPQcYqNYMeVJCKkpBqY4nayKhhzu6aItDx+KSsQ
  HPF4bSFbfuwJP/2Z2332PF3iquf6bmb/5P1RB59Py72b9fVGjO2pP9tDfI9IPFrJpnX4yULfM
  /EvylotStd+DJ0wwbauyobjlmlLaqZQv+OOP/pOF1Tb31uJWP0++bW+2HnSIaFXk2yKrT2MXw
  tFKU1K1tOW3p2QojnNdeHeFt6tCiXLNtTc6m4zkCzt/vLB696cqpQ/Lw9Kzm9sWqdquvaqv/k
  x9x0id9fcjWxhUu4r/iR1qvpWVm3//j2/9IRPallWOQUeLVB6cH8mV0DrkouzzvsWBjvfuHLN
  V7LIOl7/41MFh+4wqRNLN8eFrkiL1z7lvUTAJWnunp8vfGyUWIozEg21mIuKEwF5tN13gQMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1644882914!20249!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28255 invoked from network); 14 Feb 2022 23:55:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 23:55:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 93CD6100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:55:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 878C1100183
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:55:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 23:54:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.3.5 -> 21.3.6
Date: Tue, 15 Feb 2022 07:54:35 +0800
Message-ID: <1644882876-4535-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
References: <1644882876-4535-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161737

Changelog:
=========
Bug fixes
---------
radv: CullDistance fail
i965: Segmentation fault during glinfo context destruction, regression in 21.3.x
Vulkan Wayland WSI returns empty surface formats
[REGRESSION][BISECTED] iris: Qutebrowser/QtWebEngine sporadically flashes the window in white
Flickering Intel Uhd 620 Graphics
Broken Terraria & Glitches in Forza Horizon 4

Changes
-------
Revert "nir/algebraic: distribute fmul(fadd(a, b), c) when b and c are constants"
anv: Fix subgroupSupportedStages physical property
Revert "zink: handle vertex buffer offset overflows"
ir3: Fix copy-paste mistakes in ir3_block_remove_physical_predecessor()
ir3/cp: ir3: Prevent propagating shared regs out of loops harder
ir3: opt_deref in opt loop to remove unnecessary tex casts
crocus: find correct relocation target for the bo.
vulkan: Fix leak of error messages
pick_status.json: Update to cb781fc350108584116280fc597c695d2f476c68
pick_status.json: Mark 15e77504461a30038a054c87cc53a694171c9cf4 as denominated
pick_status.json: Mark 960e72417f3e8885699cf384f690853e14ba44da as denominated
intel/fs: Take into account region strides during SIMD lowering decision of SHUFFLE.
vulkan/wsi/wayland: Fix add_wl_shm_format alpha/opaqueness.
vulkan/wsi/wayland: Convert missing vulkan formats to shm formats.
vulkan/wsi/wayland: Add modifiers for RGB formats.
vulkan/wsi/wayland: Fix add_drm_format_modifier aplha/opaqueness.
anv/pass: Don't set first_subpass_layout for stencil-only attachments
vulkan/wsi: Set MUTABLE_FORMAT_BIT in the prime path
i965: Avoid NULL drawbuffer in brw_flush_front
intel/fs: don't set allow_sample_mask for CS intrinsics
intel/nir: fix shader call lowering
panvk: Fix pointer corruption in panvk_add_wait_event_syncobjs
zink: never use SpvOpImageQuerySizeLod for texel buffers
zink: reorder fbfetch flag-setting to avoid null deref
zink: fix vertex buffer mask computation for null buffers
zink: clamp tbo creation to maxTexelBufferElements
zink: add vertex shader pipeline bit for generated barrier construction
zink: fix waiting on current batch id
zink: cast image atomic op params/results based on image type
zink: use SpvScopeDevice over SpvScopeWorkgroup for atomic shader ops
zink: disable PIPE_SHADER_CAP_FP16_CONST_BUFFERS
llvmpipe: disable PIPE_SHADER_CAP_FP16_CONST_BUFFERS
llvmpipe: ci updates
zink: add VK_BUFFER_USAGE_CONDITIONAL_RENDERING_BIT_EXT for query binds
zink: fix PIPE_CAP_TGSI_BALLOT export conditional
zink: reject invalid draws
zink: min/max blit region in coverage functions
anv: Disable CCS_E for some 8/16bpp copies on TGL+
anv: Use ANV_FAST_CLEAR_DEFAULT_VALUE for CCS on TGL+
anv: Re-enable CCS_E on TGL+
iris: implement inter-context busy-tracking
aco: fix neg(abs(mul(a, b))) if the mul is not VOP3
aco: don't encode src2 for v_writelane_b32_e64
radv: fix R_02881C_PA_CL_VS_OUT_CNTL with mixed cull/clip distances
radv/winsys: fix missing buffer_make_resident() for the null winsys
tu: VkExternalImageFormatProperties is optional

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.3.5.bb => mesa-gl_21.3.6.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.5.bb => mesa_21.3.6.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.5.bb => mesa-gl_21.3.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.5.bb => mesa_21.3.6.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8093f5665..cfd325add1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c"
+SRC_URI[sha256sum] = "96bb761fd546e9aa41d025fcc025225c5668443839dae21e3731959beb096736"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.5.bb b/meta/recipes-graphics/mesa/mesa_21.3.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.5.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.6.bb
-- 
2.25.1


