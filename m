Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B52C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:45:38 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5393.1785217536612416020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jF0EX0JP;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1478; q=dns/txt;
  s=iport01; t=1785217536; x=1786427136;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ne/oTxeQHk/ruF5+av1nOYqdtkEy+qQYM26J1MXzChU=;
  b=jF0EX0JPYL7A+FMJmEk6tuQIKV8enDXPAZ/Dtsb9UVGfVIw0cWjUv2Lz
   o2Dz30VkBVzxkIGtLb6euqVXoyhNcL7JcpTr3wNURZVhm4FV2VwLVonC3
   0Dyc4weyv7IkpNovabTWNdtw481WLREgMI4Bey5OqhPRs92Y1aveEB4p7
   S+5mZ78aAA1om3vh+OCTzvVYCoBjJthXTTZDue3cZUrDik3ahAl5s/EUI
   n3lTRWB2SkNuWYtM81uzMhFGuqU0ovITGfcWDSrRmGqAn/mXwA/gdK1g2
   ePVYl2Ywh2Rwf57uQOd7dlEKtBN7LTJkelbh7kEiPTyorqw2lA7Qoq8Ui
   g==;
X-CSE-ConnectionGUID: 4fXygQh4QVCLdvTGlibl9g==
X-CSE-MsgGUID: VVkFkIEtTTWkm6VGhw9iGA==
X-IPAS-Result: =?us-ascii?q?A0BBAgAZH2hq/5IQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAMRwEGCLIEBgygBgVTbLgELFAGBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoQIdoUQhXgEgiKBDIF4UGePE0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgSxhhFgjGTl/gTF1SnctaQESF4EagzwCghUDCxgNS?=
 =?us-ascii?q?BEsNxQZBD5uB411IoI9gQ6CGRuUIJF6oQ8KKIN1jCGVOhozqmwumFqkWoRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD99oJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:xN6CV6uiF4i35XCUYlZKdURU7ufnVAJfMUV32f8akzHdYApBsoF/q
 tZmKW2DOvzbYGf1c9h+aInj9UsHsMOGzt41HVA+/HxmE34QgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z90s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwpuhHEG539
 aAhFhspYg6/qOa3yrbqRbw57igjBJGD0II3s3Vky3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgl/5JEWxI9EglH/cTRUr1S9rqss6G+Vxwt0uFToGIWFK4HQG58PwS50o
 Er4wWfXATA3KOCj9jmArEyDhvCenAzSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:qEe+gKmOu9J1ADNaHbKk8SK70UHpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:VHk3hmGZM56GrHzGqmI7+n4FFfklLkTj51PcPXOXDWdjTOyaHAo=
X-Talos-MUID: 9a23:pTlFjQoVkR06ytC9N7sezw9cN+lrwomyNHwykpBYheaEKn1xFB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="789526227"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 05:45:35 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 9009718000200;
	Tue, 28 Jul 2026 05:45:35 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 23F02CC1611; Mon, 27 Jul 2026 22:45:35 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-pyopenssl: set CVE_PRODUCT
Date: Mon, 27 Jul 2026 22:45:26 -0700
Message-Id: <20260728054526.3134128-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242163

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyopenssl matches nothing in the CVE
databases, which have used four vendor spellings for pyOpenSSL over
the years:

* CVE-2013-4314 (jean-paul_calderone:pyopenssl)
* CVE-2018-1000807 (pyopenssl:pyopenssl)
* CVE-2018-1000808 (pyopenssl_project:pyopenssl)
* CVE-2026-27448, CVE-2026-27459 (pyca:pyopenssl in the CNA records,
pyopenssl:pyopenssl in the NVD CPEs)

Set all four vendor:product pairs. All five CVEs are fixed before
26.3.0 (the two 2026 ones in 26.0.0), so they resolve as not
affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3d752e577004f871fe7f4235e2625410140a08)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

---
 meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
index ca2ee93d29..43977d75b9 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
@@ -18,4 +18,6 @@ RDEPENDS:${PN}:class-target = " \
 "
 RDEPENDS:${PN}-tests = "${PN}"
 
+CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


