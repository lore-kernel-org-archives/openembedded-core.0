Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A1CC54FD2
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32604.1771565685718979248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jYQG5+t/;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2049; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HziCI1+V1bhGfWRiQrA1bV8dRzBzWbBusDJ+6cTJKhs=;
  b=jYQG5+t/Rgbu2UyIAZQuh1g6JVzLf1AET5Caj5YzB/OZ62oHuJahwWgu
   Clp9FguWDA5SCfSystGCEPbp2S/YrD6GswdIa1cBxmt4OSlWCx8ZZnNWK
   UfFC7omcGkiwCNtgZsukowXtV4DBqRZmQomKFe6GQ2HIQetTfN4fPlEho
   I4bFvOsZ6hjgSlFxUY1MiLe4+XXlj5VB5gmrM6vEJY7TPn1lctO9E+0f4
   Sx2fgTTBQZK0xz8L/qSRlhX2tnJnIv9Za0+Ac5bNNypeeejb3JzCf1NUD
   uK+wwrt9LiFocTbbqgqG2sHz/IHoBtSqJzV4YnwJGNlBD8VDglXnoZ6rO
   w==;
X-CSE-ConnectionGUID: t7WxPoF4QvOmK8itbpNdHQ==
X-CSE-MsgGUID: Hn9XVQEuS8CMdMfTAvwijw==
X-IPAS-Result: =?us-ascii?q?A0BBBACY8Jdp/5P/Ja1agjQQGoJED4FQQkmWSwOeGoF/D?=
 =?us-ascii?q?wEBAQ9RBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAUYQIDErKxmDAoJ0AgGqBoIsgQGEfLUIAQsUA?=
 =?us-ascii?q?YE4hTyIGVoahHonGxuBcoR9hRCFdwSCIoEOk09IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQsbBwWHUw+JBXhugSCBGwMLGA1IESw3FBsEPm4Hji8/g?=
 =?us-ascii?q?jQBLGEwgWFpLJJoRJF6oQ4KKIN0oVgaM6prmQakWYRogWg8gVlwFYMiUhkP2?=
 =?us-ascii?q?GIiNTwCBwsBAQMJkWwtgU4BAQ?=
IronPort-Data: A9a23:kRLoAK5JuFRP6wF4Pp8mQAxRtILFchMFZxGqfqrLsTDasY5as4F+v
 jQZDGCGa/6JYDb2KtojPIq09EkBsJ/XmtY3Sws9pXg9Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO8/BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhOs/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fbfkevicu9k3TYVH7Pk/RyBlkQMa0hr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w13oIoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBgGhYasNmRZ4yY
 +IZZCZ3ZQjoaBxUMVBRA5U79AutrievI2QB8g/M9MLb5UDzyl1B7oHALeGFUfmGYMtpt1iHp
 2DZqjGR7hYycYb3JSC+2nW0i+nCmCn2VI4fGPiz8eRnqFmS3XAIThoOWF22pPO0hkKzV5RYM
 UN8x8Y1hbI5+EruSpz2WAe15Sfc+BUdQNFXVeY97Wlh15bp3upQPUBcJhYpVTDsnJVeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:jNdZJ6j02CdmSzw6ic1FzmQrj3BQXt0ji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: 9a23:h6smLmMjzJ+eau5DRHZY5HYTNJwcbFrY7yfRP0WgL2pJcejA
X-Talos-MUID: 9a23:yq0l3wvyfEQzbfieoc2npDczBPlRzrmVWGsonbAIh+CaKi1yJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="688112519"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 2C1C918000247;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 8EE66CC8CFC; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 12/34] cve-check: fix cvesInRecord
Date: Thu, 19 Feb 2026 21:34:21 -0800
Message-Id: <20260220053443.3006180-12-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231459

From: Peter Marko <peter.marko@siemens.com>

Currently flag cvesInRecord is set to false if all CVEs are ignored or
patched. This is inconsistent as it shows false if a CVE was fixed via
patch and true if this CVE was fixed by upgrade. In both cases the CVE
is valid and was fixed.

As I understand this flag, it should say if any CVE exists for
particular component's product (regardless of how this CVE is handled)
and can be used to validate if a product is correctly set.

Note that skipping ignored CVEs may make sense in some cases, as ignored
may mean that NVD DB is wrong, but in many cases it is ignored for other
reasons. Further patch can be done to evaluate ignore subtype but that
would be against my understanding of this flag as described above.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5d499693672ec9619392011b765941cf94aa319)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d505c68511..8aa7293368 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -334,17 +334,18 @@ def check_cves(d, cve_data):
         for cverow in cve_cursor:
             cve = cverow[0]
 
+            # Write status once only for each product
+            if not cves_in_product:
+                cves_status.append([product, True])
+                cves_in_product = True
+                cves_in_recipe = True
+
             if cve_is_ignored(d, cve_data, cve):
                 bb.note("%s-%s ignores %s" % (product, pv, cve))
                 continue
             elif cve_is_patched(d, cve_data, cve):
                 bb.note("%s has been patched" % (cve))
                 continue
-            # Write status once only for each product
-            if not cves_in_product:
-                cves_status.append([product, True])
-                cves_in_product = True
-                cves_in_recipe = True
 
             vulnerable = False
             ignored = False

