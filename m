Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4064BC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 07:12:57 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web10.5988.1737097972540773542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 23:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=MBSK4muO;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1032; q=dns/txt; s=iport;
  t=1737097973; x=1738307573;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cNUm30/vNOj9FKPKOO2+HpwxCyXi9JDz0fi2N7OTTt0=;
  b=MBSK4muOonLcp423NAEE6g+Y9coJu1Gv1ngPWqMDik83NpjEULAuppcw
   VvZc5HuaWWfVlPF1joBaKgtNXL6gJwGt8kC/zLsRC/bh75Qo+M92e4K2+
   uoTM21OsZVxYsgwxl/9QU5t2iludjtx0Yuibalc9bzZoqEMKO83bVsTez
   w=;
X-CSE-ConnectionGUID: qTbpUz1zQ+mOr0PACN58Rw==
X-CSE-MsgGUID: OxYoVnPkStCs16HbtFrdkA==
X-IPAS-Result: =?us-ascii?q?A0AtAABYAopn/47/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?wcBAQsBgkp2WUNIjHKnbYElA1YPAQEBDzsJBAEBhQeKdQImNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOFew2GXTYBRoEMRIMBAYJkA?=
 =?us-ascii?q?xGzBIIsgQGDaAJDTtk4gWcGgUgBjUlwhHcnG4FJRIJQgi2BBYFcAQMYghOFd?=
 =?us-ascii?q?wSHZY8LkCdIgSEDWSwBVRMNCgsHBYFxAzgMCzAVgUpEN4JGaUk3Ag0CNYIef?=
 =?us-ascii?q?IIrhFyERWAvAwMDA4M2hWKCFIIUhG9AAwsYDUgRLDcUGwY+bgebUgE8g3M9U?=
 =?us-ascii?q?SyCLJMfszyEJYRvhymVLhozqlOYfI4ElkOEZoFnPIFHCwczGggbFYMiUhkPj?=
 =?us-ascii?q?jiFYoMVuDBGMgI6AgcLAQEDCZFeAQE?=
IronPort-Data: A9a23:rs+EnaK3gSewH393FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgjIGn
 WNNCGmOPaqMamL1f91xPI21/UwFv5DRzIMyTFAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCea/kr1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrW0
 T/Oi5eHYgL9gmcrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN13MEsuAJ9B6N80BEZUr
 cQxAxZQPiqc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLo7leutj2PlchVTqUmeouw85G27IAlZium9bYaNJIHSLSlTtmGIl
 2X4+Vz6OQ0xL4XB6TCZ3GighcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:sXm4G6MpTZOWSsBcTsqjsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjfK/mKIVyYygabvp
 0QF5RDNA==
X-Talos-CUID: 9a23:q+Fnb2CEx7rLWOX6EzBb/lYpCJk3Sz7Y622IG2aTLzs5cqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Aiu5LZg6mh+z5AnO5SQV/Q5IPxoxP85WpNkY1kq4?=
 =?us-ascii?q?akNLdawx6JxmHgDeeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,211,1732579200"; 
   d="scan'208";a="298540650"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jan 2025 07:12:52 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id A3A8C18000226;
	Fri, 17 Jan 2025 07:12:51 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 342B4CC12B5; Thu, 16 Jan 2025 23:12:51 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [meta-selinux] [scarthgap] [PATCH] selinux: Mark CVE-2020-10751 as Patched
Date: Fri, 17 Jan 2025 07:12:48 +0000
Message-ID: <20250117071248.4088445-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 07:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209977

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2020-10751
Type: Security Advisory
CVE: CVE-2020-10751
Score: 6.1
Patch: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb73974172ff

Analysis:
- This is a selinux cve which is addressed in kernel.
- The fix is available at [1].
- Hence, marking the CVE as patched.

Reference:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb73974172ff

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 recipes-security/selinux/selinux_common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-security/selinux/selinux_common.inc b/recipes-security/selinux/selinux_common.inc
index cecb0b5..d8c91ac 100644
--- a/recipes-security/selinux/selinux_common.inc
+++ b/recipes-security/selinux/selinux_common.inc
@@ -19,3 +19,5 @@ do_install() {
 }
 
 CVE_PRODUCT ?= "kernel:selinux"
+
+CVE_STATUS[CVE-2020-10751] = "fixed-version: Fix is present in the current kernel version."
-- 
2.44.1


