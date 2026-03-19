Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF335107529F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7734.1773915288282216020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJMrA5mo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915288; x=1805451288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H60ce0P+xsB6V8/7F42B1YZVEXSGSRbij90Kxzh4J1E=;
  b=JJMrA5mojp6vZ/xaXUjsPqJLXjinR9LigrK9S/T83u5W9tqf/s+KQwcf
   IgnXfgIqEBlQpqwgmw5+zjzrUq3WP+OhO8MglYzpiDPNY5L57ftEbZEmE
   Tu+CzbxwbsQXmOZ43+iBq5KD8cR9jSKod/nHasLClRzb+a9fPcZrmrlbO
   bOdw12SHvx/zipc/7k4qnP9U/+4glcQ0PRcI50ujT6GaUKm4OXNGgW9XU
   zNJ4nknRiBQiYPaM/cf81mWf/f95j0Qp3G22fl4Dy95qN9P6DXQJH+wvk
   lP3GLOqaj9gf+OXpmbpTim0daEs3Xl3Q+Uhv2KTHyY5FFMErE5xM8W1/j
   Q==;
X-CSE-ConnectionGUID: GsVpbcBdS4q97maE97a6mg==
X-CSE-MsgGUID: w6Kp3x1vQkeU/htTQYHiQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="238209066"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="238209066"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:47 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AC3C81002B81
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:46 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5E5321410C96
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6BA14101E529;
	Thu, 19 Mar 2026 10:14:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/40] hwlatdetect: upgrade 2.9 -> 2.10
Date: Thu, 19 Mar 2026 18:13:06 +0800
Message-ID: <20260319101332.2067-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233481

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 2042768d5a..e782d990c8 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
-PV = "2.9"
+SRCREV = "40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28"
+PV = "2.10"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https;tag=v${PV}"
-- 
2.43.0


