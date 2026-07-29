Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB67C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:44:26 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7096.1785314662573063057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iuBnxDVb;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1846; q=dns/txt;
  s=iport01; t=1785314662; x=1786524262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OLzEw1XV/RFX4isN6TYPZWwsxKT7zJSGHDW4uF4hZUM=;
  b=iuBnxDVbBN6LuLAK/lWZwr66JMBQp4PAq7L45UMgiyiHx8GBkV6Lee+K
   7AiRcnxB/uNN6jpo7wuw+EWzp82qa8djRRIgfgjOd1w7F8wDu7kDVMNH7
   HzNeoE0wehnkosyp/Yrj1LUyYJF0FpS6eX+hRRmmUoHgDYI6+Hpe1/E46
   T7Jll0YbSiPY6Or3l5UCADMIw98fpRIUWeZp529dEq3QpZqaDzeW7ZLI8
   p+oNIvTP6YI7T0mjZJ/6MM6tBv3fRghEhoILyxS3S2WoHQIAvTjPvFxxR
   E9uMx8Oek/KSewCRWPaABPxGBy2LzEBsn3ZKCiqyz6WvXZuHdNu4l9rNw
   A==;
X-CSE-ConnectionGUID: qOng9DH3Q9udMx8K4HGpRw==
X-CSE-MsgGUID: iXOg3pcdRsGBnuhKrZgPDw==
X-IPAS-Result: =?us-ascii?q?A0BBAgDQvGlq/5EQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAMRvhOCLIEBgygBgVTbLgELFAGBOIU/iCB1h?=
 =?us-ascii?q?HwnGxuBcoR+hRCFeASCIoEMgkhHjyBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBwWBHYEsP4RXIxk2f4EvdUp3LWkBEheBGoM5AoJBAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeNbyGCRAGBDoFEVZN1RpF6oQ8KKIN1jCGVOhozqmwumFqkWoRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD+B9JzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:DkAQwaAjlkE8TxVW/33iw5YqxClBgxIJ4kV8jS/XYbTApGx01DQEm
 zEfUWyEO62JYTf2L9EgaNm19h4Av5bdzoM3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2tJoAxAaHdYhq/t7JHEe1
 qA4Byg3cUXW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8XCpsym+GAjXjkeDoeo1WQzUYyyzeClFYsiui2aLI5fPSLdeJaxV6Tq
 ljd0E7/HxE5Lu6Q8RaapyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeAuhhZX59bFPc3rVndjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:zxj4Y6FGqxtfha6BpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:c+SVDGzuugmiX6fnHWe+BgUNPcYqI1H9l06BPkOdGTZKFJ26UWWPrfY=
X-Talos-MUID: 9a23:SPAU7AUNQIegFvnq/D7coz45LMxk2b+BIkYQkbYcica8GTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790252830"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:44:21 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 8B07F18000479;
	Wed, 29 Jul 2026 08:44:21 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 2A722CC1611; Wed, 29 Jul 2026 01:44:21 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-pyopenssl: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:44:15 -0700
Message-Id: <20260729084415.2285578-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242259

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyopenssl matches nothing in the CVE
databases, which have used four vendor spellings for pyOpenSSL over
the years:

* CVE-2013-4314 (jean-paul_calderone:pyopenssl)
* CVE-2018-1000807 (pyopenssl:pyopenssl)
* CVE-2018-1000808 (pyopenssl_project:pyopenssl)
* CVE-2026-27448, CVE-2026-27459 (pyca:pyopenssl in the CNA records,
  pyopenssl:pyopenssl in the NVD CPEs)

Set all four vendor:product pairs.

For scarthgap, python3-pyopenssl is 24.0.0. CVE-2026-27448 and
CVE-2026-27459 are fixed in 26.0.0, so this metadata change will
expose those CVEs as applicable/unpatched. The fixes for these CVEs
need to be handled separately.

Note: Original commit was for python3-pyopenssl_26.0.0.bb. This is
adjusted for scarthgap where recipe version is
python3-pyopenssl_24.0.0.bb.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba3d752e577004f871fe7f4235e2625410140a08)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index 94a70aa17d..ab00730b57 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS += "openssl python3-cryptography"
 SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
 
 PYPI_PACKAGE = "pyOpenSSL"
+CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
 inherit pypi setuptools3
 
 SRC_URI += " \
-- 
2.35.6


