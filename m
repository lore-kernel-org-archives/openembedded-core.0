Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1460.1795801782336926983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lNBOcW0X;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4900023f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801780; x=1796406580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qQNk4JAOvU9moEn/r0fAiC1l52hZIWi6MEn6IAn7Bmw=;
        b=lNBOcW0Xg5h0brzT9GKZR1zvae0dv88rW3SwtET2oFPCw2pApQqWA7GRXxwxvd4L+u
         aaeoyGzJY1hYQEA2/Y/0Rc9pa9JWAT90bw1ArRv9Q82i6nq0ZDcTQHXb56LdcO5hzwCu
         ry9JxEbkdFj26EqYlqGKYWDaE98ktCltQxjjtoQGoBWV3gud7PxdFdM6eKBjOpPYgXwO
         RvdxVI/2RblZ+vo66y8qBxiskC4F9u4A9kR567VyeBxmfGmpbGc1I/2LspzVZ7pEsPPG
         hE+Ey167yo4ycOqrxzEGv+5PrgwIT8HrZ33/zZ6qWDqF+v+kgiNlpFMBwLwAoWNw500f
         LCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801780; x=1796406580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qQNk4JAOvU9moEn/r0fAiC1l52hZIWi6MEn6IAn7Bmw=;
        b=NTmEKGGJ+XFiplp0mH4xa+EQaCw/HwZkDg1UAQxfbxy+zvd+ZYgS3xbhTz8fGaABRm
         cbcRJHTapWYlzoZmWj8UF0ayhhFwHcGCbMP5seRkm38xomB514zgfKFeKQz94KoOmpyx
         aMibxQr+Qs6kh8A1m5tGTCl9RfmZuKAk9diQ1ahXZgPQ1dzoQLIiXX6DuAeekxRpJjX6
         tiOjhrpnQ0h8oUkluKCMscYajbp21qLX+ajLSjHrdumihBiB7cqsmuZZfIMJ0BIjWox4
         TEuZeLNF5x4KFEYsKSN+2dXhlKkDAnrjZIi2qUz93lhx5LLiBHM8+C40kVCDPfPHwINk
         FcJA==
X-Gm-Message-State: APuU4Z9fxEJFoCo9L9dkOCxveXdarqTxZaOfqWOK41f4Hu050hbXFgb3
	7lzriFBMOFWBnbI1U14MfQxHVgeSXI9n8xf3aoVi1jWAQ4LU2pG/OJGGGdJ49K7PfetF8sR4/m3
	UCMfGv6Y=
X-Gm-Gg: AZFdTZc6KKHFYYrZt6gt03SBRGHz++yMynThkYNvzBNKMZubKTYHPUu1ZJ54g+l54ZJ
	yEhnNXzmHzft8sqGiQK3RFBFLD/Tzc9vm5NYHGcQMkwP0eBSR4nruawVoxOLVQOM03ZfzQChKGc
	plfiLxbVk+izfhm43aS9h17Axd9HUdIX3vjy8TGWY3mjdxo5eh8EZq88xG98g1Ez4s5VP8y9aDz
	TZvkyf4X3LvXmcYw2bBFwg62J552ELQ6kXVinZyfptBHowOuEUxf9hoEpGFwmY/0GGF+U56rpcu
	heSTbfv2bhzhxMYVCUej420JmteoJhOQtS5Onj3cLQ2dVHVTXteEd/OvX44gKpUnmtl70mjynjt
	+JuvKeANwI8No/uQoaOwKcHbq8JxJwuCqCgAOx13n5YcUtgpEtA4LtBzGTmOZNU64zGXYV99ewI
	m7BBcU5BubOARYx42yIZYTXz7B++W3amewtU3GMuPSwg3EKaJfax51ppsAIhUpd2jOiREPAvUDU
	2egpqetEQ4KRYVn5kx/dqcsFF9M/jsLw9i+PkDFAlxSx+Cvcz64AGh0Vit7bI17B7QhzLThVhPx
	d3cpgs+TGs8+BmUEIu9GZSp22+YQYPMySsX8p9zg9t8FfzVHv51oQhqynBBa3Jyqnxp/aNZivb3
	di5HojYfRshfD7Vf/WTHQH91DLVk19Q==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr49600559f8f.56.1795801780475;
        Fri, 27 Nov 2026 09:49:40 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/37] sqlite3: fix CVE-2026-119371
Date: Fri, 27 Nov 2026 18:48:55 +0100
Message-ID: <090e2804c6e6111ac544d17763cf7555f5804c0e.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251418
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
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite3/CVE-2026-119371-dependent.patch   | 109 ++++++++++++++++++
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 104 +++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
new file mode 100644
index 00000000000..6f06da3d741
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
index 00000000000..03588c983ba
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
index 480f597b662..464d1cf9b03 100644
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
 
