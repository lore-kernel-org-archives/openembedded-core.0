Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAAFC2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:38:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.181978.1692257922425150253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TzAYRjsY;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692257923; x=1723793923;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OX1ZM3PmunxesUnsKBa6HJeltFReN3FHdEGxxESJQjA=;
  b=TzAYRjsYswmf9BfU0YjNO0hc40JmoCp274QQ8eQLroV4sE2ffRfFW6mH
   3IZKzGuLguLL9N626fxcQcHiPBtIFYggSKypqE4F7468TZahsgjUPqMoz
   Y34KlVVmbSwAb9CNKJ8RkxoQLQ4i434CCg6p5/QlwXsKFLWOZ3SpwCnVO
   ckrfdGUZotpFO/YFvDVjbSF36c2Aa7xXjZr7YeOLdNsX+vmyoqDItQX7P
   Nl8sf1/s6R/EM5ZccvKx1L73ts6wvFFKfSfecTUkFsE590Ir8hAg48vNE
   deGZPvzGhStHhqenORC1g/SX/YE3MzvBVLuyujAYLzBapuhMqZ6JEgn65
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403720051"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403720051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734569781"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="734569781"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.150.235])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] stress-ng: upgrade 0.15.08 -> 0.16.04
Date: Thu, 17 Aug 2023 15:38:34 +0800
Message-ID: <20230817073834.55471-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817073834.55471-1-anuj.mittal@intel.com>
References: <20230817073834.55471-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186292

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.04.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.04.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
index 9952c4ef8a5..6e5665cc3b9 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "4fc205238518cdaf80cf18e8bd411708f7ba3856"
+SRCREV = "95777d7cf32de9fc88c452a968ae2ae23ed269c2"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.41.0


