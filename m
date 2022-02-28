Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA888C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=SD5ePwJx;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056878; x=1677592878;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NHg9PnFBQGY6fTq4iZFOsRiVk8A0mO5FE6aKkptJZWo=;
  b=SD5ePwJxbTB/3CWfxk88PLzZUSqUOYLV6Z1acsIlApys3AvmhIH2KyMv
   t8khSclmBm3BcP+kI0/6Wb7Td7t8t8rhggU4mV1f4cTVkfpCZ0sph/vVZ
   r5gUIVKga4QgdWAJkDHKVZQW/UYzg4ZQzxBRU2rp4nImZT8W91nBOFnAy
   ESMyyfMgZwSPNE4aK+bwVz99H2I2CKgXE8MLSid9W/QRey78IxxCHf1y8
   seGFWEmCPwYz2ZP5ogis/OGCtqd+Cy6QhMICr00IoRMcIepBxfnC4TPie
   awc1edLqSQAuMokhkM95GAF7F+HSKUGrzED7nOEUaGpW0141RkUoKAO3u
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857281"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857281"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092593"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/39] gstreamer1.0-rtsp-server: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:14 +0800
Message-Id: 
 <4cb69f75a01e9e2fdbf7ac62488a49b85c8b2fbd.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162480

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
index 50426ad46d..f105713f33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
+SRC_URI[sha256sum] = "826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


