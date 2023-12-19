Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95242C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:40:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8765.1702978801256551335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143914535"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143914535"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:39:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B360C160C
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:39:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C955D9489
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:39:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E83EB6B828
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:39:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A49321A006F;
	Tue, 19 Dec 2023 17:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-babel: upgrade 2.13.1 -> 2.14.0
Date: Tue, 19 Dec 2023 17:39:06 +0800
Message-Id: <1702978746-7959-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--0.771000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwbQ9sC3KqjsL6g
	Ca8feq9dRd2OPkXFYFpDDA56aiueRGcSI4QxgePnGXGu0jdPFGRa4WbtOovh4RlO0yGfeyeWvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgGv34qCfZeB4YA3qL69rXq4Gp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0gGlEJORGTlJ+gtHj7OwNO0X9rpBZuBDbdjJL
	d1O9zsSUBV9cItSlpe3cSv1kj79JE2/HwTjKl6dsKNJN0hrkTTQiPeMfWsUogrIQ5GqnLm50NIc
	3NElSgSXl52S2vwb4fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-CLDR/Numbers: Add support of local numbering systems for number symbols
-CLDR: Upgrade to CLDR 43
-Frontend: Allow last_translator to be passed as an option to extract_message
-Frontend: Decouple pybabel CLI frontend from distutils/setuptools
-Numbers: Improve parsing of malformed decimals

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-babel_2.13.1.bb => python3-babel_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.13.1.bb => python3-babel_2.14.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.13.1.bb b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.13.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.14.0.bb
index 6908d81326..2e736107f9 100644
--- a/meta/recipes-devtools/python/python3-babel_2.13.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
 
-SRC_URI[sha256sum] = "33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900"
+SRC_URI[sha256sum] = "6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.34.1


