Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE49C54E59
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8418.1709105610013304442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qZNb62Hm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105617; x=1740641617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CMJaf5eDh3u3AHL3iKDyiBGQCsOH7IY3i6L6AEFau00=;
  b=qZNb62HmCOZD9wiVLzdFnw1F4Tsb4peAlYuJwkK4nFWC/nV81VxoiI4t
   1a/12OveBupPRQxNk9xdCX58LCVjcxZbXiK/TdF1yY8Yky4klcH8Q4nwq
   ZOoFnebPJH2RuLcb+KAAa4gTZ1KNo536yzYnJ7vyqveZMliesGmuo/iLU
   LLn2rDJxtEFZDUBvlrYH5L4R3rrKgMei5NHsLsD3pbA5KUSayLVGNsx5X
   HLWmqvcby9HOf1vzn6xs7BH5aDK0nLWmbWT/DS8NhLSHmDV/SQgJDgQZ3
   CJ4twrUc+m8VB7NTcPXRC9VrQKHnbWDbLY2R/L8zAUMbwi2s3qOm2jZIh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="152444765"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="152444765"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 56884D4802
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80569106EED
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 05D872008FF8D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A2EB91A006C;
	Wed, 28 Feb 2024 15:33:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/48] python3-dbusmock: upgrade 0.30.2 -> 0.31.1
Date: Wed, 28 Feb 2024 15:32:39 +0800
Message-Id: <1709105575-24259-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-0.921500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrGngTdFfYoLzk6Qbi+9i6Dwbo
	TDS3zulAfbfCU7Sb6U4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSzP7h7lOBna2AhBeNJICtc+eBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtqjRCdGLhipYLricgsS7Bs79ssnHBvDDR1Zwzul/M1kk5xzkpDLVojTipl
	i0X/EfXQme8w7tuTuNL39nfjtROW6yHFvguELY3HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196357

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-power_profiles_daemon: Move back to original D-Bus name to avoid breaking compatibility
-Add upower_power_profiles_daemon template for version 0.20 API with new D-Bus name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.30.2.bb => python3-dbusmock_0.31.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.30.2.bb => python3-dbusmock_0.31.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
index 8e1f0f93fe..fc32c6bbb6 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "1d7b3794af7b280942f7f6cda4d8bb5d17d8c7216000825cf8b43b6af8792d7d"
+SRC_URI[sha256sum] = "b23b8e1b51fe2a9b13e617fff6b60b3ed8e536c080cf3498019d223678d5ea49"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


