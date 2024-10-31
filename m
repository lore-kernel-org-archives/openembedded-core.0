Return-Path: <alexander.hirsch@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D720CE6897A
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 11:54:46 +0000 (UTC)
Received: from newsletter-01.clustermail.de (newsletter-01.clustermail.de [212.223.35.126])
 by mx.groups.io with SMTP id smtpd.web10.10507.1730375681757524317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 04:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gin.de, ip: 212.223.35.126, mailfrom: alexander.hirsch@gin.de)
Received: from [62.157.191.2] (helo=GIN-GR-EXCH01.gin-domain.local)
	by newsletter-01.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <Alexander.Hirsch@gin.de>)
	id 1t6Tl9-0004dm-2c
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Oct 2024 12:54:39 +0100
Received: from PC-138-100-3.GIN-DOMAIN.LOCAL (10.176.8.6) by
 GIN-GR-EXCH01.gin-domain.local (10.160.128.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 31 Oct 2024 12:54:39 +0100
Date: Thu, 31 Oct 2024 12:54:33 +0100
From: Alexander Hirsch <alexander.hirsch@gin.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] perf: add PACKAGECONFIG for zstd
Message-ID: <ZyNv-fEkSB649_Yz@PC-138-100-3.GIN-DOMAIN.LOCAL>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.176.8.6]
X-ClientProxiedBy: GIN-GR-EXCH01.gin-domain.local (10.160.128.6) To
 GIN-GR-EXCH01.gin-domain.local (10.160.128.6)
X-EsetResult: clean, is OK
X-EsetId: 37303A2952B00555667667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 11:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206579

perf record can use zstd when available to provide on the fly
compression.

Signed-off-by: Alexander Hirsch <alexander.hirsch@gin.de>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 11fa917649..fb3c19dd01 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG[jevents] = ",NO_JEVENTS=1,python3-native"
 PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 PACKAGECONFIG[pfm4] = ",NO_LIBPFM4=1,libpfm4"
 PACKAGECONFIG[babeltrace] = ",NO_LIBBABELTRACE=1,babeltrace"
+PACKAGECONFIG[zstd] = ",NO_LIBZSTD=1,zstd"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc = "libunwind"
-- 
2.43.0


-- 
G.i.N. Gesellschaft für industrielle Netzwerke GmbH
Raiffeisenstr. 15
D-64347 Griesheim

Telefon: +49 6155 - 8259 - 0
Telefax: +49 6155 - 8259 - 11

E-Mail: alexander.hirsch@gin.de
Internet: www.gin.de

Sitz: Griesheim
Registergericht: Amtsgericht Darmstadt, HRB 5068
Gerichtsstand: Darmstadt
USt.-ID-Nr. DE 111633284
WEEE-Reg.-Nr. DE 20824942

Geschäftsführer:
Dipl.-Inform. Andreas Schoenberg
Dipl.-Ing. (FH) Dipl.-Inf. (FH) Jürgen Hellmich

