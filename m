Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14036.1795509670257072477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Cj0Zoy9l;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2912; q=dns/txt;
  s=iport01; t=1795509670; x=1796719270;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rJWOZNf+Ap0xGfwZICsyVkO3olk2GmGEUD0wjRVnZog=;
  b=Cj0Zoy9l679dy2l111//39xCdeC8ZMs3fSHs3LwC1ORaTdEyoUDsXQFD
   OYtTVCyi8zEvxm4f3XDQxnSLUTrpO4RQsVdxWmW1gbS8erqlb2XcdGkuC
   VsgTc23k7RDPRDngGM224jADjfx2nj6WlBLcOXnoy8EyS9tFi8bq7wwCC
   Ap/xTPSUd9zFfpg4bCOgLb7Z2sLk4ggrUgxfINeP9TRhuTB0zHM/sOYo4
   gOfuAnW6VhnOwYDI1LsWnv40txfa+le0YZcd+mhgq3vTjRiDSEUsSZhIq
   ft3Zs9QGvlcJzjGt3RHfwJodAdJFDH5Hm5bbKI92PEUes80JvNz1hKV6H
   w==;
X-CSE-ConnectionGUID: uL2DfnvkT6qQzX0S6Ql5iA==
X-CSE-MsgGUID: 1eAqwMsCRcWW3tjrY8HMxQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgABTQVr/8pK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBVhwDAQIvKyMIGYMCAYJ0AgERuhwbN4IsgQGEf?=
 =?us-ascii?q?tszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYNqgQWBXAKBJxF1hXkEgiKBDIFUG?=
 =?us-ascii?q?AaMeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUFIMaexMBKgEggS1fkzcBB5I2oREKKIN5jCSVOhozhVulF?=
 =?us-ascii?q?wuYfY4KlWhphGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvAQEHAgcOA?=
 =?us-ascii?q?wuBaIRhix8BJ4FWAQE?=
IronPort-Data: A9a23:Zs7qS6/KLX/uGEcUzaSrDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WdODW3QOv3eZGCjfdl3Poi2oRwAvpHWydJmGVZlpHhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2krGdc09OBpAl0Q7
 MUKGGg2MCmH2uOflefTpulE3qzPLeHiMZlavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YOXWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCzaIOFJ4HbFK25mG7Bq
 0vf4EHiKSsRC+PE1TifwyKMo//2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:yEM+HawTzvUYbWlNb+fCKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:jm7XBm9rTAbcFGxdhCyVv1MwQOwrdGPe8CnJGl2IUV03cbnISHbFrQ==
X-Talos-MUID: 9a23:6AdKnwYJ1q6Ja+BT7jLFnS5HL+xS6JuRU1wPi6RWm+yUDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60185599"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id B5E5C3441A
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6938ACC2EF1; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/8] cups: Fix CVE-2026-55453
Date: Tue, 24 Nov 2026 00:40:26 -0800
Message-Id: <20261124084033.72286-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250976
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-55453 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/d41cf0616688721e9d435d54118c4c8a36ed596a
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-7hqf-mfhx-7r3v

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4c158aaee1..476d093fb2 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -32,6 +32,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
            file://CVE-2026-39316.patch \
+           file://CVE-2026-55453.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55453.patch b/meta/recipes-extended/cups/cups/CVE-2026-55453.patch
new file mode 100644
index 0000000000..9e899cc87c
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55453.patch
@@ -0,0 +1,52 @@
+From 87a30222512dea2bed50ea436d85b1126bf1ee72 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 14:45:48 -0400
+Subject: [PATCH] Sanitize IPP attribute strings.
+
+CVE: CVE-2026-55453
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/d41cf0616688721e9d435d54118c4c8a36ed596a]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md    | 1 +
+ backend/ipp.c | 8 +++++++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 7a5e8813fe..c8284c9b42 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -5,6 +5,7 @@ CHANGES - OpenPrinting CUPS
+ Changes in CUPS v2.4.11 (2024-09-30)
+ ------------------------------------
+ 
++- CVE-2026-NNNNN: The backend did not sanitize IPP attribute strings.
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/backend/ipp.c b/backend/ipp.c
+index 8609e3a283..e537bfb096 100644
+--- a/backend/ipp.c
++++ b/backend/ipp.c
+@@ -70,6 +70,7 @@ typedef struct _cups_monitor_s		/**** Monitoring data ****/
+ /*
+  * Globals...
+  */
++
+ #if defined(HAVE_GSSAPI) && defined(HAVE_XPC)
+ static pid_t		child_pid = 0;	/* Child process ID */
+ #endif /* HAVE_GSSAPI && HAVE_XPC */
+@@ -3099,7 +3100,12 @@ quote_string(const char *s,		/* I - String */
+         break;
+     }
+ 
+-    *qptr++ = *s++;
++    if ((*s & 255) < ' ' || *s == 127)
++      *qptr++ = ' ';
++    else
++      *qptr++ = *s;
++
++    s ++;
+   }
+ 
+   *qptr++ = '\"';
-- 
2.35.6

