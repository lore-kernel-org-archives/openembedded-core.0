Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FEDC04E69
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7582.1687850380117986789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122208760"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122208760"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:38 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA227C68E7
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0AB7CFBDF
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66D6E6C833;
	Tue, 27 Jun 2023 16:19:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.23.0 -> 1.24.0
Date: Tue, 27 Jun 2023 15:17:23 +0800
Message-Id: <1687850250-20040-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--8.554000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrC//1TMV5chML62xXB+Btq4VD
	0TJVgsKEBoxcUDXCLMxs00ZABHv2qADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZHzoX6MtOvdEXSJ4c3nT+Qfqcdt4G7kueVXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibIAcCikR3vq+h9idL1+KH4ElCPirAmNbzzlpmlhricAnRToxdnZ7JeKlND
	vKi2X/P
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183468

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Dropped Python 3.7 support
* Bumped meson version requirement from 0.53.0 to 0.56.0
* Various cairo dependency updates for the Windows wheel build
* examples: update to GTK4 :pr:'307'
* examples: add a clip_image example :pr:'316'
* docs: fix the build with Sphinx 6 :pr:'318'
* Various code cleanups :pr:'306'
* Added Python 3.12 Windows wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.23.0.bb => python3-pycairo_1.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.23.0.bb => python3-pycairo_1.24.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.24.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.23.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.24.0.bb
index 5214a05d53..8059750de0 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.24.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "9b61ac818723adc04367301317eb2e814a83522f07bbd1f409af0dada463c44c"
+SRC_URI[sha256sum] = "1444d52f1bb4cc79a4a0c0fe2ccec4bd78ff885ab01ebe1c0f637d8392bcafb6"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


