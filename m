Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3243.1794374735250697674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aKaa6iOs;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4189; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OJu5z3OqhAxaExsyR9qa9XVo5jUSO5xTc6URp1YSQbQ=;
  b=aKaa6iOsQmx39ikA2dPJ3AcecN7HbkySui29eJwem7Yos6H7dtfnmolg
   5QYGNEv6fypQrPITt223ItNIzY9d3015O4trKegllw02C56htnxwUKFIi
   VXpPyKFPgzEyINXlMfogGUeLRZHi/VbeDYO8CBzGOpcOMLF6CsXDOJjGv
   OY8rhdVUlZ4KE3dmpqhWhAQOsFTXziZyOXYqtZyb8DrakQhu8vrIiu3yS
   Says9fjul4lUI7vPl3SGWf8hQ49T6eP8Fb5QqzhrjoIbcQa7n9zK8Om6L
   GYNZ0YhreeEA9qhV5X16py6aPFlsotJkTdy0DUJFGkYUmLZUu2GTe13Cf
   A==;
X-CSE-ConnectionGUID: xmlWm2LLRuOR202xDdBcAQ==
X-CSE-MsgGUID: 9ZwKf1nYRmu+8yPQneYitQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgAG+/Nq/4v/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iKBfg8BAQEPRA0EAQGEP0YCjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG5V?=
 =?us-ascii?q?oF5M4EBgmZDAT8CQ1DZS4FoAQsUAQWBM4VCModyXRgBhH0nG4FJRIJQgi6BB?=
 =?us-ascii?q?YFcAQGIJgSDHBKBWo0aAoFPhyVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHIEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hkm6DFQE8HDUBK4IENgOTAJBEgiGhEYQqgWiKPJU6GjOFW6UXC?=
 =?us-ascii?q?5h9jgqWUYRqgWg8gUcLBzMaCBsVgyIJShkPji4LC4NggX+DFMlIJjICCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:q2gI4axuqSNRnBc29gB6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 GtKXW/TMvfZZzPwe9pwb43n90IBvcfXzdVqSVdopVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaztMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFEzObIdoMJTO3xpz
 6ZAciAhYjqIrtvjldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tO6ynnjjazRwo1OOrq1x6G/WpOB0+OWxbYqFKoLXG625mG7Jl
 H3l8T3/MysfKZ/P2AK89H+dh/P2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:sKUndKzw68AJsFTsREKMKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3Ah+Qjk2p0MdrCVi0WJkm61TrmUdAgdkLYllP0GVK?=
 =?us-ascii?q?fMzwxEq25RXWb0Zoxxg=3D=3D?=
X-Talos-MUID: 9a23:Mehm8gvY5EPxALNsWM2n1QN9F8kx5ZWUDV1OwYQ+gs+JBC1sAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="545888656"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 1B38E18000203;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id B3CCFCBF231; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 05/10] sqlite3: fix CVE-2026-119379
Date: Tue, 10 Nov 2026 21:25:27 -0800
Message-Id: <20261111052532.1258975-5-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249944
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
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 79 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 0000000000..1fad466b3d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,79 @@
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
+index 04f4eea..39b300c 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -239370,10 +239370,10 @@ static int sessionChangesetApply(
+   int schemaMismatch = 0;
+   int rc = SQLITE_OK;             /* Return code */
+   const char *zTab = 0;           /* Name of current table */
+-  int nTab = 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
+   u64 savedFlag = db->flags & SQLITE_FkNoAction;
++  int bNew = 0;                   /* True for first entry of new table */
+ 
+   assert( xConflict!=0 );
+ 
+@@ -239395,15 +239395,16 @@ static int sessionChangesetApply(
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
+@@ -239438,7 +239439,6 @@ static int sessionChangesetApply(
+           rc = SQLITE_NOMEM;
+           break;
+         }
+-        nTab = (int)strlen(zTab);
+         sApply.azCol = (const char **)zTab;
+       }else{
+         int nMinCol = 0;
+@@ -239491,7 +239491,6 @@ static int sessionChangesetApply(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 29187e75b4..2a0517efe6 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
+	file://CVE-2026-119379.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

