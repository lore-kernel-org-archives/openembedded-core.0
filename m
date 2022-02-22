Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED57C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13721.1645542507811489137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WyjZEbTO;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542508; x=1677078508;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JrmV09Se6oMe/7/k8jD7kBmAQuITiImIeCHZu1fZs6U=;
  b=WyjZEbTOuxB0tYq2x+N48UOGI4bXyiggKq2YS78qKLLpDvu9Jzgj37Pg
   EnPCI0RLBl5C8lkyV0r8upwU7NrHsPIokxCRRSVERyDAYd5796G61Wr0t
   u/DJgrANRHqYB1VrBx1ln/YRrvxqh1Xjr36ev9cKH+pVQYEueIudwA3rq
   JGA4O90TnCtm4KvfTFxkyaL5UMc99obJXoUY7foztW4fgu2lbHYC1iK+w
   5aadPQ6tB9iy/9vHGnOvc/wqOJF1qewOr1h9kcTyln+w7o0oiizcBiYZ+
   TL2Ac/VlnaP9+Ax9eEDQfT599ybU8ku/8vcFGEzZWpi7J49DVOmX5SGQv
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305067"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305067"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258572"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/38] gst-examples: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:13 +0800
Message-Id: 
 <c99aa16782b824f5f6023fa46617da252950955e.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162147

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index a720bb73ff..2a7a3c3111 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
+SRCREV = "70e4fcf4fc8ae19641aa990de5f37d758cdfcea4"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


