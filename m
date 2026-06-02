Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C44CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:19:11 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.846.1780413541835749597
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HdLSxE0k;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=964; q=dns/txt;
  s=iport01; t=1780413541; x=1781623141;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AnYC+r0aRyG3MKmo5yUBhGWa24jsb16LjOuuqVUQ7Dg=;
  b=HdLSxE0keG7mkOcL/Bdh5ez8TraFv95mpp9T6kGSa/wSRLJKrP/vzNob
   FWc0Yotoeiiz/CwjAiTWcNxBE5SeaIdv1r6lbYQW4UsvDW3dJQ47B3zqp
   jraUGxqC3R5TUbdxgAWNSmwBIvZ/sWTigl2XAnm/lJmXP0DIAyrm3ewNQ
   te67NlSCmoa3hyq5A04pQQv6UZIVovQgonPNPpk/VJeQie9fIhWE/VUu0
   0bNLjnqGdpl5oQcKwuQpNw4+LVX6xkdxC1ad2smrBW3x6hyhcp60fpnaE
   uATsDuyRhvg27dPxvipHgxxlTE8zvl6frjehoKWbXRFgFS679DlJ2h1o3
   w==;
X-CSE-ConnectionGUID: tJLFoyHRRQuuuoLqIRKOHQ==
X-CSE-MsgGUID: V9bMaMt/R2qr5HT1MG05jQ==
X-IPAS-Result: =?us-ascii?q?A0D2AgDS8x5q/5L/Ja1aglmCV3JeQ0mTWgGhDoF+DwEBA?=
 =?us-ascii?q?Q8xIAQBAYUGjTQCJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCcwOzS4IsgQGDKAGBVNsoAQsUAYE4hT+IHXSEe?=
 =?us-ascii?q?ycbG4FyhH2FEIV3BIIigQyBdQaOBkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBCxsHBYFKgVVqgQSFFSMfAzmBF4F/gStpaRADCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?4tuFw+CNYEOAahNoQ4KKIN0jCGVOhozqmsumFikWIRogW8MKYFZcBWDIglKG?=
 =?us-ascii?q?Q/bQicyAjsCBwIHDgMLk2UBAQ?=
IronPort-Data: A9a23:7wpwWqKKwqCQX5AfFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS0WcHm
 mIeXmmCPqncNmD9etF2PIS3pE4FuZPVnNY1HgAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWYuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yLmUYOpw4wNxOHHxT8
 tgBCQouSTC60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5FAhiOGwbIWIIbRmQ+1rz0y9r
 0fauF6jGwtHFODG7BXdr3CV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOz9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:xXcYtavNgNugMLevtdbw/f657skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AiGqY/WrIVLbA4QWvrSSsmMbmUdwHVlPa3VfqGXa?=
 =?us-ascii?q?lFHtubKS0c3y32Joxxg=3D=3D?=
X-Talos-MUID: 9a23:DWpMFgpebe1RXYI/vwgezw8zPuJhxrjpMhoUi8gmh5ChGnQtOQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="480154753"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 15:18:53 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 2DE3718000481;
	Tue,  2 Jun 2026 15:18:53 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C33C2CC1611; Tue,  2 Jun 2026 08:18:52 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] bzip2: set CVE_PRODUCT
Date: Tue,  2 Jun 2026 08:18:25 -0700
Message-ID: <20260602151837.3595029-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 15:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238061

From: Jonas Munsin <jonas.munsin@gehealthcare.com>

Add CVE_PRODUCT to bzip2

Signed-off-by: Jonas Munsin <jonas.munsin@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc889ea799cc82f7fa018baabca0b821c1209897)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 4e3a06f240..f922490868 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -66,5 +66,7 @@ FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
 
 RDEPENDS:${PN}-ptest += "make bash"
 
+CVE_PRODUCT = "bzip:bzip2"
+
 PROVIDES:append:class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


