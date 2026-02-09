Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAB6E78D4B
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43585.1770627809027587216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rcW66Qil;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627807; x=1802163807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9eZUBDjjQz7LWf25KSafX1LQWw+n41sMT2nI40caVtI=;
  b=rcW66QilwHy6IC30CKWOGQ+wmo6zItRPKgjtEF0vqu0b0B7FnkeOStMp
   1cyvy6NUW65FH7zVAhV6PgdEKnnQNT0HZKAp4hwvrCB00Oh1DWGGhRZdz
   pMZs4qFyz1I6UsZaG03YqBjm1NoKYAxuLuIRPrRyJSXUmIwPL89xL+RxM
   henwRFtU6xzEcX6UNqkHMnls9WMCTd5yuTq7eoKwG4bYxNzUnq9mf19j9
   nLTKJA3CTii5PE99SOp+M5/ye60Snfz9e/koRFVmsVOuk1IZbmA5hnILG
   uEgGSLOGx2TJaph2E9BR+K3U6pX0XviwA1qfoi/MPyDg8bPPbxvUFUsDP
   Q==;
X-CSE-ConnectionGUID: vK097AQaQICnSfDo8QINJg==
X-CSE-MsgGUID: ilzqnOwQRVunsmgPUn8Ckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980356"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980356"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:26 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 5357742A33F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EDAE814003B0
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 421C1101A406;
	Mon,  9 Feb 2026 09:03:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/39] diffoscope: upgrade 306 -> 311
Date: Mon,  9 Feb 2026 17:02:40 +0800
Message-ID: <20260209090317.1468-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_306.bb => diffoscope_311.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_306.bb => diffoscope_311.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_306.bb b/meta/recipes-support/diffoscope/diffoscope_311.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_306.bb
rename to meta/recipes-support/diffoscope/diffoscope_311.bb
index 624e1ee3f1..e947bc0219 100644
--- a/meta/recipes-support/diffoscope/diffoscope_306.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_311.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c489aba7334ab0d4a9946ac51fe1b17085621a5476b89950e9c4f1e612cbab3"
+SRC_URI[sha256sum] = "9316493c0ba14d6f7537dd4e4ade7d4cd5cfef86b63fe687f0e7073861c5ba8b"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


