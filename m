Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A99BC54F4E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32607.1771565685880906200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zul/NKqj;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1366; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gwL5tI1l131kWIHhhNXyAIww7n1T0vvfWqlfuCTBrHU=;
  b=Zul/NKqjsNHQcreuF+5rFUnPvF7PMzsQTUikJYkNCFDqj48RaBTtRhhC
   Jgq9hbceaWsdXORmuc85bceuACdi00JGreGefzlFcmlBs4SD1JDiMQrgt
   CgqBM2MO0WZcIVycmwd5KmQXLMfMEMZFvcb05TD/Q92BSB8rQ5rxOPlZ+
   L/rmqgzRvQt2iA6sw6wVD0Qll3ITgWiQo7mvc+T0VJ1gpK8TSHrITfRqH
   FoIdI85J/oBFW3S5x4w1Qm9PMz4XD7IQkJxCDQlaRpPYRf5yScEQtxnPf
   +5o/ss5DVq+ouOh+K49VjFBERBXj3gQKH98neLbRnKTL4oJRNCuy0Mzk7
   Q==;
X-CSE-ConnectionGUID: potf65OQR02J6Si/kuyfVA==
X-CSE-MsgGUID: Kd3BD5CLR8Sngv1Y2ScdWQ==
X-IPAS-Result: =?us-ascii?q?A0BBBABB8Zdp/4z/Ja1aglmCSA+BUEJJlksDmDyFXhSBa?=
 =?us-ascii?q?w8BAQEPUQQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAUYQICYLKysZgwKCdAIBp1aCLIEB4CIBCxQBg?=
 =?us-ascii?q?TiFPIgZWhqEeicbG4FyhH2ECh9nhXcEgiKBDos0iBtIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWHUw+JBXhugSCBGwMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?i8/gjQBgQ2CGR6TMhw8kguhDgoog3ShWBozqmsuh2WQc6RZhGiBaDyBWXAVg?=
 =?us-ascii?q?yJSGQ+OX74aIjU8AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:OUCT6K4KDUAeaVJZyzCONgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mQeXDzQPPiLYGGnKYoiboW39ExX7cXVm9YwSFZrqyg1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhOs/rYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJYoE9LgqJlh0r
 aY6dgsMKROeluyI6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAhnTjazREgFmUvqEwpWPUyWSd1ZCzb4SJI43WFZg9ckCwh
 W6d1UikKTUgZOeZxiTcwyiXjePwpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:BsQ0iq2t6XbaOud2dyg3UwqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:K7QT3mPsdup4S+5DQC57+hBJPfkfKif/kkzRZEylGGhXYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AN9nnaw0ZAS1rdmcWUPgWwI7KujUjwKj1ImxQurE?=
 =?us-ascii?q?86/KCOjIpCm2mhziIe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="676419485"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 2C2A3180005A3;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 8A1D4CC8CFB; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 11/34] cve-check: restore CVE_CHECK_SHOW_WARNINGS functionality
Date: Thu, 19 Feb 2026 21:34:20 -0800
Message-Id: <20260220053443.3006180-11-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231471

From: Peter Marko <peter.marko@siemens.com>

Commit 05ef4f2a7b225c8d230eaca8d333ffb921729d79 removed this
functionality by accident. It was implemented in text exporter, while it
should have been a global feature independent on exporter type to avoid
such accidental deletion.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2996b11596afca288a6b7f409a5287063d331f3b)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 22161e8539..d505c68511 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -413,6 +413,11 @@ def check_cves(d, cve_data):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
+    if d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
+        unpatched_cves = [cve for cve in cve_data if cve_data[cve]["abbrev-status"] == "Unpatched"]
+        if unpatched_cves:
+            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves))
+
     return (cve_data, cves_status)
 
 def get_cve_info(d, cve_data):

