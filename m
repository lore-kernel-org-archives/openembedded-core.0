Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27959.1793856648780669959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TvzVR0Ew;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10796; q=dns/txt;
  s=iport01; t=1793856648; x=1795066248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z42Y8LK2/7QvEuvfnK6xAAzuzr+8mttiGVAJ9m1ReKc=;
  b=TvzVR0EwbAhOP9HNHVo+aSPJ0QuGW9svNoECcCgvDWGF2Ti1zCvRzQKa
   6KQ0vGo2ZW81+MOTBv2foDT/3+Pj1ziTP4TF0//oWD1KNzh8+YYc7THQF
   fupKtY+eovA/9iB2mdEHpkvLWUnKBtzVW8l+vclXvwVhrzR0YaZuUPUFQ
   2t+KISFU3vIFfGgnBHo5h9leNdhybmeczdaCpqCA/YuL58UGkAqM64usl
   x5LgULQK5NlVni4HIvVEOQDlBRJgzFqPbgRhr2KrPVRZS0xcaArHf1XRL
   IxD8N71xkjum25e4VrLY2cMxklBp1ebjyTUn/YkSuwMzbR+nr2s7EXcmU
   Q==;
X-CSE-ConnectionGUID: 9OX2Q4kbQMKXE2cGL+SOmw==
X-CSE-MsgGUID: Vs7Rfc2OSFOI9s+K8+3htA==
X-IPAS-Result: =?us-ascii?q?A0AaAAAGE+xq/5H/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWZMjiwGBfg8BAQEPRA0EAQGEP0aOHwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDA?=
 =?us-ascii?q?QJaIyGDAgGCdAMRvD+BeTOBAYJmQwE/AkNQ2UuBaAELFAEFgTMBhT8yh3FdG?=
 =?us-ascii?q?AGEfScbgUlEhH6BBYFcAQGBOIZuBIMugVqBA4wVAoFShnBIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5E?=
 =?us-ascii?q?DAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hki+DEQE8PhMBJQaBBT56K5MDkBaCI?=
 =?us-ascii?q?aERhCqBaIo8lToaM4VbpRYLmH2OCpZRhGmBaDyBRwsHMxoIGxU7gmcJShkPj?=
 =?us-ascii?q?isDCwuDYIF/gxTJSCYyAgkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:9qv2SaMbowB/klLvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUp03mdVm
 GpKCD+HaKmPajGne48nPIixpENUvZ/TmN9iSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66RJPBsPYY4Sw8NUMUwU/
 tM8awsqaw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMXwsYDUXUrsTIJskhOa0nnDXeDxDo1XTrq0yi4TW5FEtjOKwbYqNJLRmQ+1rhRmiq
 Gmc2F/XJTBLL5+8mXne8m6F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:SjGsLKBkvHrgKeDlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3Aq4K2smlzgflQGrBLQbkZuauecp3XOSz6/C3pf0y?=
 =?us-ascii?q?yMENKeJDPQnC0u5hDltU7zg=3D=3D?=
X-Talos-MUID: 9a23:ff2p1giFgewFvM75leh/JMMpCtw32aqlUmc2v7In6tLHFnwzYDeBpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544255806"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:30:47 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id BAFAF18000440;
	Thu,  5 Nov 2026 05:30:47 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 685A1CC2EF1; Wed,  4 Nov 2026 21:30:47 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 09/10] sqlite3: fix CVE-2026-119371
Date: Wed,  4 Nov 2026 21:30:46 -0800
Message-Id: <20261105053046.2449268-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249433
Content-Type: text/plain; charset="utf-8"

This patch series applies the upstream prerequisite [1] and CTE recursion
fix [3]. Commit [1] adds VIEW and subquery nesting tracking; commit [3]
uses that counter to limit recursive CTE depth. The GitHub commits [1]
and [3] correspond to SQLite Fossil check-ins [2] and [4], respectively.

[1] https://github.com/sqlite/sqlite/commit/9fb225190c3ac0e51f11a7fddab0d4cc960417ad
[2] https://sqlite.org/src/info/3f3fb9b638f59ad9
[3] https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb
[4] https://sqlite.org/src/info/f54730871303e655

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119371

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite3/CVE-2026-119371-dependent.patch   | 109 ++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 +++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |   2 +
 3 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
new file mode 100644
index 0000000000..21fed4b6f8
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
@@ -0,0 +1,109 @@
+From 15fc374428c9fa554b25e8f51ebb9b3d38107a00 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Tue, 16 Jun 2026 13:43:08 +0000
+Subject: [PATCH] Limit VIEW recursion depth to SQLITE_LIMIT_EXPR_DEPTH to
+ prevent static overflow in malicious schemas with tens of thousands of levels
+ of recursive views. [bugs:/info/2026-06-16T04:21:51Z|Bug
+ 2026-06-16T04:21:51Z]
+
+FossilOrigin-Name: 3f3fb9b638f59ad982beafb7c117f24ddd3da612e62c862510805fa672ffae06
+
+CVE: CVE-2026-119371
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/9fb225190c3ac0e51f11a7fddab0d4cc960417ad]
+
+Backport Changes:
+- Ported src/select.c and src/sqliteInt.h code into the amalgamated
+  sqlite3.c source file.
+- Updated limit documentation in sqlite3.c and sqlite3.h.
+- Omitted test/view.test because the extracted source lacks the upstream
+  test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 16 ++++++++++++++--
+ sqlite3.h |  6 ++++--
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 603ca28a27..87c568b41e 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -4655,7 +4655,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** or in an ORDER BY or GROUP BY clause.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_EXPR_DEPTH]] ^(<dt>SQLITE_LIMIT_EXPR_DEPTH</dt>
+-** <dd>The maximum depth of the parse tree on any expression.</dd>)^
++** <dd>The maximum depth of the parse tree on any expression and
++** the maximum nesting depth for subqueries and VIEWs</dd>)^
+ **
+ ** [[SQLITE_LIMIT_COMPOUND_SELECT]] ^(<dt>SQLITE_LIMIT_COMPOUND_SELECT</dt>
+ ** <dd>The maximum number of terms in a compound SELECT statement.</dd>)^
+@@ -4682,7 +4683,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** <dd>The maximum index number of any [parameter] in an SQL statement.)^
+ **
+ ** [[SQLITE_LIMIT_TRIGGER_DEPTH]] ^(<dt>SQLITE_LIMIT_TRIGGER_DEPTH</dt>
+-** <dd>The maximum depth of recursion for triggers.</dd>)^
++** <dd>The maximum depth of recursion for triggers, and the maximum
++** nesting depth for separate triggers.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_WORKER_THREADS]] ^(<dt>SQLITE_LIMIT_WORKER_THREADS</dt>
+ ** <dd>The maximum number of auxiliary worker threads that a single
+@@ -20531,6 +20533,7 @@ struct Parse {
+   int szOpAlloc;       /* Bytes of memory space allocated for Vdbe.aOp[] */
+   int iSelfTab;        /* Table associated with an index on expr, or negative
+                        ** of the base register during check-constraint eval */
++  int nNestSel;        /* Number of nested SELECT statements and/or VIEWs */
+   int nLabel;          /* The *negative* of the number of labels used */
+   int nLabelAlloc;     /* Number of slots in aLabel */
+   int *aLabel;         /* Space to hold the labels */
+@@ -149283,6 +149286,13 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+   sqlite3 *db = pParse->db;
+   u64 savedFlags;
+ 
++  pParse->nNestSel++;
++#if SQLITE_MAX_EXPR_DEPTH>0
++  if( pParse->nNestSel >= db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
++    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
++    return 0;
++  }
++#endif
+   savedFlags = db->flags;
+   db->flags &= ~(u64)SQLITE_FullColNames;
+   db->flags |= SQLITE_ShortColNames;
+@@ -149304,6 +149314,8 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+     sqlite3DeleteTable(db, pTab);
+     return 0;
+   }
++  pParse->nNestSel--;
++  assert( pParse->nNestSel>=0 );
+   return pTab;
+ }
+ 
+diff --git a/sqlite3.h b/sqlite3.h
+index 302f0f5b16..b34982a3e5 100644
+--- a/sqlite3.h
++++ b/sqlite3.h
+@@ -4334,7 +4334,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** or in an ORDER BY or GROUP BY clause.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_EXPR_DEPTH]] ^(<dt>SQLITE_LIMIT_EXPR_DEPTH</dt>
+-** <dd>The maximum depth of the parse tree on any expression.</dd>)^
++** <dd>The maximum depth of the parse tree on any expression and
++** the maximum nesting depth for subqueries and VIEWs</dd>)^
+ **
+ ** [[SQLITE_LIMIT_COMPOUND_SELECT]] ^(<dt>SQLITE_LIMIT_COMPOUND_SELECT</dt>
+ ** <dd>The maximum number of terms in a compound SELECT statement.</dd>)^
+@@ -4361,7 +4362,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** <dd>The maximum index number of any [parameter] in an SQL statement.)^
+ **
+ ** [[SQLITE_LIMIT_TRIGGER_DEPTH]] ^(<dt>SQLITE_LIMIT_TRIGGER_DEPTH</dt>
+-** <dd>The maximum depth of recursion for triggers.</dd>)^
++** <dd>The maximum depth of recursion for triggers, and the maximum
++** nesting depth for separate triggers.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_WORKER_THREADS]] ^(<dt>SQLITE_LIMIT_WORKER_THREADS</dt>
+ ** <dd>The maximum number of auxiliary worker threads that a single
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
new file mode 100644
index 0000000000..d2d99cf8d8
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
@@ -0,0 +1,103 @@
+From f6040218564d03a040d991179d1b3491f4e9a566 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 09:32:24 +0000
+Subject: [PATCH] Limit the depth of recursion for CTEs using
+ SQLITE_LIMIT_EXPR_DEPTH. [bugs:/info/2026-10-04T04:58:58Z|Bug
+ 2026-10-04T04:58:58Z].
+
+FossilOrigin-Name: f54730871303e655a70f3167ce1a39dcd4e53fcf017d225f429e2bb67ad96604
+
+CVE: CVE-2026-119371
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb]
+
+Backport Changes:
+- Ported src/select.c changes into the amalgamated sqlite3.c file.
+- Omitted test/with2.test because the extracted source lacks the
+  upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 87c568b41e..19ab450812 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -149277,6 +149277,20 @@ SQLITE_PRIVATE void sqlite3SubqueryColumnTypes(
+   pTab->szTabRow = 1; /* Any non-zero value works */
+ }
+ 
++/*
++** Check the current subquery nesting depth.  Return true and set an
++** error if it has gone too deep.
++*/
++static int checkSubqueryNestingDepth(Parse *pParse){
++#if SQLITE_MAX_EXPR_DEPTH>0
++  if( pParse->nNestSel >= pParse->db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
++    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
++    return 1;
++  }
++#endif
++  return 0;
++}
++
+ /*
+ ** Given a SELECT statement, generate a Table structure that describes
+ ** the result set of that SELECT.
+@@ -149287,12 +149301,7 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+   u64 savedFlags;
+ 
+   pParse->nNestSel++;
+-#if SQLITE_MAX_EXPR_DEPTH>0
+-  if( pParse->nNestSel >= db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
+-    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
+-    return 0;
+-  }
+-#endif
++  if( checkSubqueryNestingDepth(pParse) ) return 0;
+   savedFlags = db->flags;
+   db->flags &= ~(u64)SQLITE_FullColNames;
+   db->flags |= SQLITE_ShortColNames;
+@@ -152617,14 +152626,13 @@ SQLITE_PRIVATE With *sqlite3WithPush(Parse *pParse, With *pWith, u8 bFree){
+ }
+ 
+ /*
+-** This function checks if argument pFrom refers to a CTE declared by
++** This function checks to see if argument pFrom refers to a CTE declared by
+ ** a WITH clause on the stack currently maintained by the parser (on the
+-** pParse->pWith linked list).  And if currently processing a CTE
+-** CTE expression, through routine checks to see if the reference is
+-** a recursive reference to the CTE.
++** pParse->pWith linked list).  And if currently processing a CTE expression,
++** it also checks to see if the reference is a recursive reference to the CTE.
+ **
+-** If pFrom matches a CTE according to either of these two above, pFrom->pSTab
+-** and other fields are populated accordingly.
++** If pFrom matches a CTE, pFrom->pSTab and other fields are populated
++** accordingly.
+ **
+ ** Return 0 if no match is found.
+ ** Return 1 if a match is found.
+@@ -152753,6 +152761,8 @@ static int resolveFromTermToCte(
+       pRecTerm = pRecTerm->pPrior;
+     }
+ 
++    pParse->nNestSel++;
++    if( checkSubqueryNestingDepth(pParse) ) return 2;
+     pCte->zCteErr = "circular reference: %s";
+     pSavedWith = pParse->pWith;
+     pParse->pWith = pWith;
+@@ -152777,6 +152787,8 @@ static int resolveFromTermToCte(
+       }
+     }
+     pParse->pWith = pWith;
++    pParse->nNestSel--;
++    assert( pParse->nNestSel>=0 );
+ 
+     for(pLeft=pSel; pLeft->pPrior; pLeft=pLeft->pPrior);
+     pEList = pLeft->pEList;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index c16576354a..4073a48202 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -20,4 +20,6 @@ SRC_URI += "\
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
+	file://CVE-2026-119371-dependent.patch \
+	file://CVE-2026-119371.patch \
 "
-- 
2.35.6

