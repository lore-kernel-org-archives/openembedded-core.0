Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0F6E7719F
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10440.1734945081618580580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b4tYMC0K;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945083; x=1766481083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XIJQwvfoxzZ5s+1SXPfKkq8/iLNBIG6j6G/pnUwy0MQ=;
  b=b4tYMC0KoFJEPqeQZEHqKdx9ibb8Uh9EnPddKxwZ2xayvtQEJYN7uNCL
   SOTdhKc6pfj9mlNY0sqMuOMUDDw5o62iE7NGZtl6DqCcn+om4FYOx28cr
   a4yWk6iANOjF/wdR24XosPxoe3ykXMSKKNX0etTfWC0IVuCUmj5HS/hv5
   TxxshcdDFQLnNR89c3dk4dgPSvHDMMYqQi5Zdvb4SRSAH/1LbPUq7zYPP
   lCcg8RD+4lkEvEkriq560Vs80oJua+O46BND/grbaDtqqtBoLKSji7z6d
   PEueZYjV94BNWaviqqNbipktaSKs/YzaUfDDhF6gPZhue8rEQ6m+J+bAV
   w==;
X-CSE-ConnectionGUID: qVyDUeVZTHyIrutFtLSIOQ==
X-CSE-MsgGUID: cweLaTerR3G/OfsP3R+tZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="164121759"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="164121759"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86F3ED4808
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A7F7BF3D3
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9D2C1021B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9300E1A006C;
	Mon, 23 Dec 2024 17:11:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/22] python3-hatchling: upgrade 1.26.3 -> 1.27.0
Date: Mon, 23 Dec 2024 17:10:51 +0800
Message-Id: <1734945065-4373-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--3.819600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+AI7Mvq/sL530Q
	OLtfpLM14CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0546EuH17uq9IiZYj
	faKkAhGDi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFNVWnIaxX/tB8X1ggWaSTOs5Yy
	zwCDkkDyf4TQDw2o6zize2gTFMxKpOjjJZ4jPIjS6ja+RtjuXG8L6MMruC+m2FkIb8vvKVh+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update the default version of core metadata to 2.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.26.3.bb => python3-hatchling_1.27.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.26.3.bb => python3-hatchling_1.27.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb b/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
index 590456ad9b..5239d8155c 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "b672a9c36a601a06c4e88a1abb1330639ee8e721e0535a37536e546a667efc7a"
+SRC_URI[sha256sum] = "971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.43.0


