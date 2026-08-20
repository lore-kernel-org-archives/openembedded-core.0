Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD76C5DF8D
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3034.1787216847341274971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CXTXEAQq;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1562; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2I+EMU66RZgW7DRrXMfVub19XwFRKK60YzNXrGOxOR4=;
  b=CXTXEAQqBC7X86wOzYmg6hZaJrdYvtWDQLIoOG83kn8QX38vB2yKkLYd
   hDKv7YHbrHPNPISdfVJoPPcVIT59CH/yN4ghknqzTdw+fMxF1AOp+a3Yj
   GqpEyc/aPAm28PMH2ygVt0wlD1C/ZSVnQ1b+6SmCuEBFC9lD+oI8Qlw83
   jcfl42N7BmWstFKm6j55dGt+AifVgHiNt2QYqGY7oPmfBOLtQJZWUdjBZ
   yIoBLtym8G+mWe1RzUhFmuSUqTMol4hOPdtI+Wm/XFu6UwDs9B8us0wlY
   P1DESeY4OE+aRHRNcf4nLxkpCsDHInfUq88cdITz5osUd+fn+c0fjq9b+
   w==;
X-CSE-ConnectionGUID: jlk6Wye+RQ2FRY4iynBR/w==
X-CSE-MsgGUID: kZoZtPPIS3iF492J5o+L2Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/40QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPCQ4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDJNKSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD5uB45RIIJLATwcNYFEpwqhDwoog3aMIZU6GjOqbC6YW?=
 =?us-ascii?q?qRahGmBaDxGgRNwFYMiCUoZD1feBScyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:NLXE9a1Lv7ii4sMHWPbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2AHy
 WYZC2+HMvzfNjSheIokb4nk/ExT6sCGm9NnQQE63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDkU1Y7IJ96VNODtgz
 81EKSELRCrEmLfjqF67YrEEasULJc3vOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME2ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOG2aYSPK4LQLSlTtkWqo
 VDax1zYOUobGoDOkxjY9TGI3NaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:vpT90Kt43RyGPI3SNFuxeI1X7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:ACWgrGHhuaxmMFLOqmJl8E1KJdEoMUfkllnqEhO5GGBDcvqKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A3Idl9w3dofEp+qKLQZo++EXprzUj4JapOlw1qbQ?=
 =?us-ascii?q?94MiqaX0qGWqazxDte9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813162962"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id ABACE180004AE;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 502E1CC12A6; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-attrs: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:26 -0700
Message-Id: <20260820090726.60976-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243830

From: Tim Orling <tim.orling@konsulko.com>

No new CVEs are caught, but attrs_project:attrs matches the upstream
NVD dictionary CPE. The pypi.bbclass default "python:attrs" generates
the wrong product identity for the packaged attrs source.

This changes the generated product identity, but the Scarthgap
cve-check database snapshot has no current CVE report delta.

Note: The original commit targeted python3-attrs_26.1.0.bb. This is
adjusted for Scarthgap, where the recipe version is 23.2.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc07eddb82fe42ecf86e685450ec0b5c9d3a9ce1)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-attrs_23.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index e39b64306c..99cae50e9b 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19
 
 inherit pypi ptest python_hatchling
 
+CVE_PRODUCT = "attrs_project:attrs"
+
 SRC_URI += " \
 	file://0001-test_funcs-skip-test_unknown-for-pytest-8.patch \
 	file://0001-conftest.py-disable-deadline.patch \
-- 
2.35.6

