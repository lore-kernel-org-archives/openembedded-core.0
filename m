Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0555EC282DC
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18206.1741079373430215607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DQMMOnlH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079375; x=1772615375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=USzQyLXICp2Jfy0R64gKSpdY59Jr1o/OsIZ4MQK6504=;
  b=DQMMOnlHo2ozvvrrYrXIf4ZTDEEq6b1LT973Y+HZZpD+Xc7Hz01+YdBj
   m/w4jvSiCi2xgeLU6T4VzajBK9dKBkuBIqHHtX60RYMevOLhpu+QxZd0l
   LCBRt6hELw6CkhiZ+Lt+2ylU1EJyohps9Hc7H4YG9kCnEi5dSMNTw3WXt
   1zHBd4MToGjz+NE7iwchvRuVtyTypRqxXQb9MrkrOY4pLRqpEZqrgJArt
   hsb1uHfHKeL/pHk5fge/Oep2xQF7D+bHevZJORiV7f40cW73Db4CzeMKZ
   Qpd0OcKXoCkOI4xBTEBoDOBS913KIkfUIZG5g5s+P7XOg+Xr/0GTo/mzC
   w==;
X-CSE-ConnectionGUID: D1drV+jxQJ2SGpw2nvHq8Q==
X-CSE-MsgGUID: dqmWoqtcSuqsqrgimdH73w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539733"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539733"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4ABADBB81
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69297D72A6
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28ACC1A009A;
	Tue,  4 Mar 2025 17:09:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/31] stress-ng: upgrade 0.18.10 -> 0.18.11
Date: Tue,  4 Mar 2025 17:09:14 +0800
Message-Id: <1741079356-13445-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212252

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.18.10.bb => stress-ng_0.18.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.10.bb => stress-ng_0.18.11.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
index 7fcb5af0ee..2b1e306b17 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "e00c355b8e9af3f7ce091e88ec6ddb5c439dc972"
+SRCREV = "44162bc4e00d06d366436857093a276ea692711e"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.43.0


