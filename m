Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC881CAC592
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.13229.1757495855880107815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s2Knr6hd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495856; x=1789031856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPpnIypWtAIy4lXytnf1lnTotD5FJ6OQ9HSxWzVaxwc=;
  b=s2Knr6hdkg++KPGF5nmczpl/jc8H4AaNN+rAJGmyDh6Ra2BdlCg3cobV
   JkYFkT8WRVR1RqJ8l82k/0BABDBwvZUbQ07Q/NXtsDuCz9g8asgCrJbNZ
   UMoKv34bl6lh/EwXtIJKY8JgxGZdOZsrLSulY1M3vIpVNhS/1NlJHEmVd
   UPZe79hwvgnZ43MHHf54Vg0EKLA88LyyLfPFmQEQzGgxa2q+fkQkFwreu
   y9euF62DN53VtMpPSYyv8Llzd2Zv0LIPEAbhRir4EGr0ld88uoOWKSzdn
   wK/OoBBGYEg/8DWrEOph1Xeje2EFre9IbIyos74LjX395UQ6wyta+oDd7
   A==;
X-CSE-ConnectionGUID: 6Cz/Xt1RRtytNFZ4iTjg/Q==
X-CSE-MsgGUID: 7eTn5jiUTUCUWWr/8N8fxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="199856632"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="199856632"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 55DAB1000354
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 12E6818009F5
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 7B15A100B799
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71B3E1A0086;
	Wed, 10 Sep 2025 17:17:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/40] libxfixes: upgrade 6.0.1 -> 6.0.2
Date: Wed, 10 Sep 2025 17:16:23 +0800
Message-ID: <20250910091646.998-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxfixes_6.0.1.bb => libxfixes_6.0.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_6.0.1.bb => libxfixes_6.0.2.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb
index 28df7bb805..513e85ab9d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb
@@ -6,7 +6,7 @@ provide the minimal server-side support necessary to eliminate problems \
 caused by these workarounds."
 
 require xorg-lib-common.inc
-SRC_URI[sha256sum] = "b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58"
+SRC_URI[sha256sum] = "39f115d72d9c5f8111e4684164d3d68cc1fd21f9b27ff2401b08fddfc0f409ba"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5a9755c8921cc7dc08a5cfe4267d0ff"
-- 
2.43.0


