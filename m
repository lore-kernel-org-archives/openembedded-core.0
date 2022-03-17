Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA07DC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 07:35:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.7502.1647502517616720222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aHUqW9XX;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647502518; x=1679038518;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uVVbx727yMVyQoir2UZdEdiH3qmiWPzn7eBlw0KyKCg=;
  b=aHUqW9XXFso9R4JIYiLoy4r/PimoYnhjSN5D0l67otfHIU/y8osztmOd
   HwCUV5yxScDKP7Jlm2lNvWEAq/BTXH4xpmqOToGooKoh9a37Lo0R2Eo4Q
   N+STm7P/1JTkMml/5zr3U2cQ2JtK5iQIfiWw4FtRFeAXHyUub/JmtjbzI
   IbqUNy0cMbgjXebry5K7ciIKH9BJ0788i6MY9PKMQKilkSbHOFYXEdMFr
   LSB/qKaN+BpbmSselvJs9kkWMPCuEk8/+jyYsDybPuPA2vJdjJOrJ9Hn+
   SQLbj+AWC9D/o0d9q3onS1HXqef5EJOEUYGedV31As0updwdLcQZO3lD0
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236750494"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="236750494"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 00:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400";
   d="scan'208";a="581208458"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 00:35:15 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 2/4] webkitgtk: update to 2.32.4
Date: Thu, 17 Mar 2022 15:32:45 +0800
Message-Id: <20220317073247.4117889-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317073247.4117889-1-chee.yang.lee@intel.com>
References: <20220317073247.4117889-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 07:35:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163375

From: Chee Yang Lee <chee.yang.lee@intel.com>

This is a bug fix release in the stable 2.32 series.

change in the WebKitGTK 2.32.4 release:
Do not append .asc extension to downloaded text/plain files.
Fix several crashes and rendering issues.

https://webkitgtk.org/2021/09/17/webkitgtk2.32.4-released.html

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.3.bb => webkitgtk_2.32.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
index bab1c17902..3e0ecb4611 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc"
+SRC_URI[sha256sum] = "00ce2d3f798d7bc5e9039d9059f0c3c974d51de38c8b716f00e94452a177d3fd"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


