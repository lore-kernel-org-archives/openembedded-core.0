Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219AEEFCD6A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:16:32 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9893.1773047789573778090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FdMR27dO;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1371; q=dns/txt;
  s=iport01; t=1773047789; x=1774257389;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oTGeMSDE74aYa3kpA3OfULrCbOEMUO9KXkrn2/VjQlU=;
  b=FdMR27dO6Cn1H3cXz5u4aKldKUl6QJJAtMiZpRTLhJu+Tzs7cmMVUWrY
   v7zPY2MlaGXMSC+uBFydc38LxO8OFJHW4xMw9y8FEZxhgebLd1cD800hD
   TubIxRhA9QaXe3xlcdyK1pp91wHa5zMPxrac8BE9KOdROscug7FjzHtnx
   iU58OIPpoIo48TDfAljgdtPg+8icwEKGg3CBg2/OrqrtQBwBMby/N1LkV
   BB4288U2lC/wpgkl6ifPX4uYovqjap5EX8soj8MLQS16bAMeNy9qaC7Zd
   7+kZuw87kzEmTC8gvtdsgF9on34rTUFQyILeITTQmRaK1fiDoaldXik5k
   w==;
X-CSE-ConnectionGUID: 7waC/CjyQuecH0tXtKSmpQ==
X-CSE-MsgGUID: /y7fVR46RICOV4pnKJrgSw==
X-IPAS-Result: =?us-ascii?q?A0DpCAAjj65p/5L/Ja1aHgEBCxIMggULghgwD4FPQ0mTW?=
 =?us-ascii?q?gFPmmCFXoF/DwEBAQ9RBAEBkikCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4ThlyHEwF2JjZEgwKCdAOqbIIsgQHgIgELFAGBOIU8i?=
 =?us-ascii?q?Bl0hHonGxuBcoR9hRCFdwSCIoEOjBaHBUiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBCxsHBYUgD4hydG6BE4MDAwsYDUgRLDcUGwQ+bgeNaj6CNIEOg?=
 =?us-ascii?q?QKBcpNgkXihDgoog3ShWBozhASmZy6HZZBzglihSjeEaIFoPIFZcBWDIlIZD?=
 =?us-ascii?q?45fdgEHy3AmMjwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:23bvrqJAlHvX5yCHFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENShWcOz
 2VOCzuEPvffajPxeNEgaozk/EMOscTUzYdnGwsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGYlajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0xE0gdeqYa699qDGpur
 eAoNBM2awi60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5FIhjOS0bIOIJrRmQ+0SjxmWm
 FiaoV7YKTYkaMSZ6hif/Umz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:h/BG4ajgyPF3HHuXSujFxn/MNnBQXs8ji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3d8+mUzJ846U
 +mGJIObeHNMQ==
X-Talos-CUID: 9a23:epSFPW60cCNE5PtuRtssq1EdMYcOcGzk0XrbAxekOXpKc7iNcArF
X-Talos-MUID: 9a23:vNarqQStZgFmIQkZRXSrlW5sCv00vZ6PI2czzY0AmOueOhdvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="684414154"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 09:16:28 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 9C45D18000583
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 09:16:28 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 4480BCC1288; Mon,  9 Mar 2026 02:16:28 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 1/3] improve_kernel_cve_report: do not override backported-patch
Date: Mon,  9 Mar 2026 02:16:21 -0700
Message-Id: <20260309091623.3506271-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 09:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232691

From: Daniel Turull <daniel.turull@ericsson.com>

If the user has a CVE_STATUS for their own backported patch,
the backport takes priority over upstream vulnerable versions.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0beef05be119ea465ba06553a42edea03dfc9fd3)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 829cc4cd30..a81aa0ff94 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -340,6 +340,10 @@ def cve_update(cve_data, cve, entry):
     if cve_data[cve]['status'] == entry['status']:
         return
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
+        # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
+        # has priority over unpatch from CNA
+        if cve_data[cve]['detail'] == "backported-patch":
+            return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)
         return
-- 
2.35.6


