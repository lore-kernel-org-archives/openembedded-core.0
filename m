Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27942.1793856564904204218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jeB59aiA;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3524; q=dns/txt;
  s=iport01; t=1793856564; x=1795066164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4DtXjU2rmr0l0rBU5K/rTh/Yq7edLkP0pvl+VcNGwW4=;
  b=jeB59aiAYzS/IOw/JctKoRGk3RSS73uT8XiuqqUlgTcCMNVJVL4TZARd
   POw86OasrgY1kt0NA0y4WS0pvhtpXNmDeed9MWoH15u6weSfRtdJoZiNR
   0StFKYaxoaFLQ2RRINgqIQwxPVa5yIpCg1IYH/nbaCJhig9bLs8qVtOIl
   wrYF/GabcluXcV/mv1cGNoRLAqL1SeyazZaIuCz+1Ur5l/G6o0D3lESmo
   MY0uASEnlNIHU8gQKxw0NQogxSedy9pByYrnFhjsvLOIjVb2GLA82lBX6
   oSqqhsp75A4CUH4aLj4bk633COCuQZYKeXyqp1M3IHhvVc8iwi2FP7KPm
   A==;
X-CSE-ConnectionGUID: 9XIue9ntROWlv2TP2lQUfg==
X-CSE-MsgGUID: FmwGqEzrSMmaFBfjU/HcXw==
X-IPAS-Result: =?us-ascii?q?A0AaAAAGE+xq/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWZ4kgX4PAQEBD0QNBAEBhD9Gjh8CJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECW?=
 =?us-ascii?q?iMhgwIBgnQDEbw/gXkzgQGDKQE/AkNQ2UuBaAELFAEFgTMBhT8yh3FdGAGEf?=
 =?us-ascii?q?ScbgUlEhH6BBYFcAQGIJgSDLoFajRgCgVKGcEiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJ?=
 =?us-ascii?q?kAbChgYDUgRLDcVGQQ+bgeSL4MKBwGBDQETGIEFQHiTAJBEgiGhEYQqgWiKP?=
 =?us-ascii?q?JU6GjOFW6UWC5h9jgqWUYRpgWg8gUcLBzMaCBsVgyIJShkPjisDCwuDYIF/g?=
 =?us-ascii?q?xTJSCYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:ynLt+69BjzBFfL8f26d5DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEbWjjXb6mJYjekcoh2aYXi9EgPvpPRyYdnTQVlrStEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnDawF97dxHVtpy
 vgGcgw1NBS6uuy5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Yn1lQ/UPrSmM+hnGH+byVRgFmUvqEwpWPUyWSd1ZCwbIaPJ4DUFJU9ckCwi
 GfZ0H3UEAshEdmW5xCL8E/rpuT/gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:cpe2tKswKSbhVg+0D2v5MPCN7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AgRbCTmkNcgrewnxzshiIqoeBdzfXOSzt7Wrdckm?=
 =?us-ascii?q?kM0FWTKPPdWfK/JpZncU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ao79UqgwxbjOn4HJODS+0IFMnveyaqIqrF28UvIc?=
 =?us-ascii?q?cgOyBPAJaNTWgyxS8cpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544254698"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:29:23 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id B0FAB1800024F;
	Thu,  5 Nov 2026 05:29:23 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 5F42BCC2EF1; Wed,  4 Nov 2026 21:29:23 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 06/10] sqlite3: fix CVE-2026-119372
Date: Wed,  4 Nov 2026 21:29:22 -0800
Message-Id: <20261105052922.2447352-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249430
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a use-after-free
in FTS3 snippet() processing. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/a87bd2471a9c0606e78d3c3678bcd9cecaa0e731
[2] https://sqlite.org/src/info/e4635c41536a

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119372

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119372.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 0000000000..c05000cb49
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
@@ -0,0 +1,56 @@
+From 52acd34ba6d51393d9f714b3e0c5ae7d805ddeae Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Mon, 17 Aug 2026 13:55:38 +0000
+Subject: [PATCH] Avoid a problem causing a use-after-free in the fts3
+ snippet() function. Report [bugs:/info/2026-08-17T09:18:24Z |
+ 2026-08-17T09:18:24Z].
+
+FossilOrigin-Name: e4635c41536a0b3620780c3f1c872de33121370bafb608fce9fe7e3113e2ae01
+
+CVE: CVE-2026-119372
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/a87bd2471a9c0606e78d3c3678bcd9cecaa0e731]
+
+Backport Changes:
+- Applied the ext/fts3/fts3_snippet.c fix to sqlite3.c because the
+  recipe source uses the amalgamated SQLite layout.
+- Omitted test/fts3snippet2.test because the extracted source does not
+  include the upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 83a018d3fc..cbad7b2ae5 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -208133,6 +208133,7 @@ static int fts3BestSnippet(
+   sqlite3_int64 nByte;            /* Number of bytes of space to allocate */
+   int iBestScore = -1;            /* Best snippet score found so far */
+   int i;                          /* Loop counter */
++  Fts3Expr *pExpr = pCsr->pExpr;
+ 
+   memset(&sIter, 0, sizeof(sIter));
+ 
+@@ -208161,9 +208162,12 @@ static int fts3BestSnippet(
+   sIter.nSnippet = nSnippet;
+   sIter.nPhrase = nList;
+   sIter.iCurrent = -1;
+-  rc = sqlite3Fts3ExprIterate(
+-      pCsr->pExpr, fts3SnippetFindPositions, (void*)&sIter
+-  );
++  rc = sqlite3Fts3ExprIterate(pExpr, fts3SnippetFindPositions, (void*)&sIter);
++  if( rc==SQLITE_OK ){
++    /* Iterate through the expression twice, in case pointers garnered during
++    ** the first iteration are invalidated by a call to fts5EvalRestart(). */
++    rc = sqlite3Fts3ExprIterate(pExpr, fts3SnippetFindPositions, (void*)&sIter);
++  }
+   if( rc==SQLITE_OK ){
+ 
+     /* Set the *pmSeen output variable. */
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 9dd182b168..c6a19525fa 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -17,4 +17,5 @@ SRC_URI += "\
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
+	file://CVE-2026-119372.patch \
 "
-- 
2.35.6

