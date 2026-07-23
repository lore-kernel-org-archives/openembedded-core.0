Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1ECC531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:42:09 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19077.1784796121211007057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DMN2Gi9p;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1211; q=dns/txt;
  s=iport01; t=1784796121; x=1786005721;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w8Ifz1SnglT6IiQox+OknPH3cq1xYQ7uqUFuSRc7Wn4=;
  b=DMN2Gi9pEZZDC4U6QycTC2xCT5iG9pQnHNy+ZqXcwVABIFunRWwS5orS
   28p8osO50pBLD2WMhN3AYsxGcoVRx0Ld4Cb4M9L0UIgAe1Ti//KbGinX8
   ihFZ2FFlzya2gucVfSmyiz8y6xrH85WA3x82Jn7FqedkykJK/GwXJhrWj
   ojbhBqadoskgCAHqfDcOXIwROz0oa94yprgXorbed990rWEC5uKyRNlKu
   fmwykni1AC+fvNk2Cm5rJeIdJOvZ9J+FJGduy7a8IXxQHlvoH41Fk1sP9
   cjlkiLMTA90yFFJRfLqzfbZfpqWhvoQMpYq+wcH+hivxIJAcD7Ma3qqtY
   g==;
X-CSE-ConnectionGUID: mEQXSUT3TxubmtpCsn0RWg==
X-CSE-MsgGUID: s3Vlr05/QHyZz6TwX9y+Kg==
X-IPAS-Result: =?us-ascii?q?A0BBAgCb0mFq/5L/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAPBUoIsgQGDKAGBVNsuAQsUAYE4hT+IIHWEf?=
 =?us-ascii?q?CcbG4FyhH6FEIV4BIIigQyDSY5lSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgR2BLoEChFwjHwM5f4EwdUp3LWkBEheBJoIUgToCgR0DCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB41wI4I7gQ6BRGuUJZF6oQ8KKIN1jCGVOhozqmwumFqkWoRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD+A7JzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:vyvO1K0RfBOy5EkLgPbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzIBy
 mIaW2jQbqyLMGakfYsnPozn9hkFsJbVyNZjS1Bt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuaTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGCWwPDbYlxr1LEXxE8
 OAAAysLNiq8iLfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQsieS0b4GLII3iqcN9hR2mo
 nieoiPAIgAoJoKj1grU4zGPibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:zrCJVarfgkC/NCT10d678T0aV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:f4C/lWBynB2mTP76EyxKzX4vJ/x+Tm3AxnLMO2SjDz5Td7LAHA==
X-Talos-MUID: 9a23:LY8vGwYdGDfvZOBTrGTSgCs6aYBRw7WcGh4xjqVXqoqnOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514173629"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 08:42:00 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 5C0901800058B;
	Thu, 23 Jul 2026 08:42:00 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 09E43CC1611; Thu, 23 Jul 2026 01:42:00 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH 3/3] python3-pyasn1: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 01:41:48 -0700
Message-Id: <20260723084148.1870931-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241794

From: "mark.yang" <mark.yang@lge.com>

The default python:pyasn1 does not match the NVD/CNA entries which use
pyasn1 as vendor, so CVEs like CVE-2026-30922 are never reported. Use
the exact pyasn1:pyasn1 pair.

Note: Original commit was for python3-pyasn1_0.6.3.bb. This is adjusted
for scarthgap where recipe version is python3-pyasn1_0.5.1.bb.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4971337840e8855740409e8f5dadb3ab3661f033)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
index 0519ba5edb..3f2d444826 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
@@ -1,3 +1,4 @@
 inherit pypi setuptools3
 require python-pyasn1.inc
 
+CVE_PRODUCT = "pyasn1:pyasn1"
-- 
2.35.6


