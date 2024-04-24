Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A9FC25B10
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.11728.1713948190768326294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f98ZyxLy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948191; x=1745484191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HaE30mTu3xUJFX/4nHvIV2LqB480hqsd3XhbUhjd0y8=;
  b=f98ZyxLydU3qcl3XyEz6ANHEKKFko6GOh/JiXs7uYTpEUGZjcwHQ1W0B
   3QEkl8Mp510DzZNxuDNO08jlMAndiD68ycF0UcIdocHbHGVNVG3dlTV2a
   BVEkwC1WahslRgn1IukCXEUS+9y3QrX+Q12ib1OYCJjzu5MTJ9VIYesiG
   Uex7bBxvH4wf3YyWDIUlKvX35zYmSuXRtsJrLMBpSj2ab0IUwCPv+tAZt
   85OpS7tAmffdO5bLCa31bM1D4waAEIn2a5ujsj9kJMeqkXLWsBqv6OJK9
   MU7D6mo8hJUFShZ8vgtO1GhLqk7qjiYVz6+sOn1KU8Y+W9eH4skJawp+o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926039"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926039"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 01F23E8F8B
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3318CD5405
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDEAA202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7ADD21A000A;
	Wed, 24 Apr 2024 16:43:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/38] python3-mako: upgrade 1.3.2 -> 1.3.3
Date: Wed, 24 Apr 2024 16:42:21 +0800
Message-Id: <1713948152-13501-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--2.407800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpO+bX
	2s8xPCVjtPwtczFrCbS8xfjW6NxdqO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzEBQe5Eo8ennoy1
	OKFRG+ztqxK4ALPiPHhZA2mtwFYo98TTvP0ptywRTupExXHRrrxEu3QmSPyeN+K3vWljF7G6zoo
	XpOa5QNiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198673

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed unexpected error when use control lines which the first control block
  with no bodies other than comments,as pass is now added to the first empty block.
- Fixed unexpected syntax error in strict_undefined mode that occurred
 when using comprehensions within a function in a Mako Python code block.
 Now, the local variable in comprehensions won't be added to the checklist
 when using strict_undefined mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.3.2.bb => python3-mako_1.3.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.2.bb => python3-mako_1.3.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-mako_1.3.2.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.3.bb
index 5b7df9192f..7545cbef99 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
+SRC_URI[sha256sum] = "e16c01d9ab9c11f7290eef1cfefc093fb5a45ee4a3da09e2fec2e4d1bae54e73"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.34.1


