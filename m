Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324ACFCD0B3
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:39:17 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7582.1773812350874467555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BrLtWaV8;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1219; q=dns/txt;
  s=iport01; t=1773812350; x=1775021950;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7OjUoOOC7e7oULmj5b4PP29idbqJUYvG3lp9WcWE6wI=;
  b=BrLtWaV8iG8ok5693K53dmvCBBpIRtZUMthewUFx7CTE5nf+JDklRxTX
   VI9Bk0cTzc8foVMP8AlExnjsVtIFZiPYOV571ifTebitHc8052R9U1OlI
   Z0uQetnnQCBCZ7LlEpPLh2mQNSjRkU8ZEdlWH0XtSKhKOoLeavMplPbeW
   sTDyK19cSkxk0UPGT/Yf13HwgWJ19ELyDCfHRfRNFMnvCbby6/57/BkpK
   01Hb3gWUg7Ao/eT9N5kEEzG4F/UCMYIU5u4WRiGKqGwZMkLUY2qezIDLV
   7YRj7u1S9EQwyjgY/ZMZFu6FZ+8Yw801WNy+ETV+ZL9MESGg2CBleLkLE
   Q==;
X-CSE-ConnectionGUID: xdG+33viQhKzckqiSjikGQ==
X-CSE-MsgGUID: vDWogYEKSMGpDSL+MkDxuA==
X-IPAS-Result: =?us-ascii?q?A0DBDwCqObpp/5QQJK1aglmCSIFfQkmTWgGCcJ4dgX8PA?=
 =?us-ascii?q?QEBD1EEAQGFB40kAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02AUYwJjZEgwKCdAIBsw6CLIEB4C4VgTiFPIgZWhqEeicbG?=
 =?us-ascii?q?4FygRWDaIUQhXcEgiKBDoougRiHNkiBHgNZLAFVEw0KCwcFgWYDNRIqFTI8M?=
 =?us-ascii?q?h2BIz4XehEbBwWEAA+IbXRtgROEDAMLGA1IESw3FBsEPm4HjU87gUJxAQEeH?=
 =?us-ascii?q?jcbgi9aknMaPZF4oQ4KKIN0oVgaM6prhEyDN5EDo3AMXYRogWg8gVlwFYMiU?=
 =?us-ascii?q?hkPVo4JyTUjNT0CBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:nFdJCaNR9s8OExrvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUp30mEHz
 2YZWzzXbqqIY2v1Kdkkb4mz8UIBuZfcyIBjT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmEsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+ViIwJtZpMZw+ZUE2pN7
 P0jKjEOQSnW0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCPklYriuO3aou9ltqiW+lqmUmpi
 0H92kvhLio+d/mc5SqY2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:dtAZI6u/h1Pe92EFJwD2kcai7skDfdV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: 9a23:xYVYW2PtK2Nwf+5DSCVItxVPBMEccl7Px3TJInS6CGVGcejA
X-Talos-MUID: =?us-ascii?q?9a23=3Aekc6EQ3vET5EMYf0CB4OOJ1nNjUj/YiRD088vLY?=
 =?us-ascii?q?9nuacGRdUeBKeoCSqa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,126,1770595200"; 
   d="scan'208";a="462223229"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 05:39:08 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 42E551800038F;
	Wed, 18 Mar 2026 05:39:08 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id DFC03CE1C3F; Tue, 17 Mar 2026 22:39:07 -0700 (PDT)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH v1 0/4] cve-check: fix incorrect CVE assessments and runtime warnings - cover letter 
Date: Tue, 17 Mar 2026 22:39:02 -0700
Message-Id: <20260318053906.26606-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233362

From: Het Patel <hetpat@cisco.com>

The patches address the following bugs:

1. Incomplete CVE Assessment Details: Currently, the `detail` field is missing for approximately 81% of entries, rendering reports unreliable for auditing. These changes ensure that the rationale for a "Patched" or "Unpatched" assessment is properly recorded, allowing for a clear distinction between version-based assessments and missing data.

2. Runtime Warnings: Corrects four instances where debug calls were missing the required log level parameter. This change eliminates the runtime warnings that currently trigger during every CVE scan.

Testing:
- Applied cleanly to the current `scarthgap` HEAD.
- Verified via a full CVE scan.
- Confirmed that all existing CVE statuses are preserved with no regressions observed.

Het Patel (4):
  cve-check: encode affected product/vendor in CVE_STATUS
  cve-check: annotate CVEs during analysis
  cve-check-map: add new statuses
  cve-check: fix debug message

 meta/classes/cve-check.bbclass | 246 +++++++++++++++++++++--------------------
 meta/conf/cve-check-map.conf   |   9 +
 meta/lib/oe/cve_check.py       |  74 +++++++++---
 3 files changed, 197 insertions(+), 132 deletions(-)

