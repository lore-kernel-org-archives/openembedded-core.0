Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C702FC5DF9D
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:26:56 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30167.1787812014076049062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q9xyLFXI;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2138; q=dns/txt;
  s=iport01; t=1787812014; x=1789021614;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bdvrXiXNMBzOCoZuMOgkIRBF5/ruIPSScdbBolJ4olY=;
  b=Q9xyLFXIirij8RAoWdPHoX1b2f2AV4Ye79skqvxM7I5kRptXFjA4vvnN
   7WopN59R1xV3sQ9OOV5m2EQz9PKZ5suabvCPDxpvnJpcC8hRj2K2tYTIm
   dEDVPfiVzaja6t+SxJ5USzAGGuQ8TOGKkrI4WBZgMSKKIBE6pJw02ZjBX
   ywqDnnW19mhV6tJ/52j+ph/nV0vCUlP6raJlU14FTKZ5bgkUmqSTY9u1p
   QA2ci4KM9pos3j4b31b86k5XosnWybyP9If7Pf7F8sfdiKDGqyaNUtgs+
   xxEb+TvpmIeuYqhyNEyajhATidQbLVsorXOlGY08+8QADCR1ohF1RTI1i
   Q==;
X-CSE-ConnectionGUID: iYR/MFPARkqLo1v/j/Wojg==
X-CSE-MsgGUID: e4WZmeh+RvOMuHnA/N8H5Q==
X-IPAS-Result: =?us-ascii?q?A0BBAgA22I9q/5P/Ja1aHgEBCxIMggULgld0X0JJk1kBT?=
 =?us-ascii?q?4E1nwqBewMPAQEBDzcaBAEBknUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIcTARgBXVw8CIMCAYJ0A745QoIsgQGDKAGBVNswAQsUA?=
 =?us-ascii?q?YE4hT+IInaEfCcbG4FygRODa4UQhXgEgiKBDJNnSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0dDCxgNSBEsNxUZBD5uB45vH4JOMSgbBxOCKaYioRIKKIN2jCKVO?=
 =?us-ascii?q?hozqmyZCKRahGmBaDyBWXAVgyIJShkPji0BFdABPDUCOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:KKHevaqJMiJWziKm/6H0apwljfleBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCP/iPY2umftl0Otyy9x4BvMWEz4RnGQtu/iBhRi9AouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8kw35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0udGOyZr2
 8QxEjMUShfamaW0h428SOY506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXH5wOxxnB/
 jiuE2LRD00lBtmSyXm/7FWJm8/JtGTdCKJPLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:zr/aMaNJs2GSD8BcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:Lgs66G9KHJaHFilL09mVv08lIIcAXEX09nTJB0jhFyFrD4KSS1DFrQ==
X-Talos-MUID: 9a23:cObFNgUqkVUDmKbq/DKwuwNnOccr2bqJLV0tl7xBnZmkaBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208";a="521317102"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 06:26:53 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id D2D7318000241
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:26:52 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 05EC7CC037D; Thu, 27 Aug 2026 11:56:51 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] cmake-native: use bundled nghttp2 with bundled curl
Date: Thu, 27 Aug 2026 11:56:37 +0530
Message-Id: <20260827062638.2141533-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244454

From: Himanshu Jadon <hjadon@cisco.com>

cmake.inc enables system library lookup through
CMAKE_USE_SYSTEM_LIBRARIES=1. cmake-native already keeps curl bundled,
but it did not also disable system nghttp2 lookup. With CMake 4.4.x,
the bundled cmcurl configure can enable nghttp2 when headers are found
on the host. The later compile uses only the OE native sysroot, so the
build can fail with:

  fatal error: nghttp2/nghttp2.h: No such file or directory

Disable system nghttp2 lookup for cmake-native also. This keeps it
consistent with the existing bundled curl setting instead of adding a
new native dependency because the host happened to expose nghttp2
during configure.

Add the bundled cmnghttp2 license checksum because the native build now
uses that copy explicitly.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b20ba549d6f17af40b9877eb9ab0c52ca62a18c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/cmake/cmake-native_4.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
index a859cef151..911155773c 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
     file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
+    file://Utilities/cmnghttp2/COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
@@ -34,6 +35,7 @@ EXTRA_OECMAKE += "\
     -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=ON \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_NGHTTP2=0 \
 "
 
 # Ensure e2fsprogs isn't found on the host to remove a build dependency and reproducible builds.
-- 
2.53.0


