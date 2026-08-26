Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCB9C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:26 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7650.1787731998522315067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WPNEOk9G;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2139; q=dns/txt;
  s=iport01; t=1787731998; x=1788941598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jFiNohKfEgj6oS8AwXuDK09ohM8lU7FxbVR8axvLlCY=;
  b=WPNEOk9GdvQMcZZOOMvvGkve7m+E5pUtMmmNsT2IhXUlnajfmxOs189g
   dfQuM66qNTkeH5eOaGCQ+pb+AQ/+1hcUHeVlNwUY6/KJf+X5uP7QMVdOm
   shyctzhni0L9P1nWpVFOzIYcQagg3z26/uP2UXxJG5apHL4VSrg6FNgQt
   wynHXNtqfd3aL/lFLpvTN30i/4D5zMO9yoWqIOIJWXm4Hh8ybMIrRT1W9
   AR7MpeCaRtrMRHslt5WzVjv3a1C+1/YVWsSmPJKfQWeg9JDart26A+jnq
   afh9LxA+BSI/mDVNjnHgHqUSNakgZ3GPnZUX/loIRQLgjT1YYKwA+4aNn
   g==;
X-CSE-ConnectionGUID: 3F3yisnbR1a5yCUWb5LGmw==
X-CSE-MsgGUID: v87WLr0URpmk8ox0uoKL1A==
X-IPAS-Result: =?us-ascii?q?A0BhAwDBno5q/44QJK1aglmDS19CSZNZAYJwkiuLc4F+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGLQNcHSeDA4J0AgG/BYIsgQGEfds8FQWBM4U/iCJ2hHwnG?=
 =?us-ascii?q?xuBcoQIdoUQhXgEgiKBDIJwkHJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBSUMOB0c+C?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB45rH4FXcoEPL0wrgTalcaEPCiiDdowilVMBM6psmQikW?=
 =?us-ascii?q?oRpgWg8gVlwFTuCZwlKGQ/eXCQ1PQIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:EHsHnKud8AinVgf7+p8pGvcI4efnVAFfMUV32f8akzHdYApBsoF/q
 tZmKW7TOPqNYmH1e98ia4WzoUMAvp7RxtBgSgA6+Ho2FSpHgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwocgsEGBV8
 /YicTlQfzu+uOjr5J2+Vbw57igjBJGD0II3s3Vky3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg1/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKFIITTHZQIxRjwS
 mTu4TSmPTUAbOGl0T+GonW83vLIvgeicddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:h7Hl4aoz9s3f1eMIrAA3dVEaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:qaI5Wm652NpsAsa+T9ssr2BPC8E+dHfnlX6NMmSFNmw0bJKQVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AIGufUgzfkW1qIkVFkQgqWIJY6wiaqLr+V38pi80?=
 =?us-ascii?q?7gdGBNnx3K2+AixeTG6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820109536"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:17 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 99A291800017E;
	Wed, 26 Aug 2026 08:13:17 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 376D3CE1BBC; Wed, 26 Aug 2026 01:13:17 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 00/11] u-boot-tools: address multiple CVEs 
Date: Wed, 26 Aug 2026 01:12:49 -0700
Message-Id: <cover.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244327

From: Hetvi Thakar <hthakar@cisco.com>

Address eleven U-Boot CVE findings for the U-Boot 2024.01 tools-only
build on scarthgap.

Backport the upstream fix for CVE-2026-46728. The fix rebuilds the FIT
signed-node list from the selected configuration instead of trusting
the attacker-controlled hashed-nodes property. Add the patch to both
the u-boot and u-boot-tools recipes because the affected FIT handling
is used by both builds.

Mark the remaining ten CVEs as not-applicable-config for u-boot-tools.
These vulnerabilities affect networking or target runtime code that is
not built into the tools-only configuration:

- CVE-2024-42040 affects the DHCP client.
- CVE-2024-57254, CVE-2024-57255, CVE-2024-57257 and CVE-2024-57259
  affect SquashFS runtime parsing.
- CVE-2024-57256 affects Ext4 runtime parsing.
- CVE-2024-57258 affects runtime allocator and target architecture code.
- CVE-2026-29007 and CVE-2026-29008 affect TCP processing.
- CVE-2026-29009 affects the NFS client.

The tools-only build disables CONFIG_NET and does not link the affected
SquashFS, Ext4, allocator, architecture, TCP or NFS runtime code.

Testing:
- Successfully applied the embedded CVE-2026-46728 patch to U-Boot
  2024.01 without conflicts or fuzz.
- u-boot-tools build completed successfully.
- u-boot build completed successfully.

Hetvi Thakar (11):
  u-boot, u-boot-tools: Fix CVE-2026-46728
  u-boot-tools: Ignore CVE-2024-42040
  u-boot-tools: Ignore CVE-2024-57254
  u-boot-tools: Ignore CVE-2024-57255
  u-boot-tools: Ignore CVE-2024-57256
  u-boot-tools: Ignore CVE-2024-57257
  u-boot-tools: Ignore CVE-2024-57258
  u-boot-tools: Ignore CVE-2024-57259
  u-boot-tools: Ignore CVE-2026-29007
  u-boot-tools: Ignore CVE-2026-29008
  u-boot-tools: Ignore CVE-2026-29009

 .../u-boot/files/CVE-2026-46728.patch         | 379 ++++++++++++++++++
 .../u-boot/u-boot-tools_2024.01.bb            |  13 +
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |   1 +
 3 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch


base-commit: 543550522f831479f07d332a40ba343c53ae1065
-- 
2.35.6


