Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF0FC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19882.1646056851264633887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=moXqCr5V;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056852; x=1677592852;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2nT+Lvgkdw/BHx8EezjE9kcDji52Ys24iasiD+br5aY=;
  b=moXqCr5VkOMfoxYDh6pUFe7jjPmICDpDstj43dN5nCQtKL1CURy1g/rj
   LzSMpfjgdGsdogVDnA2onDNOXsOIbJIDADyvacniTpm2ug/NrDnunUNnn
   up3gtlmvl0Dd8LlOuKCcF4fZc0A0cnAC5pM/JxkSaIGHbrwWjR9Jg4kh3
   1o1jlL2LLomT0WU2h09M3W6OOwFdYnKvJhjyvheydSGBRoGId4206IxVA
   uIrjGy7iqq2vyxXgCFy8vLxuDi1MFMmmn/re+ckGmj2PUH8kKS5r5bHH2
   bQFfgRXHax3Cv2/Cw3gpqEarW7hkmIKaqDLekxqQkUvuykzj05rp6eYs2
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857002"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092253"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:49 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/39] gstreamer1.0-plugins-good: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 21:59:57 +0800
Message-Id: 
 <27c6230ddcd2723c60846a7cc2a9388a92b67ab9.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162463

From: Jose Quaresma <quaresma.jose@gmail.com>

Drop backport patches:
    * 0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch

    * 0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
      https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/commit/a1bf3d8d540a25268d612a489e1e836d6ea737b0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b51d46790e582556a7230a1fe8f67375e785cc43)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Fix-parsing-of-the-mediaclk-direct-f.patch | 33 -------------------
 ...bb => gstreamer1.0-plugins-good_1.18.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.4.bb => gstreamer1.0-plugins-good_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
deleted file mode 100644
index 14a9fe23aa..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ec1949dffd931d0ec7e4f67108a08ab1e2af0cfe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 16 Mar 2021 19:25:36 +0200
-Subject: [PATCH] rtpjitterbuffer: Fix parsing of the mediaclk:direct= field
-
-Due to an off-by-one when parsing the string, the most significant digit
-or the clock offset was skipped when parsing the offset.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/910>
-
-Upstream-Status: Backport [b5bb4ede3a42273fafc1054f9cf106ca527e3c26]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/rtpmanager/gstrtpjitterbuffer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/rtpmanager/gstrtpjitterbuffer.c b/gst/rtpmanager/gstrtpjitterbuffer.c
-index 60d8ad875..02fe15adc 100644
---- a/gst/rtpmanager/gstrtpjitterbuffer.c
-+++ b/gst/rtpmanager/gstrtpjitterbuffer.c
-@@ -1534,7 +1534,7 @@ gst_jitter_buffer_sink_parse_caps (GstRtpJitterBuffer * jitterbuffer,
-       GST_DEBUG_OBJECT (jitterbuffer, "Got media clock %s", mediaclk);
- 
-       if (!g_str_has_prefix (mediaclk, "direct=") ||
--          !g_ascii_string_to_unsigned (&mediaclk[8], 10, 0, G_MAXUINT64,
-+          !g_ascii_string_to_unsigned (&mediaclk[7], 10, 0, G_MAXUINT64,
-               &clock_offset, NULL))
-         GST_FIXME_OBJECT (jitterbuffer, "Unsupported media clock");
-       if (strstr (mediaclk, "rate=") != NULL) {
--- 
-2.31.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
index 07cacdc68a..6f642d01ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
@@ -6,10 +6,9 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-           file://0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch \
            "
 
-SRC_URI[sha256sum] = "b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0"
+SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


