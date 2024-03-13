Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC92C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.10638.1710313760595481985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fhOlb12u;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313768; x=1741849768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T2ujoYK72u2WSQTXGXh1ndQ74ht/6jmAtH+3A2UF6H0=;
  b=fhOlb12uvqTgvambYhr7Dj+ho724YYKOdEwB8+8+gAs3XkVPPeGthf0B
   EmhBUa3i5Al5WbVzEBKnPRVWRhvUJrRz+iqcYGz+ONEc1XlPU+0LD69Kg
   hvofCSgROZqG6bMDZMuNXL3p1DKztWO/xrJVP2gF7FB1sgAkFNKl6Ozi/
   uyDnGTDAY6qkA1lqnXt4dKnz7rDO7DpmjGVzqwjFOPqu9sEaPlvHi6GnA
   wmpy/M2ZrMmMLCHy7YhjGtxLDitFCpVJdoHCvbVRlo45we8AZ//S7Dn9T
   xQlXMUCVocXSIrKO77RUUpI/Tyn0x2HD8CAXDkGK6YQ27jZJR2nq5LGVd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="140106899"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="140106899"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:26 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E1D12D4808
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DDF8FDA12
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD8C320097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 567EA1A006B;
	Wed, 13 Mar 2024 15:09:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/36] python3-pytest-subtests: upgrade 0.11.0 -> 0.12.1
Date: Wed, 13 Mar 2024 15:08:25 +0800
Message-Id: <1710313714-12541-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.440700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjtjhb8gYBQL76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtILgbJOZ434BsRtc
	2qGBany6BkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNXF3EwKjqicJnzPJsO0WcJLTYkUQUo3DOmdvNE329fuJmwQh3P6PIjqGz6y5F5w7mGxCq
	plKMBKgTL7J5Qryuub1nczdanStYlLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed compatibility with upcoming pytest 8.1.x.
-Python 3.12 is now officially supported
-Added typing support
-SubTests can be imported from pytest_subtests to type-annotate the subtests fixture.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-subtests_0.11.0.bb => python3-pytest-subtests_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.11.0.bb => python3-pytest-subtests_0.12.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
index 44fa1e2b80..0590be705f 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.12.1.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348bafbe37"
+SRC_URI[sha256sum] = "d6605dcb88647e0b7c1889d027f8ef1c17d7a2c60927ebfdc09c7b0d8120476d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


