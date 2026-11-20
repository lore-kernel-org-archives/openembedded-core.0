Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3635.1795172268930565108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=S7Bji0ze;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3396; q=dns/txt;
  s=iport01; t=1795172269; x=1796381869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kEeQNIiuRNWYOyihmCrQAxKJVaNoJenIpq9pIVBMHtc=;
  b=S7Bji0zeZ8CVJLuofWSImBeTGsfrG7RpJ9pVybXJ9BVyukTaC/r83zd/
   gN2heTJcRJi1ppw76T9DPRdi1tSCRR3MZE7/SJo6BqBoNpkdawzIA281Q
   g/qe7uwARuzTuUHl0MiwwqaYkDQrMoiWsaok2SCOpfyiBkpZy06ywaZoR
   KGgo98DsTUyNFePXymG8RgwDYV0zQO8xk89gPjQlEnHuTx+sqiUlEs+1K
   Lzb717fxHFZqPiIaV+ztI1WPbao1POt+o58+dijt3wdY51M0WZGDfRZd+
   OWJHscNUq6PBhMZbd/dEMyGzH438EsoBXjFfASMAjUobmYIDEy8pwJsiH
   w==;
X-CSE-ConnectionGUID: cKmg2d4kTbu8WPFPOkFLNQ==
X-CSE-MsgGUID: IwrGS7AGTFi25Cfdhl0wYg==
X-IPAS-Result: =?us-ascii?q?A0BHAgDlJgBr/8tK/pBaglmCV3VhQkkDlkueKYEbA2APA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjiECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDMgFGEBwDAQIvKyMIGYMCAYJ0AgERuCwbN4IsgQGEf?=
 =?us-ascii?q?tszAQsUAQWBM4VCiCRdGAGEfScbG4FygRWDaoEFgVwCiCYEgiKBDIFUGAaMe?=
 =?us-ascii?q?QKBT4gmSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESg?=
 =?us-ascii?q?QNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYNGA1IESw3F?=
 =?us-ascii?q?RkEPm4Hk2yDGVY4LIIspXWhEQoog3mMJJU6GjOFW6UXC5h9jgqWUYRqgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD445g2uEB8pUIzULAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:0tMvJq4P95C92i6ISC2uogxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 jBNUTzTa/aMMTb2e4ogb422/E4Fv5KEnN9kG1M/rS02Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOs/vawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eNq4d9bx7XWJy/
 +FIFwgjVjeAqcaQ+efuIgVsrpxLwMjDNY4F/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0Yn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FbYuFJoTVGJQ9ckCwh
 33c0F+mKz4mGt3FlBGL/nKo3vD+knauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:xedr86EPuILIrreypLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:2gsqq2zyvGU+pF3wvlfvBgUfOcUqKHGBz0vaPh+HMUhRb767bXmprfY=
X-Talos-MUID: 9a23:eRApIAtRkL8S8gjEJ82npS54G/w3youSJkFXzL4It8mAbTNBNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59840759"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:45 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 1B9331800017B;
	Fri, 20 Nov 2026 10:57:45 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C31E0CBF221; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 2/8] cups: Fix CVE-2026-55467
Date: Fri, 20 Nov 2026 02:57:14 -0800
Message-Id: <20261120105720.2197092-3-asparmar@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250769
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix referenced in [2], using the commit
shown in [1].

[1] https://github.com/OpenPrinting/cups/commit/0cf4e7814d6810ed3c454222bce3aa342d541681
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-69qc-prxg-h2c7

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c635e95015..65db905563 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -26,6 +26,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
            file://CVE-2026-55453.patch \
+           file://CVE-2026-55467.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55467.patch b/meta/recipes-extended/cups/cups/CVE-2026-55467.patch
new file mode 100644
index 0000000000..834a910c2b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55467.patch
@@ -0,0 +1,63 @@
+From ae60aee636ef12192e42a22d6ba44330a3aa5120 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 15:43:22 -0400
+Subject: [PATCH] Sanitizer destination-uri and pre-dial-string values.
+
+CVE: CVE-2026-55467
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0cf4e7814d6810ed3c454222bce3aa342d541681]
+
+Backport Changes:
+- Omit the CHANGES.md release-note hunk for the newer upstream release.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ scheduler/job.c | 29 +++++++++++++++++++++++++++--
+ 1 file changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 2ef56c41..183c76fa 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -3901,12 +3901,37 @@ get_options(cupsd_job_t *job,		/* I - Job */
+     ipp_t *ipp = ippGetCollection(attr, 0);	// Collection value
+     const char *destination_uri = ippGetString(ippFindAttribute(ipp, "destination-uri", IPP_TAG_URI), 0, NULL);
+     const char *pre_dial_string = ippGetString(ippFindAttribute(ipp, "pre-dial-string", IPP_TAG_TEXT), 0, NULL);
++    char buffer[256], *bufptr;		// Sanitized value
+ 
+     if (destination_uri && !strncmp(destination_uri, "tel:", 4))
+-      num_pwgppds = cupsAddOption("phone", destination_uri + 4, num_pwgppds, &pwgppds);
++    {
++      for (destination_uri += 4, bufptr = buffer; *destination_uri && bufptr < (buffer + sizeof(buffer) - 1); destination_uri ++)
++      {
++        if ((*destination_uri & 255) < ' ' || *destination_uri == 127)
++          *bufptr++ = ' ';
++	else
++	  *bufptr++ = *destination_uri;
++      }
++
++      *bufptr = '\0';
++
++      num_pwgppds = cupsAddOption("phone", buffer, num_pwgppds, &pwgppds);
++    }
+ 
+     if (pre_dial_string)
+-      num_pwgppds = cupsAddOption("faxPrefix", pre_dial_string, num_pwgppds, &pwgppds);
++    {
++      for (bufptr = buffer; *pre_dial_string && bufptr < (buffer + sizeof(buffer) - 1); pre_dial_string ++)
++      {
++        if ((*pre_dial_string & 255) < ' ' || *pre_dial_string == 127)
++          *bufptr++ = ' ';
++	else
++	  *bufptr++ = *pre_dial_string;
++      }
++
++      *bufptr = '\0';
++
++      num_pwgppds = cupsAddOption("faxPrefix", buffer, num_pwgppds, &pwgppds);
++    }
+   }
+ 
+  /*
+-- 
+2.35.6
+
-- 
2.35.6

