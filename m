Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06D6108E1D1
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:19:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7927.1773915565485419288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pFungn+r;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915567; x=1805451567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2OFDHm+N7eceLLxPqFid0Bx89W+auWfHZSP2e8iQ6mg=;
  b=pFungn+rPwL99RiXsJvtnaqMy6W3soxcNtpQkrMDeY0CgToCYNC+O1GO
   jtYGHP2WC5YfJJX4D8I07TX27XQgIzka9MVCizIXYLhTdmU2xXlpxHyB6
   GPDPzJ5aOMQj6oR6bWMWJ94Edpeb0nyheXJplWDGK4ppXXh/SZM1Wa2sx
   DigjGTzimSwu2k4VXA7HiALjwj3s4SjK3dwttW4aTjGDhhJCbfK4wUNK8
   9IAKDXn9d4rHiZ017sKfWbY/+diSH5SFPgIwe81dT9VuKwRaOyv4NGt9D
   KTjh82bu3vPkDCm9fnzb3PHcnFCJ/WFEpx698Jh0bpsNcXHbOU31yShdT
   w==;
X-CSE-ConnectionGUID: D+TZtdmXQkWsmLkETdBgPg==
X-CSE-MsgGUID: gmCyt4MpSkiVZ9dv3GLdeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233898218"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233898218"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:02 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ADBFF42A33F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:01 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5651E100595C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7610B101E523;
	Thu, 19 Mar 2026 10:14:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/40] mesa: upgrade 26.0.1 -> 26.0.2
Date: Thu, 19 Mar 2026 18:13:13 +0800
Message-ID: <20260319101332.2067-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233502

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 14dc7b6c51..a95adfc960 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc"
-PV = "26.0.1"
+SRC_URI[sha256sum] = "973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346"
+PV = "26.0.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


