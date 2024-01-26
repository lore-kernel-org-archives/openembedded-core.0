Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1840AC48285
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 03:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.7284.1706238894951339775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 19:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kanvEZG2;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706238896; x=1737774896;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sDoBJFbToJMN4ukOTxi1CIEVjMqdIs/YqWIsgqtrdO8=;
  b=kanvEZG2+1hrSKpBBb6HtjRoY+vh0EzhyhrOMUhD3bU5xoOV9/w1juiN
   GZ/rMYO7U01qVXrvqTu/tZOcjTsIr9bTlclZUe+hC9EPNOaYMNx/QFE1Y
   MPG3rElDEzTCHAO8EMfWTffZ0cIdtmZvPvwZYeBg/vulU9eiaunG1eNlN
   JvsL9yn4Q7IKEUbL8WeaN5dRqgsmuNV2eXl5nnbDGRUsxmVCfQ/WEe/mE
   b+K6fphydiWNJYbdCHrTn+DsS1aZ7yWqQy1DC8U+uvgsJji8JnxXB9C30
   4i90t50gb/Ad8Rm+bWVh/XcNMuTuGZLcDSpdQwTpDL1rMsqIvZzJpLubZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2266472"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2266472"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 19:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736553028"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736553028"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 19:14:54 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][patch 2/3] python3-jinja2: upgrade 3.1.2 -> 3.1.3
Date: Fri, 26 Jan 2024 10:46:11 +0800
Message-Id: <20240126024612.358182-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240126024612.358182-1-chee.yang.lee@intel.com>
References: <20240126024612.358182-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194342

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix compiler error when checking if required blocks in parent templates are empty.
-xmlattr filter does not allow keys with spaces.
-Make error messages stemming from invalid nesting of {% trans %} blocks more helpful

(cherry picked from OE-Core rev: 8a0524464583d69df7746253f5020c2c125a8e1f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
index 80e0b85670..068e21bf5f 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
+SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.37.3


