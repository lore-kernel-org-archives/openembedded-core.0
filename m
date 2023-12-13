Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938F0C41535
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:53:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.25594.1702439628421583079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TpvvSyJM;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702439635; x=1733975635;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gFyuvrmK9CZ4o896kfTSHtsmMko8KJkcFK3msaPPvz0=;
  b=TpvvSyJMxu/fvOG+aWAwo50kn++yAvQWSmsL0F3MDinbnpRpXwh9JyZ+
   ciXOkiQyrYyaqTHzmxFxU6hcb6hJrOiqeKRf8OEltNyv/aL8c6dLn29Jr
   sRaVB8Mv/jVSVZFD0PtEB3dKBJmqFLXwT+nak5LOsQPweBEDGYP4OiPvD
   oz0C09ptGo23dRnI6vBnXoqSjlHY7UoiMB1pHOYFN4j3224VptR+ZxeWA
   YAFOcyYjVjLNpCWjKXSkENXT4ctOZVdWliZeMA4OsKmnZs32+ab75tM1v
   GzDjCmXFZYzN2JLax5cf0+X6Hj+Rlp84j67zf4KvvEoj+Jdis3R0uAxFD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481109713"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481109713"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 19:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917523943"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917523943"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 19:53:50 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 5/6] ghostscript: upgrade 10.02.0 -> 10.02.1
Date: Wed, 13 Dec 2023 11:34:08 +0800
Message-Id: <20231213033409.2101308-5-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213033409.2101308-1-chee.yang.lee@intel.com>
References: <20231213033409.2101308-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192264

From: Wang Mingyu <wangmy@fujitsu.com>

upgrade include CVE-2023-46751.

(cherry pick from Oe-Core rev: 9492c2d51a08fbd4c107540a5a833b1a3fb70504 )

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 4bad0f86e1..18c296128a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
            "
 
-SRC_URI[sha256sum] = "e54062f166708d84ca82de9f8304a04344466080f936118b88082bd55ed6dc97"
+SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.37.3


