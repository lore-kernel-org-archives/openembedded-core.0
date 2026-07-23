Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87969C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:19:18 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18341.1784791155210707364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hhgWe5Bl;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1140; q=dns/txt;
  s=iport01; t=1784791155; x=1786000755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mdjYQgtEY+7P/SPQ+cOpUmdvXuNPy+QgmrN/CN8f9/Q=;
  b=hhgWe5BlbVbyu51JJ1vFP7cYAfP/jdxhrlZIGErXP58goXYGlQLbidoq
   WEYWVb08RbL8mcscZ5Zb2r4D9w2yMgBcoe331iWEYvqERaW3MmbCu0uEG
   7Kewxn5qbgUsDOpaAjtq+rKSauFQs+/KmT+PejowrhmjtN0uQhss7g4Jk
   TibHUuo9UpCED13jKGSctRbRjjCWb/c1NPgttgyPdtFjOEAcqknNHWDjV
   FU1vsRB77sIj0q4IawZNOqs4JMpBS95TsHkrj+/tbieMHd8G2qRBJArUg
   HMta5DcdYRHDi0DhfTSVjM3g/o1EmjyzokZrFe3Blsmxy3DQrwgP3pWp2
   g==;
X-CSE-ConnectionGUID: izyp5XbUT5+i0xCJRGGnfg==
X-CSE-MsgGUID: uxIIyYxAQmyI4IVJvAtMcg==
X-IPAS-Result: =?us-ascii?q?A0BAAgC6v2Fq/5P/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgFGMFxEgwIBgnQDwU2CLIEBhH3bLgELFAGBOIU/iCB1hHwnGxuBc?=
 =?us-ascii?q?oQIdoUQhXgEgiKBDIF4gVGOZUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgS6BAoRcIx8DOX+BMHVKdy1pARIXgSaCFIE6AoEdAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeNcCOCO4EOllSReqEPCiiDdYwhlToaM6psLphapFqEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ/gECcyPQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:c6rOwqK9Y19AW+lOFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS1jUBn
 DQfWGzQOPiJMzbxetkkad+18U8E68TSzdI2HgMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQvajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1vHlAuYL0Sx9oqQmAW5
 dc6Eh8iaB6M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5FEojOWyYISPK7RmQ+1Ijme5t
 1PW1l38EzBGFeK91xOZ13mj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOD9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:voW92q2XwdCrqJKXWIxAiAqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AXqBQSmpuZvcxF2gNGjGT8m/mUcE3Y2WA/H3tHxL?=
 =?us-ascii?q?7CD55Y5+vZnCW9qwxxg=3D=3D?=
X-Talos-MUID: 9a23:EWlA3go0C7+I6e81H2cezyxyFeZ50rSHMUUcsMknheuaHDBVMDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514578629"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 07:19:14 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 2574618000277;
	Thu, 23 Jul 2026 07:19:14 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C63BDCC1611; Thu, 23 Jul 2026 00:19:13 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH 2/3] python3-ply: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 00:18:51 -0700
Message-Id: <20260723071851.1805812-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241779

From: "mark.yang" <mark.yang@lge.com>

NVD registers ply as dabeaz:ply, so the default python:ply vendor
prefix never matches and no CVEs are reported. Use the exact
vendor:product pair.

CVE-2025-56005 will then show as unpatched; no fixed release exists.

Suggested-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb80fef9a76649fb1144408fbc7e2903439cd556)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215..06393ac4fe 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -14,4 +14,6 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "dabeaz:ply"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


