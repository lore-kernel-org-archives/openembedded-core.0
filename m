Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC6FD58B29
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:41 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28370.1773579757641425296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OrfFaIQD;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1044; q=dns/txt;
  s=iport01; t=1773579757; x=1774789357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PTlS+u+FGXw3meJFT2dFTWfAUuPyeQmjXD6yFdXp+HM=;
  b=OrfFaIQDACzv1Y6FZG9nMo0TUiLxraDgnyYWr0PLiosmkM72GReXijEM
   J++8fFl0jGuwMyczzHC6uybB9YxtM15sgBIa2oRUsQRJVvAXy+lGFZtUR
   R6T3z+KTS8YWWg/wLhVml0bO5OXwZy8IJfqRGcwG5bVaMufCTa+g6Vd1v
   wwXbjSewPJK1xUvxkdl4LGpV9ikEvK1gCasCRi8SHoGP0nemXrfrHQK43
   1bGVIjlCrWmW/OnXTcOwnBn8RhoV/mNPacvFej30yhffqzP5SEx1FCdtM
   iiCuGn/sB/Y3z59QEsoPZ3MTjFQiNGxAqGuaFnTYS3KH7mR05ugNMKAwk
   g==;
X-CSE-ConnectionGUID: iVcn7ihtQUquUE01tzrZyg==
X-CSE-MsgGUID: X3THE2jCQWqypxFrFV+VnA==
X-IPAS-Result: =?us-ascii?q?A0CxBQCYrLZp/5H/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbFqgiyBAYMoAdx5A?=
 =?us-ascii?q?QsUAYE4hTyIGXSEeicbG4FyhAd2hAqBBoV3BIIigQ6Bf5EtSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgQJFaAGmHKEOCiiDdIwelToaM6prmQakWYRogWkBOoFZc?=
 =?us-ascii?q?BWDIglJGQ+OX8x9IzUCOwEBBwIHDQMLgWiQAIF9AQE?=
IronPort-Data: A9a23:nmvGRKgoSgHdDMlC8jNRHfpwX161MREKZh0ujC45NGQN5FlHY01je
 htvCm2COKrbMTfzcogjPIW28kICupDSzII2QANqpSo1FyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMsPve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUZxO1xXmBO6
 cUlMS0wQ0jam/Cs8qO0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JI3TGp0NwhvEz
 o7A11SiPjE3bt608AWc42q8qPXho2DFXqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:iwllrKMCBLuFtcBcTsCjsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3DHio379
 YHT0C4Y+eAamRHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AMSqHmWvRFXopZcTAvMrdE+Pz6IskTHbbk3bQP3a?=
 =?us-ascii?q?FEHtUZeXMVU2KyrJrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AwHwxLwwGiNElKsH2ScN76SZQSZCaqJT1NGAgy5c?=
 =?us-ascii?q?tgvadJDRgFS2zsneJRKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="691700454"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:36 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id C12C01800058F
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:36 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 6DD8ACC12B5; Sun, 15 Mar 2026 06:02:36 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 2/7] python3-magic: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:43 -0700
Message-Id: <20260315125948.3002743-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233110

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-magic to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.27.bb b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
index 2e561e69d7..23f9d4c0a1 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.27.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
@@ -19,4 +19,4 @@ RDEPENDS:${PN} += "file \
                    python3-logging \
                    python3-shell"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


