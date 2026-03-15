Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E592D58B27
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:41 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28370.1773579757641425296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bBbSX024;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1147; q=dns/txt;
  s=iport01; t=1773579759; x=1774789359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=blkqStRF7fI2aZyfce84sB1mnG3t5mCYt3MhJ08kBCI=;
  b=bBbSX024Wpfjy9dI8w/tXc8rNdeAzVkStwrelAw3jOCyKDka1HR81fXz
   8ntzqQDewwq20pKE2Sn+Di2rpDXw0pgAcaH/OQDR9GdPEF1quo1TjgaV+
   3oavCz5gjuz/sMllktzAqfsilaluIOjb0AgVAbRZp9tCvsQD36MVkWHsb
   5SFbh6RB/+xlc+3ju93JH1Hsp8/EmFtaVWt8DCnSxq/x6xtd1G6juEns5
   b3d6lByOqy1UkM6a6hbvGtewpryGF+m1yX+MSELJicUm3CFsMimJdh278
   LvqVvIGKP/r42gqDkB9bwgaeBksYe3irYgZxD/b75Kzj+UFZemUPYsX68
   Q==;
X-CSE-ConnectionGUID: JutZpd9JRTGP7XKQzH2FNw==
X-CSE-MsgGUID: ZDCNkf5dRF28n7FYZ+rGEg==
X-IPAS-Result: =?us-ascii?q?A0CoBACYrLZp/4v/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAVYgJgsrKxmDAgGCcwIBEbFZgiyBAeAiAQsUA?=
 =?us-ascii?q?YE4hTyIGXSEeicbG4FyhAd2hAqBBoV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgQJFaAGmHKEOCiiDdIwelToaM6prmQakWYRogWg8gVlwFYMiC?=
 =?us-ascii?q?UkZD45fzH0jNT0CBwIHDQMLkWiBfQEB?=
IronPort-Data: A9a23:O62IM6mO+Foid2+KM0bUx4zo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXDuAPKmMNzP9Kt0ga4nn9RkH6sXVmt82GQZo+C1jH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsv/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa8F5tRvDTBsz
 8A3EG89TSmRp7iY5q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKLK4XVHZ0JwBrwS
 mTuzUjSJBIUadCl52DV9C2Ct92MhwzWV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:7MHQLqCWH320l9jlHemt55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefygaYvp
 0QFZSXz7bLfD9Hsfo=
X-Talos-CUID: 9a23:DIbQ12NzJ7pWne5DejR7xlYYS+IfTlLlk0fzGl2YU0hPV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AzOi+lw14Qcn1/vsz+v3BMiBp8TUj0YiFLkMDzJk?=
 =?us-ascii?q?8lZPUM3NeCgXelhuaTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="691700464"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id F0D6B18000222
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:38 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id A01F5CC12B5; Sun, 15 Mar 2026 06:02:38 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 3/7] python3-pyelftools: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 05:59:44 -0700
Message-Id: <20260315125948.3002743-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315125948.3002743-1-deeratho@cisco.com>
References: <20260315125948.3002743-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233111

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-pyelftools to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 447c8ad6af..eb555ed0c7 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "pyelftools"
 
 inherit pypi python_setuptools_build_meta
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
-- 
2.35.6


