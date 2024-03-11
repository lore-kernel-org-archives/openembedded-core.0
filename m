Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583C1C54E68
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=H8uB/opn;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146412; x=1741682412;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tLtSRNsG625n2HaenVsnmVYiYnPT1ZGtFUzdgm+UHUU=;
  b=H8uB/opnHJPNNkRdHULA79MMJtyDjQRk2DAw7pqlH/R9rrwCGupZ7iOV
   k44nf02XjtM4ZSUJzzTk/4YxewXb4kF8WSwOqATnimK5XSa9NOMcMnTxB
   hK342/RemDLD+JDdsdcreqnzNbL6RNBG+tH9XNUj6/LmBnAJiZwHVca9X
   HsNgy/du3ntaLSDrPjZ9fBaFs4kQzkVTK39/C2I7vrdbHBzH2SHzPqOBV
   mSR3qP/coU23r1ZsmiAO6DtY0oNKCK2d2C9XQag0Td8iCCHNQME0kTa8h
   9KwkG7h3fjAuecKZiRkL3tnk0kmiX0Vu0f5kFcJcr+JU9PgMGAkNbAfnq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656126"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15593990"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:11 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 3/7] python3-jinja2: upgrade 3.1.2 -> 3.1.3
Date: Mon, 11 Mar 2024 16:39:50 +0800
Message-Id: <20240311083954.418271-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196922

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix compiler error when checking if required blocks in parent templates are empty.
-xmlattr filter does not allow keys with spaces.
-Make error messages stemming from invalid nesting of {% trans %} blocks more helpful

upgrade include fix for CVE-2024-22195.
(cherry-pick from Oe-Core rev 8a0524464583d69df7746253f5020c2c125a8e1f)

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
index fa6d930a9c..18057809c8 100644
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


