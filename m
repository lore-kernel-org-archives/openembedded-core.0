Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B310C78855
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9255.1727246985761968810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V1IMtq5y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246990; x=1758782990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h7Saezy7C1eCLocIQdj4IyKmfsjOaKldwioErDPrpTs=;
  b=V1IMtq5y/tDw8trF3jXPEnkBLP38BY0kXKPU/2rFxeRfxGuMSGCgrgRW
   vPqu/phT47aAm+AKb/zQ/WQ2558qHB/N0JLril8VABlGXEm9GCPYCIfd/
   paRCQ7bz3KLRuDqgFsCZdE5KcdOXzJy9XRX+9lbAyFZQunau76Q4oxTpA
   7Mwka2dmXDY5r/U4kSe4EkaxMDgDjBu6TKT+a1tvVpuOBTsAclJs8anUm
   nsZ8urd3UWnlD5VbnSRUqMWJbPrxxWWuyQFRbVCiW316Dm4aX3ThErPzF
   6wh+HScr3giqb3qA588RZvA0hxOyUXBxNF+zxgnYv+dCdfajpvOT+fH2I
   w==;
X-CSE-ConnectionGUID: jbVtTfWqQPi+lSbCuzhjGQ==
X-CSE-MsgGUID: RBCisirRTe6YY3dYfQ5s2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174697195"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174697195"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 37B3DDF238
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E4BCED8BD0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 781CD20086335
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 26D571A000A;
	Wed, 25 Sep 2024 14:49:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/47] python3-build: upgrade 1.2.1 -> 1.2.2
Date: Wed, 25 Sep 2024 14:48:57 +0800
Message-Id: <1727246960-20665-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-2.147200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwGptwt5mOunTTI
	xI7tqkhQugoU/6gQC0rqmKJ/MhsVL294Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRs1faBo9B2XHAqtvFe2ltMQHANB7Ry53UzWr65UQ2cMSkCSvChpuNoQiNManj82ktKnJ
	gn2hKp6/LrOhWK+BV9MEd4g43zEU5ltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204922

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add editable to builder.get_requries_for_build's static types
- Include artifact attestations in our release
- Fix typing compatibility with typed pyproject-hooks
- Mark more tests with network
- Add more intersphinx links to docs
- Make uv optional for tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-build_1.2.1.bb => python3-build_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.2.1.bb => python3-build_1.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.2.1.bb b/meta/recipes-devtools/python/python3-build_1.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.2.1.bb
rename to meta/recipes-devtools/python/python3-build_1.2.2.bb
index 0156861201..8f2ee92060 100644
--- a/meta/recipes-devtools/python/python3-build_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d"
+SRC_URI[sha256sum] = "119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


