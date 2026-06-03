Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6494DCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 06:10:19 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13702.1780467011291157705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 23:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ly5iWUL2;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1134; q=dns/txt;
  s=iport01; t=1780467011; x=1781676611;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z44K5YEDYhGsTRQSraHWflSx8h3l7NSLPbnESDaT+fA=;
  b=ly5iWUL2GGSf1GVCDDfbcCy2FoVUS0wIVQAFr8YMsqfI6ZuSX1S4CFH3
   xl9J97B6E4rFBG2t7bClfcufp+olaRh664iei1iVkY4cGFVxKouvfEFHQ
   oNGBa8m6IDD21aj2lhmzs4y9ExP1xMutB/EdFtqRDnStsfQCukdDbangS
   VoXMlhx9QfNvJ/PigpOQcgCp8fuXi+Za/r9AMlNgpyL+Afp/pPIfvdCVf
   8O0sIclHFR6qDok5r0J+CKVlz2JGsDc/SokIpQEIKJT27dCmfFYU5Plm1
   tlh6svBO+cQKmG+116f7OT+HO8V4dFNhl1K9LopKfBj6qhdvbCZL2S7Yl
   g==;
X-CSE-ConnectionGUID: 2X7nhdoXThSfiNXqyR35PQ==
X-CSE-MsgGUID: FR4tHNBaQXWXSSWGdQaTmA==
X-IPAS-Result: =?us-ascii?q?A0BAAgB3xB9q/5D/Ja1aHgEBCxIMggULgldyX0JJA5Qno?=
 =?us-ascii?q?D+Bfg8BAQEPPRQEAQGSOgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYcTARgBXVwdASaDAgGCcwIBEbE1giyBAYMoAT8CQ1DbKAELF?=
 =?us-ascii?q?AGBOIU/iB1zAYR7JxsbgXKEfYEFgVwBgi6FdwSCInoSgXuFL4h7SIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgUqBVWqBBIUVIx8DOYEXgX+BK?=
 =?us-ascii?q?2lpFT4DCxgNSBEsNxQbBD5uB4wOFw+CNlY4LCCCDKV2oQ4KKIN0jCGVOhozq?=
 =?us-ascii?q?msLmHuOCZZPhGiBaDyBRwsHcBWDIglKGQ+OOIVqgxTDdyQ1AgwvAQEHAgcOA?=
 =?us-ascii?q?wuBaJF9AQE?=
IronPort-Data: A9a23:KLslf6+RLl7SiNAQNWmQDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zAdCmjXb63bNmT0e9l+O9iy8B8EvJ/cn9U3SARprnxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4muyyHjEAX9gWAsbDpOs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lsDdIe+upwMV1Oz
 vIZDgAUfyrY2tqPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FbIqFIYfQGJUJ9qqej
 kz8o3jZJDsTDeyg+QG+zV2gv+bzmAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:4CkjPq4VSQ3dEPrYwwPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:nLqdmG/97OU0/umcDdCVvxQkRcYlfnrt8HfrLU6eOX94cubIcWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AxtDHgw+U2VkUT8NNztVwwHmQf+lSv7iOLmoEqKU?=
 =?us-ascii?q?5i/K/CgN8Aj6hiR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,184,1774310400"; 
   d="scan'208";a="488332584"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Jun 2026 06:10:10 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 3C6BC1800020F
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2026 06:10:10 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id D5F71CB6A93; Tue,  2 Jun 2026 23:10:09 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] go-binary-native: set status for CVE-2026-39836
Date: Tue,  2 Jun 2026 23:09:39 -0700
Message-Id: <20260603060938.1434845-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 06:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238080

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index 7688a090f4..dd84021cc9 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 
-- 
2.35.6


