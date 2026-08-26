Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EF3C61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:26 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6158.1787722219337362624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JA68c25j;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1427; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=smbDoRBm5dUB5/7zdWkd5FEKffWKEpHQ0h3zK+OgImg=;
  b=JA68c25jl9JrlBYfayH/KqYxbhJyhR4Mo0h5idruZBTQ3/NellGPhhb+
   6QJ/icJEAxNwGAhEeHgi9sBA9i8KU/9jdup7sCP6Fwrcp53BgfxN3+bs/
   W0aVqukgMOGWTeU/TNThPrDeIkntbfeNOKlD35GWa3e5ktlKrbb4xTkVg
   YnEo80jLqKs/V1kK/8E9VcyEgcKSrJL5Q2pyjzinXOlQVx9NfSdGkVPwM
   5uZzdjN9Uf63Y5l1IzrjS8M2/S+yLcDn6CkHhZF0WZbd5DsxFGQa8iUht
   hq24y2inUiuM1egmpGZOJZi2BEAi5iWo7pyzF1mhp6HOrrK0kTPrZ/QQq
   Q==;
X-CSE-ConnectionGUID: FKdvW0SaTKmG54zTuENFJg==
X-CSE-MsgGUID: fJox9MbPTJaX2cyFddVZYA==
X-IPAS-Result: =?us-ascii?q?A0DDAgB8eY5q/5QQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjUIDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO+VoIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0c+CxgNSBEsNxQZBD5uB45rH4JJPVEqdXqmNaEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFpATqBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:7cKQoaJwHfnsMV4HFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENSgzUCz
 2ocWWjXbquOYmTzKtt/a9u38xgG6JHVmNNqSVQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1AL00oAtUj89pUBE4Tq
 e4kNR0rQDKM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzPHwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhiei8aYOJKoXiqcN9kGSft
 jPj9VzFIBgqbteO5zaJzECdr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:HerlrqMf9z+bQcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:VGIcyG5sp1qejr0xudss2m0YBP99SXTh73L/fhOqNXtEbpO3RgrF
X-Talos-MUID: 9a23:grM0qAbYpIKWB+BTuR3rlGBHPv9Uwa2eUkscv5kKhfu1HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="818911481"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:18 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 78635180001FC;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 19A4DCC12A8; Tue, 25 Aug 2026 22:30:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-mako: correct CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:18 -0700
Message-Id: <20260826053018.51321-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244288

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:Mako" mapping is not used for the packaged Mako
source and causes its vulnerability records to be missed.

Use "makotemplates:mako" for its historical NVD configuration identity
and "sqlalchemy:mako" for the current NVD dictionary CPE, NVD
configuration, and CNA affected-data identity.

Backport note: this applies the metadata to Scarthgap Mako 1.3.2 rather
than master 1.4.1; the older release exposes applicable unpatched records.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76fc2046d3f251af34dd04f8fdcfc0c1d6016380)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-mako_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
index 5b7df9192f..d6fdacf7ac 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -10,6 +10,8 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
+CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
                   python3-netclient \
-- 
2.35.6

