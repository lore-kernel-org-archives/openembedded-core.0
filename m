Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D65C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3552.1786186332120819974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=P7Z90D9j;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260808105213c5169f4f6c00020777-k2q5xx@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260808105213c5169f4f6c00020777
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MMicT5poJGpFqHjGdeWmghDGZq4CydCUUx2H50d5NFU=;
 b=P7Z90D9jYT2Ir3lauJImmRlwga/wncIbBea83HSoNYPCO5mi8fYXyQsfnvWZDB5sqNA+Hk
 cHv8bVJnZqYZasjM5f/CxqUcpm114CpI0+2xbxAjLb9+Q535pf136lBiYC5Sq6GJXV9GYlhM
 kIxpFmxS1LVgkCCnZ8qVIHTX64NhsKupL4PtXAnWlQnp1RQeZ6d3vbCMyZi0595p4iucPiad
 QAqUI+sgnRY+gtKukNGlQvY4IYibQpUZvNN9zmqGBMmEdBuhF3cio93JuhbTLlGCTT0jLEH8
 FT+/tZwtrQLhRCcMcLYdMbGSDKwsQV8PiQ9ZOeHxq2SicenkBPSGMGwg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 01/11] sbom-cve-check-update-nvd-native: upgrade 2026.05.07-000006 -> 2026.06.09-000006
Date: Sat,  8 Aug 2026 12:51:37 +0200
Message-ID: <20260808105147.42294-2-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243038

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d33c73535229b5066901faedaaaca0aa6bbd99bf)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
index 02446e30ce..2917c89e62 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

