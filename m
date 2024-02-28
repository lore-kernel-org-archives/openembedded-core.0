Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16015C54E5E
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8396.1709105613845511941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pwvKJZYM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105619; x=1740641619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=F2Hf5UQogoTTxn3sVz7LbjScecm9caFuJ9yFuCG9eOY=;
  b=pwvKJZYMqhYwfVCAGMqEXavvumOh6KVikP5/7KoqcyCtcuprcSpUzqC3
   DLL8b58BiHNBT7T7FwPo9g+9wEv7pt7CYMXpvGRRsj8Iqv8Vxu6FzuJ9o
   vEtyzAPBWZcpC9MzHpvTjM+lS/KnZjisDsUczrV1E1gOq7RMaoIhGG1tP
   RoBkfjYSXUsNeSqO1Zft658SoO4xYuQLQBRDxie5i7S1Hm5n/bAjxjyOj
   mXbDluLHXqOJVXabdNWTBsHhXRRo/jlTroPMSJQmJYY3SiSk8/JWxKfEp
   +fPVCrlyC6nf92HYZERK1CI9iA7NrEobzjepaz0ZfZlwG/rZNEb5Ky/nj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150517373"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150517373"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:38 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7254D4800
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 00774D3FD7
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96D1241180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 437D71A006A;
	Wed, 28 Feb 2024 15:33:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/48] python3-pycairo: upgrade 1.25.1 -> 1.26.0
Date: Wed, 28 Feb 2024 15:32:42 +0800
Message-Id: <1709105575-24259-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--9.801500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeVaCbh+r2jQs2Ma
	pnFC68Xm2GcSxE3tAnd1MgCuYp7QVNIGVceD+uxrGqSG/c50XgOb+3jd3k4Rfpr1mjtMloOwvjN
	9OkaN1tqtC6X6XrMWVpoivvFVRdDkAM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkfOhfoy0690RdInhzedP5B+px23gbuS55VeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7XWPmaFoiyJsgBwKKRHe+r63Ka3R+e6rkdOdfLPduTUWZCp7wGqrGVRjFksDrOHRlne5q
	qQTK6V4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196359

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Bump minimum required meson version from 0.56.0 to 0.64.0
* Various meson related cleanups
* Fix header file being installed to the wrong location with meson on some systems
* Adds a new "wheel" meson build option as preparation for meson-python support
* Update dependencies (libpng, pixman, zlib) of the Windows wheels
* Various maintenance related updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.25.1.bb => python3-pycairo_1.26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.25.1.bb => python3-pycairo_1.26.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
index 1599f6d39e..ea8b81be76 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.26.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c"
+SRC_URI[sha256sum] = "2dddd0a874fbddb21e14acd9b955881ee1dc6e63b9c549a192d613a907f9cbeb"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


