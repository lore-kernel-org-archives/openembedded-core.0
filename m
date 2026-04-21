Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F2AF8925E
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 11:10:48 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23418.1776769838202206628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 04:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XhkQDAZs;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=954; q=dns/txt;
  s=iport01; t=1776769838; x=1777979438;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=daiWs/WK7zcSCSoUG2sCtHlvO13BYsS3ZwqlZVLKn+Y=;
  b=XhkQDAZsbu51+46wf5Cx9Cl5+eYtB2u8OtVCfPM6XdV9BqesM7gU6/8j
   Dk5VYuaCMSByUqLz80lvHeOXwACMb6Wqak2LtBomsE8peeff5dN9LLKyI
   ceWi1QYxlC3qC8iyUVE0AwDH0/RAQ+oY70fp6IIUwJxms4EiD4DRgtwCI
   G1oz8uSqPri8XEMaPIXdOmDWUHPEsfDuvOA7uSEv0P+mwWbiv/bsvbqWf
   uHE5W+DhyBWzF2hQSJ0dbNDX45o8nhynp8ar4C5LKlA5S3LdlmHpnb8/0
   5NqmlIkxsl4eIZuV/rIaT7lNxLkj20nIoawjaDxrMAUIuIcixTeSypOiM
   g==;
X-CSE-ConnectionGUID: IJa20+QuQgemg4+gYu/SfQ==
X-CSE-MsgGUID: sMHFsjhhQmGDptWsadKPiQ==
X-IPAS-Result: =?us-ascii?q?A0DGAgCwWudp/5X/Ja1RCYJZgldxXkNJk1oBgnCeHYF/D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUGjS4CJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJzA7FbgiyBAYMoAYFT2yYBCxQBg?=
 =?us-ascii?q?TiFP4gchW4nGxuBcoR9hBd5hXcEgiKBDoF+LgaCTYl5SIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EMGwcFgUuENm1qgQuDMYE3AwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geKFiEQgip0GoFHgSKTAJBCgiGhDgoog3SMHpU6GjOqay6YWKRZhGiBaQE6g?=
 =?us-ascii?q?VlwFYMiCUoZD5FwxQsmMgI9BwIHDgKTcAEB?=
IronPort-Data: A9a23:lY6JpqtOwXnK9zzrV0WsjLkokefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKTzSbKuIYjGgLtt3Pdm2ox5XsZGAztVqT1RsrCkyHnkVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/7Z8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw28R+WzkNz
 OEhJz0IYUzAiNOrh4m1c7w57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3Xcz9RpFWTjaE2+GPUigd21dABNfKKIIXRGZwOxhvwS
 mTu5EHZLAoYNNymzBWp6m6TnebDvhv6YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Kxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:XaIqNqpYINMxWWZ2sjJkxpoaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:jWkJ+G+PTXaDn271QAaVv282E5p9MUTA9XjdJkDkSmlYVfquR2bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A55CmPQ+akjkAKXEz1qAlJaeQf9xNw4q1CkANqJA?=
 =?us-ascii?q?pl9GYCjd5NxSljQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,191,1770595200"; 
   d="scan'208";a="721341305"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Apr 2026 11:10:34 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C19E8180001D0;
	Tue, 21 Apr 2026 11:10:34 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 5FC0ECC1288; Tue, 21 Apr 2026 04:10:34 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [master] [PATCH] apt: Add CVE_PRODUCT to support product name
Date: Tue, 21 Apr 2026 04:10:28 -0700
Message-Id: <20260421111028.2501890-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 11:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235671

From: Himanshu Jadon <hjadon@cisco.com>

- NVD contains older debian:apt CPEs, but they are deprecated and
  explicitly replaced by debian:advanced_package_tool, so the recipe
  should use the active normalized product identity.
- Therefore, set CVE_PRODUCT to align with the NVD CPE and ensure
  correct CVE reporting.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index d2dfe48e9a..871564baea 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -148,3 +148,6 @@ do_install:append() {
 	# Avoid non-reproducible -src package
 	sed -i -e "s,${B}/include/,,g" ${B}/apt-pkg/tagfile-keys.cc
 }
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "debian:advanced_package_tool"
-- 
2.35.6


