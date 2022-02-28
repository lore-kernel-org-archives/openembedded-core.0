Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C5AC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NIWtYoGW;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056866; x=1677592866;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1qxKxBCq296nOJfX6sagBgIePMEviRFtM1fkFVdJE5o=;
  b=NIWtYoGW87NfwhRoFlw59gZHxQOGBNgUh2puxpJkzcPqHpQK6bQhdv/J
   35OfRrV9Gr3ztYQjw3vOKnfMBJefP74jXs8wteFjMKleSot3w/TLpUBpN
   rqSfOQoiUEnSqSGczGsCy8rOjsO/jSC4xpm8AqR71VwUY2ZkGE2DqxDU6
   ZecB0X7dRCPKqpRI85R1t3v1QZiBlm18IS+2rvkta4lUPFQMdgWM/bW0q
   pPfWwtAG2bbTiL4jmfMszcHq6IOW0lAh5UsFNrfEvqyA1pDEqJHnc9hvj
   ol8p+mz3DTczsEDVr1s5ltAY2/ecaOdL/qiN/tsFdmoM9/mObaOJdvcyF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857122"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857122"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092444"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/39] gstreamer1.0: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:06 +0800
Message-Id: 
 <03bab61a17a513f79ec12d885a22a988713928dc.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162472

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
index abf68be785..82fb476a47 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-meson-Add-option-for-installed-tests.patch \
            file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
            "
-SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
+SRC_URI[sha256sum] = "4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


