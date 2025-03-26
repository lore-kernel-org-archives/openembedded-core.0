Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91346C3600D
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 06:37:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.16238.1742971020180924385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 23:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=byCtHgFg;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742971020; x=1774507020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gXVn73iZRDUKkefrS2Lg+4S2Np/+VwbBElcRy2W/3oM=;
  b=byCtHgFg4858OvusjiB6dbq8YfS+Yy8PN6FzbhcNmvG+3T6+EuSIJm+V
   rYESUkYvQgmb9j5o7aOnNZWkHdHpXOPr8d0JDFP+na5lbZlp1fa+26V5g
   38PRcrt1S630eeQ8DAUnmBhNj47RChOumJnKvSrdWhxzGUOhIE4O704GV
   CjlbCjjCmQuGpEMA4F1uQ6TDSz/aVVlZ1nKetk3187Pe2zaLUlgeKWWOj
   9hbBaw2jVra9yIzmu9DCI6pRr4oEVJXi/ZpF2nAXk1uflc+SHEV1vUMMo
   WwyoDx4f0yD1X4h3qCESYdzxozBx7GbyzUrkMI2Qy7yM9Kgwy8FsgtK1U
   Q==;
X-CSE-ConnectionGUID: 5CuHkTqeSd+qTMu9oUf2NQ==
X-CSE-MsgGUID: IpKTlXiGQz+eHx/q0sNS+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="182729085"
X-IronPort-AV: E=Sophos;i="6.14,277,1736780400"; 
   d="scan'208";a="182729085"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:36:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 97936A80E9
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 552B9D16EB
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:52 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B39AC1A00B4;
	Wed, 26 Mar 2025 14:36:51 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leihaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 3/7] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 14:36:43 +0800
Message-Id: <20250326063647.1941-3-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326063647.1941-1-leimaohui@fujitsu.com>
References: <20250326063647.1941-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 06:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213637

From: Lei Maohui <leihaohui@fujitsu.com>

Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
---
 ...treamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
index 77c10da39e..a2d35f8a93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
+SRC_URI[sha256sum] = "707a8b687ff5fddcee5b02415e2ec9b71b4ac44d0b7aec3b477364ceecbf1ecf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


