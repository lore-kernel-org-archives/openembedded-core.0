Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAADC54F4C
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32606.1771565685734441813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cc++n5tr;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3593; q=dns/txt;
  s=iport01; t=1771565685; x=1772775285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ek0QSNLtGTW1ms66bNSMIm1CDT5VlFnSC9ceyVoSsXo=;
  b=cc++n5trfqQnCsuLzH0+mVvDXHgzjFC9ktB/gR4DzgakKo6440RfIieB
   jXGvqXUAkxMRqT+I92mV58QS5GLcCsyBzQkXfQ7WEn6bNhx9TKG6KUc9z
   z+ZUSX5qhgpMih+V+YrjDX8I8xdTmnS6zwDvLMj0FlNSJsTTt6dGpPe5Q
   4wAW4NxhkqhNjOlQ1ylXlNwsQ9HNmJHReNQG+aFrrwIa4iMEVF7uu8+P2
   tLAw/6ax3y6huF6VMRKgWAbp1fMecs5UMaoOPzo0YC08yk9OjSpD3EhmS
   rrL42OEGPsCiEHB52BL2b6BKic6Jb9rb8jyAOeJQuvgyznpO8ZK7Bha5w
   w==;
X-CSE-ConnectionGUID: IlF1YIj8RxWmyHQ4At6SSQ==
X-CSE-MsgGUID: axAL5pHbRQ+6nh5FlPR/Wg==
X-IPAS-Result: =?us-ascii?q?A0BBBABB8Zdp/5D/Ja1aglmCSA+BUEJJlk6LZIxYhV6Bf?=
 =?us-ascii?q?w8BAQEPUQQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAUYQIDEgCysZgwKCOwM2AgGnVoIsgQGEfNhHD?=
 =?us-ascii?q?YJSAQsUAYE4hTyCeYUgdIR6JxsbgXKEfYIfiGgEgiKBDo1Chg1IgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWHUw+JBXhugSCBGwMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4Hji8/gjSBDpZUkXigHXEKKIN0m1yFfBozqmsuh2WQc5ISkkeEaIFoP?=
 =?us-ascii?q?IFZcBWDIlIZD45fvhoiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:ArZb+KuUSFlcHiCsUWuwVA2lOufnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWGDaPeJM2PweNkkPIW//BgC65fSn9YwGwRtqS4zHnwagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/jZ8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2+JZWFBv9
 6wiOA8IfzC628uqnomAc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XczBEsFuJjaE2+GPUigd21dABNfKLJYXaFJoKxBnwS
 mTu9nTQJkwCFNal8Hnb9HLxqOv3p2TEV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:PTb3K6+ePq3vk3DNKLhuk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:IH2MyWBdIL8AQgL6Ewhj2hclO8J1SG3iyWbwGhORFThSc4TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ABxU5qAysr+XnFX/FvEQkXnRICliaqK2+IWRQibU?=
 =?us-ascii?q?MgfDHaypwZhmZtA7wfYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897727"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:44 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id BF9A018000481;
	Fri, 20 Feb 2026 05:34:44 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 6A5D3CC8CF5; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 05/34] selftest: add test_product_match
Date: Thu, 19 Feb 2026 21:34:14 -0800
Message-Id: <20260220053443.3006180-5-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231456

From: Marta Rybczynska <rybczynska@gmail.com>

CVECheck.test_product_match tests has_cve_product_match()

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30ee6edc57ff7629a72606d1005f92d43a5d14f9)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index a40272c919..3dd3e89d3e 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -72,6 +72,54 @@ class CVECheck(OESelftestTestCase):
         self.assertEqual(convert_cve_version("6.2_rc8"), "6.2-rc8")
         self.assertEqual(convert_cve_version("6.2_rc31"), "6.2-rc31")
 
+    def test_product_match(self):
+        from oe.cve_check import has_cve_product_match
+
+        status = {}
+        status["detail"] = "ignored"
+        status["vendor"] = "*"
+        status["product"] = "*"
+        status["description"] = ""
+        status["mapping"] = ""
+
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), True)
+        self.assertEqual(has_cve_product_match(status, "*:*"), True)
+        self.assertEqual(has_cve_product_match(status, "some_product"), True)
+        self.assertEqual(has_cve_product_match(status, "glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca"), True)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), True)
+        self.assertEqual(has_cve_product_match(status, "*"), True)
+        self.assertEqual(has_cve_product_match(status, "aglibc glibc test:test"), True)
+
+        status["product"] = "glibc"
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), False)
+        # The CPE in the recipe must be defined, no * accepted
+        self.assertEqual(has_cve_product_match(status, "*:*"), False)
+        self.assertEqual(has_cve_product_match(status, "*"), False)
+        self.assertEqual(has_cve_product_match(status, "some_product"), False)
+        self.assertEqual(has_cve_product_match(status, "glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca"), False)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), False)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc test"), True)
+        self.assertEqual(has_cve_product_match(status, "test some_vendor:glibc"), True)
+
+        status["vendor"] = "glibca"
+        status["product"] = "glibc"
+        self.assertEqual(has_cve_product_match(status, "some_vendor:some_product"), False)
+        # The CPE in the recipe must be defined, no * accepted
+        self.assertEqual(has_cve_product_match(status, "*:*"), False)
+        self.assertEqual(has_cve_product_match(status, "*"), False)
+        self.assertEqual(has_cve_product_match(status, "some_product"), False)
+        self.assertEqual(has_cve_product_match(status, "glibc"), False)
+        self.assertEqual(has_cve_product_match(status, "glibca"), False)
+        self.assertEqual(has_cve_product_match(status, "aglibc"), False)
+        self.assertEqual(has_cve_product_match(status, "some_vendor:glibc"), False)
+        self.assertEqual(has_cve_product_match(status, "glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "test:test glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "test glibca:glibc"), True)
+        self.assertEqual(has_cve_product_match(status, "glibca:glibc test"), True)
+
 
     def test_recipe_report_json(self):
         config = """

