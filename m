Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B85FCAC595
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13221.1757495823526350494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sN3OHn3y;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495823; x=1789031823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EH6fGG/Wg72g5+yOjlVMAwwW8IQoF0/xsVZAHOWTM98=;
  b=sN3OHn3yKN2zPDwStYqVIDyeWFrhtMmn33kQvDsDT04fAX49g74CJ6PZ
   8ScNnagokBb4zOevZzix4BK/vXFEZVDejd1tVAYsENo7G3K1pQGVn2mg5
   ZEBTbni6WYKvXLPSpKrRT2TaAcL8tYapFBP0elQbr+rJn53bvuluGWURk
   O6/IUZ4lMHvpEh3xYi70J7Dlb1BP0mfGOQxAKeImOzyCvUyMJwHIpa9lI
   iGG2iKOucKmCOLlGUUpvGFBxeayccuAhyJebvqw1kSskSfnvR7GTPqjWG
   PTLtFEaTLl6EGXfnmjvfaYsNyyWRnf0aQveEBKcy7oYLX7fzLfJpHBITx
   A==;
X-CSE-ConnectionGUID: 2cfd1xJ7Q72z5jd6biRfZA==
X-CSE-MsgGUID: HzBdviiKQIKVI0hS95D/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384169"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384169"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:02 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C196D1000353
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:01 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7B425C00540
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id E9BE31803FD3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA1481A0086;
	Wed, 10 Sep 2025 17:16:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/40] ed: upgrade 1.22.1 -> 1.22.2
Date: Wed, 10 Sep 2025 17:16:12 +0800
Message-ID: <20250910091646.998-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223157

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.22.1.bb => ed_1.22.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.1.bb => ed_1.22.2.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.1.bb b/meta/recipes-extended/ed/ed_1.22.2.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.1.bb
rename to meta/recipes-extended/ed/ed_1.22.2.bb
index bfcff37e69..80d4e116ac 100644
--- a/meta/recipes-extended/ed/ed_1.22.1.bb
+++ b/meta/recipes-extended/ed/ed_1.22.2.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb"
+SRC_URI[sha256sum] = "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.43.0


