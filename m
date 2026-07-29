Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3858EC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:57:17 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7263.1785315432644746461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LMiN4+d3;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1535; q=dns/txt;
  s=iport01; t=1785315432; x=1786525032;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=suvhXKADMrtICTRiWGiOCvTkaE1YhYgpc5jTcmUKJBI=;
  b=LMiN4+d3Lvt20ErvhUnmP43PMRQ8XLDPMgRDZJkvVetUnSgRCuufleXy
   3kGuUIqjTSAY/r5KWnIBL1rHoqDcG0/FYQto7BZwAdjv/bpJaMvZ8zU2w
   Do4Pv1EjW2FWjv7Wd0nassAS4Y2sy+6Ppou4abQPhqR17mg4cb7R/GJEU
   IYKvu15ILmoWwpYDpET6kMv9ZB+7RSm+zUYkfnS484L/Y4yfjLM4WK7dR
   YgNLpO66TchtYHYK2LlCe6oYYT7ntRtJHUJvjzq9pgJNbLbwTcTyXRgYZ
   nyTMw4ssad2j/I4mfyqLqHR95pSzrieTHQCgQAATRLzxFgBMIa7OuI8bV
   Q==;
X-CSE-ConnectionGUID: hWarcdm0SCazU2H/VwG1iQ==
X-CSE-MsgGUID: d3C+rDRdQ4GJwMgYXYIWTg==
X-IPAS-Result: =?us-ascii?q?A0BCAgBTv2lq/5QQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0A74pgiyBAYMoAYFU2y4BCxQBgTiFP4ggd?=
 =?us-ascii?q?YR8JxsbgXKEfoUQhXgEgiKBDIMPjyBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBwWBHYEsP4RXIxk2f4EvdUp3LWkBEheBGoM5AoJBAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeNbyGCRYEOgURUHJQgj1mCIaEPCiiDdYwhlToaM6psLpJ9hV2kW?=
 =?us-ascii?q?oRpgWg8gVlwFYMiCUoZD44uFdI6JzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:eqIVCKN64kS1FDzvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUog02YOm
 GceWDvVb/iPZGWmetlyb97ioR8AvJ/WxtFlTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gW8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/VRBVs9MYhAwc1+E1wU1
 bsmNx9UbynW0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/CJA3kOCurnL+aDZf7lmSoMLb5kCMnVUhjuS1bIW9ltqiSZ5+3Vy0n
 G7/o0vbHTQVBeyu6AW5/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNuhoaHt4VGOog5UTUk+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:4ey78ag6tHQnKZA+MWumTtDllHBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:q90xu2/PFWRdRBFcEc+Vv04rE9oufniF91zZMXLiKSFXV5LMSGbFrQ==
X-Talos-MUID: 9a23:g470iQn1z0mZygxucEvFdnpub+wr+YiUBHlRvrcZnsa1BR1RBAuS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="791864047"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:57:11 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id AB985180001EB;
	Wed, 29 Jul 2026 08:57:11 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 514F1CC1611; Wed, 29 Jul 2026 01:57:11 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-pyyaml: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:57:07 -0700
Message-Id: <20260729085707.2321828-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242264

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyyaml vendor prefix matches nothing,
so PyYAML CVEs are not evaluated at all. The databases use two
vendor spellings: pyyaml in the NVD CPEs, and "Red Hat" (with a
space, not expressible as a vendor:product pair) in CVE-2020-1747's
CNA record. Use the bare product name to cover both.

All four existing CVEs (CVE-2017-18342, CVE-2019-20477,
CVE-2020-1747, CVE-2020-14343) are fixed by 5.4, so they resolve as
not affected at 6.0.1.

Note: Original commit was for python3-pyyaml_6.0.3.bb. This is adjusted
for scarthgap where recipe version is python3-pyyaml_6.0.1.bb.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89a0ba3c2da2a7755bafb28afbf75dc7112e2549)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 3388312557..07bf851fce 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
 PYPI_PACKAGE = "PyYAML"
 
+CVE_PRODUCT = "pyyaml"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"
-- 
2.35.6


