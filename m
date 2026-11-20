Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3710.1795172267748336496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RIW4cAdr;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4594; q=dns/txt;
  s=iport01; t=1795172268; x=1796381868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wqZ9u5KMbrI4/YWnt9sGeIrvQ6a5MaCcnk57mcAAML8=;
  b=RIW4cAdrT8bcn9Sb9lmN8SjI6xj1tRJ2rD+H3aNBO0qhzhibL0Hvoo5j
   5T27/kN5u1r/zzEV3tNTVyRDosN9VgxPRWfKzbJU9YZuUGrK1Ijqcb/Di
   sf7RufXwr2RA82U0vWzCw0p2f5qW4rSr6Hmtx9kO3rkBp3hg7oEYQzwfW
   eYeNVdLLK/MExPSeLp0o0gJRfCw/FFKMyVBEPJvQcqYSOAMviLPW+RWok
   qSBYVmiT8D4qNb8nyz3eJZISqr9wqO5dMP5iYYzfLQz/RC2CCpQMqwWhZ
   XndAsirTr8nZDH1np/BysJJ1leNsZiMCPRQIKu8M+U9wJVXRREaTgbNIN
   g==;
X-CSE-ConnectionGUID: 9TsWz5cNTUuOWSRn9dhSHg==
X-CSE-MsgGUID: nycx3BPETp+KijbsJYvAVw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDlJgBr/9JK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AgERuCwbN4F5M4EBh?=
 =?us-ascii?q?H7bMwELFAEFgTOFQogkXRgBhH0nGxuBcoEVg2qBBYFcAogmBIIigQyBVBgGj?=
 =?us-ascii?q?HkCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGDRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5NsgxIHLRBRASUGIFsWQ1gcATGSXpJJgTWfXAoog3mMJJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqVYx5QhGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJEeYAEB?=
IronPort-Data: A9a23:EArQI6qyYGS0GtU0lwc8U5v5RFpeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBmCa6yDM2ujf4h0PIiy9EMDv8TQytY1SVZqrC89RCMV9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8ks25ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rdLGl5cq
 Pc+FA0QSS+4veTnzLKAauY506zPLOGzVG8eknht13TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA5PYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoHbG50IzxvJz
 o7A12LoCQFBHuSy9SLG0XOujPTtrD3SZp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:bJqjvqG0eDuXL+uHpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:EodXvGySVKb62u64j74XBgVFJtsaYCDW6kvtPmiHMlxvGbGVcn+frfY=
X-Talos-MUID: 9a23:fQ7/6AgbKITHpV3I/ygI3cMpMtZj8/+EMG0xidYlusuOLg5BJR6jk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59605959"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:46 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id A2E3618000134;
	Fri, 20 Nov 2026 10:57:46 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id DB935CBF230; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 8/8] cups: Fix CVE-2026-107885
Date: Fri, 20 Nov 2026 02:57:20 -0800
Message-Id: <20261120105720.2197092-9-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250767
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/6c61d23f5523055ec4374465e85d1dec9396994f
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-hhw5-qqmc-p6rg

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 547a129ce4..0581841e44 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -32,6 +32,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-107888.patch \
            file://CVE-2026-107890.patch \
            file://CVE-2026-107886.patch \
+           file://CVE-2026-107885.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107885.patch b/meta/recipes-extended/cups/cups/CVE-2026-107885.patch
new file mode 100644
index 0000000000..73ef70d92a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107885.patch
@@ -0,0 +1,102 @@
+From a927cd66e7c20e72919481b10076b107a802295e Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 6 Oct 2026 10:07:21 -0400
+Subject: [PATCH] Don't allow clients to hold a job open longer than the
+ multiple-operation-time-out value (GHSA-hhw5-qqmc-p6rg)
+
+CVE: CVE-2026-107885
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/6c61d23f5523055ec4374465e85d1dec9396994f]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ scheduler/ipp.c |  2 +-
+ scheduler/job.c | 22 +++++++++++++---------
+ scheduler/job.h |  2 +-
+ 4 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 0142ab12..56b047d7 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -11,6 +11,8 @@ Changes in CUPS v2.4.16 (2025-12-04)
+   submissions (GHSA-wjc4-qhjr-5m5x)
+ - SECURITY-2.3: The scheduler could crash when modifying a class
+   (GHSA-pwg4-pv39-8c22)
++- SECURITY-3.3: The scheduler did not protect against malicious clients that
++  held multiple open print jobs (GHSA-hhw5-qqmc-p6rg)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 35d095c4..8e08b57c 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5265,7 +5265,7 @@ create_job(cupsd_client_t  *con,	/* I - Client connection */
+   if ((job = add_job(con, printer, NULL)) == NULL)
+     return;
+ 
+-  job->pending_timeout = 1;
++  job->pending_timeout = time(NULL) + MultipleOperationTimeout;
+ 
+  /*
+   * Save and log the job...
+diff --git a/scheduler/job.c b/scheduler/job.c
+index b688c342..50a003e0 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -287,17 +287,19 @@ cupsdCheckJobs(void)
+ 	* the job so we can start printing...
+ 	*/
+ 
+-        cupsd_client_t	*con;		/* Current client connection */
++        if (curtime < job->pending_timeout)
++        {
++	  cupsd_client_t	*con;		/* Current client connection */
+ 
+-	for (con = (cupsd_client_t *)cupsArrayFirst(Clients);
+-	     con;
+-	     con = (cupsd_client_t *)cupsArrayNext(Clients))
+-	  if (con->request &&
+-	      con->request->request.op.operation_id == IPP_SEND_DOCUMENT)
+-	    break;
++	  for (con = (cupsd_client_t *)cupsArrayFirst(Clients); con; con = (cupsd_client_t *)cupsArrayNext(Clients))
++	  {
++	    if (con->request && con->request->request.op.operation_id == IPP_SEND_DOCUMENT)
++	      break;
++	  }
+ 
+-        if (con)
+-	  continue;
++	  if (con)
++	    continue;
++	}
+ 
+         if (cupsdTimeoutJob(job))
+ 	  continue;
+@@ -306,7 +308,9 @@ cupsdCheckJobs(void)
+ 	cupsdLogJob(job, CUPSD_LOG_ERROR, "Job submission timed out.");
+       }
+       else
++      {
+ 	cupsdSetJobState(job, IPP_JOB_PENDING, CUPSD_JOB_DEFAULT, "Job hold expired.");
++      }
+     }
+ 
+    /*
+diff --git a/scheduler/job.h b/scheduler/job.h
+index b4820861..47ea2d67 100644
+--- a/scheduler/job.h
++++ b/scheduler/job.h
+@@ -30,7 +30,7 @@ struct cupsd_job_s			/**** Job request ****/
+ 			priority,	/* Job priority */
+ 			dirty;		/* Do we need to write the "c" file? */
+   ipp_jstate_t		state_value;	/* Cached job-state */
+-  int			pending_timeout;/* Non-zero if the job was created and
++  time_t		pending_timeout;/* Non-zero if the job was created and
+ 					 * waiting on files */
+   char			*username;	/* Printing user */
+   char			*dest;		/* Destination printer or class */
+-- 
+2.35.6
+
-- 
2.35.6

