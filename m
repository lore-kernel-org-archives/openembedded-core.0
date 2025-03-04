Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0646DC282E3
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18107.1741079374756247925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t1J/Y/+b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079376; x=1772615376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zC1+XjIYb+Ss6y+4uSMgRlj56qzsqYUMFG/Apc/HAXc=;
  b=t1J/Y/+b21+5AaI9vEYLkjyYX6UCeWcKBPi+vsKYzhl/uwElRS9ZSQm2
   fQncQBdDO+0IuKJLsYHyorKfoBn+YebmwtpkzqbQw/JqkwEX/zU9iREUd
   qVrHXW53ddE5e6yAgGPS7rz1RUdNTMqcwQdr507UzHdLiAzoktrkR+VzX
   LE2z4pSlJlBlKqA93x52PL94A11rHV+DI7wXku7te0KN3bF6azNaF5xUM
   60mtbVHDlcWZhq7+TM4mFymU7+L5tb7o5SNEZjocM7pPSxOzL8FaNzBEV
   CGHDM+VfIicpa+h1Epvjpb5AhpLwm/mwpfCujJPdPGlxfyhTkasdLb/Sf
   w==;
X-CSE-ConnectionGUID: EFei3PLDSY+eMDGV5qn/mw==
X-CSE-MsgGUID: kqZSNsmNQFWWh0pb3RWWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191934015"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191934015"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9603DBB8C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EAE4D8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FD5E1A009B;
	Tue,  4 Mar 2025 17:09:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/31] wireless-regdb: upgrade 2024.10.07 -> 2025.02.20
Date: Tue,  4 Mar 2025 17:09:15 +0800
Message-Id: <1741079356-13445-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212258

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2024.10.07.bb => wireless-regdb_2025.02.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.10.07.bb => wireless-regdb_2025.02.20.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
index 0e4100fba7..09fff768c4 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
+SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
 
 inherit bin_package allarch
 
-- 
2.43.0


