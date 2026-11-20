Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3709.1795172267676421292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LUR8i7Tr;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3116; q=dns/txt;
  s=iport01; t=1795172268; x=1796381868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9xZTDL7rNGetVr1uJNtkAexeUiaPwp1rzouCk5jlZQU=;
  b=LUR8i7Tr4gJvaWW5SHE+MsJzj8bYf92YgZBRGlCakweeIX5Wj0PJ1Fpq
   xxB8OBcxbglLcZdOzhNBo6Z4UMg7SWSx63Lun0hDun2ezYs07x/VLyjnM
   JBFAOcFOxLdrnhgn1dxlbGJtamm4JRjBu3FzHMnu+glBsAd+LTZ3hs+4t
   yMhWCLIW9uLUnDgBV+CXYjgbU/4+tngp4UmsiZ7fQDQC4wAai9Avwg0mo
   ZCrT/ragLtj0NndCAI4tsqXMfF9qEVGce1gpeixSti8OlC4A4T7ROY3YQ
   jKHmRM860C+h3nkd+Mzj1ZDRysG+1XXdwtkhyShIp9JIh429VA8FxknyN
   A==;
X-CSE-ConnectionGUID: 68F5w9mKT2ux5o+5NH+JSQ==
X-CSE-MsgGUID: er1mL1bnT3WGItjxTtziPw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDlJgBr/8tK/pBaglmCV3VhQkkDlkgDnimBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOIQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwFGEBwDAQIvKyMIGYMCAYJ0AgERuCwbN4F5M4EBh?=
 =?us-ascii?q?H7bMwELFAEFgTOFQogkXRgBhH0nGxuBcoEVg2qBBYFcAogmBIIigQyBVBgGj?=
 =?us-ascii?q?HkCgU+IJkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGDRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5NsgwkJBwEsYQErIIFFRxySbzSSNoE1n1wKKIN5jCSVOhozhVulF?=
 =?us-ascii?q?wuYfY4KlWNuhGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvAQEHAgcOA?=
 =?us-ascii?q?wuBaJAALIFSAQE?=
IronPort-Data: A9a23:g5i3pKiK3L7WGE6BTM4ojcqAX161NBEKZh0ujC45NGQN5FlHY01je
 htvUW7Ua/ePZGTzL4gnbornoxgCsZWGnd8yTlFprnswRS1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVGqsgqHjBL1
 sBCNSBQaVPeocL14omCH7wEasQLdKEHPasWt2slyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXYT/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKIK4zWHZoLxS50o
 ErL5T38JkgQMuDE9hWk7nC8uvPdnBvkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:I3lvc6MYkYqRPMBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:2FiwrW0PxDe6W5d6w+glbLxfRJALL2KMyVTseVKoVGEqFZu1Cn2rwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AgcWOFg3+JQBZmMMNXup9AIURfzUj7r73DWRUm5M?=
 =?us-ascii?q?64ParFDByKwuBnjWPXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59840763"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:46 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id A1A801800017B;
	Fri, 20 Nov 2026 10:57:46 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id CF0E3CBF224; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 5/8] cups: Fix CVE-2026-107888
Date: Fri, 20 Nov 2026 02:57:17 -0800
Message-Id: <20261120105720.2197092-6-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261120105720.2197092-1-asparmar@cisco.com>
References: <20261120105720.2197092-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250766
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/c5fc041ca0a211f8e69854907be7b55f56955659
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-qqm8-4q5h-jg55

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index dad2ce88ba..2b63c448c6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55467.patch \
            file://CVE-2026-55480.patch \
            file://CVE-2026-61702.patch \
+           file://CVE-2026-107888.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107888.patch b/meta/recipes-extended/cups/cups/CVE-2026-107888.patch
new file mode 100644
index 0000000000..226839fdc9
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107888.patch
@@ -0,0 +1,64 @@
+From 6cb1f8abb2b46285db7b4c2cf683ac05fb35ec0c Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Thu, 1 Oct 2026 17:05:55 -0400
+Subject: [PATCH] Abort held jobs if the destination has gone away
+ (GHSA-qqm8-4q5h-jg55)
+
+CVE: CVE-2026-107888
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/c5fc041ca0a211f8e69854907be7b55f56955659]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ scheduler/job.c | 20 ++++++++++++++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 47b394be..cbea543e 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -5,6 +5,8 @@ CHANGES - OpenPrinting CUPS
+ Changes in CUPS v2.4.16 (2025-12-04)
+ ------------------------------------
+ 
++- SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
++  (GHSA-qqm8-4q5h-jg55)
+ - CVE-2026-27447: The scheduler treated local user and group names as case-
+   insensitive.
+ - Fixed cupsd crash if user does not exist (Issue #1555)
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 183c76fa..b688c342 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -328,12 +328,24 @@ cupsdCheckJobs(void)
+       * Check whether the printer is still holding new jobs...
+       */
+ 
+-      printer = cupsdFindDest(job->dest);
++      if ((printer = cupsdFindDest(job->dest)) == NULL)
++      {
++       /*
++        * Whoa, the printer and/or class for this destination went away;
++	* cancel the job...
++	*/
+ 
+-      if (printer->holding_new_jobs)
++        cupsdSetJobState(job, IPP_JSTATE_ABORTED, CUPSD_JOB_PURGE, "Job aborted because the destination printer/class has gone away.");
+         continue;
+-
+-      ippSetString(job->attrs, &job->reasons, 0, "none");
++      }
++      else if (printer->holding_new_jobs)
++      {
++        continue;
++      }
++      else
++      {
++        ippSetString(job->attrs, &job->reasons, 0, "none");
++      }
+     }
+ 
+    /*
+-- 
+2.35.6
+
-- 
2.35.6

