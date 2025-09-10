Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56356CAC587
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13176.1757495901192975484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j0eUwWg7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495902; x=1789031902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/tHuF02O/cMafv9uy9bxhMUaEb57IGEg4Yu2pGEhUvc=;
  b=j0eUwWg7dYyILOy6cSu18UIh6kJlhXYMeOVGylEW06bOvoDERou1R+Ea
   cPIy0dj819K7I7LKannorYM3HPK8N6rDQ3roA2H9E/dzOzzGu7zNRYJu5
   VBdQoF4kqie0/5iVNSSQWBmxdOZhtc2/tpEZ9WLD9CtBAO4O2qc0BHiha
   maqma4OqgfFtoVbdaHOp6O3iiHf6dNXUSuwfV/dhmOg/rZCW+8FD+UhWa
   9An5a185RjN4mYvPsC9tFZtiPheJoPmTgr2DuPLg+X7O7ocaCqeNQ1hIb
   U/MLFVHBYjudqFZLZ9quDKM7iwznkm/xuhzjpFbOzMH6RV7/Bnl6Moq8T
   Q==;
X-CSE-ConnectionGUID: TsgrvVA7RyeC/DJw696vkA==
X-CSE-MsgGUID: 93dE0GlpQiaw6NWDWzshcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="200942189"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="200942189"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:18:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D37901C1C724
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 94AB01800243
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 18DAF100512F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D42A1A0069;
	Wed, 10 Sep 2025 17:18:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/40] xdpyinfo: upgrade 1.3.4 -> 1.4.0
Date: Wed, 10 Sep 2025 17:16:46 +0800
Message-ID: <20250910091646.998-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223191

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.4.bb => xdpyinfo_1.4.0.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
index 3becd40281..804b284352 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.4.0.bb
@@ -15,6 +15,6 @@ PE = "1"
 SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b"
+SRC_URI[sha256sum] = "dc1de6e6e091ed46c4837b0ae9811e8182f7be0d2af638cab3e530ff081a48b6"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.43.0


