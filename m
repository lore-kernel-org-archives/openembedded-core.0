Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3330.1794374735166642856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y2S88M6g;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12843; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YIxuvdqWtCdsMKXotK+mPdAzGMdhJqb+dbrOU/5UaZk=;
  b=Y2S88M6gj256xO3G+2XSyvzhTrAXkUGxGGFIjKDhvLeMMSfcg/GMciju
   5ADtWNXcmKcyLy1GWswBNPRYxZdmQcWWeeagK3gfZpNWyXFJ2RwgggqVD
   7R15YoaEDT2Lhw1IXsLMhbOd7ra6wx7Ue853bbs+V1h2I4WmeTB4zczV2
   +x7JKZ8TUnvLCj2rpoPKA35zganRygwjsBp9jeWrfL7+HouX6hpHCzLx3
   e61fh3nRbphUy0tUAmLsPgebxzNDgzRIExftVWb2bDSWmSIa1m0X5fRqg
   d85guq8D3KyI1D2xa9k5FF54N5T57vzn43RWRfCoQgWNyGQ4wTjcbRHFW
   w==;
X-CSE-ConnectionGUID: pr1tVwlkQgSWGHBZI3OKzg==
X-CSE-MsgGUID: NUj1NXBYR/aujUA5LZmkmw==
X-IPAS-Result: =?us-ascii?q?A0AaAAAG+/Nq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWZ4lgX4PAQEBD0QNBAEBhD9GAo4eAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBA?=
 =?us-ascii?q?lojIQmCeQGCdAMRuVaBeTOBAYJmQwE/AkNQ2UuBaAELFAEFgTMBhUEyh3JdG?=
 =?us-ascii?q?AGEfScbgUlEhH6BBYFcAQGIJgSDLoFaHoYhhlsCgU+HJUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjPheBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQM?=
 =?us-ascii?q?B4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSboMOBgEBWCITAQcjAXsdcDU6owqCI?=
 =?us-ascii?q?aERhCqBaIo8lToaM4VbpRcLmH2OCpZRhGqBaDyBRwsHMxoIGxWDIglKGQ+OL?=
 =?us-ascii?q?gsLg2CBf4MUyUgmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:qiRQ9qhSmXPSPf5ZdSKaFvh4X161NhEKZh0ujC45NGQN5FlHY01je
 htvUTiDb/feYmb9LYhxb4vloB8H7ceAmtRmTVY5+HwxRC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvva8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUA4L9rP35K9
 sUXEw8iTjqxprmR46C0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg5/5JEWxI9EglH2aSVZtEqcjaE2+GPUigd21dABNfKIJoLRHZsFwx/wS
 mTu2Vn7WzcqHu2ljjOY8E+F28v9mCD+R9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:M4fK0q1UvD7AnBaxEo7jZQqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:2ISJRmGAz9W58OGSqmJ/7hcIJN8hcUTS90j/A2WKKD1Oa6+aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ATWAgAgxG+b0GV9yh45lw7XyepnWaqIKTChkrob8?=
 =?us-ascii?q?3gY6NKC5NEmq5vjG0R5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546306851"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 0C7D3180001AE;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id A52DECC2EF1; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 01/10] sqlite3: Fix CVE-2026-119377
Date: Tue, 10 Nov 2026 21:25:23 -0800
Message-Id: <20261111052532.1258975-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249942
Content-Type: text/plain; charset="utf-8"

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
---
 .../CVE-2026-119377-dependent_p1.patch        | 86 +++++++++++++++++++
 .../CVE-2026-119377-dependent_p2.patch        | 61 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   | 52 +++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   | 51 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  8 +-
 5 files changed, 256 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
new file mode 100644
index 0000000000..57f44bc645
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
+index 0644a39..6a795f7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -111320,9 +111320,7 @@ lookupname_end:
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
+@@ -126468,8 +126466,14 @@ SQLITE_PRIVATE void sqlite3AuthRead(
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
+@@ -126483,7 +126487,7 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
+   ** or if the parser is being invoked from within sqlite3_declare_vtab.
+   */
+   assert( !IN_RENAME_OBJECT || db->xAuth==0 );
+-  if( db->xAuth==0 || db->init.busy || IN_SPECIAL_PARSE ){
++  if( IN_SPECIAL_PARSE ){
+     return SQLITE_OK;
+   }
+ 
+@@ -126508,6 +126512,19 @@ SQLITE_PRIVATE int sqlite3AuthCheck(
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
index 0000000000..121424308e
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
@@ -0,0 +1,61 @@
+From 4ad8d0b4f4de75182a835bfadf0dc14c1c8c1a70 Mon Sep 17 00:00:00 2001
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
+ sqlite3.c | 17 +++++++++++++---
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 6a795f7..9353a03 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -111237,7 +111237,7 @@ static int lookupName(
+   ** cnt>1 means there were two or more matches.
+   **
+   ** cnt==0 is always an error.  cnt>1 is often an error, but might
+-  ** be multiple matches for a NATURAL LEFT JOIN or a LEFT JOIN USING.
++  ** be multiple matches for a NATURAL OUTER JOIN or a OUTER JOIN USING.
+   */
+   assert( pFJMatch==0 || cnt>0 );
+   assert( !ExprHasProperty(pExpr, EP_xIsSelect|EP_IntValue) );
+@@ -111320,9 +111320,18 @@
+   if( cnt==1 ){
+     assert( pNC!=0 );
+ #ifndef SQLITE_OMIT_AUTHORIZATION
+-    if( db->xAuth && (pExpr->op==TK_COLUMN || pExpr->op==TK_TRIGGER) ){
+-      sqlite3AuthRead(pParse, pExpr, pSchema, pNC->pSrcList);
+-    }
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
++    } 
+ #endif
+     /* Increment the nRef value on all name contexts from TopNC up to
+     ** the point where the name matched. */
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
new file mode 100644
index 0000000000..4ab2f652bf
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
+index 9353a03..411a39a 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -111322,13 +111322,16 @@ lookupname_end:
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
index 0000000000..827d5fe750
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
+index 273ef4a..6130466 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -111322,14 +111322,13 @@ lookupname_end:
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 007a823dc5..c7c081b393 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -20,8 +20,12 @@ S = "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
 B = "${WORKDIR}/build"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"
-
+SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
+	file://CVE-2026-119377-dependent_p1.patch \
+	file://CVE-2026-119377-dependent_p2.patch \
+	file://CVE-2026-119377_p1.patch \
+	file://CVE-2026-119377_p2.patch \
+"
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
-- 
2.35.6

