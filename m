Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B2DCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:31:03 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18972.1782214253641104153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aGXT7tPL;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5458; q=dns/txt;
  s=iport01; t=1782214253; x=1783423853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9GU5tMjvmKYoZzEy8tVcpInWCdz296CI3HqYJB0p5yo=;
  b=aGXT7tPLdZw9UVoaSWS5RFZd9+ySmhZmou1UHI/CKnmFWL669ZgvW4DP
   iEDDqwggCtzaEq/l1z0OBUjjt+yclclIUtAKd9xhG2H5cpH/ICITb455W
   66qnroto+3pkbDwecv1OCExXxR4aLWy+jRTZPkCEbDSYaq87e0psQiJur
   bxAQ0m4fptjDYB9r8f3vnpQAbDXB22EtT9JRvyBseqIeWRVgPITEh/NDd
   O5oiYcOFtU00KjB2NM8Qzaw2AH4oVAKcHLrunQzpOcsTtkcZPKq53lCyD
   2yUB2LHJe74rZvbcArgr8NOXdh3UY3JJOXQatYTiEjuCjilCkJ8IEatbW
   w==;
X-CSE-ConnectionGUID: PiyxR9IRRdCX1F3U/3T6mg==
X-CSE-MsgGUID: 0BssXCrIRA6qjAZAmdPCZg==
X-IPAS-Result: =?us-ascii?q?A0BMAgCDbTpq/5X/Ja1aglmCGD90X0JJA4RUkXQDnhsUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBghKCdAKNSgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAyMECwE0EhAcAwECAwIJHQICKyMIGYIqWAGCc?=
 =?us-ascii?q?wIBEZxWlxcaN3p/M4EBg2gCQ1DbLAELFAEFgQUuhT+DHAGFAlsYAYR8Jxsbg?=
 =?us-ascii?q?XKBFYNpgQWBXAKBI4QYgmoEgiKBDIFaGAZPBYJVghuJRUiBAhwDWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYFugQSFAiMfAzl/gT+BJGRmFTA1g?=
 =?us-ascii?q?QEBER8KgSsDCxgNSBEsNxQbBD0BbgeMWhcPgW5IB3sTASoBIGMCgSccATGSa?=
 =?us-ascii?q?gcqkg2hDwoog3WMIZU6GjOFW51hhzALmH2OCpZQhGiBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?jiDa4QHgQzEfiQ1CwMvAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:4lpJSaNSgJ1SKvvvrR30lsFynXyQoLVcMsEvi/4bfWQNrUor0zMBz
 jdMC2GFMvyLYGb2e4h0boi1oBhX6MPdz4diGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV/lV
 e/a+ZWFZgf7gWUsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj681vHVEMbKwiwOpcMThgr
 sFfcwxTax/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJsym+Gnj2PyWzZZs1mS46Ew5gA/ySQtgei0bYGFJ4PiqcN9xmyDv
 VLt5UXDK08DNvWt4D+Jylmeibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:QIXMHq4Qddb2PtXDcgPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AjWjnlmnFqTzJHxrBLJz4b/pFXrnXOUXc3Wfqcm6?=
 =?us-ascii?q?CM2pCeOS7EmLXo586lsU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AmWqNbw5O9m5N8bYckCitVDboxowwyb+1OGsXsK8?=
 =?us-ascii?q?v5dCGHB5ZPjulpwa4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498153857"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 11:30:52 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 73BBE180001CF;
	Tue, 23 Jun 2026 11:30:52 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 1A78DCC12A7; Tue, 23 Jun 2026 04:30:52 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 2/8] cups: Fix CVE-2026-34978
Date: Tue, 23 Jun 2026 04:30:26 -0700
Message-ID: <20260623113037.28968-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260623113037.28968-1-adongare@cisco.com>
References: <20260623113037.28968-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239349

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568
[2] https://security-tracker.debian.org/tracker/CVE-2026-34978

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34978.patch            | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ec9392b73d..e06bbc0a2a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447.patch \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
+           file://CVE-2026-34978.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
new file mode 100644
index 0000000000..d05bc85588
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -0,0 +1,102 @@
+From ab6ab965de6890aed4df39c97f7cd708fd5cb00c Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:18:26 -0400
+Subject: [PATCH] Fix RSS notifier.
+
+CVE: CVE-2026-34978
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568]
+
+Backport Changes:
+- Rebase CHANGES.md placement and scheduler/ipp.c subscription context to the
+  CUPS 2.4.11 source carried by this recipe.
+
+(cherry picked from commit 730347c5bbd5e1271149c6739aa858c0c83a7568)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ notifier/rss.c  | 20 ++++++++++++++------
+ scheduler/ipp.c | 12 ++++++++++++
+ 3 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 7a5e8813f..429ee874f 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
+ Changes in CUPS v2.4.10 (2024-06-18)
+ ------------------------------------
+ 
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+- Fixed cupsd crash if user does not exist (Issue #1555)
++- CVE-2026-34978: The RSS notifier could write outside the scheduler's RSS
++  directory.
+ - Fixed error handling when reading a mixed `1setOf` attribute.
+ - Fixed scheduler start if there is only domain socket to listen on (Issue #985)
+ 
+diff --git a/notifier/rss.c b/notifier/rss.c
+index f17e1494c..250ad877e 100644
+--- a/notifier/rss.c
++++ b/notifier/rss.c
+@@ -1,11 +1,12 @@
+ /*
+  * RSS notifier for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
+- * Copyright 2007-2015 by Apple Inc.
+- * Copyright 2007 by Easy Software Products.
++ * Copyright © 2020-2026 by OpenPrinting.
++ * Copyright © 2007-2015 by Apple Inc.
++ * Copyright © 2007 by Easy Software Products.
+  *
+- * Licensed under Apache License v2.0.  See the file "LICENSE" for more information.
++ * Licensed under Apache License v2.0.  See the file "LICENSE" for more
++ * information.
+  */
+ 
+ /*
+@@ -80,6 +81,7 @@ main(int  argc,				/* I - Number of command-line arguments */
+   http_status_t	status;			/* HTTP GET/PUT status code */
+   char		filename[1024],		/* Local filename */
+ 		newname[1024];		/* filename.N */
++  struct stat	fileinfo;		/* Local file information */
+   cups_lang_t	*language;		/* Language information */
+   ipp_attribute_t *printer_up_time,	/* Timestamp on event */
+ 		*notify_sequence_number,/* Sequence number */
+@@ -111,9 +113,9 @@ main(int  argc,				/* I - Number of command-line arguments */
+ 
+   if (httpSeparateURI(HTTP_URI_CODING_ALL, argv[1], scheme, sizeof(scheme),
+                       username, sizeof(username), host, sizeof(host), &port,
+-		      resource, sizeof(resource)) < HTTP_URI_OK)
++		      resource, sizeof(resource)) < HTTP_URI_OK || strstr(resource, "../") != NULL)
+   {
+-    fprintf(stderr, "ERROR: Bad RSS URI \"%s\"!\n", argv[1]);
++    fprintf(stderr, "ERROR: Bad RSS URI \"%s\".\n", argv[1]);
+     return (1);
+   }
+ 
+@@ -209,6 +211,12 @@ main(int  argc,				/* I - Number of command-line arguments */
+     snprintf(filename, sizeof(filename), "%s/rss%s", cachedir, resource);
+     snprintf(newname, sizeof(newname), "%s.N", filename);
+ 
++    if (!lstat(filename, &fileinfo) && !S_ISREG(fileinfo.st_mode))
++    {
++      fprintf(stderr, "ERROR: Local RSS path \"%s\" is not a file.\n", filename);
++      return (1);
++    }
++
+     httpAssembleURIf(HTTP_URI_CODING_ALL, baseurl, sizeof(baseurl), "http",
+                      NULL, server_name, atoi(server_port), "/rss%s", resource);
+   }
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 2d80a960e..2dc7376c1 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -1985,6 +1985,12 @@ add_job_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
-- 
2.44.4


