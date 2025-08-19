Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FFFCA0EFC
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5646.1755574542344187087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kgKVzyyu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574543; x=1787110543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyI6wzofnii9zuh76yRlNAgfbFZ56LQeXBzj6DS+D40=;
  b=kgKVzyyuJpvWKezvPr5LW7B6SYGV3/Sa0mdHNWYiEhqOsye1HTT53WLG
   t1HYETZgtaRC02orF5tJicZbAa9Jk6P5eR4/BNo7Dw7QvsBi1vmfyJeJu
   QjCyKovWaKG3q3UDHtCpR/qv5Vo4eDHDnWeGbxCQ/nzY7hAPCNvsBGjFl
   ejT4x0f2Wzk5BgyK1ABZQKReWFJ5OcN2p8hYM1HZUSC4mtbOZledXLRF6
   /Ich9ijJ5D6NUqsC2UyMjKku6B6IyizyTSj/f152DhORoCOjP6qo9H00z
   To1D04SfWnKpjEG8DqnV+x+MRG4BYOO0jXLYiE9yXIGI2APRs4sUFd5nW
   A==;
X-CSE-ConnectionGUID: ZijKGm9VQs6dOeyo6HmFkw==
X-CSE-MsgGUID: b+sj45BvQWKA+OgQPKSpvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="198173861"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="198173861"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2C0C61C1C707
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:43 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D6C8018002E7
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:42 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id B39AE2000210
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7CF011A0087;
	Tue, 19 Aug 2025 11:35:36 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 06/11] gstreamer1.0-rtsp-server: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:27 +0800
Message-ID: <20250819033433.390-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222066

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...rtsp-server_1.26.3.bb => gstreamer1.0-rtsp-server_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.3.bb => gstreamer1.0-rtsp-server_1.26.5.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
index 7ee7a1f07f..a6bfd1d2b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "415e8a53a9844789770dd4f116ac2e3a4a33de42673c57acc25c5ba0f4406fc5"
+SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


