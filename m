Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CCDC3ABDA
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.45969.1747040638105268631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EhZMITxS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040638; x=1778576638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YiccP8pkglCGN88loMYv2+mHtL4QWrJl4FfVdjPzbcI=;
  b=EhZMITxSjpIjg/TckGAeKUs5VldYVHwfiZO8HWrl9SqExZqojT4aOWOm
   0rekwnEJxs4JENd+B/qgTZpEw3HR0kOqDXlgIZV6LFgQDRMZ40tiJf6NE
   79bQ2rGVVu22NEnvhqtnoy1V+LySz9nmA5qAzm+KiipibQzJQMA9IVWjc
   5G/SRzrGhbooJQx7O/0llIQGxEWRaVkFCPuu4wxsPuqiaj+TglLvgshBa
   i+HMpTiG7ua0k6cyCITd+q/9AVYG/m9qfUQ6NVSu20aBwMD5SSU9SgMtS
   mMekNEkNcYJ4g21SCgJoawTxKv84KkOCo5h4Nm9ZDnHuD/YCvMN8zHpDs
   g==;
X-CSE-ConnectionGUID: OLfr0ZJ1SrOjxpm+Lx72vQ==
X-CSE-MsgGUID: cjp3APxYSBaE8mMvV+/ftw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343067"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343067"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4565D5017
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 82C5BD20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 186901A009A;
	Mon, 12 May 2025 17:03:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/56] bind: upgrade 9.20.7 -> 9.20.8
Date: Mon, 12 May 2025 17:02:48 +0800
Message-Id: <1747040619-7566-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216302

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.7.bb => bind_9.20.8.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.7.bb => bind_9.20.8.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.7.bb b/meta/recipes-connectivity/bind/bind_9.20.8.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.7.bb
rename to meta/recipes-connectivity/bind/bind_9.20.8.bb
index b4202f1a59..864daed97e 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
+SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


