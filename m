Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30767108E1C3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7867.1773915316565450898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XJkMIjLe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915322; x=1805451322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=muiqJxvRlVBtlMuIU9oFcTRVE6mUTlKHpGyfy1UZhdw=;
  b=XJkMIjLeqQ6DRy60rjM1ScncxX1XFoyxVgs9E1EVAFt3oJst4DlFaJc6
   h3gEruYNpUiWNfN8K3GcbqmKU8cAC2h0t2T2h7elegWWuIYpvXBn6rlq+
   hBRGyL7+tr8FPIbg6Z8qN2kTWsaEv2CDyHG975dYEHxfEZnPDQs67RVtt
   hT0Qr5TxSJMY2cHLzhau3gKlgR09GqDir46IlwZaB3zn/oKRyHX45jfhp
   HhgW6GiVxIjstXyTfM+vu9Z5FbantGdDaiZ3dPPG1b4wXQOAvw2LBM4Xp
   olWfc1VNNgsRf8WehtHuRKeEvzBZvpvfF9r29n/qzrNKOAr7+SR1cwN76
   Q==;
X-CSE-ConnectionGUID: F3a/skBUS7OVeHztaD15cQ==
X-CSE-MsgGUID: cFmAnIGQTXObfjlI+AF3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221352238"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221352238"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:21 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 78A153049
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:21 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2ADCEC02E7A
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3BC9E101E52A;
	Thu, 19 Mar 2026 10:15:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/40] python3-shacl2code: upgrade 0.0.24 -> 1.0.0
Date: Thu, 19 Mar 2026 18:13:22 +0800
Message-ID: <20260319101332.2067-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233494

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
index 93ed9a2530..49416b3a04 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "1f9d5cb786bf98d3a7de92218fe5e546143d6aa2aa134098200b06022629d005"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


