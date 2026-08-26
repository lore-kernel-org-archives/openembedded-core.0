Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20CC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:37 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7696.1787732009352537141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ba2UBDZv;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1502; q=dns/txt;
  s=iport01; t=1787732009; x=1788941609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hh9mz8YbAJahmBoU5fAAmn90gphsLFjf2uKA/lNtZRI=;
  b=ba2UBDZvCxXwHzv9TLJBMRaN9V8eY1rtjZxeOdudNwJD8HnnC1sizHPR
   mcJtRYVzwd4amZOW4xFMDhIyc2KM9ywqeSC8eXH/Yr2N4HPY95qY+j8HN
   AbvbTpmpD8B+vtGiQ+IiuN9vag1RsEF9+wo9EiwLyCGdS5kDWwpFCPX0P
   Wr1uWRXD5xF7c2UypgeXYmTMBXeUNeG/8xM/XNOlSxAQCo5/swQZwx6YK
   hKbheoxTEzZUvtmzZIODQYC+A2oomgn7zX4ATZ0GDI8E7FrWoDenCPxMT
   efFCUIlZ/sCgMocPo4ioMAWyNW3yW43F7JXxkPGsWWnIGhJpAxscsHsOG
   w==;
X-CSE-ConnectionGUID: NDSZqmRUS3OpPlPy7xQrrg==
X-CSE-MsgGUID: 6mUZUNqAThuMUlpHKxP65w==
X-IPAS-Result: =?us-ascii?q?A0BDAgA+n45q/4oQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?z0UBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBRhAgMSsrGYMDgnQCARG+fIIsgQGDaAJDUNsvAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKBR4M3gQWBXAEBgi2FeASCIoEMk2JIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJg?=
 =?us-ascii?q?gcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBEynUqEPCiiDd?=
 =?us-ascii?q?owilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1PQEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:qnbp3qNSxBslbBfvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUpx0mMGx
 2YZWDqAMvbcYmv3KthwbYq390kPv5aHy4I2HnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69NCN3MvOLclwb1QGVlKz
 e1HOAkXdB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGE/BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFYoiOizbIGIEjCMbZtQo3Slg
 Hvvw2TkJyweLPy82QLbr23504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:rvUwV6BJzPMuT+zlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:K4GT0G0M5hndIl1WUnhiurxfPOweQGTY9krreGigMWJRWeKFcEWK9/Yx
X-Talos-MUID: 9a23:qLhhFAZKWS+v5OBT6TrRtgxELe5U47mLNUQVsbYWg5fZKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821086435"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:28 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 6F3A8180003F6;
	Wed, 26 Aug 2026 08:13:28 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 1606ACE1BBC; Wed, 26 Aug 2026 01:13:28 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
Date: Wed, 26 Aug 2026 01:12:54 -0700
Message-Id: <54ac50ad1d952ee140ffa94524c6632afe609ccb.1787731424.git.hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244332

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2024-57256 affects U-Boot Ext4 runtime parsing [1].
- The tools-only build graph does not link fs/ext4 into its host tools
  [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-57256
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/tools/Makefile

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 6516d7698a..66e46fa7af 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -6,3 +6,4 @@ SRC_URI += "file://CVE-2026-46728.patch"
 CVE_STATUS[CVE-2024-42040] = "not-applicable-config: DHCP client code in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
 CVE_STATUS[CVE-2024-57254] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2024-57255] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
+CVE_STATUS[CVE-2024-57256] = "not-applicable-config: Ext4 runtime code is not built or linked into the host tools produced by tools-only_defconfig."
-- 
2.35.6


