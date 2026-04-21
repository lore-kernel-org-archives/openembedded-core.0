Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8EDF89220
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20443.1776765385332640571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E89hDqHA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765385; x=1808301385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jcQOOzif4dm8R9A62GFWaCDSbhyDY3azJmvZA+/lags=;
  b=E89hDqHAOPBE9s/pRgebhMo/sJmnvm0tbuQ1/JbfdzyoNDdzjHQC3cSq
   VWzBSQMpVMSPcnD9NRHc99IVpF52Di1Yzm+n5oy5uQ8SG8IBMiviJD3qL
   yR46HNf20yNod4jPRG5ejC/STNZmsqHPNi4oE0XtKEHDH0pLH968jHHTn
   fEqgEtHmArGfrzoQCA7Y+TZNk91lLA2iiT9AzmyU8dTsC+1NvnpvEu9w7
   AmHvg5eMUBvTsLDAYD/xbEq0S1IBN8NmXJsCH8TbkBFVCoSBJnk5tEFwJ
   Zy8UCX3Uv3J4VLZJySihARRgL+4OWbwQr5ViYpP7rGQ9SoEH5fmMynUSH
   Q==;
X-CSE-ConnectionGUID: 9yuveZH2RbO0pvqLKmG72w==
X-CSE-MsgGUID: LdxkxNIJRTWNd6bmOmyzsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="226358582"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="226358582"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:23 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A52BA100281E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:23 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5F96A8D29E6
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EE14914000E6;
	Tue, 21 Apr 2026 09:56:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/49] groff: upgrade 1.24.0 -> 1.24.1
Date: Tue, 21 Apr 2026 17:55:20 +0800
Message-ID: <20260421095559.1856-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235618

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} (96%)

diff --git a/meta/recipes-extended/groff/groff_1.24.0.bb b/meta/recipes-extended/groff/groff_1.24.1.bb
similarity index 96%
rename from meta/recipes-extended/groff/groff_1.24.0.bb
rename to meta/recipes-extended/groff/groff_1.24.1.bb
index dbc8cdf6d0..c4df5f1b18 100644
--- a/meta/recipes-extended/groff/groff_1.24.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-gropdf-use-SOURCE_DATE_EPOCH-for-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
+SRC_URI[sha256sum] = "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"
-- 
2.43.0


