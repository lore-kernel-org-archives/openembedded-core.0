Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D934108E1C7
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7754.1773915342134998005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lCKzQvhJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915342; x=1805451342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nqK3DVMj2pV7t7kOv6qpiLA3yW7lhvJuY8WT1WIWc9c=;
  b=lCKzQvhJwasmCfrVd60SG0xF30MyiLZM3cecOCLiOMW+NYrUQG3y5kpY
   fPrEDzuR8VkNbH0kO8hMqesOzlxhf5wUr6WIuAPl43CmT5NHRFToV4/Ke
   CnrsZV6NcWHBMR7KTHkI67mieVyjCSR+wNgfGag8nwxgiRWNf8ARrcmIY
   Oq+y1BlzrPGkksxXl55mcHHTFdHXGjUeo/i8+BJk1r+Q4VOQrXJaM/D8B
   rswE8CtpySjKlqY62oMnaovfQWtLmWegmFtJy9x9eBUpAyGUWJtnOcXI3
   zh2EIgVyNTiaThudLPNUnjSqWBmBqqcVofJ35a2FNkeH5YRxlc1M9+auD
   Q==;
X-CSE-ConnectionGUID: BRNN/FbaQvWGNPN5U3HFNA==
X-CSE-MsgGUID: P8aht2AdSWKZSevEtgW3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221352265"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221352265"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:40 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AC6261002B81
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 62BE68D29D1
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6890D101E523;
	Thu, 19 Mar 2026 10:15:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/40] taglib: upgrade 2.2 -> 2.2.1
Date: Thu, 19 Mar 2026 18:13:31 +0800
Message-ID: <20260319101332.2067-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233497

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Support edition, chapter and attachment UIDs in Matroska simple tags.
 * Avoid duplicates in Matroska complex property keys.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.2.bb => taglib_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.2.bb => taglib_2.2.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.2.bb b/meta/recipes-support/taglib/taglib_2.2.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.2.bb
rename to meta/recipes-support/taglib/taglib_2.2.1.bb
index 55a3d9d72f..9f5dbfe9cb 100644
--- a/meta/recipes-support/taglib/taglib_2.2.bb
+++ b/meta/recipes-support/taglib/taglib_2.2.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c89e7ebd450535e77c9230fac3985fcdce7bee05e06c9cd0bc36d50184e9c9dd"
+SRC_URI[sha256sum] = "7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


