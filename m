Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B0BCD5849
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3122.1767781896664570006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HhNdwcLJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781898; x=1799317898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JEuAckGjWyZn8kvAAdNFxjqYZOU0Ava7IuXJzyKQYk4=;
  b=HhNdwcLJVaP0oZO2CDitqgt/mbhHu+1KMzdHEZX2albWG+C4Q/COnIBu
   EoUK3Uu0zEdOaiuiSfCfB/PnVrf4tDZHZW0ULg1NtsBaneLGJN56TtZHV
   aqbYOm9AOaQQRLNrf1wOARHWOEA3FVBcw4YTU/msz3zIqUvvXg8gsBZqD
   NCHQJEE6c7tkzhYrHP9JX8vDn0UT0JmddPzzTXGUm6j3lmDpgxxs4MvC5
   xdBuGrqObrrqmsDY9un+yjUiZDiTvaarQ+Og0O9ljG9Bt5mHtrJbs4Hu9
   kuaaLngEPj2yIcK1lv+aItO7mmWDx/l9p592b8q3FsqWqOAQzIelSd214
   Q==;
X-CSE-ConnectionGUID: 6ryQzp0PTLmUjtIsTXBwbA==
X-CSE-MsgGUID: 1ZnOgwrvRSC7VCbaozKMKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467878"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467878"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 705D51002B85
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 24A6114042CC
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 52914101BB60;
	Wed,  7 Jan 2026 10:31:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/15] python3-pyparsing: upgrade 3.2.5 -> 3.3.1
Date: Wed,  7 Jan 2026 18:30:58 +0800
Message-ID: <20260107103102.458-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228981

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Added copyright line to LICENSE file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyparsing_3.2.5.bb => python3-pyparsing_3.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.5.bb => python3-pyparsing_3.3.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb b/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
index e94bebae38..37d5b192bc 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
@@ -8,9 +8,9 @@ HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
 BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c8a9625037eff2407f8456010875183"
 
-SRC_URI[sha256sum] = "2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6"
+SRC_URI[sha256sum] = "47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


