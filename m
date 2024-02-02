Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD52C48286
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:22:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11902.1706833372334302811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gvxMxmVY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706833373; x=1738369373;
  h=from:to:cc:subject:date:message-id;
  bh=XfEYXUez/lC9wf44mIOIRVdYyN5iVFggiZIfJQ68Xr4=;
  b=gvxMxmVYQTY/72g/T3W7b8wzR7Q4guq1xyFrK4kpj1SZqG6ZoYW5ecx9
   NtD7P2Op/uobixG+BMHRU3YYj+zMLy1HiyaIJ6B6T6jM7x+bq4ehHepQO
   uE2bTIyCO02WnCOfHm08J57wSoNiItffTHp128CyHqjsNS7T6iXbTTh6B
   ULsx9HVKuBRfRkdiNeQnj3YC4kfPlmtRdEGwQLfWuH/t7EknJLFWzHwH/
   Ntn1cWARt47Yu9LAX18cDSnb+R484A64KrAWw/6qzRT0heyxxnznbVwRB
   dTL/bHyam60RW9bDsaMXxV62g63D6pnFxLtqvqUMbnu0SexbNFehPMEWl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148080544"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148080544"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:22:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2789171B2E
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:22:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40EE2454F8
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:22:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAA0F6BE5C
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:22:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 407F91A009A;
	Fri,  2 Feb 2024 08:22:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyopenssl: upgrade 23.3.0 -> 24.0.0
Date: Fri,  2 Feb 2024 08:21:20 +0800
Message-Id: <1706833280-20077-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--4.268000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrwpoFhxXXuNBTqGRAXj8Kbb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOr4Qh
	BWhMCl59bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Egw
	GkS4oNGi4ikDL9BLqybYJ4SDlXBzMIc2BYoJ33eJRq6h4OoVHHvKyzW3Vh+A6tPRCafQaFrutv1
	Fs6LtkccmNafhLyqTeCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194772

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-Added OpenSSL.SSL.Connection.get_selected_srtp_profile to determine which SRTP
 profile was negotiated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_23.3.0.bb => python3-pyopenssl_24.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.3.0.bb => python3-pyopenssl_24.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index cdcae48d60..47850220ea 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12"
+SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.34.1


