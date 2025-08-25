Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92DACA0FF3
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.31417.1756093890405217278
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TqppX1TD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093891; x=1787629891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vguQNNj/8DmyG8Wsz5wZDrMHJnWakejRyY2vPsSK9dU=;
  b=TqppX1TDiKzS9uSJPyn8DHGKicm80/epo2i/ufTkQZ3xhyjBuZK7K4ea
   cvpJtAYVE45smu+V3PwuSuzRXL8hl49Y9AIfKAaCYsibJtIduWE76uuGx
   bRIzPvYuuJRfl/cX8OzDfBQRngdt/VNJmvC8yXCmBqOq/ISXwuHdYyr8Y
   y4UYydT2Z48VMKU/tp48HapQ+wOtH7a0Vez+GpF9697br7JdyaZurRsvi
   NFxt21ceFQf/xlxl4l1rNviN0iNUA2jr4CJOFUPgvI+sMnXoclX0dZAnD
   qaTzaeve2olTf+WSJmcA1VVGR5L0Vs+Mao3LlOffNldLYlxPnSXcFkSke
   Q==;
X-CSE-ConnectionGUID: mGDOFiJmQjmWifLUX17uwQ==
X-CSE-MsgGUID: UsCHaDuvQj+9Ze4hG/ZBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="210427168"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="210427168"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B5A241C00084
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 70A571C002D1
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 5D287829F33
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:26 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45D601A0087;
	Mon, 25 Aug 2025 11:51:23 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 04/10] libxkbcommon: upgrade 1.10.0 -> 1.11.0
Date: Mon, 25 Aug 2025 11:51:03 +0800
Message-ID: <20250825035109.797-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222398

Release notes:
https://github.com/xkbcommon/libxkbcommon/blob/master/NEWS.md#libxkbcommon-1110--2025-08-08

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.10.0.bb => libxkbcommon_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.10.0.bb => libxkbcommon_1.11.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
index 79c95cb8ed..c953058275 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
-SRCREV = "7888474d0296dcad50c9ba4adfdfdf2be02d35e1"
+SRCREV = "0f9cefb1fedb23433666fa5d9045e48ff030c006"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.43.0


