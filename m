Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55988C27C54
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5677.1716369346967507716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KFw59Hg5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369347; x=1747905347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t9iUmsBCoet0Ndt32+F8KnQoBawMUVZi0blZHd/zIS0=;
  b=KFw59Hg5jOKVMsLMcn6wV3KDolpBSFHzqaLIbB9MRSDVVBUqyKwSiA9s
   0TApwKvi9UK46/wDSCFqZ/2AWIcmrtRwREg5g4iWjjL13HRTENGt2TNlu
   JrJQc74yb2oPTJRr/0XUBxe6DoJ8olAfkyl9KcY7Agpr/502D2PZT3h6n
   akfZ9rZ4XoRsTMIPrsRE6zcqo2LTplZJO8iGUB9m+EUDK7Ihao+E1Bie0
   UEpsc8pLF3ZHPYNKDlREc4oNZCXOPUl/cPuu1knmTLb9f6pv/N1ddRrSZ
   5KsTz5OVC4JXHyfWsdbVdncXDHOLBkk93qP8eVkRO5B1Sq56f7Jwf0j8m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="137912353"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="137912353"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A12B2DBD93
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EA82FD45FF
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 79B7521CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 269911A000B;
	Wed, 22 May 2024 17:15:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/42] python3-mako: upgrade 1.3.3 -> 1.3.5
Date: Wed, 22 May 2024 17:14:42 +0800
Message-Id: <1716369289-22526-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--0.152800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYC5LPd7BvbYCn
	q9qtGcvV44Yh583I62ZMNbrUuyXyo+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6ufLzWlMhGpVbZ
	7wxb18W2j69sO70o5m79E4AMovhi/eJY/bKNRQH6zS3vLmVQYoxl8m/0K3R2/miy9HQkszc5a4u
	5pvN1c3iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199729

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Reverted the fix for #400 as it caused new issues when traversing
  some bracketed situations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.3.bb => python3-mako_1.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.3.bb => python3-mako_1.3.5.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.3.bb b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-mako_1.3.3.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.5.bb
index 7545cbef99..d27fb121a6 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.3.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e16c01d9ab9c11f7290eef1cfefc093fb5a45ee4a3da09e2fec2e4d1bae54e73"
+SRC_URI[sha256sum] = "48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.34.1


