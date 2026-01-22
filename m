Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF50C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:05:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33180.1769072724603454524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bTeKj2aW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769072724; x=1800608724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=38u++2MOAQihLONFE8O+9lsU4EGSS9KuMOa/aPtq6ls=;
  b=bTeKj2aWmOT/Q5fgAa7ymZ1cZLSJHrDARI2NnlVYEtStUIUa+FYAusEd
   cFkbol13JQOXq66Hm+iqmUNELt7XaTgqsIS13dE1SoXTLnEJJ0oVKH10R
   Zezpc8wEg/sg8vr02UkamZRs+a8GkBxLF+3Nk7eZ9q9YHNOn0it0IsxS1
   LvyOp9G8eC8HP+lZ7REur2324SExKLhm6PfOLFgzMsxyrkghiT8y/ZBUF
   E/YRuaMdLnOZtaJVIE+R/1qYcl3t9QO29dBPOZEOl18VtKxEpWjTQf/sP
   s+ykPeXrs2ajnyYygjTPt0NbF4VzTm7C8iRdUBKAFlMFqWmNLbMYY4BHc
   Q==;
X-CSE-ConnectionGUID: bLtGnulBQlqIVSbsY6s/AQ==
X-CSE-MsgGUID: fQ1lFAd4Tla0MorgP7rxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="214640543"
X-IronPort-AV: E=Sophos;i="6.21,245,1763391600"; 
   d="scan'208";a="214640543"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:05:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BE05442A303
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:22 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 735E0C00238
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id E0DE32000109;
	Thu, 22 Jan 2026 09:05:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 2/5] alsa-ucm-conf: upgrade 1.2.15.2 -> 1.2.15.3
Date: Thu, 22 Jan 2026 17:05:10 +0800
Message-ID: <20260122090513.888-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260122090513.888-1-wangmy@fujitsu.com>
References: <20260122090513.888-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229835

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{alsa-ucm-conf_1.2.15.2.bb => alsa-ucm-conf_1.2.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.2.bb => alsa-ucm-conf_1.2.15.3.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 1716ccf1e9..0ac51b6c5d 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "07b93bab13b2c54f4ecce1374efb8fce23a353d7e0038dd3c533a24825ea0ba3"
+SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.43.0


