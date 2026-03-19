Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA11103E19D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7862.1773915298929446925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r+QwU342;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915299; x=1805451299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6+KGY4EdheYuHC1b9Zl6exL5l1Z7vBMgSz0cLAzeUsU=;
  b=r+QwU342cX67cGQ28ww/sEoLPl1vsJ6ANlfEd8U6NxU1RdcY+Cw19bGj
   S9VDAT6tKEn+BWVtjJho31oJJyXq3wcyh+pUaLsNtSRYRaCa+s8WSmqno
   5VNKbT7Z3/OJ2fKBfe2h/dEi+U0FRVLYthgDISncIWPwj9p1YaNb2HLDn
   TUlW8x2myvoeFVP7qJjvWZB+dp+d2Bb2SLYQs8nSr+woaA4NgthnVA/aV
   HKy71RInR03A9GX0ZguMiVdFS3e3UJLjK9PR/Ok2rDc96WEu8cIVlKTWW
   +B/GxKOUD7dEmzYLJN7h1x/EWmuj6soOu6DJnjI/ZDndxtjy45vLc/V2m
   Q==;
X-CSE-ConnectionGUID: cSRx1eWOS06vAoE54aUppQ==
X-CSE-MsgGUID: nfmrbh3STsOoZk0ydXnrUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233324807"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233324807"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 63FFA1878
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 160A61810842
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 37051101E523;
	Thu, 19 Mar 2026 10:14:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/40] lttng-ust: upgrade 2.14.0 -> 2.15.0
Date: Thu, 19 Mar 2026 18:13:11 +0800
Message-ID: <20260319101332.2067-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233485

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
index 1a15c5b420..fe502ba713 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
+SRC_URI[sha256sum] = "6bc9723c7a50dd00c7da83d40b3bbb4b0746819f4d6e377c9bd897c898993e28"
 
 CVE_PRODUCT = "ust"
 
-- 
2.43.0


