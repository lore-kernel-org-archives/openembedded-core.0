Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1533.1795801781761498079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GsyuuvD1;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a32576da88so4855098f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801780; x=1796406580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MRRI44DQGwWdxh9ICgDAZ/YqvTwGH86ml0vn203aHx4=;
        b=GsyuuvD1rHlG7D4lXfI66k+ufcWTpGwayyi6JPmwE3dSTOqgfaG5LJYegp02TI6i1u
         D3vU9VcE+RHxVGJ83Ds7+NDgnH3EL6Srb43yRhKOhIlaXlqs5dTQcSp4qB11voKG8y/l
         XjXQP38OxHTMQTS+k5IdueFkSIFIR/LMiDcjuRWNAon05pAlqO3LMG2tnbLXXPgpepqk
         ya9BRys2B7wQmG+VPxAAJ+7+9KHTHXfoRKpgz3ThG1b0cc6PSJ3HKHP3a+AI1HjLUfKh
         dBaA9leqK3vP0j3SZKuH9/FtyBIFbHeUnq6pHBVjPeKJ/uhd0LTTPh5P2zGoQVYrHqKM
         ncrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801780; x=1796406580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MRRI44DQGwWdxh9ICgDAZ/YqvTwGH86ml0vn203aHx4=;
        b=uv2H/721Wq0JcwnnAgjGi0JCglR2Gky0mSd2dT21SAusnsa4TpnQPtSdAR/qsIxJ8Y
         Vs/sBTI7blbkOBTxRaNSRe8zp7FvFAc2FqAA0jb4B//UfHiEdCnqQfMdkuFeN8Ows6w8
         PkS+xp7ChgUnVsFojh8Eblc73NlIOtA4VeU/JWSGEmXt8MdtqvVVz3bNmq3szn/aQRbB
         hGyzEFuwVlhs3r2u8+pZuddsM4pjgH0fli4NJgPMG1sjL38yumjrgdi3b+OoUzyWeIJ5
         LWj9rESS7N4JvThUC6iUiP1tvdKL6YGEWTaukZbcxmrkQKJisp3UwjvJCJ8xc7vwsdqD
         TaqQ==
X-Gm-Message-State: APuU4Z/iRTMhtCghOAtOFfUTii4ozjH5PpAKHz6pKfkH7oSCNGSO1XbG
	G4KlOEJdDyOS+CkbEA1/ZZrsYwQSDfd3tY28NyeTpgnoDk2CR3hQlNyA+vrxkrz2jOwDqb62O0I
	Iq+WOMWg=
X-Gm-Gg: AZFdTZfSvs1jGPeue/zrmzdqCdmqaIynhzmj8UkQP+HLyVsXMcQlkPgYHDvbnxtXnGn
	2kIE2tIo9i64vjU8T8pgzWC6Tns3YknFGiK+H3I78viI6uydjOnzRNpMp+nX1RX/vrd/NtztOZH
	Z1LOypvL98Jld4vtBrdnDsvho3NS5NLqZyQGCUA5NbRf7+Q9EGwBCBYsinXUPrVjqOghCV9sXNQ
	fAbzIyhzlX24DIuJp7//5hzK1V8TBHaX+JY1894bPQUnuRpVzqBn55s9vqmas9jaCcwKJTpUKgE
	bMFE+AQzhRofw8EAU7R4my4do108d2dnMHEb1C5B5H70tn4QsleH5kIryVklas5JNRekQG6K2Gr
	+PF2vvADiMi3BWoJOtatv0OinYv19zbcLxKrzQVRqeU+TLbhjZobGCfiMnFS7zdfal2LfAqI+ng
	wtjsJgmFFenF5sli36CAJNdpdsEQ5ckTOiajY5WQ6jnxTggyTCjATwxw/r6Az0l++pHLDuKHDXR
	QGtOTly/p0MdAGQE3H55A79MKkkW25XiuEPPbY2XcVUprHbpe4PTrY23Yg0eObMw+OZDz0WYmNV
	zv+MfsNSesTWjDe7eF6tliBpbYabczQ7GEI65lvbP98qmqKw+xUeJuLpUzoKSXn5AXA3VHvO3OK
	7N9Vj5qwBv4QLD58ntNqS2xbYKlUce1HHXDHN5GMNMm8k6KOVonM=
X-Received: by 2002:a05:6000:2c10:b0:4a8:a1fe:ea94 with SMTP id ffacd0b85a97d-4abacfea54fmr49204920f8f.3.1795801779926;
        Fri, 27 Nov 2026 09:49:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/37] sqlite3: fix CVE-2026-119376
Date: Fri, 27 Nov 2026 18:48:54 +0100
Message-ID: <f27da6d57c7aa0068710646bdc9ef32452fcc690.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251417
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
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119376.patch      | 75 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
new file mode 100644
index 00000000000..975054e843f
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
+index 4b1c310fd6..7385344f84 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -21204,8 +21204,8 @@ SQLITE_PRIVATE void sqlite3SetTextEncoding(sqlite3 *db, u8);
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
+@@ -108701,23 +108701,29 @@ SQLITE_PRIVATE int sqlite3ExprDataType(const Expr *pExpr){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 8a8456567ec..480f597b662 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119375.patch \
            file://CVE-2026-119372.patch \
            file://CVE-2026-119378.patch \
+           file://CVE-2026-119376.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
