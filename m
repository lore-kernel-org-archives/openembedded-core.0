Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3283ECEFC5D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9173.1728452976699233839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OKsCAlBq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452980; x=1759988980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NKbvEvUJmYMnNYWLCw4GYVBBEQtKYuPNc1MKrsSVPIs=;
  b=OKsCAlBqOHJx8QvJ2E5eLkC7i/kHmbtt9Xi1bNx8AGqZzfE8wb2Ibq+z
   KywaFdTp3T5vZvvETb+xCF6bPhjKmQ6Fp39R0m4cXQGP4kVAYZRMk9or0
   eZDPZoDrZTJdKVB+1771ga/qSDSxwhRp5H0oeq3Wo7VpZbE/SBHi/Q5Fl
   WQaQnVG+/6odV0PREvFfSWYlKl0jIqlNQ4PEhALV0Vd9tIYPo9Yr3Ilzs
   c9CUIliRJLyNoJAuMJf4RIySnx4oQpnKXrNmfVTao1XrpVGvyVQNRXcUG
   1lw2+jvL8cfW43kaqwdDRQ1bsN6t1dT44XSgL6nZ5jmpL/vyC2pEIui9P
   g==;
X-CSE-ConnectionGUID: Dr/gCD7oTLOOEjQWx2Qp1Q==
X-CSE-MsgGUID: zkBoRZ8tTnilJb7anFYDcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="163622121"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="163622121"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 789F9CC142
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF14AD73B6
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57694E5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03BA71A01E9;
	Wed,  9 Oct 2024 13:49:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/26] python3-dbusmock: upgrade 0.32.1 -> 0.32.2
Date: Wed,  9 Oct 2024 13:49:03 +0800
Message-Id: <1728452955-25051-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-2.635500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrk45XNF39dU5L77JzwgjIL6B8
	tGwEqyga+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSzP7h7lOBna2AhBeNJICtc+eBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNf4rkQ5lIuEPPD3Pdn9DJCk71jupOLL/urhG9AiQkXIcy63PZ43s68Y+VKwkMuBRsu29b
	UUz+ZfkcqOqbcX5OR7NsBmb9NH6xvzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205323

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- all templates: Drop wrong variant wrapping from all properties
- tests: Skip TestNetworkManager::test_one_wifi_with_accesspoints with NM >= 1.49.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.32.1.bb => python3-dbusmock_0.32.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.32.1.bb => python3-dbusmock_0.32.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
index db7011831b..436b82d1a0 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.32.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "f02c34493d420b3cf2d8d341b79a60841593b7b7615adc3ece17ff86f8275924"
+SRC_URI[sha256sum] = "357c269d53a5bb3f87983bec7ff700a0c4d071481f7cf7221ec8376224fc4316"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


