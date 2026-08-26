Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A304FC61DD4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:37 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7696.1787732009352537141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PVNkjrm8;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1552; q=dns/txt;
  s=iport01; t=1787732010; x=1788941610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OzICAlo09NN8WoEhejjI/Dg2g6jjGvb0fgbuRJq269g=;
  b=PVNkjrm8WgL+IqWP98bwJadmitfNFlovHaj4HpYlGc8CKfK2J6p6t6I3
   vZjGNKnq25ZSWAriikRTIJ+RaI2S36QHFna/p5Kdt+SnnB8h59Yzdq7L5
   8tghuLDZWo8YSC7lmh3e9V2Im8yY9aKSfJVoPrEIxefqqmT6O2RR5HUji
   nX4c20tVa2P1WxIrCf1nRroTaTZCA8mHYZopz/BFgWHWYdvBuGWGsaAIS
   XM1iHxTmeXJz0I1OhS8tydMkS3gqwWISOYD2X3Umwn88IoPHV7fbmbOcT
   FuTwM1EF4JSSsSHU/HwTSU4WdUYXUNMW0/qqdnDXuhb0PTiKy5vkAajSz
   Q==;
X-CSE-ConnectionGUID: TLvVyAPhSnK/msAr81VSSg==
X-CSE-MsgGUID: FjFLzhdMTA6vcKufL4lmbw==
X-IPAS-Result: =?us-ascii?q?A0BDAgA+n45q/4oQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAgMSsrGYMDgnQCARG+fIIsgQGDaAJDUNsvAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKBR4M3gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJg?=
 =?us-ascii?q?gcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBEynUqEPCiiDd?=
 =?us-ascii?q?owilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1PQEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:SXAfuqomwvfGMPgXgJb020CQLD5eBmJPZBIvgKrLsJaIsI4StFCzt
 garIBnTPfeMazDzKY0jPNi/9EkAv8KDxtJgGQdtrC8zEn4X8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tpTH19f3
 MQYEzYuKRWYrvjmmYyAceY506zPLOGzVG8eknhkyTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwxHYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KobTHZULwhvEz
 o7A10r7LDUINNC69RPb7HmPm+HrwSf+Up1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:eEgD66v6BMal3eEdm0z/fX+Y7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:8uk8Nm/qRAm/sWOkTWuVv3IwBP40W0Xd93HzZEqjIHw5EYOuclDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A0qXyMQx7mNTFD6jIM5gRE3ok3IyaqIqsJmQfkZk?=
 =?us-ascii?q?jh+DaKydTJjm50DCySJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821086454"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:29 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id A8D9C180003E9;
	Wed, 26 Aug 2026 08:13:29 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4ED75CE1BBC; Wed, 26 Aug 2026 01:13:29 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
Date: Wed, 26 Aug 2026 01:12:55 -0700
Message-Id: <b2b0eef940d90d53e4df5bf4c8aac4a4f40ee0cf.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244333

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57257 affects U-Boot SquashFS runtime parsing [1].
- The tools-only build graph does not link fs/squashfs into its host
  tools [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57257
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 66e46fa7af..5bf2ca0f91 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -7,3 +7,4 @@ CVE_STATUS[CVE-2024-42040] = "not-applicable-config: DHCP client code in net/boo
 CVE_STATUS[CVE-2024-57254] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57255] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57256] = "not-applicable-config: Ext4 runtime code is not built or linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2024-57257] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


