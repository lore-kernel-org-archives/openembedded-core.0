Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D042CC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:47:58 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5541.1785217675222301742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Sy7NHUwc;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1293; q=dns/txt;
  s=iport01; t=1785217675; x=1786427275;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RytovF7G/y5p+NRkSmL2sec27E6cL1ON7oj6MqXvlAw=;
  b=Sy7NHUwc3ROAC55ScE6fN/mbacZXIVDdw8PD5rRYP2BUyZa6zzLjGiPu
   M86AALg9S4kl31z4/FuSUIAqpQ5362Eo7rH9mNZ2RZH2am+HsoyHyCNvo
   hM3LFcelDXYwVQpwwQCUTNbc46C25hvk3y0fy1eoiuQwS0wY7ReoZgya5
   f1m8qoneB/2eCu8/fezaxTmMy9nZkaVCY8uuMGb4R1i7fjhKJUN0o4HBq
   Eclb2NXLbNv1tXrX8kR547lMc9DLlwGU3agrXXS9eJ0RS2V4tw5H7NSew
   HwdyeeJWpRZB9g04qCklfPIesNz7Oo1PleJaGi64ml4wGTF/w0ZuwpXC3
   w==;
X-CSE-ConnectionGUID: Bf9EUPyyQHmShJz+jISumw==
X-CSE-MsgGUID: az1E7IWPT8Gp4mr7PbPrtQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgAZH2hq/5QQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAMRwEGCLIEBgygBgVTbLgELFAGBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoR+hRCFeASCIoEMgy+PE0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgSxhhFgjGTl/gTF1SnctaQESF4EagzwCghUDCxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB411IoI9gQ6WVJF6oQ8KKIN1jCGVOhozqmwumFqkWoRpgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD99oJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:9Sqwrqtt+BVHvEZzERu99m0cbefnVAJfMUV32f8akzHdYApBsoF/q
 tZmKWqDbP7cNjSmfIsnYNi+9R5VvpDXz9Q3SQFsqng1H3gVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z90s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0OgmLFx25
 O0hCDU2bjKRxOCX+6++Vbw57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglH/cTRUr1S9rqss6G+Vxwt0uFToGIWFJIPWGp0Nxi50o
 ErP7T3UXTAlDODP5iLZ92jzvuX3hz/CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:lmBhOqHRSkWoQAVWpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:VcKU92z/41aTD/LBwWoYBgU+FJEIT0XM3U7wJnS4K3QqSpyuVFqPrfY=
X-Talos-MUID: 9a23:h4vMfwlGVmqLXDEph80pdnprJp5FvIWRMHxdvo1avtPbDSZIISuk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="786747000"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 05:47:54 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 31646180003A6;
	Tue, 28 Jul 2026 05:47:54 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C9D8CCC1611; Mon, 27 Jul 2026 22:47:53 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-xmltodict: set CVE_PRODUCT
Date: Mon, 27 Jul 2026 22:47:50 -0700
Message-Id: <20260728054750.3146504-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242165

From: "mark.yang" <mark.yang@lge.com>

The CVE databases track xmltodict as xmltodict:xmltodict, so the
default python:xmltodict vendor prefix never matches and its CVEs
are not evaluated at all. Use the exact vendor:product pair.

The only existing CVE (CVE-2025-9375, disputed by upstream) affects
0.14.2 before 0.15.1, so it resolves as not affected at 1.0.4.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2229426b729adf85780c23d38c85fc3cf090f6ba)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

---
 meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
index e622c00dae..04632de099 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "6d94c9f834dd9e44514162799d344d815a3a4faec913717a9ecbfa5be1
 
 PYPI_PACKAGE = "xmltodict"
 
+CVE_PRODUCT = "xmltodict:xmltodict"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
-- 
2.35.6


