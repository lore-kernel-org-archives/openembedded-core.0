Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC75D5A6C3
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.35682.1732584617878888554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sXNIxChz;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584623; x=1764120623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Fvz27Jme778Qm9NFEgig796HIII7REmKMwPH6ugXVdQ=;
  b=sXNIxChzjbNksYK/MFYFx1puVLB3Rkg5rcJ2uR4iAJgShrTIRkoCsxH4
   1c/GIkYItmRJcrcqxO/GIEwaeT/hD0p2blJJrS6SreJAKJ9bOt8leQWL5
   RAbCF+wpg2620LrifgeeNIeqduKuy38nZ+4ZC1LvXv28wKFrAXdJXp5vi
   GnWKACUT45Ctcb+4J8fU6kIQ9M2zhNVpjFXvXXZu4Fpg/+0kZLwlyupnE
   m2+FoF6xM+bfoSE2V6n7rUKdKJBcxE8n0TWg9bWDWjx7OYwtNK6ROj6kn
   zkX7fLg3R+SiB01xm20MDkDlyyzYQeO4zAHm9iyKXqtdh09VtyBKfr55W
   g==;
X-CSE-ConnectionGUID: 50tXgBmRRsaeUcBTzToCkg==
X-CSE-MsgGUID: THuWIaJrRiquamka/JZW1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="160592040"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="160592040"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E141C2260
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06A33D562A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FE372007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F6BE1A006C;
	Tue, 26 Nov 2024 09:30:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/16] python3-hypothesis: upgrade 6.118.6 -> 6.119.4
Date: Tue, 26 Nov 2024 09:29:57 +0800
Message-Id: <1732584602-4785-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S2WrH1WkwDOBhe9NW3l1J/4kjW1lnW2bCR3RSXCmBcFsYC+
	M1fTaZh3Yp+O9wFA+DvZ5kcEmRVstv5LI3/JjpsPECdGE/5jHZS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207817

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.118.6.bb => python3-hypothesis_6.119.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.118.6.bb => python3-hypothesis_6.119.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb b/meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb
index f5f7642d67..66e7b2e967 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.118.6.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "96e7d86034658100f50f3150917bc8a0cf7ea94af49d36efb167cb8e66f035db"
+SRC_URI[sha256sum] = "1a7d12709c0e96c1d85aca76d1594b34b5958623e00511592eba674acd4f3392"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


