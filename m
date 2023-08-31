Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE728C83F19
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:36:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8484.1693449359070262890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109449382"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109449382"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:35:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED891C53CC
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:35:52 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9C2D948C
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:35:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C9AE86C8D;
	Thu, 31 Aug 2023 11:35:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxml2: upgrade 2.11.4 -> 2.11.5
Date: Thu, 31 Aug 2023 10:35:34 +0800
Message-Id: <1693449334-27968-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--1.631400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrBGvINcfHqher1gUu9f1F/+aG
	g/Bit59tolRGdbDVj22gGOZ3m2LY5+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKL/KVtfZiSDpqY70l+keWg+Dytg73Zv02axlpnlQFCyh1XgGeVUh3WdmyiLZetSf8lBgw
	5G4NYCZN9pjzubZ2rHJ0RPnyOnrZJxv6r/1wi3NpOj6+IxLMoSE4al+tgDB4gwSfjc3Q/eTSIka
	JowebonfqLoP1ygnM5gZuu8reG9YZze3zJNl+D9C2JVpZOoUC9Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186942

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Regressions
---------------
- parser: Make xmlSwitchEncoding always skip the BOM
- autotools: Improve iconv check

### Bug fixes
--------------
- valid: Fix c1->parent pointer in xmlCopyDocElementContent
- encoding: Always call ucnv_convertEx with flush set to false

### Portability
---------------
- autotools: fix Python module file ext for cygwin/msys2

### Tests
----------
- runtest: Fix compilation without LIBXML_HTML_ENABLED

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.4.bb => libxml2_2.11.5.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.4.bb b/meta/recipes-core/libxml/libxml2_2.11.5.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.11.4.bb
rename to meta/recipes-core/libxml/libxml2_2.11.5.bb
index cbf20504f8..4cf6dd09a9 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -18,7 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7"
+SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.34.1


