Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C9AC44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:19:58 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18371.1784791194712475961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AzEUqDxy;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1118; q=dns/txt;
  s=iport01; t=1784791194; x=1786000794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3Lu7r5shsWaBWCe2ZG5GZZP+ohXo6LYpoaKVv7dym0E=;
  b=AzEUqDxyz+y8nqkewfmlSE4aKc/ax/BBHNdUJFJ5EhqelaKz6Ny65sFp
   Jm1u99LpFGn0zWEpewifknNWWwMQw61PAwC7A7sey3aa23YQ7lSZIbD6Q
   RN0YvxWbimzSH2+VleiKv69kPbWzvU2ajLguQIPszVuEpISfe+/g1xuqU
   9w0Fr4uAnDVbqxa8vSOJO/G7HLzrR3K82HwsEPEXFLVK9gDT/XQocU5LE
   dbU3Il4a6kBeJ1E6v8RNPI0hH1x1jG1A3OfLSyPoCtjHwj8ZRiZUVCByp
   XHHOKk9FoRfpMp12MKYuw1qJJKjZabxCy1nVKTtTGO7qNWKZtugzF+o/t
   Q==;
X-CSE-ConnectionGUID: HrLpUbeCTmO9gfwLD2yDPw==
X-CSE-MsgGUID: mOkUBv6JRC2j/djgWoNSmg==
X-IPAS-Result: =?us-ascii?q?A0BBAgC6v2Fq/4z/Ja1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjVwCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAPBTYIsgQGDKAGBVNsuAQsUAYE4hT+IIHWEf?=
 =?us-ascii?q?CcbG4FyhAh2hRCFeASCIoEMgXiBUY5lSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgR2BLoEChFwjHwM5f4EwdUp3LWkBEheBJoIUgToCgR0DC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB41wI4I7gQ6WVJF6oQ8KKIN1jCGVOhozqmwumFqkWoRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD+AQJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:4Csjgaq0yaYERGfUtKV5zkiYj4BeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBnTO/aPNGOncox/b46//R4Bv8PdzNQ3SQpqrS08RXgT8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kg35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sZtJXlz/
 /EzFDUqPx+NmMaamqOXcvY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7Wz1aoV6So4I84nPYy0p6172F3N/9J4XWHpQOxBrGz
 o7A12HeASwwKoK98xHf8DWghODwmgXAXY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:DmbJeKB/k405q/vlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AWnnPLGnJlMJfiuoUwLYPSEGF6PTXOV3H6G/tKUK?=
 =?us-ascii?q?TNWNOGbKbVnu8orJIq9U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AK2CAeA1SS3C+JGSBLhcXOAeFJjUj5oOtNWoTz7c?=
 =?us-ascii?q?8kJOGciByNAiaqg+yTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514393246"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 07:19:53 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id C061B180001D9;
	Thu, 23 Jul 2026 07:19:53 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 6E932CC1611; Thu, 23 Jul 2026 00:19:53 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH 3/3] python3-pyasn1: set CVE_PRODUCT
Date: Thu, 23 Jul 2026 00:19:48 -0700
Message-Id: <20260723071948.1807375-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241780

From: "mark.yang" <mark.yang@lge.com>

The default python:pyasn1 does not match the NVD/CNA entries which use
pyasn1 as vendor, so CVEs like CVE-2026-30922 are never reported. Use
the exact pyasn1:pyasn1 pair.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4971337840e8855740409e8f5dadb3ab3661f033)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 01157e251e..b44e877447 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -14,4 +14,6 @@ RDEPENDS:${PN}:class-target += " \
     python3-shell \
 "
 
+CVE_PRODUCT = "pyasn1:pyasn1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


