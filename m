Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A443C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:25 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.13719.1645542503897597031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cEiAKY51;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542503; x=1677078503;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fWit+QlWa8rsO/8i/6Kh25UId7b354typisGkkVgIzw=;
  b=cEiAKY51sPXGq0n7vYysYG477gceF0ZtI19AIJs//3opam+GydhJbBrL
   F24MvWiISD/RkIys/Fhe4M0Sfz+51Hcahpy0kfj5H3gMSJKQOd5aEsnKv
   K+EYft7znFc4RgGwywuHx8CL5IMfwIqcyQ1JPJ2gO283J/esh482hKlw1
   262sTJXqZJWulAlQbGegSRD9mxRJqaaNTHPABEq6jlnKxCEmna7cRPg3T
   99akJLZ6Wso8ZS6ZP8zYsG2BBJEaST7HwCCkGuMSN/nAd1cCpw5op0adD
   aZRs0EWmV1aZXUyeD22jNWO8GU4TvLdHxog3v5GRgKWG1CPOGqaxFynte
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960833"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960833"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258527"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/38] gstreamer1.0-libav: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:08 +0800
Message-Id: 
 <92854f2801e7b46656b86785ce8fb1729dba19a5.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162143

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
index a77ec62759..d46342285d 100644
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


