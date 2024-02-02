Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE89C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 01:01:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.12634.1706835691280323686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 17:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XlS9A8Pa;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706835691; x=1738371691;
  h=from:to:cc:subject:date:message-id;
  bh=arEF4fflL+/ilG9kDdMskFECBzbhicQ4xCo6m5RUjbM=;
  b=XlS9A8PaVCBy+gbzKYkg0ro/XQ3fqeItw11BNbz81gDlCM0OuP2BZrfE
   RscYWSk5UWIA7BZj9fhQ4P7NPOQ8WL3pW4ROug9EWbxzm/D5VUzcPm5m0
   BSA2Gb2vr28mJyc4lgeeHUOropI2G+RKXzXFkxmbMB14kaKVdBOcmmuin
   ICwEwoaIF5iZxhL/7d+JsC3hvfu9feNhyQlWCi/PAPKoPzRUNFbxpdIdA
   tBZ4CTtU+8J+6LjLvZtBbNQh1d0w+RrPhZ6zd7GB/oCMqH/fUIjdcTvIY
   ye3+EVKgE1R4caEyHpDuzxx5pxoZ/KSUbTO+/3cRQeHr27I4aguO8eBp3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="127396961"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="127396961"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:01:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD7D0DE893
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:01:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 620382C4B8A
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:01:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9EF020074730
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 10:01:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 822061A009A;
	Fri,  2 Feb 2024 09:01:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinxcontrib-qthelp: upgrade 1.0.6 -> 1.0.7
Date: Fri,  2 Feb 2024 09:00:34 +0800
Message-Id: <1706835634-20514-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10-2.115300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGC8RBbzC4lPfOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4ewSz8fXAzKym3QfwsVk0UbvqwGfCk7KUs9PjDoDQHWKwlubG5wAl6iRJ5u
	xaMo9DvQwLLE9GtsA0hW5xlQK35W77Ae6o35DQLcS3n/80DiWLHmgs2MMlUbira2bI84xV94gep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 01:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194778

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.6.bb => python3-sphinxcontrib-qthelp_1.0.7.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
index 3538b063d6..b24f7f8e6f 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "62b9d1a186ab7f5ee3356d906f648cacb7a6bdb94d201ee7adf26db55092982d"
+SRC_URI[sha256sum] = "053dedc38823a80a7209a80860b16b722e9e0209e32fea98c90e4e6624588ed6"
 
 PYPI_PACKAGE = "sphinxcontrib-qthelp"
 
-- 
2.34.1


