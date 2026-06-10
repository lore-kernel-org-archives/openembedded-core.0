Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC7ACD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16345.1781084986807947092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ascI1wof;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084987; x=1812620987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3FzhuH5Tb1tve7ByCWm0hoUPj+1e1xXuIjGPkGTKfUo=;
  b=ascI1wofclfmLke9CWalzaceCRQHRs9IEH6nkF2jNLWxUkuORBAPsaei
   iCsirp3b3OtRaLcbX+AkwnAIVyS3c1n07ykqorqyh/V67X4wUAOgKwFEj
   p2WlVE05nxyWwNjoblBJ09NPg5NuLpSGxMG6k/kiHCDIucsT4CBzi4Y4i
   LEmKv+oqmOIYBB4PhAgvlCbDhQfw+y7JuIpm69hRn8zcfzB86yZQgdsuc
   zlsiXWDdRbBkKSsgR3u5VOvmPwFq0/yOFFtMosQghnx3CS9FKd3/APjV2
   X1MSxf5DKh+eL//FAAQXllCeRBJYLpaFy1Sq+KG43DO1Bv8gGSthHNfvK
   w==;
X-CSE-ConnectionGUID: eYSTDBJWSiuiVrjLC579Yw==
X-CSE-MsgGUID: RZsSOZkpSdyWiB/5u5t0nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="246966906"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="246966906"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:46 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 24690C000B9
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:45 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D1058C38B12
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id F058F14000A3;
	Wed, 10 Jun 2026 09:49:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/16] barebox-tools: upgrade 2026.04.0 -> 2026.06.0
Date: Wed, 10 Jun 2026 17:49:18 +0800
Message-ID: <20260610094932.2264-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238328

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index f736ca68e0..6467ed3653 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.04.0"
+PV = "2026.06.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
+SRC_URI[sha256sum] = "521b427efe4d5199641fd6440ed77226fed3ba7088ee2f6361b510187f700f09"
-- 
2.43.0


