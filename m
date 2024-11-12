Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38650D32D68
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.82736.1731403538298997987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MTc/DGnC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403538; x=1762939538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=R9ug9fm3nji0iY7/KL+me/5+8I3L+8/5tUPwgtwiICA=;
  b=MTc/DGnCUbdu1yRlFoBZPIpBxlpEu1rL/bA8BB4In/7sWfcr/CLpXmDG
   puzYj6KFm++xdxS+AhGJ8aHQWZHu7xXS9jBTN++KcZwH0PrUrtas6cHU9
   07F8+8AF0/icFAmKQgEfwdtydjq6zmrigyqlOywvUfdScZkz1/JPllfJr
   quaNFZG9QxFWm0PSDkMd4XVZNV9YXCKrROr6ozHnQUefqgZrWp56F+21q
   nZPcX2MWncMBDVDn9C5xkaUgdeEhKYdCiMIYwqLU6RbEybqkdTFP+4W9Z
   GfrKYvJc21DhCrkn+z/8x7g2nef7YCxpUnx9BdgwHIK3Lhr5mbGKceGwi
   Q==;
X-CSE-ConnectionGUID: FW8y6ifLRXSVn2TFzCBJAw==
X-CSE-MsgGUID: Vs+n3/G7RzSTvrXhlXO2IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="168413937"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="168413937"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4455ED9C0F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D84A7D5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77ADC6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 275941A000A;
	Tue, 12 Nov 2024 17:25:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/47] python3-license-expression: upgrade 30.3.1 -> 30.4.0
Date: Tue, 12 Nov 2024 17:24:28 +0800
Message-Id: <1731403483-21399-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--2.329200-10.000000
X-TMASE-MatchedRID: d0WP0JJEp0QFWIzFaWZsv31zro62qhdCpxAd6mi1Ga2al2k3ufmkfb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz3J2drnLVpj7pyO
	9ncQLQ1TEBegp+HolKfjZFF+qrc4oFAZUR4vPrc6c72IWO5OYxSx487qQm3tSwFzSij1Ifdd+uC
	WfGwyoziB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207020

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update licensedb to 3.24
- Update licenses with SPDX license list 3.25
- Update README and setup.cfg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.3.1.bb => python3-license-expression_30.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.3.1.bb => python3-license-expression_30.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
index edf7ead2e4..7a035206da 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "60d5bec1f3364c256a92b9a08583d7ea933c7aa272c8d36d04144a89a3858c01"
+SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435522f05"
 
 inherit pypi ptest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.34.1


