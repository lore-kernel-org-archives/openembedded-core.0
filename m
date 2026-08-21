Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F87C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:51 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6763.1787317186441417436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y/35mtNO;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1061; q=dns/txt;
  s=iport01; t=1787317186; x=1788526786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m52RJFKdTZf0SWeBeAh6KplRJKg+AINd8JeefpNULdQ=;
  b=Y/35mtNO404Xd4FU6gKLOL1xwzr/CW2SFMxGLbsLz7kL0Ki+WhYEKEZZ
   Bv7wdVSX5mpTq1a55GhE7T6CCH6GaEpSMg4LMeRKIc6zbIJfre0EaNjPc
   WfHGFa305wtjXHeisDHUIPJ721YovF/sKgEx6vuCJGNEHybdai8hvMg6W
   PxfTrR9eJsc5Mi7LZjspmgKl455x/LQr7V8G1+1/fsVCFZJkECYLzYJBa
   BX4yIgagabKhyHGcqVyJqxaNHrZZN5UwrtsfCD49ocK66J/G5img656Bs
   eFGtdBL3lZSuOrn4vvijnhh8EiPepJ5q0+nQUZ/3yNbzbZ9kRWfROTdHs
   Q==;
X-CSE-ConnectionGUID: 2HzmuNX3Qverpf9fj+jadw==
X-CSE-MsgGUID: 3D/3UPQCRm2sjudM35GHZg==
X-IPAS-Result: =?us-ascii?q?A0AxAwBhSohq/4wQJK1RCYJZgld0XkNJk1kBgnCgHA8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1uAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDwS+CLIEBgygBgVTbLwELFAEFgTOFP4gid?=
 =?us-ascii?q?oR8JxsbgXKEfoQKDXmFeASCInoSgXiCY457SIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJfggUCA?=
 =?us-ascii?q?UlDDgc6CxgNSBEsNxQZBD5uB45aIIJGATxRllSReqEPCiiDdowhlToaM6prA?=
 =?us-ascii?q?S6YWqRahGmBfiaBWXAVgyIJShkP3lwnMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:p9vr0qu4Lp5+FgZZedt41GlR/+fnVABfMUV32f8akzHdYApBsoF/q
 tZmKTrQPaqDZDD0e4sgPYW+90oDvMLQxtBkTwFlrXo9RXgbgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwoMZlBHxox
 achNj0Xdh7SieD1wru3Vbw57igjBJGD0II3s3Vky3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZg9/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXQFZoNxh7Ez
 o7A1z/VRUonDOW08z/f6XCxisqUwAzbao1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:WsAT6q5D51nyHvETiwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:I1dMz2xned2tP4D39acwBgVOOtIgb1vtl07OLlWgBzdnSv6XQFOPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Ajkg3XQ6XRdyYmdT+4i03Gyb4xowzz+P1NXg0uq8?=
 =?us-ascii?q?D4dKGKCBVYGqyrAa4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="812870004"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 12:59:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 8611D180001ED;
	Fri, 21 Aug 2026 12:59:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 28C28CC12A7; Fri, 21 Aug 2026 05:59:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [PATCH] python3-lxml: correct CVE_PRODUCT mapping
Date: Fri, 21 Aug 2026 05:59:45 -0700
Message-Id: <20260821125945.59739-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243939

From: Devansh Patel <devanshp@cisco.com>

The current product-only "lxml" mapping generates a wildcard-vendor
product identity instead of the vendor assigned to the packaged project.

Use "lxml:lxml" for its exact NVD dictionary CPE, NVD configuration,
and CNA affected-data identity. This changes the generated CPE, but the
current CVE report is unchanged with sbom-cve-check 1.3.3 and the pinned
NVD snapshot.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-lxml_6.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
index 4ca7f08b39..da19905f89 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
@@ -39,6 +39,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "libxml2 libxslt python3-compression"
 
-CVE_PRODUCT = "lxml"
+CVE_PRODUCT = "lxml:lxml"
 
 CLEANBROKEN = "1"
-- 
2.35.6

