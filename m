Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3847C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.20339.1646056876675169584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Xhb05Sio;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056876; x=1677592876;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wJgt7WR1OXKtUw9K4uUEeFzyl7kP2oYEmJXS16rvzwQ=;
  b=Xhb05Siojsf96TNemIhKlC+QRs3R6sfMQ4U2TVJM8CI5cj7HqcwPJR73
   IKKsUnNlXh0ukzUx5Jr4tz95Do3RIUiogTpVCkB3N6Pmw5pn0z1fxp3eC
   Ee5ZjGf04vokn6nkqW9KwYvlSF2ZyzyJPfsblgft/Uba8Z8qIpo8Li6MJ
   MFzt5dunIOVjptxpJGs8/g0dVbzFh+wvWopLMgex7BpL9L8QzW+aArgaH
   YULgrGMk1NsFMnlLeAREgLbSxEy5jraSDsOe3VzzdyrM0vk82aBcqqqRI
   3i0GGyb0cNl2BzGkNetBYNWdaeuf59S6pLmZfAuye/LPz297+NWmX6OwX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857261"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857261"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092559"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/39] gstreamer1.0-libav: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:12 +0800
Message-Id: 
 <e1b51a93615b832ca42ea59456699ec4eb491e05.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162478

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
index bf1401975c..6229bb4d62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
+SRC_URI[sha256sum] = "e4e50dcd5a29441ae34de60d2221057e8064ed824bb6ca4dc0fd9ee88fbe9b81"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.35.1


