Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14021.1795509646710928550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PVyv975M;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3951; q=dns/txt;
  s=iport01; t=1795509646; x=1796719246;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WjXTREE2O8CkC9u9i/AwmWdp9ndPjDR/zil8V4uJiq4=;
  b=PVyv975MLltLqR9LP6BnrUlujb2iwG8KVY8elhtjklDbxOK2MvAxLe/I
   eULxuDHdYRju0Isc/NZVwBioKq/hspkbq8m1/erZJhb8vG2SWMGzIj1vC
   RoTfBxzJeI65ZGjiD44E7Q8Tt88iEyZrHN1ED0AR/Tet+BV3QBI7aHxrp
   /HOYptLqhKbDl/yIrW0pAycP5AgmvQLplYaiO9+xGt2hDKol2Ue143wIS
   BIZpxtCh70tZxXLZNQ1kEpHzxbEziMrducEjPzJe2wWyMaVUyKszaro02
   3+pWQRYVoE4pWq4CyVWUeDBbWskzxTWKniQaQ7LtzHJ0/nz2kpAxSZNUt
   w==;
X-CSE-ConnectionGUID: AGUc50/BRCKd5lhPQ+gFrw==
X-CSE-MsgGUID: AEdw/Y6UQLiRdnmof2YsLQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgCTSwVr/8xK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBVhwDAQIvKyMIGYMCAYJ0AgERuhkbN4IsgQGEf?=
 =?us-ascii?q?tszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYNqgQWBXAKBOIZuBIIigQyBVBgGj?=
 =?us-ascii?q?HkCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HlBSDGlYlEwEqASCCDJM3AQeSNqERCiiDeYwklToaM4VbpRcLm?=
 =?us-ascii?q?H2OCpVoaYRqgWg8gVlwFYMiCUoZD44uCwuDYIQHylQjNQsDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiEYYsggX0BAQ?=
IronPort-Data: A9a23:E0yJyaDfhtiGWRVW/33iw5YqxClBgxIJ4kV8jS/XYbTApGtwgjwPx
 mMYXjuOaPeKZ2SjeYskO4jioR4HsJGDyoRmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6tpTBxxueqci0cV7XGVOz
 cVbJx4XcUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4lnfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWYHgBfoO3WjPn8eE4o3huKhnFH0ciZTrxSeoq9fD237klYugOO9YYS9ltqibOhZgQGp+
 F//22XDDhcfM9LF+CGhyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnWjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:bMwUGaoKkLdvvQ2xNDAJxn4aV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:ZqYVgmBjl1qJ9rv6EwBIyUVJQocPSFb+wCrUI3eBSmlHUqLAHA==
X-Talos-MUID: 9a23:WornZAhC/dSJcG192fBaCsMpHepk/OOfVn00tZQ8t8+BMiIqCiy5tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62783896"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id BE4B418000206
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6B5A1CBF221; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/8] cups: Fix CVE-2026-55467
Date: Tue, 24 Nov 2026 00:40:27 -0800
Message-Id: <20261124084033.72286-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250972
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-55467 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/0cf4e7814d6810ed3c454222bce3aa342d541681
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-69qc-prxg-h2c7

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 476d093fb2..cd69eb3bb6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -33,6 +33,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-39314.patch \
            file://CVE-2026-39316.patch \
            file://CVE-2026-55453.patch \
+           file://CVE-2026-55467.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55467.patch b/meta/recipes-extended/cups/cups/CVE-2026-55467.patch
new file mode 100644
index 0000000000..8c17c07484
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55467.patch
@@ -0,0 +1,70 @@
+From b5e074cee7d633233447cec7e9ced16dce66733d Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 15:43:22 -0400
+Subject: [PATCH] Sanitizer destination-uri and pre-dial-string values.
+
+CVE: CVE-2026-55467
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/0cf4e7814d6810ed3c454222bce3aa342d541681]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      |  1 +
+ scheduler/job.c | 29 +++++++++++++++++++++++++++--
+ 2 files changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index c8284c9b42..4e0de90191 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -6,6 +6,7 @@ Changes in CUPS v2.4.11 (2024-09-30)
+ ------------------------------------
+ 
+ - CVE-2026-NNNNN: The backend did not sanitize IPP attribute strings.
++- CVE-2026-NNNNN: The scheduler did not sanitizer fax numbers.
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/job.c b/scheduler/job.c
+index ea6aa2692a..f746fb0e02 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -3904,12 +3904,37 @@ get_options(cupsd_job_t *job,		/* I - Job */
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
-- 
2.35.6

