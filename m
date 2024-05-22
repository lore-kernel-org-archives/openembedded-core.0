Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1687AC27C43
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5676.1716369346365410183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lF1ltLQ2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369349; x=1747905349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pyHMMT2+i074D8IAeE71iy5pXl+rkAGkoL6bv3/z17A=;
  b=lF1ltLQ2MhcpZGlwRkgZge2OTKC4J5LWFdOVW2jZKVHsDT/pdZJnfssG
   KbTz+YtkgPaH1ANr8r0q/cohR5gqAuaP29MkLS34C6JNCepiBUuIU6nO0
   g3BU1ab1QL3XH5+HDsZ8BbXgh8qqph829F/VaaC8/+h/ieDMRvzlgx+Wd
   KmbaI4TH7rjqCKevUnvv5Uar4jZHxkribaZ+JzFWqMhsI0L4qm1uz4g8Q
   mptcALax533SHJrDfRJTF8vXMCgRumsD0nMc0KUPWLuxh0XbHHERK7lnS
   zx/C6YiCB1ffDjnH1KQS2jyXYNFeS2N8WZtvEPBK53/4ZaM1cnd8EyHtH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="159376816"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="159376816"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 104EFC68E8
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DF84D45FF
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D570420097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 82AF31A000D;
	Wed, 22 May 2024 17:15:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/42] wireless-regdb: upgrade 2024.01.23 -> 2024.05.08
Date: Wed, 22 May 2024 17:14:48 +0800
Message-Id: <1716369289-22526-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--0.369500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BpyRCJSemPbgH8UzOewTxw+79
	DJRUi35pm9L28Suig/ixUiJMMML0+y/7QU2czuUNuce7gFxhKa2YkAyCbA7KV+CbuVI7hVbLPUB
	7phxYIL1t3t347YMumlaqBFpUBa9V5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTuzrF/dl1vg1b0uQwZpPuwI+KpOZ6pLKKLqoVjJn0Ic8i35MgBW7h/mAR2NtMJS/leqUW5
	+zgCQEJEyfAtPw6I+2HnnE5VeaR3/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
index 8fde236ab4..95e33d9fb1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
+SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
 
 inherit bin_package allarch
 
-- 
2.34.1


