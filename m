Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A5FC55176
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32606.1771565685734441813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EQx93Mqj;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=976; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XM6RtQ3rz7ZAFNH5Ph/J3G7eO/F8qWbVnCC1/xu865M=;
  b=EQx93Mqjw9Y3EWQobdQfVMoPBHRNK3UwQ+y0oHnGEg7QedFQazPVW4vH
   9vFYUnw9gH9u9qFiImhfaVX/4ho7riVNP+gcy0hfC62X/ckEjTlMgygop
   SnGC+QUAEInQiXnAnMYTJnlpk6+HQ7zlhp5M4sdlisfGK8LrqIGzAblXV
   +SFXW/4uWmViVZnTNN4AiVIBRp2N9hAUEmk/REi2X5qrqTaicrnPq1JmE
   5QBs9jDEbrikQDEgMt/2ZAPqjTnUhCVbjqvqyF8vrVGABf73n5wh7DAcd
   A5X12Lq8hhTtUV8z+HqHSd/JpXaWpNX8LqCEE6PHwYyf/ofApNiEYn6LI
   g==;
X-CSE-ConnectionGUID: k2SmLZhjSLOGSmugqtcWpw==
X-CSE-MsgGUID: feQ28yY9T3Ws8BXqb2x6cA==
X-IPAS-Result: =?us-ascii?q?A0A/BABB8Zdp/43/Ja1aglmCSA+BUEJJlk6eGoF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQcCjR8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGWwIBAzIBRhAgJgsrKxmDAoJ0AgGnVoIsgQHgIgELFAGBOIU8i?=
 =?us-ascii?q?Bl0hHonGxuBcoR9hAqBBoV3BIIigQ6TT0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBCxsHBYdTD4kFeG6BIIEbAwsYDUgRLDcUGwQ+bgeOLz+CNAGBD?=
 =?us-ascii?q?YEfpy2hDgoog3ShWBozhASmZy6YWIJYogGEaIFoPIFZcBWDIlIZD45fvhoiN?=
 =?us-ascii?q?QI6AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:R4i6PqKfeiZAMkHtFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS1jcFn
 DMdDWzTafjbYGOgL9p3PYi2oU5TusWAm4dgGQQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1tVnozGb8Y+N1TJk518
 OEXMSwGUQic0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FIuiei8b4WOKrRmQ+1bk3/C9
 nP3rliiPQpKHuyGw2CVrHmF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:H6b2LqnGMGyErKIA0XppD9Lxm3LpDfIr3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYsS4/izPIaurJB7K8gcaVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AOKqj/GsfH7EksqpiaPFdX6uL6IsmKEbY6EXQIXS?=
 =?us-ascii?q?cLklSTaCaUEObx7t7xp8=3D?=
X-Talos-MUID: 9a23:xZACzwtvvywbds1x282nijxbbpd50vWSU38Wwb82osPeJXJ7EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897738"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 34E51180001BE;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 9CFB2CC8D00; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 15/34] meta/lib/oe/cve_check.py: fix patched_cves not updated
Date: Thu, 19 Feb 2026 21:34:24 -0800
Message-Id: <20260220053443.3006180-15-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231465

From: hongxu <hongxu.jia@eng.windriver.com>

Due to commit [cve-check: Rework patch parsing] applied, it missed to
update patched_cves dictionary if cve_id not in patched_cves

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08796a8153666d93bb622c6a7497a85cef4def42)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c1f36db775..8da03b6865 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -170,7 +170,7 @@ def get_patched_cves(d):
         patch_file = bb.fetch.decodeurl(url)[2]
         for cve_id in parse_cves_from_patch_file(patch_file):
             if cve_id not in patched_cves:
-                {
+                patched_cves[cve_id] = {
                     "abbrev-status": "Patched",
                     "status": "fix-file-included",
                     "resource": [patch_file],

