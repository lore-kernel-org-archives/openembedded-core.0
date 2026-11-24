Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30979.1795560746861911053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=hFr1Hn4z;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so24075525e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560745; x=1796165545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1k7GzTKIOkVJLe6A5a37Z8HGKYQ58EYjyflMb0OmFio=;
        b=hFr1Hn4zonPiIEbdYTIuupnzFGSd+VrmY18+5ouhZGfsVnWXWFIwFH4592qgiQ4ll8
         2TlUk8dxJjSFkrRYYF+uJrM7k8UZHG5go6/LGOx9d1AUDDnrl3w2/HNcrLVTVlbkFbwD
         LO6OldvuQ6ln9FDBE/QSzfdLt46lG3ZA5wO0woVjYE8LvOyZTVkk2N3DEXURFn6ACDi9
         /TsU+xqx0nQwnt5RSj+m5xqnk4AD8ZSQHyJnJM4BZZKjxPSzgytQQxbNHFjJ3waoUgPH
         gHrP/qAA4F8yCI32smiIOgEeJ2G0+45+uK6JP9bikAnvdKpdFSZ3yPx07JdSelCzZtIn
         CHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560745; x=1796165545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1k7GzTKIOkVJLe6A5a37Z8HGKYQ58EYjyflMb0OmFio=;
        b=g4uVfEP07WqNwXwFRGfSYJibAuleV8hRUB4d27XQwop3+Pt2ezoLzSBiP1jsJGIcEV
         rTdCKVDrxYbCoYy/l7ePqaP1i2G7S0sA+pSTdwHiQQvmJ+DzOMIakJK9qi6XCU0XxZIf
         LMtElG0ZWOCcQH54DBG/YiQX/bHni4j8q2DXZlNZAUXEU4eslmHPcBiINxAnKpptMoUb
         CXP+uEKSrQFwTz2uEPAwihgzqjcCEQ0IaWu5NucFPZA28FmGl6ZGp0+VQIvozOzRSlji
         M6jPRCELgGlF4nzZ1b1KmuT7F6Po0s04WYZaFFjM/LYQ8/DztwokfRc8yt17X4/noA/W
         jwiw==
X-Gm-Message-State: APuU4Z/FEEjRxVNH/aK3K5kppKCBy03pOgM2ODjEnFXtLYzoW2vobWyK
	+YpWwkW+dKfKsZr8GiMGgiSR5IOYEyj0u6kiRPDRyLtUm4QE9HtSAP633v2RF+zvDvSdRCv2V3t
	3veNseXU=
X-Gm-Gg: AZFdTZc12XuTa7e0UP/Eur98iJ1dvaLO9kcKXUcwuk24VU/MG40o0scm1mtaNWYwC/o
	JIcP34DwuyviVvr9ln/vEueyPUVmP069dymCQkVZTnrrauXw8MyuasI+G0Y7egQUXAzAG7lhxEm
	dx1d5pRYIN4ABhCjJnNos1fMyT8lHKmpQSXy/0vgQPIIwpt/Zr2Bl3BORyDaYI0QWxQb2Dt9VgF
	aJ/RaDOrRIiewbZNGK0+ahYAGMbqUVNgm3cS0gonCDjLD3QWGDZqedWUsJ0oi7ixGZxXSM9RA2J
	8lOVkDUbM7qHbFvXuhk2F5qItCN/cD5/d59pvVyWvMd8hpLheh4JCw3FrI4jdB7T0SCkDQTiMc5
	hmOWruzF+bgcqPTvyw1WV3Uho0lUpF38hMmq3AXkA05F3n4EPJ8eq1KK3XIMA8H4oMoYQnWKmHr
	O3X+/1igDTOMK38XXlSrQe9J8/xlV0oyaRM9iNfXm2O+m4Ej7ii5eREKc4w+XvDi3XoK02uIKLI
	PDCp7FP+m/ld8ti/qkPHLH4UeWEBypT1nyLPjjcpRYrou6QGXwS6LFPj+ur9XUF3W32J1UstAeP
	BhM4L4Y93CIHVsp5foPYI8m6wz60dqNvHjCwOfaODgJHmAqht2QuemfRpMdfskUUX+hdm80Z5JT
	oowboEnIcjnOCYvanVmVuJt6fRfnPBg==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr354632535e9.5.1795560744955;
        Tue, 24 Nov 2026 14:52:24 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 09/21] sqlite3: fix CVE-2026-119376
Date: Tue, 24 Nov 2026 23:51:16 +0100
Message-ID: <1e0d7f4e8bd99a632b743f1b6eba11d6d6de54f8.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251089
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which includes COLLATE
expressions in expression tree depth calculations and prevents bypass
of the expression depth limit. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d54522a5b832422ab893a1e9fa7a99ab314ea4e2
[2] https://sqlite.org/src/info/252c0b7bf5a727d2

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119376

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119376.patch      | 75 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
new file mode 100644
index 00000000000..5a6bc972598
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
@@ -0,0 +1,75 @@
+From 2af844923ba3e32fb16b06adab4e4ad3b2f4da49 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 4 Oct 2026 21:54:17 +0000
+Subject: [PATCH] Fix expression tree depth calculations for COLLATE.
+ [bugs:/info/2026-10-04T04:50:56Z|Bug 2026-10-04T04:50:56Z]
+
+FossilOrigin-Name: 252c0b7bf5a727d29605672bb58e06c758173c276671df3e388a68294998b4d3
+
+CVE: CVE-2026-119376
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d54522a5b832422ab893a1e9fa7a99ab314ea4e2]
+
+Backport Changes:
+- Ported the src/expr.c and src/sqliteInt.h changes into sqlite3.c
+  because the recipe source uses the amalgamated SQLite layout.
+- Omitted test/sqllimits1.test because the extracted source does not
+  include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index d2c0f23..cb678b2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -22409,8 +22409,8 @@ SQLITE_PRIVATE void sqlite3SetTextEncoding(sqlite3 *db, u8);
+ SQLITE_PRIVATE CollSeq *sqlite3ExprCollSeq(Parse *pParse, const Expr *pExpr);
+ SQLITE_PRIVATE CollSeq *sqlite3ExprNNCollSeq(Parse *pParse, const Expr *pExpr);
+ SQLITE_PRIVATE int sqlite3ExprCollSeqMatch(Parse*,const Expr*,const Expr*);
+-SQLITE_PRIVATE Expr *sqlite3ExprAddCollateToken(const Parse *pParse, Expr*, const Token*, int);
+-SQLITE_PRIVATE Expr *sqlite3ExprAddCollateString(const Parse*,Expr*,const char*);
++SQLITE_PRIVATE Expr *sqlite3ExprAddCollateToken(Parse *pParse, Expr*, const Token*, int);
++SQLITE_PRIVATE Expr *sqlite3ExprAddCollateString(Parse*,Expr*,const char*);
+ SQLITE_PRIVATE Expr *sqlite3ExprSkipCollate(Expr*);
+ SQLITE_PRIVATE Expr *sqlite3ExprSkipCollateAndLikely(Expr*);
+ SQLITE_PRIVATE int sqlite3CheckCollSeq(Parse *, CollSeq *);
+@@ -113018,23 +113018,29 @@ SQLITE_PRIVATE int sqlite3ExprDataType(const Expr *pExpr){
+ ** and the pExpr parameter is returned unchanged.
+ */
+ SQLITE_PRIVATE Expr *sqlite3ExprAddCollateToken(
+-  const Parse *pParse,     /* Parsing context */
++  Parse *pParse,           /* Parsing context */
+   Expr *pExpr,             /* Add the "COLLATE" clause to this expression */
+   const Token *pCollName,  /* Name of collating sequence */
+   int dequote              /* True to dequote pCollName */
+ ){
+-  if( pCollName->n>0 ){
++  if( pCollName->n>0 && pParse->nErr==0 ){
+     Expr *pNew = sqlite3ExprAlloc(pParse->db, TK_COLLATE, pCollName, dequote);
++    assert( pExpr!=0 );
+     if( pNew ){
+       pNew->pLeft = pExpr;
+       pNew->flags |= EP_Collate|EP_Skip;
++#if SQLITE_MAX_EXPR_DEPTH>0
++      pNew->nHeight = pExpr->nHeight+1;
++      sqlite3ExprCheckHeight(pParse, pNew->nHeight);
++      testcase( pParse->nErr>0 );
++#endif
+       pExpr = pNew;
+     }
+   }
+   return pExpr;
+ }
+ SQLITE_PRIVATE Expr *sqlite3ExprAddCollateString(
+-  const Parse *pParse,  /* Parsing context */
++  Parse *pParse,        /* Parsing context */
+   Expr *pExpr,          /* Add the "COLLATE" clause to this expression */
+   const char *zC        /* The collating sequence name */
+ ){
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 1aea7cb3741..06cd34818f5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
+	file://CVE-2026-119376.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
