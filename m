Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11834C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=goUMN9p2;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530505; x=1732066505;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SSLydixZR63+1gIifQ6cyx5y1AV+Pjuq/33M+5F+Ogc=;
  b=goUMN9p2bMEhUtr95d7TIpLQfZWj+hFElqLyZt/oLN6YfTdA/PIU7/lG
   tjkces/Aqp2itoaxW5xZzTS6Hne+qmTFrRNNwW9CD7nK4pLFazPqV61Ft
   mLXzl5DyRc0r1B6w+6aHI5i670hm3IJ7r8KN72R2mqdYLADMNRm1tStDB
   tvOl4XiVeI57byZeZoGC6V/SZ2H7KQBUarnOFKNzfPTQUkPMw7nwpW1/p
   rpFQIVClLQ/llVnS6U6XUroVXnv1RPYmIeHivRUvVdH5mg2EbvZpBCSuN
   apiEHpae0w3iFF01LDgo+BiNRp79NVciJJPqJW9VBX+ESq1pMj46wMZjP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584391"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584391"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952192"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952192"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] stress-ng: upgrade 0.17.00 -> 0.17.01
Date: Tue, 21 Nov 2023 09:34:48 +0800
Message-ID: <20231121013448.8478-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190950

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.17.00.bb => stress-ng_0.17.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.00.bb => stress-ng_0.17.01.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb
index 4dc9c1713b1..b6fd96d8578 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.01.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "b5f33cfd1d9d5fccf6b34a9082d07e86c909b05e"
+SRCREV = "c9669b041eff5905da191974ba0102208a59e04e"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.42.0


