Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31031.1795560766072188423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=RVUIR3V6;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3907847f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560764; x=1796165564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuaBGKxOv3Fg73XFVGSfXXc7VLQsaznGngTgVN6NsuM=;
        b=RVUIR3V6fsVrpBILj3VHsTYZmaS8T5ZwELKxkCRc5SJj/p22LImDSlVBEIQJ6k8wel
         TN8IinfeiVrGwdK54vSRKlAaB7FJ9UxT9ggOQpOy9OlE1PeizeJA3f883vrrVlXdaiJ1
         hEL5rujSGWMIbsKFgeDZyffX9cSd0r3tRJ+DV3RbSCwUqeO9g+BugqbrVF+ikpjVytIR
         ZL8mu6dO0iwYRKsCqJRkP4HrWoDd1k51s9V/yyfuhTUHa+iOS4zj4S4j3/3ZhVbeVQFq
         EQVbASyG/oC0CeqfKxFmcyFX00MGt7V8FObB/FcrGmOxQ6pcqcIQ11bgiKH3fhn8MQkH
         u9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560764; x=1796165564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuaBGKxOv3Fg73XFVGSfXXc7VLQsaznGngTgVN6NsuM=;
        b=obXqpyxU/dRJsCWjyMa++MHs4F33saJKasCOCddmDwCdTZ/o6nNa4cqt44eC2A/cO6
         rFn9fIJKn8/AvYF4qLaGYclwHxAZbgNdsFgBL/FZXQONc3t7hzFBYTH8LywGAVyjdy6C
         HDDkq/uNr3oEpZamOIYMxCiXQPP5IOPdB3MhQHm/fFJg2KVgKdbfOHh+osNl/XywONBE
         ty542Gl05CHXLunKO34vSRydTV/01jOn6nrLMYoLU0rAIGPFfXf61jWe7ifGOplOlLU5
         /hE0kKTcvyYgVoAOKR/ruAu3fyhDt+YaRY00a53thn0vDT4xa9kAAZCz3v7HqXKEKW8S
         1qrg==
X-Gm-Message-State: APuU4Z/C1q1s9RUhPhc2OLcjxnl7yOllf4/IecsML3/V9DhhHHAMGW/f
	Bx7NKMJqzg0ZAxySjJFLtdbwhoQ/aio3wl637ethP6LibNGvzVpRXz45Sv0VXgJAaVwE5H5fcyq
	JQTM+g7I=
X-Gm-Gg: AZFdTZfGVkqK8uKqLu6WxbvBTEECjs+GcsvAWnDjytGnQiZXiDz4fY1ZWILf+gH4Adf
	vlkg5sMAFcvgJ6vxh3k4517Kauc4eRwFs8SlbBULjD+yLzgysntdF25Di2LO1aM/32LUFxwDo56
	bUPgpn0neUzqBZaR5pH71yfMKTfb47R6ClWGKwrtl3eCpPUPoPHSy39RF5Xk08JGQ7t3K2iwqej
	i+YCGajyAAGdDgtC9AShtAQ9Os7+8jICE2ORqUNfoe2zuiKO9nU2LW1BZ1xIrHuuvmWmvQkHjga
	wy9O/qVpQRwIXDwUFAGTIPviPnFlzH0iXzu0Rol35fqaztYggaaWCnJ4KXXIt31LDx+FDTpqyny
	A1fqP5WDkFK6XPYLaRCs/zSbBE3538ugSOMwuJaYYifN7dqaFTU2u2o01VlRk7qh2masWOLsKa2
	XemoZ7FbDEzjVkOKhqPrrtQVWbw13ibWdX9Bgz8a7jZJ67NzgPIsofPdZlfq0W0gZkf2G29f9n1
	K82kf0RBUNUufGezX72/Cv2MADpg8YOmGjIh6hB+jXQ4NhbYH78GRatUmcMBwv3nV7XOvS0hhhb
	Q1MZ1ISs7+H2hadysdeOFI2cajim+82n4YxVjbJaotIL/qQOaZQu0Rbwq2uHMPuupfrjCG8b6Un
	Z7ku07YATq2VcOLkOpzDIgTL/kalo
X-Received: by 2002:a5d:6f1b:0:b0:4b9:15d1:46c9 with SMTP id ffacd0b85a97d-4b915d146fbmr1661059f8f.5.1795560764153;
        Tue, 24 Nov 2026 14:52:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/21] sqlite3: Fix CVE-2026-119377
Date: Tue, 24 Nov 2026 23:52:20 +0100
Message-ID: <adc9975fcd434effc7aaaf310138c9cd6a2f0da2.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251105
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-119377-dependent_p1.patch        | 86 +++++++++++++++++++
 .../CVE-2026-119377-dependent_p2.patch        | 59 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   | 52 +++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   | 51 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  4 +
 5 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
new file mode 100644
index 00000000000..7fdcc9b99d6
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
@@ -0,0 +1,86 @@
+From fcb432b9952e9ced22fbfaa1ea0bbc7f54c78214 Mon Sep 17 00:00:00 2001
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
+index 2f4b77429f..46dd437d82 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -109962,9 +109962,7 @@ lookupname_end:
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
+@@ -124299,8 +124297,14 @@ SQLITE_PRIVATE void sqlite3AuthRead(
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
+@@ -124314,7 +124318,7 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
+   ** or if the parser is being invoked from within sqlite3_declare_vtab.
+   */
+   assert( !IN_RENAME_OBJECT || db->xAuth==0 );
+-  if( db->xAuth==0 || db->init.busy || IN_SPECIAL_PARSE ){
++  if( IN_SPECIAL_PARSE ){
+     return SQLITE_OK;
+   }
+ 
+@@ -124339,6 +124343,19 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
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
index 00000000000..e2f83209634
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
@@ -0,0 +1,59 @@
+From e6920a57640e0c3d55c74a3dd850516f6a65d838 Mon Sep 17 00:00:00 2001
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
+index 46dd437d82..8370952d5a 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -109880,7 +109880,7 @@ static int lookupName(
+   ** cnt>1 means there were two or more matches.
+   **
+   ** cnt==0 is always an error.  cnt>1 is often an error, but might
+-  ** be multiple matches for a NATURAL LEFT JOIN or a LEFT JOIN USING.
++  ** be multiple matches for a NATURAL OUTER JOIN or a OUTER JOIN USING.
+   */
+   assert( pFJMatch==0 || cnt>0 );
+   assert( !ExprHasProperty(pExpr, EP_xIsSelect|EP_IntValue) );
+@@ -109962,8 +109962,17 @@ lookupname_end:
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
index 00000000000..1cecb494169
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
@@ -0,0 +1,52 @@
+From aa67fa2ce1fa30fc1e13b169419569b487a4df22 Mon Sep 17 00:00:00 2001
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
+index 8370952d5a..fc32ca3c8f 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -109964,13 +109964,16 @@ lookupname_end:
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
index 00000000000..743e6ba8b18
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch
@@ -0,0 +1,51 @@
+From 23726411060f3440cdc3acae57d27e79d34bb116 Mon Sep 17 00:00:00 2001
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
+index fc32ca3c8f..bb908566d4 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -109964,14 +109964,13 @@ lookupname_end:
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 2b0a9c0e4d7..2f821769135 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -9,4 +9,8 @@ SRC_URI[sha256sum] = "81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e
 SRC_URI += "\
 	file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-11822_CVE-2026-11824.patch \
+	file://CVE-2026-119377-dependent_p1.patch \
+	file://CVE-2026-119377-dependent_p2.patch \
+	file://CVE-2026-119377_p1.patch \
+	file://CVE-2026-119377_p2.patch \
 "
