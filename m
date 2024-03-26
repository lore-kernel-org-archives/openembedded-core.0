Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DADCD1288
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7942.1711413459779929207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P/V0YlPk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413459; x=1742949459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QQnd53MkI4Tlcrv0IRXV7cEqXLzr3r/Zouxfs/ID94w=;
  b=P/V0YlPkf3gGLydhOOxJV9+z6fJLLL2I6OTqZ9+TUA4Nb4PULQqyfNI1
   kLTLsuqbkdASE/h3/Lgu0ChecwZjUbG/Zthc91Yq22h4IRDXI4yAMqbIl
   ZLWkqMfi2nz53CvT2xu2nDy3DNWcXUTdJxIZcp5hBVG8igKtyYTSHDC7h
   RbdinOBnAL0rSoMvRlriJLO1X46Y2hOwb1h7Gs+48FdLc/4shv1DePST6
   dzFsoMX58UEvRfNpyVuZWpkXEK1bU0fxI8jzExpEVqpgT3zk/fXq0ZhbC
   gvAcUCL0G8L9V7bXe+YnFlPBWNHF6V+ZcE90tCbtFkbt95zXfC6hQs/Jx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132640458"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132640458"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 696DAD5A43
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FA85D5E88
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D9D920097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD22A1A006A;
	Tue, 26 Mar 2024 08:37:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 22/34] python3-markdown: upgrade 3.5.2 -> 3.6
Date: Tue, 26 Mar 2024 08:34:40 +0800
Message-Id: <1711413292-3025-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--1.367300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDyN+XEEoySvk89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054142zm1Zi+MJ1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7XKa
	gpAjvawP4Ny3TK3Qo2m6vRvjQk8rnN0ALVLa3jJuf4Xt+v6IuXQ4clvNa1ErIjux0j2BGnd8Kvx
	RdyDSH28P0kpgVe7IqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197512

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/Python-Markdown/markdown/releases/tag/3.6

License-Update:
 Update the license template so GitHub can detect it

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.5.2.bb => python3-markdown_3.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.5.2.bb => python3-markdown_3.6.bb} (64%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb b/meta/recipes-devtools/python/python3-markdown_3.6.bb
similarity index 64%
rename from meta/recipes-devtools/python/python3-markdown_3.5.2.bb
rename to meta/recipes-devtools/python/python3-markdown_3.6.bb
index 1df7a98183..7c64837395 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.6.bb
@@ -1,12 +1,12 @@
 SUMMARY = "A Python implementation of John Gruber's Markdown."
 HOMEPAGE = "https://python-markdown.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "e1ac7b3dc550ee80e602e71c1d168002f062e49f1b11e26a36264dafd4df2ef8"
+SRC_URI[sha256sum] = "ed4f41f6daecbeeb96e576ce414c41d2d876daa9a16cb35fa8ed8c2ddfad0224"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


