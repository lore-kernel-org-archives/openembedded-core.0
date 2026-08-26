Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC5AC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:47 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7655.1787732017439620324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S3PQ5CjX;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1641; q=dns/txt;
  s=iport01; t=1787732017; x=1788941617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7QgpkDGaF4WsA2esxhiZTb1/SvUBDwxIEhNyTCZZVQk=;
  b=S3PQ5CjXed7L3bAbVFFgk7D2/vFBWDo7s1jQxmCzb0L53Z881L0qTTIk
   miv+YQxWNPYVYGxT2FNOEMD/biJluxaoiV/DKKAElgLx+Pcg96vyF7iQT
   YLaCBtlIBo3WmwA0OD+wYZ2kxNlikpF+WPjCUdLWRa9by0me+L3M1B3c+
   y2Ixm4tnGaWawV2SW2cVaeAQxMhlkTJe+SOSS7f/KpOIp8gEEDc7Q95rq
   FqAcC6ZUfSyGpip3E6S+AComypV/eo7qg75w2gek9BcfJDA6JJBPY4U/1
   Z4YcnHSG9i2EYm4ReCVws5t4G2ogP4z+/wqDthB7KKZ2sHdYdeoEXVc5U
   Q==;
X-CSE-ConnectionGUID: /eWAgnLmSIKLmnBuYPO8og==
X-CSE-MsgGUID: wfytbb1hSoWNCvUiM/PDLA==
X-IPAS-Result: =?us-ascii?q?A0BDAgDBno5q/5MQJK1aglmCV3RfQkmWTZ4bgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQUCjWwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhlsCAQMyAUYQIDErKxmDA4J0AgERvnSCLIEBg2gCQ1DbMAELFAEFg?=
 =?us-ascii?q?TOFP4gidQGEfCcbG4FygUeDN4EFgVwBAYIthXgEgiKBDJNiSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBC?=
 =?us-ascii?q?YIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSVo0LASoHqEPCiiDd?=
 =?us-ascii?q?owilVQzqmwLmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/KOiQ1PQEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:qLLsh6/IxzLs3FPFBJxODrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GBNDGiDbqncZ2Sgftl0OYSxpEgD7MeGyN5kGwZs+C1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbeSxxZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lxMLIx9eBTBFpv1
 tgdLhoQXyik1+W5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi2boeNIIfWFK25mG6Hq
 HPa9W6gAiodC/q01weE1zWUqsvmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Z04uuaGda4Z5MHkxpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:yp66L2BqspwjO7H6E25qy2cbHOQgSVz+6HLWCVKJMUE5T7LAHA==
X-Talos-MUID: 9a23:tnk/iwl1ST4/fiHOwVSEdnp9OtZ06a73CHsKrrMtpfSFEGtIFxO02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="836502349"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 8C3EC18000165;
	Wed, 26 Aug 2026 08:13:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 3147CCE1BBC; Wed, 26 Aug 2026 01:13:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
Date: Wed, 26 Aug 2026 01:13:00 -0700
Message-Id: <e9ee1ba2c38ca12de91d1e3706773765a0669b04.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244338

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- CVE-2026-29009 affects nfs_readlink_reply() when CONFIG_CMD_NFS is
  enabled [1].
- u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
  and CONFIG_CMD_NFS is not enabled [2].
- Hence ignore this CVE for u-boot-tools; the exclusion is
  configuration-based.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29009
[2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 8579e18d7b..b2c4275ab9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -12,3 +12,4 @@ CVE_STATUS[CVE-2024-57258] = "not-applicable-config: The U-Boot runtime allocato
 CVE_STATUS[CVE-2024-57259] = "not-applicable-config: SquashFS runtime code is not built or linked into the host tools produced by tools-only_defconfig."
 CVE_STATUS[CVE-2026-29007] = "not-applicable-config: TCP runtime code in net/tcp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
 CVE_STATUS[CVE-2026-29008] = "not-applicable-config: TCP runtime code in net/tcp.c is not built by tools-only_defconfig, which disables CONFIG_NET."
+CVE_STATUS[CVE-2026-29009] = "not-applicable-config: NFS client runtime code is not built by tools-only_defconfig, which disables CONFIG_NET and does not enable CONFIG_CMD_NFS."
-- 
2.35.6


