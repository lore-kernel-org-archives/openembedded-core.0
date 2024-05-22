Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63023C27C53
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5676.1716369346365410183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=li6t3njB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369346; x=1747905346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ob8gwew+i0w+MGin9aAMalzQr6AKInXyZ8yHUr+Jlps=;
  b=li6t3njBHuMaDYeL2A+ht+eZkRH6kZUBt8JWhuv18jGDWnuGKFm+zebL
   ATd0JcFz2PpgCMe3QRDkb3yKBlnzmjc+EttJNcI4H2ObqC69osWTcTv0P
   gewA6/Z6eVUCqzccaAMZuHFkhV5YuQzf4yGOP+QXGzOem+d51oNoDwNCn
   eGfcwroZRTtzDPdBJTAIdzi1euS0vc577GK7aEPX5co5qYKKUXUdKLswX
   zuxuNecyVw8/OGs5AOhMDwIupDKmjXtSLT49kOxjWg1HC9Nc+1Iio+gpk
   TsDfMsiuBl/qOJ9onng27kmVMKw7oPdKRcYvQHcGhWZNLAT9tjhlmFg+e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159376805"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159376805"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2774D2AE7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BABCBDCA7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CA3420097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4981F1A000B;
	Wed, 22 May 2024 17:15:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/42] python3-lxml: upgrade 5.2.1 -> 5.2.2
Date: Wed, 22 May 2024 17:14:41 +0800
Message-Id: <1716369289-22526-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--6.848100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mra9qiaDSLgo2b7QqAvqLTukkS
	zx2E9sLTKzFPIYHt94JqxIBA+EkMG+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3DW0
	xVTs41PJtP/8GqgnfXCOfEA0lzZmyFigEyBWPrdxD0PVvLLUPc
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The test_feed_parser test could fail if lxml_html_clean was not installed.
- The minimum CPU architecture for the Linux x86 binary wheels was set back to
  "core2", without SSE 4.2.
- If libxml2 uses iconv, the compile time version is available as etree.ICONV_COMPILED_VERSION.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.2.1.bb => python3-lxml_5.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.2.1.bb => python3-lxml_5.2.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.2.1.bb b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.2.1.bb
rename to meta/recipes-devtools/python/python3-lxml_5.2.2.bb
index 44a10505f3..e5a22e7090 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.2.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "3f7765e69bbce0906a7c74d5fe46d2c7a7596147318dbc08e4a2431f3060e306"
+SRC_URI[sha256sum] = "bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.34.1


