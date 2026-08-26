Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA314C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7699.1787732013337054212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TrrTy8oT;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1604; q=dns/txt;
  s=iport01; t=1787732014; x=1788941614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=buZe+K+gLh15VXrXZi2hZyOPsGAsi1b5PGabQXRhVlQ=;
  b=TrrTy8oT8T6rkIpB4cZR26dpXkP7Lungo3E8+9AKarBCxkiGuWbTl+4Q
   ZPbsfQrMPyFUdpbgTCV0EmdffbAp48FeWICx4hEbix7ulc3uY2AeAYwFc
   cjRBq9tA4QEFAt04fmH7/vLDOgD80L4PGyDKNNdg7LXeBNbuMvap1qoI/
   nuF0a22fOa5Z+AmQecDhnrWVSq+OoDOUyODh5yG1wNDVgHjhM8Pyi1lIT
   E5BOXbsDwApjxkldnlVizmZseseJQwmMAWsIhELCEcn5Ebj2FuE8boQGI
   Okabjlw01J5xHb9T4DTTz8QkUiaZxWUItdIpWsKQBTwsEF7yL1uL+vrea
   Q==;
X-CSE-ConnectionGUID: M8wiaOeYSeK9E5XY1p20xA==
X-CSE-MsgGUID: n+MvKA80S1uAf3otviAZqg==
X-IPAS-Result: =?us-ascii?q?A0BEAgC6n45q/5UQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAdAzErHQ4ZgwOCdAIBEb8GgiyBAYNoAkNQ2zABCxQBB?=
 =?us-ascii?q?YEzhT+IInUBhHwnGxuBcoFHgkF2gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF?=
 =?us-ascii?q?4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJWjQsBKgeoQ8KK?=
 =?us-ascii?q?IN2jCKVVDOqbAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444g2uBf8o6JDU9A?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:atLnHKxxT/j+vB+3fCN6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUEm
 zZNUGuBP/jbNmOmf4sjPonipBwHsZHXzNA3TAU/q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGRmIowR3etGOmxtp
 NFFGAFUdkrbl8vjldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOG8a4OKKoLaLSlTtkDbg
 3zl1jShOUgHHdLEziab81uen+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:2fFkoa/uxjRmIV/2hDpuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3ARb+pZmh3X70sQAA7r0p89VwaIzJuVy3CzX73Ln6?=
 =?us-ascii?q?DBEU4ZeCleAaIovt0up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgjRMwgzhykrV0eTpRzsca8PjH3WaqKLtLV4uuMV?=
 =?us-ascii?q?egJCZHCIrPCuDjR2FW4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819317868"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:33 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id B26971800020D;
	Wed, 26 Aug 2026 08:13:33 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4F4F9CE1BBC; Wed, 26 Aug 2026 01:13:33 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
Date: Wed, 26 Aug 2026 01:12:58 -0700
Message-Id: <c4f4930eff400c1948d196e90c32db0d68e6aaab.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244336

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2026-29007 affects U-Boot TCP processing in net/tcp.c [1].
- u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
  [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29007
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 898b808063..b13135c4de 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -10,3 +10,4 @@ CVE_STATUS[CVE-2024-57256] = "not-applicable-config: Ext4 runtime code is not bu
 CVE_STATUS[CVE-2024-57257] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57258] = "not-applicable-config: The U-Boot runtime allocator and affected target architecture code are not linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57259] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2026-29007] = "not-applicable-config: TCP runtime code in net/tcp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
-- 
2.35.6


