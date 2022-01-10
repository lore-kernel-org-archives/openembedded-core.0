Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51C5C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:34 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Ed+BUnQ2;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787773; x=1673323773;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RYfXrpMQubBtvgQclelVJyWkHbo6HS7cNzRhXfkR45Q=;
  b=Ed+BUnQ2JHUrBOJvkneqrAFE4msc5iHTSB25uT4RRWNup+0tSgfS1YIf
   RLL9GpP/krp7puNzVf12C8Oeq6y/Zhk74dLkAwLUXek5k88PsBd2eTgxj
   /tFPpaWtxjPtKm4EmaMHGJcXaLm9w1jcrGhtcNBAUhCDLPLRYmHvle5av
   YtS0eEyoIemSLydNm1+wT/ljeqs7teezqguh3Rqo8hYWdcUT4NyPFB7PC
   m70vR1YtfTnVZ60QfPi3pclgGUboRHhP5/U7cG8yylXOlvH/if4ByX+4N
   8lQky+1W9kWHhvbZFQIWZaOQmcMo3uWRDryIqwCIon0NspNSTAOsXh08Z
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347385"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347385"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402253"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/10] vulkan-loader: inherit pkgconfig
Date: Mon, 10 Jan 2022 12:09:12 +0800
Message-Id: 
 <6b44cf1e7a0f6ec457dc8c7d8586a79b92379acf.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160329

From: Markus Volk <f_l_k@t-online.de>

this is needed to get the vulkan.pc file created

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1eaf810efca0dd8be5d561bab46c1998b96061c1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
index 41632f25ce..984dc1253f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-inherit cmake features_check
+inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
 DEPENDS += "vulkan-headers"
-- 
2.33.1


