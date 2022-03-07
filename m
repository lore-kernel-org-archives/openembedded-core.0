Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE77C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26505.1646662420742202043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iygk+dCW;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662421; x=1678198421;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=S2KopqdWumbAYkI68SOaXbI/0U3srwZ96QYLvRB0dd4=;
  b=iygk+dCW3WfQgfIrX0zNyycbFB8OkPD+EYjKQpJ8jTr83lzYfg+zPk0H
   s///Z7v4WlsuxshwE3Yh6pA0dDr2zynZOz9ygUpFLrmsn/RIiBGzIPzjF
   Fh+OFU96JIuy/ZaxTRYnFxTK9sbTyq/+3Qz/czO25SgLYhtu9CvW6d7+R
   H8Poix+82Y7j5SeSovUQDDZ9vn6lEIyw7mx8dsvfU/cf52vPLx6aO3zvO
   MA96vLPLqKNlfOgVN92iNJFFcgV9aaYH8vDAxg+3g7Q5JvhFBfAl+rGss
   08GkA/YCyd3iKpBeQy7oBi8qSLji7t5YyHQIxOulCxV31NPOkG2sj56y+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112441"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070788"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/25] libarchive : update to 3.5.3
Date: Mon,  7 Mar 2022 22:09:40 +0800
Message-Id: 
 <4f4a32a7f9ab3306f0de26bedf6b77f3aba86cf4.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162825

From: Lee Chee Yang <chee.yang.lee@intel.com>

Libarchive 3.5.3 is a security release

Security Fixes:

extended fix for following symlinks when processing the fixup list (#1566, #1617, CVE-2021-31566)
fix invalid memory access and out of bounds read in RAR5 reader (#1491, #1492, #1493, CVE-2021-36976)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.3.bb
index 385bcef6e9..dd607aca0a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
+SRC_URI[sha256sum] = "72788e5f58d16febddfa262a5215e05fc9c79f2670f641ac039e6df44330ef51"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


