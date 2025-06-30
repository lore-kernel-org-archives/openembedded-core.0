Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE73C83F01
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.35177.1751274810576654104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=goaEVRhW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274810; x=1782810810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tflJoxpmhJwkZtjLNlg3zoaP27/6JZV3nI5ll/KuEw8=;
  b=goaEVRhWp1gbSsWbPk3uwBnyBylXM+u8tt0TwCZ2RHqu4m+saJEdhFWg
   XUZo2TzIYIKnL/iYhhKhwBgeuKtgaGWKBdINYJDnh7IORyeq72iLGj+wP
   3zwULglDDAm0460T+c8dUDAqJJaKqlCnFM/K++NtHWYqC7b0ILBwDNiz+
   sC+BZuX/jkCbYEjRV2tRDEK3x/qBMNSedpgciuYKoxP1DGyxhKUmQkM0u
   MzXOxSb7t/gFWoZIV9oZsa7C45mMWrWCwMO7InV9uiuCW6SCnMvCglqBb
   N2LBb1OjILQVRql9181UHZL+etFvAgPMsnolMFezGmR/7e9Z9JXg6hbu5
   g==;
X-CSE-ConnectionGUID: N5W9muypR6mOltsNkZVeqg==
X-CSE-MsgGUID: pRu5Qf/zQJizOqtAaJgmGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="203801327"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="203801327"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D0A2D188F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 4F1FDC006D6
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1B47B4E2F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:25 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 34F5B1A0074;
	Mon, 30 Jun 2025 17:13:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/37] gstreamer1.0-rtsp-server: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:51 +0800
Message-ID: <20250630091315.1897-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219480

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.26.2.bb => gstreamer1.0-rtsp-server_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.2.bb => gstreamer1.0-rtsp-server_1.26.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
index 51085bb3fa..7ee7a1f07f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f942b2a499ed6d161222868db0e80de45297b4777ff189c6fb890bde698c2dc3"
+SRC_URI[sha256sum] = "415e8a53a9844789770dd4f116ac2e3a4a33de42673c57acc25c5ba0f4406fc5"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


