Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A4DCD1286
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7936.1711413454417569341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BNySY7l2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413454; x=1742949454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hVyP7C/UaAcWuc1kFdd2mf2CiLwFlVlvIwkBto1DZOg=;
  b=BNySY7l2ivrq0WLG13MlIaMdJ92ubeOKmKAcbqOzpWaG/pCX8x9eqsU5
   X0EhPU3f9sGi9knCtGvyGbZTeDCoi1Up9kbGEyh3Gnu2LqNfjW2i7ART0
   vVqpfEV/7qRZ9f5hBEp/6I5RF/VquIMIIQ9+oZjCRfTc5f9t1wEL351Up
   ro+1Vfb/m3DGdUtpxE31Xx93k5SHurPyHEW+XKBMrYcKLpusFuYUxEbxs
   Ny50BAXZbw7x7nH5VJdHGVVU3xtfYCAcaAxOaN0hmzU4GJL2m20l1BAMV
   8bntSWFc/8P7JpOosoYMpBD4ye5FhaVFwxFbqa0yCBcJE769k7ubsI1nV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153607382"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153607382"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CA8FCC21AA
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3BD6D5607
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 934C1411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F2BF1A006A;
	Tue, 26 Mar 2024 08:37:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 15/34] libxml2: upgrade 2.12.5 -> 2.12.6
Date: Tue, 26 Mar 2024 08:34:33 +0800
Message-Id: <1711413292-3025-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--6.283500-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyslsQ9ktMX8f1o7
	GAJI3HBl3Cf0YV7w2OcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0nvPrWB/m7DX7nX/pa8NQkB5blhnExvtoqxlpnlQFCyh1nWjGf5iZmIjSdnJC0YNlGbV4
	X+HXCyWYNLeUDt6RSEeTjw/FyRX6QfE8yM4pjsD3AruZnjhopuxkmG/IILlDN2CRFHw6Iz/yAHA
	opEd76vXR+5amuM3JS5iH/WcNTbzXdfRKYjOwRuWlECLR6uuU44LsBJKhv2hg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197505

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- parser: Fix detection of duplicate attributes in XML namespace
- xmlreader: Fix xmlTextReaderConstEncoding
- html: Fix htmlCreatePushParserCtxt with encoding
- xmllint: Return error code if XPath returns empty nodeset

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.5.bb => libxml2_2.12.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.5.bb b/meta/recipes-core/libxml/libxml2_2.12.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.6.bb
index 47c1a72e77..14fcff7fa4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.6.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
+SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


