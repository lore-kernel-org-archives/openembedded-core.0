Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D4EC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 10:59:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.35810.1697194781037847552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 03:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Jv0fCKyG;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697194782; x=1728730782;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bQ9E7DBTkfxB3NFcQPHnr9g7fCs3vsDnXSUpBKJcUiY=;
  b=Jv0fCKyGjO51SxqXW9ztUWAmXkIS7RZ6p3upsD8ydPHJ7Q3kSQb0hpWn
   zHviWqOu2KWDIZFTxynDnGAgmI0h2nMr0mbQ3WWvVAU4zlr0jGU4kpYjS
   89l0x1wjIb9jetQnxHq5S2ayKL9Hch02XeltR/uTh6xvhCothMldZyuzC
   MqjgUtW+mV8aMZSzf89EdUwBhnTj7B0BQBn3+14c0YlBDk+P3aDvBmJGW
   NjJHwZIDxCobEOrYkCWVr6f9DaV2ugTJlYsMTSNtPVIik6heY+2PCg/0v
   4FrWHIGMdkPGyZtfwZ1kN6L+OloNWYoTpDaLGUQrpw+/9DUIVqKcH+/zJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471389777"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="471389777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928385165"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928385165"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 03:59:31 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH 1/2] python3-urllib3: 1.26.15 -> 1.26.17
Date: Fri, 13 Oct 2023 18:39:53 +0800
Message-Id: <20231013103954.2205925-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 10:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189061

From: Lee Chee Yang <chee.yang.lee@intel.com>

1.26.17 (2023-10-02)
Added the Cookie header to the list of headers to strip from requests
when redirecting to a different host. As before, different headers can
be set via Retry.remove_headers_on_redirect. (CVE-2023-43804)

1.26.16 (2023-05-23)
Fixed thread-safety issue where accessing a PoolManager with many
distinct origins would cause connection pools to be closed while
requests are in progress (#2954)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
index d2de7c4c02..57b166870a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
+SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
 
 inherit pypi setuptools3
 
-- 
2.37.3


