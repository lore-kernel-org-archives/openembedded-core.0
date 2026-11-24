Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30992.1795560770782912808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ADSVuSwu;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3187511f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560769; x=1796165569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7f/7uNt3MofLvZFHN+Z+4tB/qSSvhYE3k2SLwE1tWwY=;
        b=ADSVuSwuO9BtOU5OUFld0erEbiMwAZ3zWyK7XcMD0jDnq0dIyspXWhdwV3sTmXBqzD
         EVM+oKUnJ4sGlhN1O1DttFILSOOpQBARlm+HobojECkNAN4PDegybJmfeDzMIaGu3IrR
         lTQwNx7WR61rZ8YCV58PtZdX/xEKWoPhCFCewfU6RDqYC52SgPSt+MBdEqRZZDKcMPve
         m282leXvA5Epw9I8MSV51dRI6Cn/wFIajyoHSnrwEr3+N4r66mTheJMekpd/SJIrjkKM
         g6F5aH1Gzw0yoTMWTwkjkpiw6wgWg61ce5hZp4CLTtzj8fcIP4pKbjv6jbvAlP/93F9k
         0jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560769; x=1796165569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7f/7uNt3MofLvZFHN+Z+4tB/qSSvhYE3k2SLwE1tWwY=;
        b=wVFmglyJZqAZDg5mr49S/omYyXYigwdNqVE+2XFyqwjjjCgGKYItYcvlnXyxbyYRec
         3aofb/7pSu/hM4v28/Oi3HQECnCzlNlRVbwsU1QAKbr6EfDFz6yQ5b+YIUkPR48UQngy
         EBIFk3oBJ9366ZyijPUFD+sP/2BCL622oyFTmL05iT1iHoMDGFIZvzoqXqUJ3uhP0d9d
         wDx4e0UIjHMoEqSVof4B/W0T+xjM99Q35UvFHPMhuot/uU42P7KGczFKZDKmzCeP3gzR
         NNOduh3PHj9NuVXgc/ZnnqRI//6mqlamM5dQ5qFszkSkdW696xmGguyIet3QpY2Srr3m
         q9/A==
X-Gm-Message-State: APuU4Z9beTJg4oiBY5hsas1tbGyBIO7RmBb+IUtK8acJijMF8EeYg6+Y
	qW6qhwxXiRchzCBPfMH+l5926KV0Bv8OR2UrnRIOS64tCFdOsBD6xfbqb4uFmBqK248u5nTiGFW
	YQC3g2uw=
X-Gm-Gg: AZFdTZf8+ZYSzgy20i9KyByDA7VpfV6JNFbIhGDoqS/SMCXfF6L79mU5G0Taa1UCRzU
	WLkaKvOmX7g665btxOT7iEIGqxlIk4NGYdeRiGky6alykxx0UpG+tV+A8wZ/h3Xy9ioWb/bXiTY
	6j5HO+a5QJHNnqHawjZQ4479V+AOK26nCssh8d8sFb2jTLAkW9wquecssokh0fP9dzdKWozKpLf
	2VAE6wYexqjI9J1Z4oGa2ObBsg/31sCqltoFZ6DH2vclfLkjnvvjKNLrGtjReQGwyU/RZqAHLy2
	XYCbkYEpGqOmNjKqPQXW9zkNUbK2+ir31vOY8jl6VeEgFVsPgnlsh6aPBU49SQIT8OoEmGx6pRm
	DwbzeZcgtyle6keSM98VbYKYdG6zN8CYn/3wSDNj3v3DI5FBjyyR8kyMMz9MyEjyLAtsakPk3CW
	bhb2pV02ckyth+Ja6CyyFXF+xUsRLxA9KLrufn35uUsE+h/j6OOtLMZiCvNjG1YuBvrfyMt+Wj1
	fwuG2EIPLSN/mUrYDdiGM8/DoMLEXkxQ9pmXdX8Suvf3M4gzPxFYVCZO1Gi5AWBrivEf92H/oPo
	VaJws3Ps4aa7y+wWANyRBOWYZpHTNMAiGBoALQDnSYV8Ax0Eke9JluHuhKP5CSFI2bRFcOcDB6J
	y61FHnnUppVDa61BgLt+UcIEMvLKY
X-Received: by 2002:adf:e014:0:20b0:4a6:b87:d77f with SMTP id ffacd0b85a97d-4abb0f3b5a5mr23901031f8f.12.1795560768853;
        Tue, 24 Nov 2026 14:52:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/21] sqlite3: fix CVE-2026-119371
Date: Tue, 24 Nov 2026 23:52:28 +0100
Message-ID: <ed98171f49a26a281bc728e30141c0d67ed43657.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251113
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite3/CVE-2026-119371-dependent.patch   | 109 ++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 +++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |   2 +
 3 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
new file mode 100644
index 00000000000..21fed4b6f8b
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
index 00000000000..d2d99cf8d84
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
index c16576354a7..4073a48202b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -20,4 +20,6 @@ SRC_URI += "\
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
+	file://CVE-2026-119371-dependent.patch \
+	file://CVE-2026-119371.patch \
 "
