Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A941C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.11731.1713948196871433971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CIb6MKKn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948196; x=1745484196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=31ZS5lsgo3Xmm7EL4sr0xKQfGzfY9AKQn8+rxrUCijk=;
  b=CIb6MKKnqrUSHd3AwU2Gv96sGcRZGM1TLhb68JgkwX9dc9zxAmrJN/SX
   6qdHbQYk5aGMrYc+0RBZe6FQHlZ469X90rTgbOfGCtypHO/p807u4rRpa
   gITkWBvkKj+mcvoIONKACjTdFsESlE+y9P/XFxm17ZeVEgkOGZuZBisb1
   5I3DsYv+MLs/UtbVKY3lQVP6rGdLM+88GyZBXK2o4PutA1DEbTQjYoyMC
   TtoIpYqDX/pr+WqdWWa27zm2go7AuYPhWwWMEbOW87j/IEnP+aQoiVt1n
   kEt8QVkSq+b65dRYmBv1Er/wDB6ipB2Z/6aFK1QJDzBhPmblEDg1tKy5h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144528041"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144528041"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65C13D6F61
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEA20F76F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 441FF2646C9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E3B341A000B;
	Wed, 24 Apr 2024 16:43:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/38] python3-pluggy: upgrade 1.4.0 -> 1.5.0
Date: Wed, 24 Apr 2024 16:42:22 +0800
Message-Id: <1713948152-13501-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-0.189400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwTxwvzfR5Qyr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtILgbJOZ434Bs1vZ
	7s3YIVDILKcOYJcBTvOmX5Ik+Zo+GrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVvdlpYkSJFlV91gwEh8qsTsnW55EsON4aZgSY1UBZTdMm3bijmShtysadklofVhDSD+F
	H6rbFIPRBDi4R+x5doft1+wt+tDT1LvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198680

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for deprecating specific hook parameters, or more generally, for
  issuing a warning whenever a hook implementation requests certain parameters.
- PluginManager.get_plugins() no longer returns None for blocked plugins.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pluggy_1.4.0.bb => python3-pluggy_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.4.0.bb => python3-pluggy_1.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
index 76acc4ae27..9822cd59f3 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be"
+SRC_URI[sha256sum] = "2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f1d0cf1"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-importlib-metadata \
-- 
2.34.1


