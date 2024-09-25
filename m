Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7BCCF9C7B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9255.1727246985761968810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FzZU2PWX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246991; x=1758782991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M9sgKwDuZ7npTK1HG1o45Onfqyxg5bN8JW9oIbDa3u0=;
  b=FzZU2PWXZJ9/t3vxIuzlo8jej9Pjz3AAKkYzAN9ZWjtk266noFnE0Lxr
   sF4sq9aKPBOOwFDCnoEnM/+989g6ROU75W0j0BA2WLAq/I1IC41qn4ki4
   2wqVPVke62854iaBJ1Vspiot9RIcA3NpRuWYXQF0SN7TSVht1iKIWE44R
   B4ixzvkmOz6fi3EdTyg2vx9tLNMsIVzoI08ZWR7dX6GyDv9AK45Itu7yL
   KJFyOkj4pRbR8Fq92OWZ1kY3lXXzkGSkIk4Pi/BpZNosZHASlYsGyogJF
   fuWkLWPgvuXxr63qvGHEBBri+xntvoZf77Li2ot/IKGaN8oiWE8/vZDzv
   Q==;
X-CSE-ConnectionGUID: ASXAcMCVRS6TNf3p5WL3NQ==
X-CSE-MsgGUID: GnWaXHG6Q6qF+WU160NVQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174697198"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174697198"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CE44DB3C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E57E016640
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D0A020086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2DB881A000A;
	Wed, 25 Sep 2024 14:49:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/47] python3-trove-classifiers: upgrade 2024.7.2 -> 2024.9.12
Date: Wed, 25 Sep 2024 14:49:09 +0800
Message-Id: <1727246960-20665-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--1.146300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mregIHHX2L4YwZFeXguNpWv0mY
	fhvEN/pW+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzF6M4dp1Rscwrpi
	uDyLfhWbUi6doL7qF13M6yR5bUka6EOXUC3OAIOBdJjIuktsdFFCpZtIdj31Fp+xIBJ+kxALsw2
	QK4j2y1iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204927

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Add Odoo 18 trove classifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
index 934c6d4be0..c3a4eea1c7 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35"
+SRC_URI[sha256sum] = "4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.34.1


