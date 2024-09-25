Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092D1CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9314.1727246983620399432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TYI2KbUL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246983; x=1758782983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VRXKbxL5v9xq3ria0xnxE/ZgzNTO0Omf1iGXLsCeGVo=;
  b=TYI2KbULNd8QOcjVKcGKPd9ysHgqeZ5qddkAxXEu+CXackY9GTcjTZgV
   ovSaK2RbDnz8eJsMUd85MW+v+7t0JKYUKiMITSzd5qsSpHX8r8LvPanpo
   YRgRrOgOqDWNnBesDhf/oVNybJes5m90sEVg1cZYeCHVhMxPzjkkEzRye
   +MV5yR+CZSj1d35R9mrmUZfVeaL01vAeFl7EswCCaK3UBoDWm2FFFzcjL
   vPW0LJbBja73opdLl7SdpIodzHHrUGPRUwGbPlmdZ+kXTe/EM8PtIm01P
   xou0FgykVzu8+12pLLzaE9W+Q/GLpmy2AbEU0KtNYrBhAm9GsqNXFEfYo
   w==;
X-CSE-ConnectionGUID: rFy6igmkRqCE4PRJ0jA8Hg==
X-CSE-MsgGUID: 1SztbIEsSfq2IEFbtq9p6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="163052367"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="163052367"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06066DB3C1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FFCFCFBB1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CBEC4401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A66F1A01E9;
	Wed, 25 Sep 2024 14:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/47] iso-codes: upgrade 4.16.0 -> 4.17.0
Date: Wed, 25 Sep 2024 14:48:46 +0800
Message-Id: <1727246960-20665-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-5.376200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy00Np6N3vSVv44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uYJA
	+HBwSFidPtF2cONTJAjrmb2Z4b9ZLSWBW3bHemjCeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaAKY1KImek7czT/rQ1G1z3r788DQCZqAnPsUXt6LovU13pe9iO8k0yS+bhU4jqUxJchC
	C4Xk7SEykjyffR9u9LlT26zsKN84b7rweoAIK8o
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204903

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add letter 'g' to conversion script for Tatar
* Regenerate cyrillic Tatar from latin Tatar
* Update Romanian translation and remove most pre- and suffixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.16.0.bb => iso-codes_4.17.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.16.0.bb => iso-codes_4.17.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
index f33cce1a9d..bba2cd9de1 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "c2fcaadc832ed9f858950a43994973442d85ef4f"
+SRCREV = "0640070a001ca6edfa8ab6b61fe3230e66b3963b"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


