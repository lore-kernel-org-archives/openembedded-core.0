Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11D6C83F07
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.35176.1751274809073093360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kLeJB2Te;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274809; x=1782810809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KHEPOM2ibm3s42XJ3WostH8+n/Kp2As+Dy8l28fa0tU=;
  b=kLeJB2TeAXHn54AhtGFPdcEH8buTAwjiI8mHAeraaetCzm/LTqApqAtz
   URowzQEMc3x5ruGFQR6mTuWqGgJcleCSBm7pRaaoZ7F/YH8ZinQepn/Wz
   McClbC56jRToPbfnaBUX3zrjOlKZdvWuErEjUyhzjA0TBHbEdKZelkkcG
   69jn44tIIzRV/Rbc/ZNgaicSJm6FV0lfWcnbqt8MLvs6INs4LSmr9ixjf
   7hsJ4PVD8i2O1F3czUUX5wf3eV9SNTSKopOjOv9er+U1ATnJdJa+8ZmS7
   QId5XmoMQE7S2RL+FKiPTxOSGfDTPUh6AE5yxHlkgypVegTaYRPKem5Fh
   g==;
X-CSE-ConnectionGUID: 4a5JVCpXST2T1JuS3WhqHg==
X-CSE-MsgGUID: 96TEQ1CbR5io7QoIBgrC3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="193015477"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="193015477"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 781F342A319
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id EA9F11C0028C
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CDD22B4E2E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:23 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D3CC1A0073;
	Mon, 30 Jun 2025 17:13:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/37] gstreamer1.0-libav: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:45 +0800
Message-ID: <20250630091315.1897-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219476

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.2.bb => gstreamer1.0-libav_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.2.bb => gstreamer1.0-libav_1.26.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
index e3410f0907..4125fdf31f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2eceba9cae4c495bb4ea134c27f010356036f1fa1972db5f54833f5f6c9f8db0"
+SRC_URI[sha256sum] = "3ada7e50a3b9b8ba3e405b14c4021e25fbb10379f77d2ce490aa16523ed2724d"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


