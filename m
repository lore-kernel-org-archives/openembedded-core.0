Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5D5CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:30:01 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69310.1781267400609046377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R33cH4NN;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1493; q=dns/txt;
  s=iport01; t=1781267400; x=1782477000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u0bW4McqxGjIjc5bLNF3Xr//W3aCx9owai2+C7GSFVc=;
  b=R33cH4NNIyhgoK3mK++plPzccSr7bx/x7y6cSSjBZVTP4HoCpp19f/nk
   Kp5Gdn63ZTqdKzT2MMmTLJnISqu2ULTSMqnkumFwxxBr8/H/xgyC1hH+o
   MqOgzLNYU/fDA4wb48iGLDOsFnY9DZsoRg/Ac9cstCz1Tqr75aVWiYC6a
   SAgV+GVzGdGKgJw46Fek6gpVkEk0WpaBf+P2WqiOq1JsBnwifxitSfkcl
   0UULesHuUDi0Y4G/t67LKo5oRE6LwgoQU7Mjrdkxt8Ta74EyzVgPN6kAQ
   p5nvW/puLGfs7DuQsYTS/jGcyM5YMcbrujIRNF//BgSBkXcB3adQV/Ejr
   g==;
X-CSE-ConnectionGUID: 13ddwGzJTJiuIST+zkyqRw==
X-CSE-MsgGUID: cGB2sPeWTa6ocloLnh6FnQ==
X-IPAS-Result: =?us-ascii?q?A0COAwBa+itq/5P/Ja1ahTB0X0JJA5ZIoBwPAQEBDz0UB?=
 =?us-ascii?q?AEBgXEBgxSNQgImOBMBAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8Nhl02ARgBLTBcRIMCAYJzAgERsxaCLIEBgygBMQWBHtssAQsUAQWBM4U/i?=
 =?us-ascii?q?B9zAYR8JxsbgXKEfoEFhAuFeASCIoEMgXuCL4YVhidIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQwbBwWBSoEraoEDhQ0jHwM5f4F0gShnaRUwNYEBA?=
 =?us-ascii?q?RESAwsYDUgRLDcUGwQ+bgeMQhcPgXFNWigMLASCACgckwlXkXqhDwoog3WMI?=
 =?us-ascii?q?ZU6GjOEBKZomQiCWYsxllCEaIF/JYFZcBWDIglKGQ+OOIh+wn8kNQIMMAEHA?=
 =?us-ascii?q?gcPAoFzkX0BAQ?=
IronPort-Data: A9a23:M5C3y6qAMzRZjJR9hVNlt/GQ8j9eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnUaPyJZ2Gkf9BwPYnko04EsZ+Bmt4xHFM/+ShgE3lApOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8Uk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r8sDW1R2
 u46FBIMczG4u6Gkw6OicPY506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TWFJ4Fxh/H/
 zuuE2LRCT4wbsenxAW5+yyrjevIuSX7BqwULejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:8CFkvqP6EFYMacBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTnjAsm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AZLPCOGtZXZjf5ijAN7CxU13r6It8KXHR01jCAXO?=
 =?us-ascii?q?aCHtIc4HWW1yB4Zl7xp8=3D?=
X-Talos-MUID: 9a23:n74lcQbRS7KM4uBTvBDG3ipaOfhU6vqpA0QKtZMG5eeCDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493801711"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:29:59 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id B958518000243;
	Fri, 12 Jun 2026 12:29:59 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 5D3D5CC12A6; Fri, 12 Jun 2026 05:29:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [master] [PATCH] apt: fix CVE-2011-3374
Date: Fri, 12 Jun 2026 05:29:54 -0700
Message-ID: <20260612122954.1229967-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238614

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

The vulnerability is a design-level flaw in the legacy apt-key utility regarding
the global trust model of GPG keys.

This is marked as not-applicable-config because apt-key net-update is
disabled by default, and Debian vendor configuration does not define the
archive keyring URI required to use that path. Ignore this CVE in this
recipe due to this configuration.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 08b6bac2e4..ad75f3b32a 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: Debian vendor configuration does not enable apt-key net-update.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: apt-key net-update is disabled by default and Debian vendor configuration has no archive keyring URI"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without
-- 
2.51.0


