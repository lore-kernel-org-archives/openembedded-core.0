Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B4F103E19D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7856.1773915283897508596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oM/3P8BA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915290; x=1805451290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PhRhBhWiLhphPhrzu6+hf+UQXmO2sAU6lN8Bu5Mho1E=;
  b=oM/3P8BAs4yfNvAfkED5LtxiYF0thDkdxTzvCkCYCZ9ECgg7xbWtBT4n
   tjNAyYFEVz4QhcSwh+TWpLY6h9YjvRuqmNbr/ykOCUuzDN48P/+wJC3bU
   Wt73zbi8iJhjfE/4zPhp4sqQRz2zFw/6v6M181KCk0+4w1V900zNgssmH
   V5cM92QL3NB6dGWHqtfW/UqQCx582o0jrhCtkE1cb6KDNfddxLxjZ97ER
   nbHzhUuAqugm6OIk6O5MCRk6QSkwaJiajbQvWlqJ0bTbCuaiNVGW1tfWL
   m+scrmDjYE7sRTBNV0wAY6pswUl+xn53JHeZDr06JizyVFblOcnMTpKK1
   g==;
X-CSE-ConnectionGUID: VtC9c6PCRKG56H9wbRqFLg==
X-CSE-MsgGUID: wL7gXCmxSFKhXwxpTzhfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233324785"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233324785"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CDEE642A329
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:48 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 78F9F100D101
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8BCDA101E52A;
	Thu, 19 Mar 2026 10:14:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/40] libgcrypt: upgrade 1.12.0 -> 1.12.1
Date: Thu, 19 Mar 2026 18:13:07 +0800
Message-ID: <20260319101332.2067-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgcrypt/{libgcrypt_1.12.0.bb => libgcrypt_1.12.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.0.bb => libgcrypt_1.12.1.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
index 7638cb0847..b3c0d050b7 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5"
+SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.43.0


