Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33799C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.10250.1720604664747988967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gqOe9upS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604665; x=1752140665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dAYaVLZ2xnR4T31s9BJ0vnfaaOOEnUbJfB44giBo+jo=;
  b=gqOe9upSG1o4Rw1r1HO9yFEJhc6b5MuT0uTuvM65nIY3PnhNG4x2IBiw
   5sZHqc8/+HRize3N/VcRxcX33haHO+LhGlXPMN2IJpGR8eZFmrHHDYfWe
   aOJW6JhVFH6MJWRzc2IsJHDdaGURu4qnwY8xxe3SmOi4COvJiNAqCwAAm
   0pIq09RJ/m02qvkMXkEhDvlDP9kFiMSdVOd6989qx1lhUlbEQ5JXEYemI
   75T1hB2NOcmFilPxObsZuLpapku+96qEepEB+yjR6Xpjl7B4S4ycb8oFz
   RZWtDXhlH1fbcgmWDCZmdGSTh525PL+gx5mWIMy1TV8IwDXtsOvks/T1X
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166505413"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166505413"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDC72D4250
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A14AD4C19
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1BA1220028
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 62D2B1A0002;
	Wed, 10 Jul 2024 17:44:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/30] wireless-regdb: upgrade 2024.05.08 -> 2024.07.04
Date: Wed, 10 Jul 2024 17:43:54 +0800
Message-Id: <1720604634-23406-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--0.369500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4BpyRCJSemPbgH8UzOewTxw+79
	DJRUi35pm9L28Suig/ixUiJMMML0+y/7QU2czuUNuce7gFxhKa2YkAyCbA7KV+CbuVI7hVbLPUB
	7phxYIL1t3t347YMumobXzhjksitpHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7J9c
	cjTRCf8AWXFQkkhWYpMonJHXToDhX6Zt9NNayi30ueNLp2LityksC1LCz3k4aHvapv8J2huSEQX
	//BOgQ7QUrjTJCoq4uCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201726

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
index 95e33d9fb1..daf5e6dfcd 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
+SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
 
 inherit bin_package allarch
 
-- 
2.34.1


