Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A1FEFCD6B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:17:52 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9910.1773047863089181330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=j8f3NADP;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1628; q=dns/txt;
  s=iport01; t=1773047863; x=1774257463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OlnS6maYNC1SPJbLzp4HWC2ctQi2jjd2BNRQRyLczcI=;
  b=j8f3NADPdJu3KO231Bxx4IvGoOMh7vKnem87cIyAdVuDBu60M6jolF+Z
   fZT6985I5JglwkLbdxuHpJvoDNa4ZzJqjE5lGTA2DrzzdbRvftZ2nW3VA
   UaXSqGvlyDW7Ii3yuGOnlHFg44Lzk3I8S8yXsrRyCa6rujpq422VB0ZiC
   W4xqXhJwShQezHmsGcY0HLwSFZbngpOSXPYgoQB5a7fl9eZqVFw4zMNOM
   hqO+hrzfaQinLfz9WiO/E4DWwrQTAZQsVp3n2b5AzGcnuRER8KFZhP2vN
   t0y0/4sWbzzP4Vl1IXPsl/qt7gSwKypHm5D7raRestJnCqVVikeSfJ1wZ
   A==;
X-CSE-ConnectionGUID: icGBXs5nT6+MQ6ufqHSHtg==
X-CSE-MsgGUID: jh5UQ0GxSeKntg4vv9cvFQ==
X-IPAS-Result: =?us-ascii?q?A0DvCAAFj65p/4v/Ja1aHgEBCxIMgWsQDwuCRA+BT0NJk?=
 =?us-ascii?q?1oBmy+FXoF/DwEBAQ9RBAEBhQeNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4ThlyGXTYBRjBcRIMCgnQDrwKCLIEBugQBCxQBg?=
 =?us-ascii?q?TiFPIgZdIR6JxsbgXKEfYUQhXcEgiKBDpMbSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ELGwcFhSAPiHJ0boETgwMDCxgNSBEsNxQbBD5uB41qPoI0L?=
 =?us-ascii?q?WFMNoEnS6VYoQ4KKIN0oVgaM6prLodlkHOkWYRogWg8gVlwFYMiUhkPjl/KA?=
 =?us-ascii?q?iYyPAIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:Mwf/8q6QQf1sU2K1rzrAgwxRtILFchMFZxGqfqrLsTDasY5as4F+v
 mBKWj/XP/qDNGKnedxxYYqz80sFu5eEyt8wSwM9r3g8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlMuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fGKleVgdfOyXGYMF7VnehgFWENHZEXr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w03IIoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBh2ZYasNmRZ4yY
 +IZazNjaxLoaBxUMVBRA5U79AutrianKWcH8w/O/MLb5UDRzFFM6eDCIOHYWdqWSplLgBeTu
 Ez/qjGR7hYycYb3JSC+2nW0i+nCmCn2VI4fGPiz8eRnqFmS3XAIThoOWF22pPO0hkKzV5RYM
 UN8x8Y1hbI5+EruSpz2WAe15Sbe+BUdQNFXVeY97Wlh15bp3upQPUBcJhYpVTDsnJZeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:wMzbta7GalGDgQJRhQPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:Hx/bcW0WVcZ8sWCfR4mTu7xfG8sKWE3GkXHsfQydMDh0RqS1cn+M9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AhQukPAx4JzldasuS2t1bB7q4iGOaqKauVX00ybo?=
 =?us-ascii?q?WgMSnMzB/ZymD3T+pbLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,110,1770595200"; 
   d="scan'208";a="702273531"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 09:17:42 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 1BD8E1800035D;
	Mon,  9 Mar 2026 09:17:42 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id BEAE2CC1288; Mon,  9 Mar 2026 02:17:41 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH 2/3] improve_kernel_cve_report: do not use custom version
Date: Mon,  9 Mar 2026 02:17:37 -0700
Message-Id: <20260309091737.3507329-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 09:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232692

From: Daniel Turull <daniel.turull@ericsson.com>

When using the version specified in cve-summary.json, we need to
remove the suffix containing the custom version to match the
versions from the CVEs.

This patch truncates the version from cve-summary.json to use only
the base version of the kernel.

This is only applicable for kernels where the user has added their
own version.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3942d40e96989268e8d1030f9d8c3859044d9635)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index a81aa0ff94..5c39df05a5 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -445,10 +445,12 @@ def main():
                 is_kernel=True
         if not is_kernel:
             continue
-
+        # We remove custom versions after -
+        upstream_version = Version(pkg["version"].split("-")[0])
+        logging.info("Checking kernel %s", upstream_version)
         kernel_cves = get_kernel_cves(args.datadir,
                                       compiled_files,
-                                      Version(pkg["version"]))
+                                      upstream_version)
         logging.info("Total kernel cves from kernel CNA: %s", len(kernel_cves))
         cves = {issue["id"]: issue for issue in pkg["issue"]}
         logging.info("Total kernel before processing cves: %s", len(cves))
-- 
2.35.6


