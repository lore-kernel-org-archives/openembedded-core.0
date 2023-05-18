Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3DBC77B7F
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:31:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5731.1684377084465781346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=HHxO/M2y;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684377085; x=1715913085;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=y58AD2Q3MstbTPkkxaEwP4E2hYCzHxJQUH+Y7tOQsvQ=;
  b=HHxO/M2ylq17i+oybQRpc9RBGqp0ybLoacpUnVI4v6lofkpr52TJrA1S
   puwG9U2pyr1HJpAACf5tn4/7gT5KpEJvPYAi+MiPKEPohMM3tqQudJWVj
   57obj+oF1H1Mcoo7EiePyv0/rnKsNX/GKq47iErskLth9A2Tobb7jB7Wz
   jTFLpYbb+aCRYitSAlK95/RH6zSC40Pia3yePDZE7wM0X+gpZhShk4rEE
   7p+Rxc2v9+bBD6vRAkcNiCBPpQVgBzPPVP5qK1PQCXfvcPW1E+oJZubHk
   ck+qbpluekvm3OMSyrdoNX3zBpgDAu0rQ2/u3UAOXuReJ0sry/ZYWZWAy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336506804"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="336506804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732692995"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="732692995"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.171.143])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] harfbuzz: upgrade 7.1.0 -> 7.3.0
Date: Thu, 18 May 2023 10:31:15 +0800
Message-Id: <20230518023118.16406-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518023118.16406-1-anuj.mittal@intel.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181508

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_7.1.0.bb => harfbuzz_7.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_7.1.0.bb => harfbuzz_7.3.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb
index 71c92c64ef..7ecbb04a6a 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b"
+SRC_URI[sha256sum] = "20770789749ac9ba846df33983dbda22db836c70d9f5d050cb9aa5347094a8fb"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.40.1


