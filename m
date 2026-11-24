Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14023.1795509648214219135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YEns5Xeb;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4744; q=dns/txt;
  s=iport01; t=1795509648; x=1796719248;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uE7Lf7qxmX8mL6K71ApsGqAbE/EFzLhiydcXY1hLV/0=;
  b=YEns5Xeb23klGXb5TZNwGyLWtFl+EVPF4lf3iL3qrXkc81MbuNDkIDv9
   MMQKDvLWkrTTEmvv4D2x+wI3mz3aFeG5Wvj/6LRBCSqmsQkO6LFTE35Uy
   oztWFdnYi8lhVBtOm0u5hcrsJmWcbfZ1SKXgQo8sTYXM47Q2lk8kffqnS
   /7KkC9tQk98kDxSt0lqnL1pmhfxCRDfWQ5POpF/wO1X7kaunEYud7ObEp
   XjqiielGVGQw/OKYjI0X5j0zMkT41GlTOZNH5/vdYTvJYIcNVB8BmW+Xc
   0Wp5fR/vHLGUC64yWD1AsikHxp4vaPfPVLCPtqDQZYqTDM1C9QcscooMQ
   A==;
X-CSE-ConnectionGUID: imCWGHIjRoKD732uQJvV3g==
X-CSE-MsgGUID: ZJwxdc47SWu3QBs4NZVo2w==
X-IPAS-Result: =?us-ascii?q?A0BIAgCgSgVr/9RK/pBaglmCV3VhQkkDlCeCIQORUIxZg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBVhwDAQIvKyMIGYMCAYJ0AgERuiwbN4F5M?=
 =?us-ascii?q?4EBhH7bMwELFAGBOIVCiCRdGAGEfScbG4FygRWDaoEFgVwCgTiGbgSCIoEMg?=
 =?us-ascii?q?VQYBox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxotED4TASUFASBbFkNYHAExkl4LAZI9gTWfXAoog?=
 =?us-ascii?q?3mMJJU6GjOFW6UXC5h9jgqVYwUZUIRqgWg8gVlwFYMiCUoZD44uCwuDYIQHy?=
 =?us-ascii?q?lQjNQsDLwEBBwIHDgMLgWiEYYsggR1gAQE?=
IronPort-Data: A9a23:g7zYvajL5Oc4CeG69kXToRzLX161NBEKZh0ujC45NGQN5FlHY01je
 htvUW6Ca/qNMDenfoglO4yxoR8Av5bSmINjGgNp/C03QX9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUZ/81ILkFv9
 8YfCxxSNUqevsCo/um0H7wEasQLdKEHPasWt2slyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYD/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKIK43bH5kIxy50o
 Er03XvpDhpGa+eg1GG82GnwoN3xmnnkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ce3JyKjQeyeol2pKCmrZv19f43BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:bVzJ0Gwv3AM5+13s4lokBgUVH+saXV38zk3XAGPnUjx0cZ+LdwSfrfY=
X-Talos-MUID: 9a23:qJI4lghstTQHc2MIzjs64MMpBuV386ilVB82rohdguOfaQpCBTDHk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="59992451"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 4A4C6180007E2
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 80593CBF230; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 8/8] cups: Fix CVE-2026-107885
Date: Tue, 24 Nov 2026 00:40:33 -0800
Message-Id: <20261124084033.72286-9-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250975
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-107885 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/6c61d23f5523055ec4374465e85d1dec9396994f
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-hhw5-qqmc-p6rg

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fdf2f5db3b..13ac980f1b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -39,6 +39,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-107888.patch \
            file://CVE-2026-107890.patch \
            file://CVE-2026-107886.patch \
+           file://CVE-2026-107885.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107885.patch b/meta/recipes-extended/cups/cups/CVE-2026-107885.patch
new file mode 100644
index 0000000000..8bb9ba9a7c
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107885.patch
@@ -0,0 +1,99 @@
+From 7aaf72330a7c567ca3d8e8e4f4dc34395e6b1b7a Mon Sep 17 00:00:00 2001
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
+index a89f0b62c0..0bcf5507ae 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -15,6 +15,8 @@ Changes in CUPS v2.4.11 (2024-09-30)
+   submissions (GHSA-wjc4-qhjr-5m5x)
+ - SECURITY-2.3: The scheduler could crash when modifying a class
+   (GHSA-pwg4-pv39-8c22)
++- SECURITY-3.3: The scheduler did not protect against malicious clients that
++  held multiple open print jobs (GHSA-hhw5-qqmc-p6rg)
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index b3acd1660c..bf32b12474 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5243,7 +5243,7 @@ create_job(cupsd_client_t  *con,	/* I - Client connection */
+   if ((job = add_job(con, printer, NULL)) == NULL)
+     return;
+ 
+-  job->pending_timeout = 1;
++  job->pending_timeout = time(NULL) + MultipleOperationTimeout;
+ 
+  /*
+   * Save and log the job...
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 77e62a5af6..d1f8ca2608 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -291,17 +291,19 @@ cupsdCheckJobs(void)
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
+@@ -310,7 +312,9 @@ cupsdCheckJobs(void)
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
+index 619353d1bb..c401c5b848 100644
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
-- 
2.35.6

