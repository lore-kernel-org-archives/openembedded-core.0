Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A425CCD3439
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 15:54:15 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15587.1778169250162406692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 08:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TSla53ln;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1033; q=dns/txt;
  s=iport01; t=1778169250; x=1779378850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tTO78pTm5sw2M4a+yRN62lQmUB+LKhUxsyIf/CaB6mk=;
  b=TSla53lnlzn+gP9L+QUCX8Yn+sE8K4CTb58Y8nd45wYv6WR0QZDqyBtY
   +t57Z4qBkvjMddt+Ber/BEbCQbGt3fWyAy8FhtcoerGNsRc/dFdxFxbTm
   DzfNW+cCPhUX2HGgBJQxVSddOHamC5Y8n+DR8g1AqLd+FCsW7UwIWnIXL
   P3fUnKKpgulmUqF3Z/MlyDgwNrLcFulsjt+Xofb86+5TabOB2CwhQLU+k
   yeRE8FXK6PCVMluz6Xm1uPQs9V+424QHOwVCJwh2/DF9n/AwIjAzT8iYO
   SJGnWiZ1ocscW+xNhBzG3o9pCNfP/YpZjj7KQ9UCWptQK5C51CVhlTcUA
   Q==;
X-CSE-ConnectionGUID: okn1QByUQAiTZtLuU9cMMA==
X-CSE-MsgGUID: xSQrxrHxTXSqpHrrPv3+cg==
X-IPAS-Result: =?us-ascii?q?A0BBAgDatPxp/5P/Ja1aglmCV3JeQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q8xIAQBAYUGjTQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCcwO4EYIsgQGDKAGBVNsoAQsUAYE4hT+IHYVuJ?=
 =?us-ascii?q?xsbgXKEfYUQhXcEgiKBDoF+g12JK0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYFLgjlyaoEChGB4IywDTnsDCxgNSBEsNxQbBD5uB4pFHQ+CM?=
 =?us-ascii?q?IEOgi+UJZF4oQ4KKIN0jB6VOhozqmsumFikWYRogWg8gVlwFYMiCUoZD9hsJ?=
 =?us-ascii?q?zICOwIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:14n2O6u1d4ZaDZI/swj2XirErOfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKW2CbP+INjSmeYtxOt7g/E4DsJDSz9RjQQdlrSgwRSkSgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs//b90s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/eVxWFhk5
 MEhATExXAynmt/ny5eeY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3Xcz9RpFWTjaE2+GPUigd21dABNfKKJoTRH5oFxRnwS
 mTu71/AGAEAFMyj+QGc6lK2nNfRxmDwV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:P/MdAqvkumPKcbXPW5G7DU2u7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A678jCWqbhyOeu5BbXRatzl7mUccmdCTk5mbtGma?=
 =?us-ascii?q?5NVR1bKCoGFS13Yoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApjKzSA45Xd/lFjZLieJWWGiaxox42J20GFotgak?=
 =?us-ascii?q?2gNCcFTZqAynGzz+4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,221,1770595200"; 
   d="scan'208";a="740327837"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 May 2026 15:54:09 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 23FC81800025B;
	Thu,  7 May 2026 15:54:09 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id AB105CC1288; Thu,  7 May 2026 08:54:08 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] cargo: set CVE_PRODUCT
Date: Thu,  7 May 2026 08:54:03 -0700
Message-Id: <20260507155403.990855-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 15:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236598

From: Peter Marko <peter.marko@siemens.com>

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5cb71e7df95925a5c342c341e699e244b1b84f6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/rust/cargo_1.75.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index a6d3f1754b..573430ef4e 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
-- 
2.35.6


