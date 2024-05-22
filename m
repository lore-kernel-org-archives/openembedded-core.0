Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB39EC27C7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5643.1716369333968958930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BHUDdY+X;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369334; x=1747905334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2V/8h0RmpCG9R+VH5oVdrVLAM5JNG8mJY9b86YD4i5w=;
  b=BHUDdY+X63fxbqf4xZKGJUYau9IOC6OUml57wsocn5lGKUveCte5dW/1
   YzNd+/c4FYVECeWpRYeuL+QzUl+NkJFHN0nLq3msdzXBYue0rTiUk3UEr
   45Wu33LVHGK8uazU0yJXwjx+4QVJhU9Bw86j7xe/JzoQ4jRTgdXTI7tbD
   ycgvcTMLe5JfTfNhk8jl2VwvBcDeV886/BuH0t3wX3ZrjWgKugr0viA5C
   cRmEL1RBO6JnzinHoiH7GAm2CjxBIOHeZBGvOxlwsvmTX3/6akW/1IFww
   hFyLm07DMwl1cowCxfIjeGjbg0mn8YiT74QmsGJdqvMwGzd+U+6uCKIFs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147548972"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147548972"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 519B1CD7E2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F219D4C32
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CCA12022B83F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBFCD1A000B;
	Wed, 22 May 2024 17:15:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/42] libxml2: upgrade 2.12.6 -> 2.12.7
Date: Wed, 22 May 2024 17:14:29 +0800
Message-Id: <1716369289-22526-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--7.333000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvB1z1KvCXwaBuN
	dBIs94gP2/h2l+b7G4ANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0nvPrWB/m7DX7nX/pa8NQkB5blhnExvtoqxlpnlQFCyh1nWjGf5iZmIjSdnJC0YNlGbV4
	X+HXCyWYNLeUDt6RSEeTjw/FyRX6QfE8yM4pjsD3AruZnjhopuLzP5snaeb1Qqtq5d3cxkNcA0F
	JZ8SIV5GNAGh9H/spTvnEdYEHHJhz5wqMvJ52WecD0hjITh1ss=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix buffer overread with 'xmllint --htmlout'
- xmllint: Fix --pedantic option
- save: Handle invalid parent pointers in xhtmlNodeDumpOutput

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.6.bb b/meta/recipes-core/libxml/libxml2_2.12.7.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.6.bb
rename to meta/recipes-core/libxml/libxml2_2.12.7.bb
index 14fcff7fa4..84601c282f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.7.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
+SRC_URI[archive.sha256sum] = "24ae78ff1363a973e6d8beba941a7945da2ac056e19b53956aeb6927fd6cfb56"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.34.1


