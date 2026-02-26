Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0055FCE074
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:54:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69126.1772110470295880064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gIXSeXqa;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=744; q=dns/txt;
  s=iport01; t=1772110470; x=1773320070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u1yATUkGgY4DCKvINhfQ3hJY8cYWdlNSTYW4POC/8w8=;
  b=gIXSeXqaNIR5hvCXhpi2DklgyuOIdMRgJQI7uuVsYqtptpXOeY/vjxGo
   gZNA5DU4ZtewJYrAImnr4ZAYqZZ8ZWZVu4QQGAO1yv6xTrJQ17zgvYjaX
   kJdVi0u0TutvSQTRHIxGG8i/2158s8WZOZ0EXrISoijlnNxeRc2EgsuqS
   mZ0VLve9bYwhYmQZugfhhfzzg/nFbTy2uFKPVivbD6qXI9HrVVQiEN3R/
   K8+2nJH64z+IFgQ+GMm8+YAla2cFiIoPk4z8YZINf313yEONrqXdVgrzq
   bRKL9bdifcO+7KQw/9E09zHFO4wGl0M6kzpGhVLJHabuY+7zjUZZxy4Nt
   A==;
X-CSE-ConnectionGUID: 8tjdsxsRQqycJ9E/4tlzkQ==
X-CSE-MsgGUID: 0Iog3mGKT+KksTY4iubEHg==
X-IPAS-Result: =?us-ascii?q?A0DBBwAzQqBp/5D/Ja1aglmCSA9xX0JJlV9voBkPAQEBD?=
 =?us-ascii?q?zEgBAEBhQcCjR8CJjcGDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGWwIBAzIBGAEtECAxKysZgwIBgnMCAaZrgiyBAYMoAYFT2yYBC?=
 =?us-ascii?q?xQBgTiFPIgZdIR6JxsbgXKEfYQKgQaFdwSCIoEOh3wGhFWGN0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFTI8Mh2BIz4XgQobBwWGCA+IdHhugRqCBAMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4HjWk/gjSBDoFvepNrkXihDgoog3SMHpU6GjOqay6YWKRZhGiBfiaBW?=
 =?us-ascii?q?XAVgyIJSRkPji4VymIiNQI6AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:BKWAnqs2VuDt7zR2tH6VPceI3efnVABfMUV32f8akzHdYApBsoF/q
 tZmKWmBPvaIZzShLo1zbYW1phsH6MfWnIQ1Hgc4qy5hFiJHgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwqvp1DXpe7
 sYhMSEGTEGuwL6qxKC4c7w57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJYHWH54IwRnwS
 mTup0X+DUofG/+jihmG6U6d2u7Slw7bV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/N8lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:hTMywqPQJcAtlMBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:npZBF2HE8t2KiawZqmI36EwYAdA+SETE3XzycmL/VXptWr6sHAo=
X-Talos-MUID: 9a23:hXbJogSUg+TzdbZcRXS0pTZtb8JHwJjtK0MWraRautSOGAx/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="675423577"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:54:17 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id D59041800020F;
	Thu, 26 Feb 2026 12:54:16 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 7DF72CC1283; Thu, 26 Feb 2026 04:54:16 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [PATCH v1] mpfr: Add vendor to CVE_PRODUCT to exclude false positives
Date: Thu, 26 Feb 2026 04:54:14 -0800
Message-Id: <20260226125415.53196-2-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260226125415.53196-1-hetpat@cisco.com>
References: <20260226125415.53196-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232020

From: Het Patel <hetpat@cisco.com>

- Added the vendor to CVE_PRODUCT to prevent false positives.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-support/mpfr/mpfr_4.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/mpfr/mpfr_4.2.2.bb b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
index 4d1747c3fd..81f3a0297b 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
@@ -9,7 +9,7 @@ inherit autotools texinfo
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     "
-CVE_PRODUCT = "gnu_mpfr"
+CVE_PRODUCT = "mpfr:gnu_mpfr"
 
 DEPENDS = "gmp"
 

