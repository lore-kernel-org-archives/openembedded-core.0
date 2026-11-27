Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1456.1795801778987880699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=MtlmMiit;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a32576da88so4855070f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801777; x=1796406577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vxIToHsxGfj9Y5r8Ok6vi54SqL+tDnIZtx2f0+UeqfA=;
        b=MtlmMiiteNlJz+0aOhXXRlgTNPo/kKdNoWYWIUVRho6Be6alCkqoSbZEYErhSFgTuX
         iZFDmj8i6DQL7UjzqEBZfgZjbWq+C3M6uHTmnD4mzJZz95M6gbCR8REkV8g3mwIwzDhF
         62DXKavkghXwlBkcdGUd9V8haNM3AENXBg42/lgoai/G3HUrQZ8gHk3Wd7NHS/Xb6iDc
         PM+yYmwJ3b6/dEx4AZRVb2ngRw5T9AllJiX/XN3/gfFLAJhb4XQB6kwilKI1irUa9um2
         lzedEfZ7dEilZlUUPqkyRP55eqKq9kXwqgQe+fegpRp6EUzSIqogJqRYVFRnyD8ulpva
         u9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801777; x=1796406577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vxIToHsxGfj9Y5r8Ok6vi54SqL+tDnIZtx2f0+UeqfA=;
        b=hsg7TRjDyfmGytr+pZ7SYDnR3pnlLEExTPddaYHD/D44i5ojgbT3pH2EplGHXHd8O2
         SMlXFvjqbE+LS+Auqx1e/+Kr49rdVa40aN5w12gz9XyE3bqty3RADtTsOB5ep/9Goefd
         CR7YoXJ4DKMuVVcNoHqyPKfBZYaCPw1yLSaDyPuF5ZtAdJCkULXdtI9jWLO7CazZIhnR
         5q8hrRRT8ng3YKbCcMYpOZVo5Ym+kjXKzbPL8KqnqISDT4COe3c/i4cUN0r/v5a4w5tK
         xn/3B4i8RA80gQ8IdHEna2e4I46jZRIcjmCRAWpSbFUCnPYK4DKp1rYPfxAOejf173x1
         j7cQ==
X-Gm-Message-State: APuU4Z9A4kHIraoSoTDDvP5OeiMB7IpetsSGmJNkFnf3hws7HZYINus8
	cB7i5JHm2PW9gx9qxnv/OM2vzfLNBQgAPt0+d+08wRRNrZBg4nebt3ION2HD8AnxaWNkuAFib9C
	TVhWyXSk=
X-Gm-Gg: AZFdTZdib3h2GW5j/OkzMdJEoG6WNiML2+bi7tQVo2aJVcHIjwnW3yGz2KVxkKYHoow
	dgJfW8z37wC1L+mcFtg/LSNDmVO4N5km0RhW/0u3ImgbJWu3kzjB83MYEQo2L2UhMjyF/UAU5N5
	dN0aJdTnWCOAcgeUlNx8kWQQv7L4eSF6lOATp+LlXtKiNQOEqsWvIMl8mtnDuGBkg4PqSYRI/eh
	zBDCiOP3WMtdCHidutwZ+fM0OBhY86t7RaFPusuEKsfemlBs65huICJ0KQCBLiW8jwBnJRnZMD2
	Zp3TT4efjzJ+Pw2SCd7xN1s0humVXCwEcdfmva0oQSlIIB2TziN2I3bQwZ1dd7O1CqzaQXpnbs2
	13dSmk1C66qnljPXjtBljUQ8/9sXdcQ1yoxl2jFAD02gOem3v5mEz0a6iwJVDUUhzoAiQ3jllH9
	8xrkhuvfBI5yyBj41S6j6cYxFp9ACRUeFAGhLQaSpSISYSWiH9ULjTuxqoCla4l8nf/ER05pcqn
	Naz3lUzsf7LLF1wvzZPvmsmSiRIpaSD/pMmerZUFehayi1+hhfgYjn22jVe6SBHNrefPiWoMvqq
	0P+hNztCXba7Y1XAHJ3Kst6pAWN4F2i48oakADNkqz2InrXeeYxBZuHgd9oFo1JFNUcBbSSIGxt
	mH/bapewZ3f6SbqSe0nuwUkeaOoX2xdcWyPb9Gupky81Df70HUg==
X-Received: by 2002:a5d:5d82:0:b0:4ac:7595:6f68 with SMTP id ffacd0b85a97d-4ac75957253mr43342518f8f.36.1795801777087;
        Fri, 27 Nov 2026 09:49:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/37] sqlite3: Fix CVE-2026-119377
Date: Fri, 27 Nov 2026 18:48:50 +0100
Message-ID: <ffc428711bb02b553f734cedec8e8e2463412ee0.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251413
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix series [1], [3], [5], and [7] for
the authorizer bypass. Commits [1] and [3] are dependent commits. Commit
[5] adds authorizer checks for RIGHT JOIN USING terms, and commit [7]
corrects the loop so every term is checked. The GitHub mirror commits
correspond to the SQLite Fossil check-ins shown in [2], [4], [6], and
[8], respectively.

[1] https://github.com/sqlite/sqlite/commit/c70fbd39f9c130bbe1cc45269c3b490dfdf7f259
[2] https://sqlite.org/src/info/625f78a630bb
[3] https://github.com/sqlite/sqlite/commit/ddea119f825bf07f145c55f623022286bc644664
[4] https://sqlite.org/src/info/4ef88a36f9d9
[5] https://github.com/sqlite/sqlite/commit/7ff247c5b9ead3ad8a69c26d3fd264878e127237
[6] https://sqlite.org/src/info/bbd69ce27462
[7] https://github.com/sqlite/sqlite/commit/5694c3bb2a6a40770ecd2f65910eea756734dfd8
[8] https://sqlite.org/src/info/2cb228776836

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119377

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-119377-dependent_p1.patch        | 86 +++++++++++++++++++
 .../CVE-2026-119377-dependent_p2.patch        | 59 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   | 52 +++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   | 51 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  6 +-
 5 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
new file mode 100644
index 00000000000..bdeb32da04b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
@@ -0,0 +1,86 @@
+From c3cab0322ae36fe6ca21df300c670af379c0a423 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 2 May 2026 17:30:33 +0000
+Subject: [PATCH] Minor optimization to the authorizer.
+
+FossilOrigin-Name: 625f78a630bbf897f945065f1b85a92fe26e426302c8f6edc4d26a817ff62358
+
+CVE: CVE-2026-119377
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c70fbd39f9c130bbe1cc45269c3b490dfdf7f259]
+
+Backport Changes:
+- Applied the src/auth.c and src/resolve.c changes to sqlite3.c because
+  the Yocto sqlite-autoconf source uses the amalgamated SQLite layout.
+- Kept SQLITE_PRIVATE on sqlite3AuthCheck() to match the amalgamated
+  source.
+- Omitted manifest and manifest.uuid because they are repository
+  metadata and are not needed for this sqlite3.c backport.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 6acf46a5b5..3bab6d7638 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -107075,9 +107075,7 @@ lookupname_end:
+   if( cnt==1 ){
+     assert( pNC!=0 );
+ #ifndef SQLITE_OMIT_AUTHORIZATION
+-    if( pParse->db->xAuth
+-     && (pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER)
+-    ){
++    if( db->xAuth && (pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER) ){
+       sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
+     }
+ #endif
+@@ -120685,8 +120683,14 @@ SQLITE_PRIVATE void sqlite3AuthRead(
+ ** either SQLITE_OK (zero) or SQLITE_IGNORE or SQLITE_DENY.  If SQLITE_DENY
+ ** is returned, then the error count and error message in pParse are
+ ** modified appropriately.
++**
++** Divided into two routines.  realAuthCheck() does the work.  The
++** sqlite3AuthCheck() routine is usually a fast no-op but invokes
++** realAuthCheck() (and spends time doing some stack pushes and pops
++** as a result) in the uncommon case where an authorization check is
++** actually needed.
+ */
+-SQLITE_PRIVATE int sqlite3AuthCheck(
++static int SQLITE_NOINLINE realAuthCheck(
+   Parse *pParse,
+   int code,
+   const char *zArg1,
+@@ -120700,7 +120704,7 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
+   ** or if the parser is being invoked from within sqlite3_declare_vtab.
+   */
+   assert( !IN_RENAME_OBJECT || db->xAuth==0 );
+-  if( db->xAuth==0 || db->init.busy || IN_SPECIAL_PARSE ){
++  if( IN_SPECIAL_PARSE ){
+     return SQLITE_OK;
+   }
+ 
+@@ -120729,6 +120733,19 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
+   }
+   return rc;
+ }
++SQLITE_PRIVATE int sqlite3AuthCheck(
++  Parse *pParse,
++  int code,
++  const char *zArg1,
++  const char *zArg2,
++  const char *zArg3
++){
++  if( pParse->db->xAuth!=0 && pParse->db->init.busy==0 ){
++    return realAuthCheck(pParse,code,zArg1,zArg2,zArg3);
++  }else{
++    return SQLITE_OK;
++  }
++}
+ 
+ /*
+ ** Push an authorization context.  After this routine is called, the
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
new file mode 100644
index 00000000000..e8a89898d4a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
@@ -0,0 +1,59 @@
+From 7606a5f5a1ce6f38eb5e98514583c711120ad694 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 1 Jun 2026 16:49:39 +0000
+Subject: [PATCH] Make sure the authenticator is called for columns that are
+ part of a USING in a FULL JOIN. [bugs:/info/2026-05-31T02:00:37Z|Bug
+ 2026-05-31T02:00:37Z].
+
+FossilOrigin-Name: 4ef88a36f9d9669b0d74c58f79ad497803885ff6078e5f9685f13c96eab397cc
+
+CVE: CVE-2026-119377
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/ddea119f825bf07f145c55f623022286bc644664]
+
+Backport Changes:
+- Applied the src/resolve.c change to sqlite3.c because this recipe
+  uses the amalgamated SQLite source.
+- Omitted manifest and manifest.uuid updates because they are Fossil
+  repository metadata and are not needed in this backport.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 3bab6d7638..903af8baa8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -107001,7 +107001,7 @@ static int lookupName(
+   ** cnt>1 means there were two or more matches.
+   **
+   ** cnt==0 is always an error.  cnt>1 is often an error, but might
+-  ** be multiple matches for a NATURAL LEFT JOIN or a LEFT JOIN USING.
++  ** be multiple matches for a NATURAL OUTER JOIN or a OUTER JOIN USING.
+   */
+   assert( pFJMatch==0 || cnt>0 );
+   assert( !ExprHasProperty(pExpr, EP_xIsSelect|EP_IntValue) );
+@@ -107075,8 +107075,17 @@ lookupname_end:
+   if( cnt==1 ){
+     assert( pNC!=0 );
+ #ifndef SQLITE_OMIT_AUTHORIZATION
+-    if( db->xAuth && (pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER) ){
+-      sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
++    if( db->xAuth ){
++      if( pFJMatch ){
++        assert( pExpr->op==TK_FUNCTION );
++        assert( sqlite3_stricmp(pExpr->u.zToken,"coalesce")==0 );
++        assert( pExpr->x.pList==pFJMatch );
++        assert( pFJMatch->nExpr>0 );
++        pExpr = pFJMatch->a[0].pExpr;
++      }
++      if( pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER ){
++        sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
++      }
+     }
+ #endif
+     /* Increment the nRef value on all name contexts from TopNC up to
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
new file mode 100644
index 00000000000..7dd0f76b6b5
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
@@ -0,0 +1,52 @@
+From 7e76b79f06869f46def99a3ec08d9dfb53a346b1 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 5 Jul 2026 16:06:33 +0000
+Subject: [PATCH] Be sure to invoke the authorizer callback on all terms of the
+ USING clause in a RIGHT JOIN. [bugs:/info/2026-07-05T08:15:45Z|Bug
+ 2026-07-05T08:15:45Z]
+
+FossilOrigin-Name: bbd69ce27462000873af053bfebdd305c53deac85c426b1e7dbd927b5f17d622
+
+CVE: CVE-2026-119377
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/7ff247c5b9ead3ad8a69c26d3fd264878e127237]
+
+Backport Changes:
+- Applied the src/resolve.c change in sqlite3.c because the Yocto
+  sqlite-autoconf source uses the amalgamated layout.
+- Omitted test/auth.test because the extracted recipe source lacks the
+  upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are repository
+  metadata and are not needed in this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index d777811056..9338328be5 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -107077,13 +107077,16 @@ lookupname_end:
+ #ifndef SQLITE_OMIT_AUTHORIZATION
+     if( db->xAuth ){
+       if( pFJMatch ){
++        int ii;
+         assert( pExpr->op==TK_FUNCTION );
+         assert( sqlite3_stricmp(pExpr->u.zToken,"coalesce")==0 );
+         assert( pExpr->x.pList==pFJMatch );
+         assert( pFJMatch->nExpr>0 );
+-        pExpr = pFJMatch->a[0].pExpr;
+-      }
+-      if( pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER ){
++        for(ii=0; ii<pFJMatch->nExpr; ii++){
++          assert( pFJMatch->a[0].pExpr->op==TK_COLUMN );
++          sqlite3AuthRead(pParse, pFJMatch->a[0].pExpr, pSchema, pNC->pSrcList);
++        }
++      }else if( pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER ){
+         sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
+       }
+     }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch
new file mode 100644
index 00000000000..b67cb32b8c6
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch
@@ -0,0 +1,51 @@
+From a98f25c8a88d1e0e24f677279ac90b30567f93ee Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 24 Jul 2026 14:53:59 +0000
+Subject: [PATCH] Fix a bug in the check-in [bbd69ce274620008] causing that
+ bug-fix check-in to fail to completely fix the original bug.  This fix is in
+ response to the follow-up report at [bugs:/info/2026-07-24T02:52:08Z|Bug
+ 2026-07-24T02:52:08Z].
+
+FossilOrigin-Name: 2cb22877683680c1f89bcc9edb47bd1a4a8755d4a6b846a1a20136a657dacdcc
+
+CVE: CVE-2026-119377
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5694c3bb2a6a40770ecd2f65910eea756734dfd8]
+
+Backport Changes:
+- Applied the src/resolve.c correction to sqlite3.c because the Yocto
+  recipe source uses the amalgamated SQLite layout.
+- Omitted test/auth.test because the extracted recipe source lacks the
+  upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed in the source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 9338328be5..7761d83d08 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -107077,14 +107077,13 @@ lookupname_end:
+ #ifndef SQLITE_OMIT_AUTHORIZATION
+     if( db->xAuth ){
+       if( pFJMatch ){
+-        int ii;
+         assert( pExpr->op==TK_FUNCTION );
+         assert( sqlite3_stricmp(pExpr->u.zToken,"coalesce")==0 );
+         assert( pExpr->x.pList==pFJMatch );
+         assert( pFJMatch->nExpr>0 );
+-        for(ii=0; ii<pFJMatch->nExpr; ii++){
+-          assert( pFJMatch->a[0].pExpr->op==TK_COLUMN );
+-          sqlite3AuthRead(pParse, pFJMatch->a[0].pExpr, pSchema, pNC->pSrcList);
++        for(i=0; i<pFJMatch->nExpr; i++){
++          assert( pFJMatch->a[i].pExpr->op==TK_COLUMN );
++          sqlite3AuthRead(pParse,pFJMatch->a[i].pExpr,pSchema,pNC->pSrcList);
+         }
+       }else if( pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER ){
+         sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 926f8223fd0..84d67ce977f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -13,6 +13,10 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119373.patch \
            file://CVE-2026-119374.patch \
            file://CVE-2026-119379.patch \
-"
+           file://CVE-2026-119377-dependent_p1.patch \
+           file://CVE-2026-119377-dependent_p2.patch \
+           file://CVE-2026-119377_p1.patch \
+           file://CVE-2026-119377_p2.patch \
+          "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
