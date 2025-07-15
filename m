Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A4FC83F3A
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2951.1752566912074069742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tx3Lbmx7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566912; x=1784102912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwJo4IwgWZVcQ0kRHl67butnIjuSj40feEJWI6WTvNM=;
  b=Tx3Lbmx7exU56vYPK7RYTVKgChxD5wnti4IPCJQvTIyLWoA+Feao9F4F
   dGWW3pNNriA7rNYrc0UFcwl/LuB+Qccnjzg4HuTQIK8eYbBhLhBUdgxdX
   Z8DdnOz7bUJmrtDdXfRXRCtBgCQsnRLDnIFQOi9kORnHFn4X93LJBWhUG
   OFV4/jgv/tjdx7b428c1vms/uxpiEHFt/QtjBCvFuVleoieftMA35D3DK
   OR61YUWDQ73PIvxpTz8EZVrrM/KA8YEN9d8RRzJZbPeDBOYixioHV6ZsB
   vsI4Q1Ij/Oiq+AV2lInwH8JHByzNB6WJjr2SZdKVoEDEeVoA3XVySOVnl
   w==;
X-CSE-ConnectionGUID: zrOwxuwRQs644F5d7SIPiA==
X-CSE-MsgGUID: Uf3gCD17RpWlMPo3SjGjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="206322481"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="206322481"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3DA74C00347
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 97F2DC00213
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA2C61A0071;
	Tue, 15 Jul 2025 16:08:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/19] hwlatdetect: upgrade 2.8 -> 2.9
Date: Tue, 15 Jul 2025 16:08:06 +0800
Message-ID: <20250715080819.622-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220277

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index a2e8558c4c..2042768d5a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,6 @@
-SRCREV = "f5b910a90b6f5ab0ef6df392e009ffe1429d53af"
-PV = "2.8"
+SRCREV = "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
+PV = "2.9"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https;tag=v${PV}"
 
-- 
2.43.0


