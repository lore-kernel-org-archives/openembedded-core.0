Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264A8D32D62
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.82434.1731403537826698545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OLoPxAuU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403540; x=1762939540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8bPrf8NLtipztilBxpnGPWKMGu8nKwm4yhwYlc1qPaM=;
  b=OLoPxAuUAzOPndTN7AkxBJ5UoO1rqKOhbny87H+uBPqVduV73IqeU7Z7
   TprqveOP8HD2XeTXVB3OEGoYcZUI76+RjMpOV0Q5h4G94pzpljSf59ulr
   U4MHIiHYNZWkpykW4uBQ6PGtbe/SRJy+MSU6rM2PvqoMwKPgYYXoj7B9P
   y5wqDeWST4wlUBNQtdmwYya2u5/fwAtqnCy29D2G1yYVMMEqM2U/L4jDb
   a/WlfX9Xj17eBpOKRS1F9Xv6ZN25zj/lBaG0pPZOgLjbZuZjU4USfBcJx
   F/4BV4wiPKvtiQQ/q7cwsEWn5zdb8DDWagpds7hI/kgG3QyD3GBYSc/Hc
   Q==;
X-CSE-ConnectionGUID: LeCOvCxsSpm8GZxh4DsEoQ==
X-CSE-MsgGUID: dQrGL3orQQ+JkLmXyTnMmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180109629"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180109629"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C49C7D647A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52073E6B89
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA0AC6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 892491A000A;
	Tue, 12 Nov 2024 17:25:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/47] python3-pyproject-metadata: upgrade 0.8.1 -> 0.9.0
Date: Tue, 12 Nov 2024 17:24:32 +0800
Message-Id: <1731403483-21399-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.900400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrZG3SCLP7QtI+++3dUGxY34pb
	wG9fIuIT0GUB0XWiSWQF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2SCRvdB/PtlWo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIJSVhcAawGNt4h+aE+GBsvgDVyZDXWqxlSwU
	1XwDuBlbWv/wbNEMkT5p81speqR0YARDHtptGuTMgugsXAmJkd60zJX6WKK5H+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://pep621.readthedocs.io/en/stable/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ct-metadata_0.8.1.bb => python3-pyproject-metadata_0.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.8.1.bb => python3-pyproject-metadata_0.9.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
index 545a5efeda..946fd415fa 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.8.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.0.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600"
+SRC_URI[sha256sum] = "8511c00a4cad96686af6a6b4143433298beb96105a9379afdc9b0328f4f260c9"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.34.1


