Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C527EC52D7B
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46595.1722215430643849191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rj++tSJl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215431; x=1753751431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T45N42VPxnk5tL5bBf2xX1Y8t2zaL/QU6JkwfWgUWT8=;
  b=rj++tSJlXyhLd1cXWb7URwjLBZuAkLgp8KfRtdWAf4F+HiK2PHDaCqhQ
   Y3YN7WLID9n8qAkaQpb5BiJVO2WZkiSPG9OmG6fM7i5CPgcUbyFG5Ph+3
   iN2wVcg6s9h/kRO5Xr53L28EfM1cN2gKt3ojd/WKuEev0ZoMbQKWZ3uhP
   aAfxkx0H7EH76RljKPtPZdJyG00sKrkJS3419GoqQtdQcrjwwut6IkRo2
   DmV1ZaLkv+rFP4aI6ogfFJTpJRNcgxypYRI6+xpz+Z8QhQe0HVUsxtb9Z
   O/i3hjYBFTg0XivLf544Swl2yQOAhq+6qyBgbAVGTCA0rLZrJpIcm9bkE
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168911526"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168911526"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92190DB3C6
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B8FCFB6D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DC6F82D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 295671A0002;
	Mon, 29 Jul 2024 09:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/33] python3-sphinxcontrib-htmlhelp: upgrade 2.0.5 -> 2.0.6
Date: Mon, 29 Jul 2024 09:09:56 +0800
Message-Id: <1722215408-27541-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-1.468700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytQZ//SkC0u0r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIEukIs3g1Hje1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzL8YrO/BqUNIuSv
	QslLKTJyn/rxcRzKL0ZwArgDxgakG1fDxbK7v8AeIBBIZQeikRv3TBr1SfkOVHFdrU5Bg53e8Yz
	f+kwxXHiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202593

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix tests for Sphinx 7.4 and later.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tmlhelp_2.0.5.bb => python3-sphinxcontrib-htmlhelp_2.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.5.bb => python3-sphinxcontrib-htmlhelp_2.0.6.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb
index e30c61c398..95b5981c06 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "0dc87637d5de53dd5eec3a6a01753b1ccf99494bd756aafecd74b4fa9e729015"
+SRC_URI[sha256sum] = "c6597da06185f0e3b4dc952777a04200611ef563882e0c244d27a15ee22afa73"
 
 PYPI_PACKAGE = "sphinxcontrib_htmlhelp"
 
-- 
2.34.1


