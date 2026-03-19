Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BE7108E1F3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:26:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8842.1773919571965920380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VhvADoop;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773919573; x=1805455573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oDzUquEJ1Fx35DxNDz098yMTDlXHiT3gsIv17IYrIyg=;
  b=VhvADoop3/6m/XpBoLgL2mC6gGyEleiSuqg3pL0CmUhSBqOV1+6Ip7NW
   mKX5XY3HrA7xeNTNRPvDCOkH4Db9cdxjBxJnkTLLZS1cjfIFXKLu9ZC2m
   nMUk2gEMmSFwFKutwObo/God1kiHk0uIFv1sdVaIg8bMtbX3PSLYG/xh0
   OVCQiy9kTVdbzuKQOCxiCzv+9hpaYQ7VVEpYQQdsVlcxbp4/x46ycgy4W
   WXUe7KCL3c8OabRDDd91yJhNVK/OPlJW1YtaEjYuNb2prcErR8+vOCXV6
   tN0K15Sj2bg7UOaypVDkp8IvSRtazZWPeCySvLTvU6697Iq//iiJu0DdQ
   w==;
X-CSE-ConnectionGUID: kGQ7OCi1SAO/hqsC2s/AVg==
X-CSE-MsgGUID: 44XINQJxQkC4PCu8X/PnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212702261"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212702261"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:11 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AEB0C1C166C5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 634DA18002D5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7840A101E523;
	Thu, 19 Mar 2026 10:14:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/40] erofs-utils: upgrade 1.8.10 -> 1.9.1
Date: Thu, 19 Mar 2026 18:13:00 +0800
Message-ID: <20260319101332.2067-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233517

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{erofs-utils_1.8.10.bb => erofs-utils_1.9.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.10.bb => erofs-utils_1.9.1.bb} (87%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
similarity index 87%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
index 3964ed8f5a..03bb718b44 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.10.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.1.bb
@@ -5,8 +5,8 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "51b5939b5f783221310d25146e6a2019ba8129b6"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
+SRCREV = "d3fbccba6e409c100843563b416c47cd82c87ca0"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.43.0


