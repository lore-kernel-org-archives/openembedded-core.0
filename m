Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAD3C5516E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32608.1771565686056322342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=J932JUxH;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1130; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wU03wIqxBB9KdeDAe2MzRIfJvb0ZPNOD92pFDuqEDLo=;
  b=J932JUxH9EGGZCFTwrP7Zygru/CSyQ70wcM2sPb5y/7c2y3A9fd//jAT
   HovENrrIQnNbJVHul5wjd9xa8QOlY3HoFop/mDhAP3sljA5qYeRHuFTFW
   LhDjH1rwPeY7g4sFSn6J/eYDlIsHN6oFarYdUXBxjLwhVqDTSy/iuqWxo
   7DvYOnG3mNE2PVnFXajOASEybiPAzc9rQZSu9/y+nR8ulnixfAXBNARpF
   0U06jqv89Ci4W3sm187T0fYlMfxboQUQCWWb4YW91AM7Y0GeHg9IWRw+7
   5WToW+CdxquJFb41rKvDGOf8xtDpx1zeopvd9fkXVd8TMYq27Lw/fCMWg
   Q==;
X-CSE-ConnectionGUID: na8IKNfCQFW3Uu3Gg/q/8g==
X-CSE-MsgGUID: HsDRH9kqSoixuzBvfjBvfw==
X-IPAS-Result: =?us-ascii?q?A0A/BADP8Jdp/47/Ja1aglmCSA+BUEJJlk6eGoF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGWwIBAzIBRhAgJgsrKxmDAoJ0AgGnVIIsgQHgIgELFAGBOIU8i?=
 =?us-ascii?q?BlaGoR6JxsbgXKEfYQKgQaFdwSCIoEOjUKGDUiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYdTD4kFeG6BIIEbAwsYDUgRLDcUGwQ+bgeOLz+CN?=
 =?us-ascii?q?AGBDZZUkXihDgoog3ShWBozqmuSAIcGpFmEaIFoPIFZcBWDIlIZD45fvhoiN?=
 =?us-ascii?q?TwCBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:S224xau4niL6FoST2BNwcnz0qOfnVAFfMUV32f8akzHdYApBsoF/q
 tZmKT2BaPaNNzGkc94ib9uz9x4GusDUmoBnTgdkrXxgFyISgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/O8nIEJo+
 9chBg9WUw3YqO3x2fXrRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJYXSGZsOwhzwS
 mTu33/VODFLN8WkzjuV72CGmOHNtz31R9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:o/L+6aNhnAJtXsBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AyHJ+s2kYTsjCU+mNvgZnSatlvUDXOXvUnFbzBUG?=
 =?us-ascii?q?TMEhWE4CIEnCfv7ojw8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AucMryg4mUy2cVqzu/nwpSnaGxoxI+IiUKBEOiK4?=
 =?us-ascii?q?ButmZJwZuNTW3kjqoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671046342"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 245271800023C;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 8105ACC8CF9; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 09/34] cve-check: do not skip cve status description after :
Date: Thu, 19 Feb 2026 21:34:18 -0800
Message-Id: <20260220053443.3006180-9-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231462

From: Peter Marko <peter.marko@siemens.com>

Correct maxsplit parameter from 5 to 4 to not drop text if
description contains ":".

Example:
>>> "detail: cpe:vendor:product:description:cont".split(':', 5)
['detail', ' cpe', 'vendor', 'product', 'description', 'xxx']
>>> "detail: cpe:vendor:product:description:cont".split(':', 4)
['detail', ' cpe', 'vendor', 'product', 'description:xxx']

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c4d8ca41ac0b429af92bf0ea84f1dfd0cda9e1f)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 37230b7957..c8572d7724 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -239,7 +239,7 @@ def decode_cve_status(d, cve):
     if not status:
         return {}
 
-    status_split = status.split(':', 5)
+    status_split = status.split(':', 4)
     status_out = {}
     status_out["detail"] = status_split[0]
     product = "*"

