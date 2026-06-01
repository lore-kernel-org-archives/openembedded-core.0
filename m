Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C7BCD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:45:19 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5088.1780335912360854070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 10:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=C/A/fqbt;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=991; q=dns/txt;
  s=iport01; t=1780335912; x=1781545512;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ghy8EqCyOHuFCaSOPAk7PrpakwAjUpPg1SINm2UN2Vs=;
  b=C/A/fqbtjt/aeZSAJ4nlMcBdme8rd9DxX2ZFrH01RLW38ebapLtzcStv
   Ky4tqIZST2FyuUx4WfYTS1L07/DWn+KjV9Mu7YxjE8T63aJQXfa9x7C88
   8qmzTy1v7CUljQMpjLe3LNe3D5/wfAwLIj+R0YKN91NtqFGL2DY70NOJ2
   +m88MPjF2wp85IWCWGCfCcV1Kd+1WakS6nNMdsu6euUwYq1ONAuGvbGmn
   QvAVprVySH1kuz5q4L2T6Wqb0VLSuLI52Dv4rtV07lRfXehF3cmVHzRTe
   jOzbpEtHaYDWAfqmi2tpi45L1+y1lavM27pb3Jg1zxRRc2dHDPiRZezm/
   Q==;
X-CSE-ConnectionGUID: nr80Gp39SMOOz+JvQ3mp3A==
X-CSE-MsgGUID: m+pzx3i8ReyaU/1c6KsAqw==
X-IPAS-Result: =?us-ascii?q?A0DzAgDrwx1q/5H/Ja1aglmCV3JfQkmUKqA/gX4PAQEBD?=
 =?us-ascii?q?z0UBAEBkjoCJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2HEwF2XESDAgGCcwIBEbUGgiyBAYNaBQkCQ1DbKAEFBhQBgTiFP4gdcwGEe?=
 =?us-ascii?q?ycbG4FyhH2BBYFcAYIuhXcEgiKBDI9VSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ELGwcFgUqBVWqBAoUYIx8DOYEXgX+BK2wsAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geLRBcPgjWBDiwgqAKhDgoog3SMIZU6GjOqa5kGjgmWT4RogW8BNIFHCwdwF?=
 =?us-ascii?q?YMiUxkPjjiFasdIJDU9AQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:aCFQTK/Ilyg8Rgdo69rQDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zcaDWjUPPuCMDOjLtt1Ooy0pEoC65LdydZlHQI9qCxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDpNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kwJ91A1f4sUFpr0
 tsKaxITV0uGn7mflefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FbIqFJIXTFJkF9qqej
 meF53bpWRBKDtGOwAfCq3nypfTmhDyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:uU2OjaoFeBEnahxLrpFi4k8aV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AOL/JzGnzBHY/4jdHb+Z7wrTRtOPXOXvHnC//OxT?=
 =?us-ascii?q?pMkNOb6/Wa0Gpo6Z8yOM7zg=3D=3D?=
X-Talos-MUID: 9a23:m1NFTgky/z+lnk8sDPSpdnpnd9968/+vWHoAgJw7/JCPaw9rEi6C2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="488611948"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 17:45:11 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 56A58180001FA
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Jun 2026 17:45:11 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id EC8AACB6A93; Mon,  1 Jun 2026 10:45:10 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] rust,libstd-rs: set status for CVE-2024-3566
Date: Mon,  1 Jun 2026 10:44:25 -0700
Message-Id: <20260601174424.3108907-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 17:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237974

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability is Windows-specific and depends on command-line
handling through CreateProcess, which does not apply to Linux/Yocto
builds.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 5b433ceae7..318c7f0e29 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -23,3 +23,4 @@ UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.35.6


