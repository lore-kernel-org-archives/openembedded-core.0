Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6B5C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.22086.1754475862465132409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mYFF3cUE;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475862; x=1786011862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4ZANY4mv00x1UUGF+F28/+NVQ4cM/w40v9FU1aaVww=;
  b=mYFF3cUEeoLZHrhjlc8VOnAbWl/+Tn6VV1+LhO5YF4KdSHF5Sn7ie3iP
   XO4KiVjPbKr8hOX19eY5AcOkKxJcfbIHTYwKZu22kV1fududLor+EMk/i
   DOULV1GCCrThg2E8SvKz/kwnH9HaNSqpANPLfM5mD6/Szmzd1a6GRWNMq
   mXEebXJoDKmXIBagbvab7ghGqAb5lJr6c/QlZk8xnmuIs0jcxnkmOAqWg
   yEAqSdgWzmtgWCu6P0J3g3WpNsLpI5aM1l3yZWqL577w6UXGY1kXs6p32
   S8E/FY7TgZLeBN3v4hr+dZoLkkK+gIMt9x41B69Fx0f2blRB3MwDxqU1H
   Q==;
X-CSE-ConnectionGUID: /XDK2myyQcewZ9DMZBgDkw==
X-CSE-MsgGUID: h9qm50qKRKOPqqjc4ZxkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="187546070"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="187546070"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BCFC41C1C703
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7D7C318000ED
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 6A2F41800D53
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:18 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4A781A0110;
	Tue,  5 Aug 2025 17:06:43 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 7/9] spirv-tools: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:21 +0800
Message-ID: <20250805090624.711-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221529

Changelog:
https://github.com/KhronosGroup/SPIRV-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 4594a1a942..319b25b7f4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
+SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
-- 
2.43.0


