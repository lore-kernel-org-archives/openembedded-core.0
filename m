Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64407C61DD3
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:37 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7695.1787732007795918243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h9BMSzO9;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1361; q=dns/txt;
  s=iport01; t=1787732007; x=1788941607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9rJlBKvzXzedy2Ck0MbUJ5rZ3/4HMXpFWRmtg8POcNU=;
  b=h9BMSzO9W0vB3xxdJMa6fAz371oRSA8k4NUvXw8Z8AA7/nOtu/zlwAEF
   IP/w6zGDE28OxQWEwLmsyGuGT2EzPblORt1D022PYvKMDL2dORQWsXv0M
   SMXJ/jsAiS2HPS4g5Kb7W1CG78Fmdb0rtLfA4tBSSdmqNrvP562/7FnRV
   eMebZwvyRKU1qMLpfh+iTCA2sBuRYFZDNQ36yM1WIAc1hq/OhOBuvUKqv
   mvL/3U4oSGNEA567xhTUXFxlyaW7+02UCfuE+s7+32mAi5EdmGGQyvlkS
   eFAa2tMzcRs7r2OkZNtH8eN3jJh8fM0dqzcF0tpYZjiaqQXuO2iybIHzD
   Q==;
X-CSE-ConnectionGUID: kgi+o2USTHWUX/4giRJSpg==
X-CSE-MsgGUID: Oftuz6CQTUWruN/ulDwGtQ==
X-IPAS-Result: =?us-ascii?q?A0BDAgDBno5q/4wQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAgMSsrGYMDgnQCARG+dIIsgQGDaAJDUNswAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKBR4M3gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJg?=
 =?us-ascii?q?gcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBEynUqEPCiiDd?=
 =?us-ascii?q?owilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1PQEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:jrB/Ma2YpIgz9gAyRfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzRRm
 DEXDG/VOayOZWGkKdF0PYm0/B5TsZfSmNQ2HgU63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGD043fopCx91LIV5zx
 btEJzE3TCubiLfjqF67YrEEasULJc3vOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEyojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiuC0aIuLJoziqcN9uUiEu
 3CY1F3FPy4AKfrY1D6p7V2wv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:9Mv9lKAhVf4wlrPlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AW7Md12vH7obc7YqDGyj1RAQI6IsmfXyeyy3tGHO?=
 =?us-ascii?q?YNltZD+GaSGWyw7trxp8=3D?=
X-Talos-MUID: 9a23:96C7hARaU145gsy1RXTLii1/JplD2piTN1oQt9Ibv+WbGjBJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820109648"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:27 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id E2C48180001DD;
	Wed, 26 Aug 2026 08:13:26 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 87CAECE1BBC; Wed, 26 Aug 2026 01:13:26 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
Date: Wed, 26 Aug 2026 01:12:53 -0700
Message-Id: <a41089a1c1b1f0ea8ee29769eef636eaf44e63c1.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244331

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57255 affects U-Boot SquashFS runtime parsing [1].
- The tools-only build graph does not link fs/squashfs into its host
  tools [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57255
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 2519dc521f..6516d7698a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -5,3 +5,4 @@ SRC_URI += "file://CVE-2026-46728.patch"
 
 CVE_STATUS[CVE-2024-42040] = "not-applicable-config: DHCP client code in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
 CVE_STATUS[CVE-2024-57254] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2024-57255] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


