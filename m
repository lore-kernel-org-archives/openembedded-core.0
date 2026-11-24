Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31037.1795560770094150200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Q6cUbR9+;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3187502f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560768; x=1796165568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/1K6coTy1QRbUa1Bb5uFCguTW2Q+c/zwibOOo/5i4UY=;
        b=Q6cUbR9+O1GRzIZ4C+/tSq/HzSBF4Q4CEROgEqCzgi0bqj5j30ZlPkYeVTNk55JOwr
         Xnv1B9rx78kW+w4wrgi3fOwSGYVtW01lYXvI6o1URP2tSTqkuPOifIvsVlv+moLEQCHY
         fvpHH04JV/Tro8y56YClIRjkQ9sDxgZhcgQkvq3dR6ziojaL8Lv7aLPsdKEyd2N1LDZT
         VRS5oCv2TOaHz3bgStg6xOsmRs6Ow5w/o1Yb4XFMm/ptuCusYHCOCe6dr6ekzEd37Jki
         X/cECEodtLRA8s9+TcO9UrOrnEk8bgDdS+YL+8XWu7GeLXdtRSfw4c95nfwt2zKbQoTc
         rtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560768; x=1796165568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/1K6coTy1QRbUa1Bb5uFCguTW2Q+c/zwibOOo/5i4UY=;
        b=n/M4ynrmqAfljZ3JVTQr0uG+9oOkQJimY3bblIZNL1MVeYN/mRhOM1rT7rXXvlpLyX
         R2CPx3TIdS5xinnyQqClzMVDovg9bdkkhS97oUQthKjpSL5UjXRNV/NLlWL3JHQ7YZlD
         VFd7qQpNkj9a/5mels5LIa6pRU+FlyYVdWO8EyKJ8jNyK/t3sa4DBi3Kvri0zSQAgiRe
         SSXIMKlVWLo/w5/xOwEOlldJJWoAvZmFYPhwMXlc90z2Lmfw8N2unf8baHCcMoXatGqv
         E+zgXYhMBkVmtWxg/kAeKmzYYMy8Vpv9XY8CcHC/5GfbSlr6VeF9yIHKFnGdPx4VKYzt
         8hqw==
X-Gm-Message-State: APuU4Z/Z/I+zrdLdP97LvIOeClbAU/1Qwfd8tuOtBb8WECxML+Eqsu9a
	q+AT0pdZTeSao45DjQnBc7sUARVzU7NC6Ibt+qkE7yAJhnsAAtQMYZwUC2qkLHiFuaSrNeJCsWW
	3UyISfIs=
X-Gm-Gg: AZFdTZelvcXDfQXE7s8rmSXiFr+PfRD4WB17vM8N1EwaK3kiPnIE7JuD1hPhuSt7Qmt
	y/TAcUyvyASp/L4LuydEK0c2CyLowkyNWi3q1f27niqkSl85pHDdlpABycIvTBnwNaMIQMYYFrV
	EUKXb+9KbkXqF3niVjPt5qgBBA1cGzHCehY82RJhpbPbVNeQgPlFaEPpPqSoXA700kqKgfWiLP+
	9i90mG3lkXyremfXsHfIwP+9b7rnc1x1p9QYDA2Df0LRsYULpETBE1a4bnNZKd96FyJk//KPj7F
	CO/0QvDLmof4PACXPc3z+hLQAzuwVQe1O6D93wXoEOEMw+pFKoa8C8XD9HGGJIkY1ViYLZj3a5U
	hHCV9u3uTxoY6AXkVunshXj69HybdspYtuvYxhmKzbaWuymb6qZinG9x2QV1XaB+Tz5jpbrUu66
	BdxQpyoatv2pu2tKt1lQ3Q9er9aQ0cWp0Hs2GgE6sGchZB3/RxUpFqq4hW/GfUb9AScRyrdiwJx
	5paOVq3yR6A3aN0cmAqGp4kAwsSSEvutpbG0dnYeCq7ijXFZXq2ycSnWtRtkmvfaRFsl+DzdxzZ
	f0iT/ac1fBW6kKhdjUl3TCy+9uGoiUYTPXpT5yvzv1vQh6keaUn//S46tF5mWpWVUP1f36tKZkO
	6410xHfFv1emTzA62BE5Z3P71Gxnx
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr13215356f8f.44.1795560768257;
        Tue, 24 Nov 2026 14:52:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/21] sqlite3: fix CVE-2026-119376
Date: Tue, 24 Nov 2026 23:52:27 +0100
Message-ID: <cac0f1774efd18faaba8ac141c404d56e7738332.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251112
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
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
new file mode 100644
index 00000000000..32060a54449
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
@@ -0,0 +1,75 @@
+From 0e3ec7377ba0ef29b02e258e9fbb395d0d6dd431 Mon Sep 17 00:00:00 2001
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
+index 45ade42b16..603ca28a27 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -21992,8 +21992,8 @@ SQLITE_PRIVATE void sqlite3SetTextEncoding(sqlite3 *db, u8);
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
+@@ -111640,23 +111640,29 @@ SQLITE_PRIVATE int sqlite3ExprDataType(const Expr *pExpr){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 7c8658a977c..c16576354a7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -19,4 +19,5 @@ SRC_URI += "\
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
+	file://CVE-2026-119376.patch \
 "
