Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47C5CA552D
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:41:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7745.1694598054516823463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111288890"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111288890"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:40:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 706CED29E6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:40:50 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 953C0D9494
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:40:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 25BB6870F3;
	Wed, 13 Sep 2023 18:40:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyelftools: upgrade 0.29 -> 0.30
Date: Wed, 13 Sep 2023 17:40:33 +0800
Message-Id: <1694598033-21840-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10-2.280400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrdwX/SSKrKHh4YeSlHZYFom1d
	AMAJtyyxuwgtUgLUDM8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2duZ
	RuRKwoPZ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7Kfv
	uxWIZ97Wp7oN0brWxqDpewS9qOnrlBaC2KdaDzk/6zaBY4BHLHRETJ2oBI0xSTGwVLdzY3RO7Cc
	I+sIJhiDhFt0NPV/46CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Optimization: cache instantiation of DWARF structs (#435)
- DWARFv5 CU headers (#442)
- Bug fix in attribute reporting for DWA_FORM_indirect (#475)
- Support for RISC-V attributes (#459)
- Readelf used for testing upgraded to 2.41 (#489)
- Support for MIPS64 object files (#495)
- LoongArch support (#470, #483)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyelftools_0.29.bb => python3-pyelftools_0.30.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.29.bb => python3-pyelftools_0.30.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.29.bb b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.29.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.30.bb
index c55682e2ea..e976d6cae8 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.29.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff"
+SRC_URI[sha256sum] = "2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.34.1


