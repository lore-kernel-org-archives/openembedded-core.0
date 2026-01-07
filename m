Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A577BCD5850
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3122.1767781896664570006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oXMQWDfi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781897; x=1799317897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oE0J4X1t+5gcceRgdTyZ4P5gjemzK/O4rawCEVvPric=;
  b=oXMQWDfiskOux4YpJp4uyoZoI1mM5Ab7reuIwIPtAbNWFa/d9KqHWk6l
   hbNHLTigGyC2IIVjVCehlyN76SMqnn8upN1Ig6kqu/v45y0wRd2RXUdsc
   JG0WgBYr52mZTN7/hWKFPrHZsQSBxXlKtTZHsaUmLaHtGGbipfPSUuvFI
   RDSiPmLTgYGLVt/MaCk9H7drdJmWHK6j0zLyOVit05K2tdtE1DkQZrfhe
   oDTsxo8onX+qKs/meVUdhomm6yL3U3m4qb2cstnL+SRI3QsIkec+mipd+
   9GA6V51kXLJOOAb3TgYV8VsoOIKDbBdhxSd+b/ei7Vs5WAtUrRRUjF3nv
   g==;
X-CSE-ConnectionGUID: d3mc9GBWTPaPk18XsSZJxA==
X-CSE-MsgGUID: BQ/t/gStRoqMRJotnWNjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467876"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467876"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 451C21C00081
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EEBDC1005967
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 35316101BB5E;
	Wed,  7 Jan 2026 10:31:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/15] python3-psutil: upgrade 7.1.3 -> 7.2.1
Date: Wed,  7 Jan 2026 18:30:57 +0800
Message-ID: <20260107103102.458-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228980

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_7.1.3.bb => python3-psutil_7.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.1.3.bb => python3-psutil_7.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.1.3.bb b/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.1.3.bb
rename to meta/recipes-devtools/python/python3-psutil_7.2.1.bb
index 67d2080f21..0a9b073855 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.1.3.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "6c86281738d77335af7aec228328e944b30930899ea760ecf33a4dba66be5e74"
+SRC_URI[sha256sum] = "f7583aec590485b43ca601dd9cea0dcd65bd7bb21d30ef4ddbf4ea6b5ed1bdd3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


