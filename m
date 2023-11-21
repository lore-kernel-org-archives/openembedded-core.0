Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A457CC61D93
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KF8BZlCP;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530495; x=1732066495;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QLctvnmc7hLnVi0PkpbQVadvhQffKAWdsGY4VDFe3l4=;
  b=KF8BZlCPSa1nFZrLLxq/v+kaK8DgI4ozjomHyuve6y7KstppJ6zy2C0e
   JuH71pAqucUr1g+5b9CSdnmREy4TmLFnGEuK7dzT4zF3BKWiXUxHyovrj
   L1/lWBo0/1N5tAeUGFvArP49xUMJcCLUiQZXNvW0LTExs5TDAySuLN41X
   uF1P/n7W20EU3rR5CYgUIBm6wCOFmvPublWlDCdMLNHV+h3fg+q53tb+t
   L7fI+P61RAB7AIywUgYt/4AhsomtcII3mm1GKWcjcU4MiCl1VYmdXWE9A
   CSv9k291V/WPwhLKuLOziFRw86a9uqnHA9KfFjBx5sxMUQu8V7MKPDEMb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584376"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952137"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952137"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:54 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] harfbuzz: upgrade 8.2.2 -> 8.3.0
Date: Tue, 21 Nov 2023 09:34:40 +0800
Message-ID: <20231121013448.8478-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190942

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_8.2.2.bb => harfbuzz_8.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.2.bb => harfbuzz_8.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
index ce1a6bed65f..d733342682b 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3"
+SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.42.0


