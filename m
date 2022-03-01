Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFA7C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 22:44:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.1294.1646174658918849920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 14:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 221MiHJi003970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 14:44:17 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 14:44:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 14:44:16 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 14:44:16 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libarchive: upgrade 3.5.3 -> 3.6.0
Date: Tue, 1 Mar 2022 14:44:16 -0800
Message-ID: <20220301224416.96621-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 22:44:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162575

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libarchive/{libarchive_3.5.3.bb => libarchive_3.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.3.bb => libarchive_3.6.0.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.3.bb b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.0.bb
index dd607aca0a..31bc82515a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "72788e5f58d16febddfa262a5215e05fc9c79f2670f641ac039e6df44330ef51"
+SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.31.1


