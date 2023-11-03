Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7744C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:39:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.38463.1698997159716611257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126164190"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126164190"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:39:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 114BED4F5A
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:39:15 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C7CBF87E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:39:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 15CAD8868F;
	Fri,  3 Nov 2023 16:39:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-psutil: upgrade 5.9.5 -> 5.9.6
Date: Fri,  3 Nov 2023 15:38:35 +0800
Message-Id: <1698997115-30971-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v/W9E3d/hIMTwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFB/fYwVuxTwYQfmYtBEsEv/POw
	YgzkddnTK9hjT1qJ+/mIvL2IzWV6Py9nDmaPby0yXDj+wHXpUgd0MezPBM/K/4RlvYDCaFWOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190129

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_5.9.5.bb => python3-psutil_5.9.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.5.bb => python3-psutil_5.9.6.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.5.bb b/meta/recipes-devtools/python/python3-psutil_5.9.6.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_5.9.5.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.6.bb
index c84e2225b8..df4f776b7b 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.5.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.6.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "5410638e4df39c54d957fc51ce03048acd8e6d60abc0f5107af51e5fb566eb3c"
+SRC_URI[sha256sum] = "e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


