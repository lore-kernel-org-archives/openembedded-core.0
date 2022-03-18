Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59CDC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 09:52:44 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.7934.1647597163318962790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 02:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=L4LPOgct;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647597163; x=1679133163;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uyd5NRTer2W4PQh1dgB/XpyVYXntkD3z+ZwdfT6ncJY=;
  b=L4LPOgctQyCcRWywk3N1FeYaqF4Bc1rlAWWx/PdZdyocKbIDJAMzvtq/
   eJn9zZKaUoAnbNIxnLR5V9LOpf825cZ9mjK9RQOiKrc7DBdzl1Elez8US
   7wFjNCqGsXu25/TryagP4TBJpaMeq2wvBDfoHK22yZdL+7AD1HGR1tAc+
   eQoqpYz8j3m+dnmWeeMg/nRWnuKVxwPUcFaews7fne39cd3W8sD3ocdbK
   KXh/CFlHAP/c6ULqkAHt7huYXF8FhPZZKs2+NEE079J+V0vb6QY6EWw5s
   PpMwLPumvLtY29twpEUFtvGBu/kZ/Q6NOkII6Egrgd5sI+cV5fOCVGv+c
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="239266553"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400";
   d="scan'208";a="239266553"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 02:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400";
   d="scan'208";a="499181879"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2022 02:52:40 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 1/2] webkitgtk : update to 2.30.6
Date: Fri, 18 Mar 2022 17:50:10 +0800
Message-Id: <20220318095011.10438-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 09:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163441

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
index 93cca20d01..1fdba611ea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://CVE-2021-42762.patch \
            "
 
-SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
+SRC_URI[sha256sum] = "50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


