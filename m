Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2874EC61DD4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7456.1787730844927383633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OCPwGtms;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1550; q=dns/txt;
  s=iport01; t=1787730844; x=1788940444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vZLEWhAWo4+oANpqwE4EsQ/0/AcfOYcbwN/H4htmvtM=;
  b=OCPwGtmsGroKMpzTjM+jDEG3Ja1EmWs/+lDx02AWHGJa3Pf8fhAJ9gDm
   /0YzJ9mKmIVKWKgOtUMvSQRQRC0iWIGaVP2ZcgNfOs4G4UWvkWAi4euwv
   548TT17ZyigjJ2AObmxHCHB36L1qIqlRuB56VQEhFAHXd4MdSznmpa5SE
   rAtrhkuor4s23VYXrbPkrmhJ/nqCniHCM4q+ZBLqadJURYUD2oLUywavA
   f8LL7jJZJs0dFxHhQ6wuzv5IyDaX6Ql/th2uk6TheSPHTCnL2ioU9mpB4
   Bnj1k+KSeMbvcwz4JFnZBTmDGZ+RIQFtBKl4BQCP78RA7aeI5nUiI9O6y
   w==;
X-CSE-ConnectionGUID: qG9q+qx2QzyPrTRxE/LTyw==
X-CSE-MsgGUID: dFXizMaRQdy1kLI+7EGQTQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/44QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO/A4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hAoNeYV4BIIiehKTYkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQ?=
 =?us-ascii?q?w4HRz4LGA1IESw3FBkEPm4HjmsfgkkBPFEZgX+UPJF6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqjcmiEaYFoPEaBE3AVgyIJShkP3lwnMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:c/QGyq2M12M7FoPS5PbD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2EPx
 2QcD2nQO/aJMWXweNB+YNzjoU4FvcDTz9FlHAtk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFW5nJM4B6rxOE3B27
 8AiOB1KSiySmLfjqF67YrEEasULJc3vOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME6ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOG8aIWNIIDVLSlTtkq2l
 mPU2m3DOx0Lbd+76Hna312VutaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EijBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:xfdQK61lcOcyEY/NYSA1/AqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:H+HPbG5T3swz8Arn4dss7WFFA4M8Yifk3mboOXOCGUsubIGEVgrF
X-Talos-MUID: 9a23:eScxOAisP9uiK6tc7zv6NcMpOOlY4raLAXo0nYRfuO2ldnNdFA6htWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819070247"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id B48D318000DC7;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 58F3DCC12A8; Wed, 26 Aug 2026 00:53:48 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] python3: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:48 -0700
Message-Id: <20260826075348.64166-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244319

From: Devansh Patel <devanshp@cisco.com>

The current mapping qualifies the generic Python product but leaves cpython
vendor-wildcarded. python:python is the active NVD dictionary CPE and
configuration identity. Keep python_software_foundation:python for
historical NVD configurations.

Qualify OE-Core's retained CPython alias as python:cpython, the deprecated
NVD dictionary CPE spelling that now points to python:python.

Add python_software_foundation:cpython for authoritative Python CNA affected
data for the same CPython source. It has no dictionary record.

This changes the generated CPython identities to exact CPEs, but the frozen
sbom-cve-check database leaves the 188-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
index 1eef256a83..5764359a02 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -36,7 +36,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 # maintenance branches.
 inherit upstream-stable-release-point
 
-CVE_PRODUCT = "python:python python_software_foundation:python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python python:cpython python_software_foundation:cpython"
 
 PYTHON_MAJMIN = "3.14"
 
-- 
2.35.6

