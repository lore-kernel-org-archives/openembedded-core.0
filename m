Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577B4CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 13:30:17 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25291.1780407013525810136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 06:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RYIOaIha;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1032; q=dns/txt;
  s=iport01; t=1780407013; x=1781616613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tkMgGQdsP7YwT68atY+Xy7sR11kizT+LwV6CavbNank=;
  b=RYIOaIhaCGvmbJb+5/1WU7Rcq5VXABEUzGQVDEBw318iuUK6/O9kONlY
   Edi0TLIRKPQrRv4mu1yDzEQqPvw/66Eij3lbUKJI2YtdY/PoE3V08vCdK
   5HARXwLhAGoknQBVa9521Go1izch021VZ3+JwZAh4eOwhF9eWiqG7Mq1R
   CkzS4ouMSJBZiBJZmmVp8w0LmKaznMaejuBwxygDyqIDHXH2tsL/SP+o+
   S8S99YOEyNii2YDN/ltGLEQaZQ/Cx7xg5rZzmo8QfHyM3jV7q4ojlSbga
   kICCqA4se8GFVzftzFD5MLhv4r4jOOleiJlZUvQwvZC7VYwHrZXpxr5E/
   A==;
X-CSE-ConnectionGUID: XTfQbwbASJKd2iInA5gutg==
X-CSE-MsgGUID: OQcxVQHlTey0TG/PSDgzfw==
X-IPAS-Result: =?us-ascii?q?A0D2AgD72R5q/5H/Ja1RCYJZgldyXkNJk1oBoQ6Bfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBo00AiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnMDswaCLIEBgygBgVTbKAELFAGBOIU/iB2Fb?=
 =?us-ascii?q?ycbG4FyhH2EF3mFdwSCIoEMkAFIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQsbBwWBSoFVaoEEhRUjHwM5gReBf4EraWkQAwsYDUgRLDcUGwQ+bgeLb?=
 =?us-ascii?q?hcPgUJzAYENgmmjRIIhoQ4KKIN0jCGVOhozqmsumFikWIRogW4BNYFZcBWDI?=
 =?us-ascii?q?glKGQ/bZicyAjsCBwIHDgMLk2UBAQ?=
IronPort-Data: A9a23:q1gqlq6RR/L/yvxwIyTAzgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jEWDWuCOPmKMTbxc9wkad+ypkpV7ZfWndBhHgtvpSo3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxMsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDbEWw+xoC0h11
 98UcjEsaDneiP+qz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAhnv2fzpegFmUvqEwpWPUyWSd1ZCxb4aJKoTQHpw9ckCwg
 VvN71rAIhUmOc3H9RXCykmAif3BgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:EJ6bGKCitJjElvLlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoWpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:4sSaZWG4kqJr+FSdqmJXyEAtEN8vW0b/73uKIm6+IDtmVaGaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A/OKRQg2ksKweWNpQKpsGwhDzWTUjxJ2lGH40sZE?=
 =?us-ascii?q?6ttjcCQM3Awyxgya5Xdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="474480231"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 13:30:12 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 9525E180001DB;
	Tue,  2 Jun 2026 13:30:12 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 37484CC1611; Tue,  2 Jun 2026 06:30:12 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] apr: Add CVE_PRODUCT to support product name
Date: Tue,  2 Jun 2026 06:29:29 -0700
Message-ID: <20260602132957.3507537-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238047

From: Himanshu Jadon <hjadon@cisco.com>

apr is tracked in NVD under apache:portable_runtime rather than the
recipe name apr. Set CVE_PRODUCT accordingly so cve-check uses the
correct NVD product identity for APR.

No additional alias was found to be necessary for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit bc3803e12d4938e2de514c39bd5d0f011f883ace)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-support/apr/apr_1.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.5.bb
index 78796476e2..7a3445aa20 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -136,3 +136,6 @@ do_install_ptest() {
 }
 
 export CONFIG_SHELL="/bin/bash"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:portable_runtime"
-- 
2.44.1


