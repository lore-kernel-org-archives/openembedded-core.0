Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2175.1793955248651963828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bcTWrIr/;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4160; q=dns/txt;
  s=iport01; t=1793955249; x=1795164849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4IPuIPXUgvXyKrDQ8L4aT6Nvl7IoU2/wyoXnSdaWTmE=;
  b=bcTWrIr/7msQJQMj7eehbd398+jvnDBqpOI0Npz5gq1yBo5ai9WBx/SC
   OVjcYA/W4TOAkhwe2TXtoaNJQCYRHQLG3gUO2O+gNozWbS73RX/JSZr6l
   9Q0VWFN2gxzMYctrSx7a1AmhIFcvzoA482BZdLkkZkc7OnH9Eml+7KXKV
   bz88oLNZ34bwpmbSfqMIoOSFKCZmYvKMLawKVWQ5SG00O0z02cTzxV8r7
   chg4T/72KoU9eH7tzRHWDqspcHAME3OyWesCUCeMiS/jGCKGmMlOyaWU5
   St1LXsD+oElLC1Cu8eADd52IRWRROS1vf7zbgM4NI01o9xvgKrTSiniAb
   A==;
X-CSE-ConnectionGUID: MN89+SbqSRiW9NxypPjT2A==
X-CSE-MsgGUID: QFa+gox2RVCg/yT1Ho9IZw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmlO1q/4//Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZCYJ5AYJ0AxG8BoF5M4EBg?=
 =?us-ascii?q?mZDAT8CQ1DZS4FoAQsUAQWBM4VAModxXRgBhH0nG4FJRIJQgi6BBYFcAQGIJ?=
 =?us-ascii?q?gSDHBKBWh6MegKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5I9gxIBPFEBKgGCBDYDkwCQRIIhoRGEKoFoijyVOhozhVulFguYfY4Kl?=
 =?us-ascii?q?lGEaYFoPIFHCwczGggbFYMiCUoZD44uCwuDYIF/gxTGfSYyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:rQBQGKIaAx+tQabYFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENSgWECn
 WcWX2qGbvuLa2DwLYpzboiy80IDupbcmIUxSFcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1LKhFnfrYS491NAF4f0
 +wJMAgPUkqq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLo3hv+pmmH2WzZZs1mS46Ew5gA/ySQsjOS2YYqMIIPiqcN9p2iR5
 W3B7z7DPDoVc82jkBqCo1Oembqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:l6S75684mrAfbj1EwChuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:K+I+82H/UWMQ7bnEqmJC0h5FWfsva0bnzUiBBV+pEV5rdOe8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AkbQjGg6v7TVjUDxsfP6fDl8kxoxRza3tB0cdy68?=
 =?us-ascii?q?4kMbDJBApGzDMrQaoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544398127"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:07 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id A47301800025A;
	Fri,  6 Nov 2026 08:54:07 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 4FB23CBF231; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 05/10] sqlite3: fix CVE-2026-119379
Date: Fri,  6 Nov 2026 00:54:00 -0800
Message-Id: <20261106085405.3517095-5-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249618
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a buffer
overrun when applying a strategically corrupted changeset through
SQLite's session extension. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52
[2] https://sqlite.org/src/info/3f57024aecea0f3b

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119379

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 78 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 0000000000..19e36effc5
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,78 @@
+From 17e3b5a6f6c3a5e852a86597ad68f259d802296a Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Mon, 17 Aug 2026 11:31:59 +0000
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52]
+
+Backport Changes:
+- Applied the ext/session/sqlite3session.c fix to sqlite3.c because
+  the recipe source uses the amalgamated SQLite layout.
+- Omitted ext/session/sessioncorrupt.test because the extracted source
+  does not include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  metadata and are not required for this backport.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 52bd4aa19c..8cbe1d3ec7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -228425,9 +228425,9 @@ static int sessionChangesetApply(
+   int schemaMismatch = 0;
+   int rc = SQLITE_OK;             /* Return code */
+   const char *zTab = 0;           /* Name of current table */
+-  int nTab = 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
++  int bNew = 0;                   /* True for first entry of new table */
+ 
+   assert( xConflict!=0 );
+ 
+@@ -228443,15 +228443,16 @@ static int sessionChangesetApply(
+   if( rc==SQLITE_OK ){
+     rc = sqlite3_exec(db, "PRAGMA defer_foreign_keys = 1", 0, 0, 0);
+   }
+-  while( rc==SQLITE_OK && SQLITE_ROW==sqlite3changeset_next(pIter) ){
++  while( rc==SQLITE_OK && SQLITE_ROW==sessionChangesetNext(pIter, 0, 0,&bNew) ){
+     int nCol;
+     int op;
+     const char *zNew;
+ 
+     sqlite3changeset_op(pIter, &zNew, &nCol, &op, 0);
+ 
+-    if( zTab==0 || sqlite3_strnicmp(zNew, zTab, nTab+1) ){
++    if( bNew ){
+       u8 *abPK;
++      bNew = 0;
+ 
+       rc = sessionRetryConstraints(
+           db, pIter->bPatchset, zTab, &sApply, xConflict, pCtx
+@@ -228486,7 +228487,6 @@ static int sessionChangesetApply(
+           rc = SQLITE_NOMEM;
+           break;
+         }
+-        nTab = (int)strlen(zTab);
+         sApply.azCol = (const char **)zTab;
+       }else{
+         int nMinCol = 0;
+@@ -228538,7 +228538,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 = 0;
+           }
+         }
+-        nTab = sqlite3Strlen30(zTab);
+       }
+     }
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index db92177c08..e852ff79d8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119373.patch \
            file://CVE-2026-119374.patch \
            file://CVE-2026-119375.patch \
+           file://CVE-2026-119379.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

