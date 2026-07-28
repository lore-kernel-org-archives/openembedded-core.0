Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD21C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:47:18 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5409.1785217630482858746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gmQWgjCE;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1279; q=dns/txt;
  s=iport01; t=1785217630; x=1786427230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=81RR2GI6mBnkWTZZrriv86nRaZGS/TZLUUDuMfWWVNk=;
  b=gmQWgjCE+PlcvTIs8vETAsySWNg8aX2Wg6RMS44FmFGx14YZMPKyRAdn
   kuIKfRv6KKQ0ByPeYxhqYtpIEG3FRND8z2keasdJMcMxA01BAfbWyQrOP
   uq3LdslmlVqRAUlojNNVGtQActr8SO+pdjZX6Rjpx2ZRxCFYxEHRE/mZq
   H+VZ81ymlhVIBl/nl9gjUVNv/YE76o4X0alAnQ2x35XLV/iw8S3adEPX6
   WTP9Vz4QaqRhLAMvVhLoV6WQDbGSkCqUzbWTkdhVUxVEp2CPAEQWz3T9A
   nexDXCPhrDyZB5I2BnjGVlMkjTs+Sjw8J7Ph3yCdQuE34nEFNr5Iovk1y
   g==;
X-CSE-ConnectionGUID: 95ygwnGjS26FvMDUv8oT5g==
X-CSE-MsgGUID: K8coVKJIQHmK6bPb4oRdBQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgAZH2hq/5EQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAPAUoIsgQGDKAGBVNsuAQsUAYE4hT+IIHWEf?=
 =?us-ascii?q?CcbG4FyhH6FEIV4BIIigQyBeIE3jxNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQwbBwWBHYEsYYRYIxk5f4ExdUp3LWkBEheBGoM8AoIVAwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeNdSKCPYEOghgclCCPWYIhoQ8KKIN1jCGVOhozqmwukn2FXaRah?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkP32gnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:N9V/bq9dkUXLTbcpNKKJDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2RNXz3TOv7ZZmenL9skaNnip0kPsJXVnINkG1NprXtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThLs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnYJwX5eBYA1oUq
 9IGDRwwcECEu7+5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPnWjOX9PYH46tOeqj3X4dRVTqUmeouw85G27IAlZj+m1bIOEJILXLSlTtmXIr
 WX43EbYOzEfF4KV8TDZ9UigrNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:SR00Ra8QBL45Oc+oL8puk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:JeA9lGCbiT3rXYb6E3g65UELHO8nSSeD4mn1D3KmWWFVFbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ACvXxig+AupBDbwJXtUC7Hw6Qf+Q46KOQK2IsqLU?=
 =?us-ascii?q?DmJeODSYsPA2Rpg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,189,1779148800"; 
   d="scan'208";a="790419665"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Jul 2026 05:47:09 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 5498718000208;
	Tue, 28 Jul 2026 05:47:09 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id E6990CC1611; Mon, 27 Jul 2026 22:47:08 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-pyyaml: set CVE_PRODUCT
Date: Mon, 27 Jul 2026 22:47:01 -0700
Message-Id: <20260728054701.3143570-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242164

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyyaml vendor prefix matches nothing,
so PyYAML CVEs are not evaluated at all. The databases use two
vendor spellings: pyyaml in the NVD CPEs, and "Red Hat" (with a
space, not expressible as a vendor:product pair) in CVE-2020-1747's
CNA record. Use the bare product name to cover both.

All four existing CVEs (CVE-2017-18342, CVE-2019-20477,
CVE-2020-1747, CVE-2020-14343) are fixed by 5.4, so they resolve as
not affected at 6.0.3.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89a0ba3c2da2a7755bafb28afbf75dc7112e2549)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

---
 meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
index 7e2b088ca5..849e2c9cc8 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
@@ -21,4 +21,6 @@ RDEPENDS:${PN} += "\
     python3-netclient \
 "
 
+CVE_PRODUCT = "pyyaml"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


