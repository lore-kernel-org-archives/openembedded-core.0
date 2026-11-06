Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2175.1793955248651963828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=edfU7aKb;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11017; q=dns/txt;
  s=iport01; t=1793955249; x=1795164849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FO9py5J+Cxr01+Qa+tu/m7BP2Qi6RxLhGu+6GHIFgEM=;
  b=edfU7aKbbK1J7v5BRYLg7YIkDF3Lkg4l2lQo7ze8JKZYlCHpIj2nPp0d
   dc3NIY+NYAaxWrFAnDzr/O6/ZYxXFJoeFw2qeMWxNIdhBKTVF48b0Ur3O
   LjxwKI4F6M2lGWYvcWLUMbRKRxCYKdo6s/pF+JVS3kUcKeUrJ0uB/ClRl
   oF2aMz4NZEtJc6eI9l7GFNf0hYCan41oXrjsNdBVvIUtiy4Kuw7MoS0qY
   E3+4P8CQv+U5Q7G+HNfWfJ38fC4D/liIs/1Z+wXQhIL67Q9HYaY3uxttn
   HSnvKxRCKLi3r3Zjw9tBKzgmmzq+5yXDT5zSYMEtEDZ+rcpyeneuwYKbN
   A==;
X-CSE-ConnectionGUID: KffQZb8OR1qyA0wWRQ6M+g==
X-CSE-MsgGUID: 7evQ0pmkTxa5cfdSGnt8zw==
X-IPAS-Result: =?us-ascii?q?A0AnAADmlO1q/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOTIIsBgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECL?=
 =?us-ascii?q?ysjCBkJgnkBgnQDEbwGgXkzgQGCZkMBPwJDUNlLgWgBCxQBBYEzAYU/ModxX?=
 =?us-ascii?q?RgBhH0nG4FJRIR+gQWBXAEBgTiGbgSDHBKBWh5ljBUCgVGGeUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0Md?=
 =?us-ascii?q?DkQMB4kLwUcJj4bCi8YDUgRLDcVGQQ+bgeSPYMSATw+EwElBQGBBT56K5MDk?=
 =?us-ascii?q?BaCIaERhCqBaIo8lToaM4VbpRYLmH2OCpZRhGmBaDyBRwsHMxoIGxU7gmcJS?=
 =?us-ascii?q?hkPjisDCwuDYIF/gxTGfSYyAgkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:49aLlqkjFkCR9bIct0v+Uaro5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUWqCP//bNzT9eop3PN+z8kICscODzNEwTAdurSw1E1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa4W9N9FCzFpz
 6UBORlVcS+5vryTg73uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnDlazxEsFu9rqss6G+Vxwt0uFToGIeJJofbFZwPzi50o
 EqZ8nrAWgkfN+CPwGeO/H6XqenTzTHkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:oCvL+qmz1wywMWaJS/0Yughtm5LpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:MfGYqWCa49m3FHj6Ewpp+ncmEJACSCTE3V6IPHCCMDhMC7LAHA==
X-Talos-MUID: 9a23:vbsKNAWP8Dm76Uzq/GDhmgg6LMJr37SnVUsDna4pvdXUJzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544398128"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:08 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 075D71800035E;
	Fri,  6 Nov 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 60728CBF23F; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 09/10] sqlite3: fix CVE-2026-119371
Date: Fri,  6 Nov 2026 00:54:04 -0800
Message-Id: <20261106085405.3517095-9-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249620
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
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 104 +++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
new file mode 100644
index 0000000000..6f06da3d74
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
@@ -0,0 +1,109 @@
+From fcea662407384de099367f4eded9dae4ac16b7eb Mon Sep 17 00:00:00 2001
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
+index 7385344f84..13c687dde4 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -4418,7 +4418,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** or in an ORDER BY or GROUP BY clause.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_EXPR_DEPTH]] ^(<dt>SQLITE_LIMIT_EXPR_DEPTH</dt>
+-** <dd>The maximum depth of the parse tree on any expression.</dd>)^
++** <dd>The maximum depth of the parse tree on any expression and
++** the maximum nesting depth for subqueries and VIEWs</dd>)^
+ **
+ ** [[SQLITE_LIMIT_COMPOUND_SELECT]] ^(<dt>SQLITE_LIMIT_COMPOUND_SELECT</dt>
+ ** <dd>The maximum number of terms in a compound SELECT statement.</dd>)^
+@@ -4445,7 +4446,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** <dd>The maximum index number of any [parameter] in an SQL statement.)^
+ **
+ ** [[SQLITE_LIMIT_TRIGGER_DEPTH]] ^(<dt>SQLITE_LIMIT_TRIGGER_DEPTH</dt>
+-** <dd>The maximum depth of recursion for triggers.</dd>)^
++** <dd>The maximum depth of recursion for triggers, and the maximum
++** nesting depth for separate triggers.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_WORKER_THREADS]] ^(<dt>SQLITE_LIMIT_WORKER_THREADS</dt>
+ ** <dd>The maximum number of auxiliary worker threads that a single
+@@ -19755,6 +19757,7 @@ struct Parse {
+   int szOpAlloc;       /* Bytes of memory space allocated for Vdbe.aOp[] */
+   int iSelfTab;        /* Table associated with an index on expr, or negative
+                        ** of the base register during check-constraint eval */
++  int nNestSel;        /* Number of nested SELECT statements and/or VIEWs */
+   int nLabel;          /* The *negative* of the number of labels used */
+   int nLabelAlloc;     /* Number of slots in aLabel */
+   int *aLabel;         /* Space to hold the labels */
+@@ -144384,6 +144387,13 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
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
+@@ -144405,6 +144415,8 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+     sqlite3DeleteTable(db, pTab);
+     return 0;
+   }
++  pParse->nNestSel--;
++  assert( pParse->nNestSel>=0 );
+   return pTab;
+ }
+ 
+diff --git a/sqlite3.h b/sqlite3.h
+index 056511f577..705217e7ff 100644
+--- a/sqlite3.h
++++ b/sqlite3.h
+@@ -4127,7 +4127,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
+ ** or in an ORDER BY or GROUP BY clause.</dd>)^
+ **
+ ** [[SQLITE_LIMIT_EXPR_DEPTH]] ^(<dt>SQLITE_LIMIT_EXPR_DEPTH</dt>
+-** <dd>The maximum depth of the parse tree on any expression.</dd>)^
++** <dd>The maximum depth of the parse tree on any expression and
++** the maximum nesting depth for subqueries and VIEWs</dd>)^
+ **
+ ** [[SQLITE_LIMIT_COMPOUND_SELECT]] ^(<dt>SQLITE_LIMIT_COMPOUND_SELECT</dt>
+ ** <dd>The maximum number of terms in a compound SELECT statement.</dd>)^
+@@ -4154,7 +4155,8 @@ SQLITE_API int sqlite3_limit(sqlite3*, int id, int newVal);
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
index 0000000000..03588c983b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
@@ -0,0 +1,104 @@
+From 15f41e88d9729b80cf61f1d4893e166a61be10bb Mon Sep 17 00:00:00 2001
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
+- Kept pFrom->pTab in the comment, as used in the current version.
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
+index 13c687dde4..27b3bff8ea 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -144378,6 +144378,20 @@ SQLITE_PRIVATE void sqlite3SubqueryColumnTypes(
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
+@@ -144388,12 +144402,7 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
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
+@@ -147651,14 +147660,13 @@ SQLITE_PRIVATE With *sqlite3WithPush(Parse *pParse, With *pWith, u8 bFree){
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
+-** If pFrom matches a CTE according to either of these two above, pFrom->pTab
+-** and other fields are populated accordingly.
++** If pFrom matches a CTE, pFrom->pTab and other fields are populated
++** accordingly.
+ **
+ ** Return 0 if no match is found.
+ ** Return 1 if a match is found.
+@@ -147781,6 +147789,8 @@ static int resolveFromTermToCte(
+       pRecTerm = pRecTerm->pPrior;
+     }
+ 
++    pParse->nNestSel++;
++    if( checkSubqueryNestingDepth(pParse) ) return 2;
+     pCte->zCteErr = "circular reference: %s";
+     pSavedWith = pParse->pWith;
+     pParse->pWith = pWith;
+@@ -147805,6 +147815,8 @@ static int resolveFromTermToCte(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 761087f1a3..da12a6194a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119372.patch \
            file://CVE-2026-119378.patch \
            file://CVE-2026-119376.patch \
+           file://CVE-2026-119371-dependent.patch \
+           file://CVE-2026-119371.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

