Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C4CF044B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9232.1728452985985030710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TBuRN9cM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452986; x=1759988986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VUms3uW01y9OJayYvjuIUlAifxITbxfW8xb56/0qrcY=;
  b=TBuRN9cML0H2FlhrlrpM2SmKSW1mDOFTba1uXC5A8Nsa68YYCBO5Ugp5
   4V+ae51HlTY1MHJSyDlABkW0Vr5ftLlOqgcppEnAYpgw+9uDSNGOMfqAx
   WtMRgIHBOS+gRjDwVFQJa9hm7i9jsz/kHG1yTBgu9ZkTZnPj517UdlkKN
   VIN4JKba6ouVBim4wOD6ucEnrqFKfb90mjdaWlU3N2N7r3Sw2Ty8whNuh
   iUjNt0eFl99tPXMTUk1FTbd0P9mMap/1OcUsc2K4UQpQqIjHJWAHQoVrb
   /GuDbwZ2pBhrbXQxPqe8DQhASjaJr0BUv/fudvXJ8z1citgU834i0m6Gl
   g==;
X-CSE-ConnectionGUID: mt1BbXf0Smu/AEwtm3xipQ==
X-CSE-MsgGUID: X+tRrNpMTSi1OG0SkDWNjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="175456385"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="175456385"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92522DB3BD
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C244DD50FC
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5871020081311
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06A771A000A;
	Wed,  9 Oct 2024 13:49:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/26] wireless-regdb: upgrade 2024.07.04 -> 2024.10.07
Date: Wed,  9 Oct 2024 13:49:12 +0800
Message-Id: <1728452955-25051-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--0.369500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4BpyRCJSemPbgH8UzOewTxw+79
	DJRUi35pm9L28Suig/ixUiJMMML0+y/7QU2czuUNuce7gFxhKa2YkAyCbA7KV+CbuVI7hVbLPUB
	7phxYIL1t3t347YMumobXzhjksitpHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7J9c
	cjTRCf8AWXFQkkhWYpMonJHXToDhX6Zt9NNayi36g2ufK8a1z3eanyzNS8G+eLhF3pT+vGAgeFJ
	g3yLruCfxpc2qfOjnOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205335

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
index daf5e6dfcd..0e4100fba7 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
+SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
 
 inherit bin_package allarch
 
-- 
2.34.1


