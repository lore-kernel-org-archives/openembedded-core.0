Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76677C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:41:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8776.1702978870705323545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:41:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="132303402"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="132303402"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:41:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 187EBD7AE5
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4135FD4F61
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D939E202CB5A8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96ECC1A006F;
	Tue, 19 Dec 2023 17:41:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.18.0 -> 1.20.0
Date: Tue, 19 Dec 2023 17:40:58 +0800
Message-Id: <1702978858-8052-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--4.149900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwdGynCN4u9JbYH
	qiG3BlJoH4tlgNXyIxGKggr79PUAVKzeCylgU2zUxOIv4/oKgyBPnKxAOPp4WazoKuGXKft/vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgDFcf92WG8u/yeuKmpofsO6em2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etko7xASrNIrdAEvqtp/w7ZprDNaeo2QoZCp6Jc
	XgtfMMADoYh98mc5HZ+0J6fIeGOsuSDrnuZT23Mm0MsG0cs2kYA5jlQPNRKVku/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add bypass-selection option to the wheel build target to allow for empty
 (metadata-only) wheels
-Fix regression in 1.19.1 that allowed exclude to count toward inclusion
 selection, thus bypassing the default inclusion selection heuristics
-Fix writing optional dependency core metadata in situations where there
 are multiple environment markers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.18.0.bb => python3-hatchling_1.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.18.0.bb => python3-hatchling_1.20.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
index c94e49dab3..6c1db9b801 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca"
+SRC_URI[sha256sum] = "0e0893cbe3d5f9275fc0e5b629087fc23b17abd7065e4db0a310e0a0237bc945"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


