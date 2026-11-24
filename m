Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13757.1795509645466385255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OvJAOz8T;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2985; q=dns/txt;
  s=iport01; t=1795509645; x=1796719245;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7ackpAPOh8z3727ANdwlHJMPdtQ5Dbk3X5cXbdu6umM=;
  b=OvJAOz8TUIEFubt7ExF7EnbbTVYsTnjGpKPl+MhVOK3MG1ttcNQ+FOjq
   gldj7NwCvZSOJ1zWSa84hMVDlD9YYZtwrCdlrnpB5cI4vzzkHDa8OlAz0
   j9yKeys6DltmvQZugm489lONidLZbeUviqxqvz8GHYsWYwgmnfXBZ0Hfr
   HC6tN+hXkTWcyCEflgyczBXmLnBLhAVBpcGm5V8X+jJGBjGyUK/Vps+cv
   LtT2MWxRZNpjekzMb3xuWK3VogJhZu3xGzs341foa95sg2FI2DVyX4QZy
   Kz33GiLO7LkUREY6Co3DDgmmZuVXcrlZCZCW1GK6PhbmigydFS6L4am6u
   Q==;
X-CSE-ConnectionGUID: QQ4jczFHSbGhrOUDOQqTSA==
X-CSE-MsgGUID: e+Ucs6LYTnCn7i4rxP5mKw==
X-IPAS-Result: =?us-ascii?q?A0BHAgCFTAVr/8pK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAVYcAwECLysjCBmDAgGCdAIBEbocGzeBeTOBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoEnEXWFeQSCInoSg?=
 =?us-ascii?q?VQYBox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxp7EwEqASBlDIEbkzcBkj2hEQoog3mMJJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqVaGmEaoFoPIFZcBWDIglKGQ+OLgsLg2CEB8pUIzULAy8BAQcCB?=
 =?us-ascii?q?w4DC4FohGGLHwEnBIFSAQE?=
IronPort-Data: A9a23:LUoWEqt74bloidM4r3bmpk3RRufnVAJfMUV32f8akzHdYApBsoF/q
 tZmKT3UbPiMZWqjcoh3btni9xsB7JLSnNE2QAVk+yE9FnkQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIww98rA2pc2
 9wjIh8NdDe+q8WP2Y6AY7w57igjBJGD0II3s3x6iDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYg1/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9JITWH5UNxBrwS
 mTu8ifECQpEEO2jzxGDrXPwnP/3wCbYR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:z8jaiqv+iPPzwgglK08AgR4k7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AgnOfQWu/AyUDC5+WugeWEWrR6IscSyHfx2X+A3S?=
 =?us-ascii?q?yJmZzb4C5bmaJxJhNxp8=3D?=
X-Talos-MUID: 9a23:05H2ogTizCNNbl+0RXThxwxpL5lM0pioI0ZSkMkcq/HZMA9vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60428024"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id BB9433441D
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6F6C3CBF222; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/8] cups: Fix CVE-2026-55480
Date: Tue, 24 Nov 2026 00:40:28 -0800
Message-Id: <20261124084033.72286-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250969
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-55480 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/98adfd855950e806508f961d5438ad32e26aac62
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-jj94-x3qh-ffp9

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index cd69eb3bb6..b6d047dc98 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -34,6 +34,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-39316.patch \
            file://CVE-2026-55453.patch \
            file://CVE-2026-55467.patch \
+           file://CVE-2026-55480.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-55480.patch b/meta/recipes-extended/cups/cups/CVE-2026-55480.patch
new file mode 100644
index 0000000000..21944e0f3c
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-55480.patch
@@ -0,0 +1,40 @@
+From c8d87e19a25b22c50e6678696d8c8cd7d07ef9d4 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Fri, 12 Jun 2026 16:15:56 -0400
+Subject: [PATCH] Open temporary PPD files more securely.
+
+CVE: CVE-2026-55480
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/98adfd855950e806508f961d5438ad32e26aac62]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      | 2 ++
+ scheduler/ipp.c | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 4e0de90191..030b00d839 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -7,6 +7,8 @@ Changes in CUPS v2.4.11 (2024-09-30)
+ 
+ - CVE-2026-NNNNN: The backend did not sanitize IPP attribute strings.
+ - CVE-2026-NNNNN: The scheduler did not sanitizer fax numbers.
++- CVE-2026-NNNNN: The scheduler did not open temporary PPD files in exclusive
++  mode.
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 7b9fd12817..1721845974 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -4472,7 +4472,7 @@ copy_model(cupsd_client_t *con,		/* I - Client connection */
+ 
+   snprintf(buffer, sizeof(buffer), "%s/daemon/cups-driverd", ServerBin);
+   snprintf(tempfile, sizeof(tempfile), "%s/%d.ppd", TempDir, con->number);
+-  if ((tempfd = open(tempfile, O_WRONLY | O_CREAT | O_TRUNC, 0600)) < 0)
++  if ((tempfd = open(tempfile, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL | O_NOFOLLOW, 0600)) < 0)
+     return (-1);
+   if (cupsdOpenPipe(temppipe))
+   {
-- 
2.35.6

