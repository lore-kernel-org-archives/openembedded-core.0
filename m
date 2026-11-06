Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2177.1793955248827567715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=c8Pw56Yx;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12677; q=dns/txt;
  s=iport01; t=1793955249; x=1795164849;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iGa10oGkq6zAM0NHV9JV/nC15jfoMu4pdqq6PD+9WPI=;
  b=c8Pw56YxAzOEmoDLJZZw8XNGS8WThoCb7pfqVNKrjEuQyLACqhXeJW+p
   5yBtpvp8T4pcY7NWEWakf/8uBbvBABk+NfUeKAiKZkj9f/i+3OWUcUFzj
   epKwPh6AY7jkf1ed8YqmfMz5I/dmyHLzbdItlRrMroRBzc3cr4LTp/ZIQ
   USEqKMHK0Jx2ZlbbJPVTA0Q5iicnDIVr8CSi+bmk6zDPYc0/+C8FQgDhr
   OxdxuVoPnhLbupzzvHhxBSeYI3Pdf4AnWEbc0wSZNPlIQ5ZmeXv0tWJ6T
   URS4RqsgQemKxRrOQFDuvAo7en0SVanTxt4C7Yfm74dJRLVXBB5718lfe
   g==;
X-CSE-ConnectionGUID: 6JlhplkFTPCfLgkptq+Grg==
X-CSE-MsgGUID: GH4vWxZoTWWq4Vy3/ZhDZQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgBUle1q/5D/Ja1aHgEBCxIMggULgld1YENJlkueJ?=
 =?us-ascii?q?IF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDAQJaIyEJgnkBgnQDEbwGgXkzg?=
 =?us-ascii?q?QGCZkMBPwJDUNlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhH6BBYFcAQGIJ?=
 =?us-ascii?q?gSDHBKBWh6GIoZYAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3F?=
 =?us-ascii?q?RkEPm4Hkj2DCwYBAXoTAQcjAXsdcDU6owqCIaERhCqBaIo8lToaM4VbpRYLm?=
 =?us-ascii?q?H2OCpZRhGmBaDyBRwsHMxoIGxWDIglKGQ+OLgsLg2CBf4MUxn0mMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:k4G4T6zAYqaP8rnmS/V6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUGz
 WNMD2vVPPrYYWv9etgkYI63phtU6sCGmNdrTVRq/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJB8UOY0A/uVZPVll+
 9gXKygRd1Osne3jldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tO6ynnjjazRwo1OOrq1x6G/WpOB0+OWxbIuFJ4LSGq25mG63h
 j7YwHTLBS0lC8XD9yvetUCsqt32yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:phA+GqmQFkBJLxmvblVpmESDEebpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AFU+46Gt56AjMrT+cVXQ9tWDL6It7UHnd1HPTDXO?=
 =?us-ascii?q?AImhNR76NVUbT17lrxp8=3D?=
X-Talos-MUID: 9a23:f0iucglKM9Ty3QPcI9eAdnpNFJt23LScD3wyroxahdjfch5wFwWk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544985607"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:07 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 93E50180003EF;
	Fri,  6 Nov 2026 08:54:07 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 3DE69CC2EF1; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 01/10] sqlite3: Fix CVE-2026-119377
Date: Fri,  6 Nov 2026 00:53:56 -0800
Message-Id: <20261106085405.3517095-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249619
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
 .../CVE-2026-119377-dependent_p2.patch        | 59 +++++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   | 52 +++++++++++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   | 51 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  4 +
 5 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
new file mode 100644
index 0000000000..bdeb32da04
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
index 0000000000..e8a89898d4
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
index 0000000000..7dd0f76b6b
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
index 0000000000..b67cb32b8c
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
index 975f3bdab8..5a87ad4c6f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -10,6 +10,10 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
+           file://CVE-2026-119377-dependent_p1.patch \
+           file://CVE-2026-119377-dependent_p2.patch \
+           file://CVE-2026-119377_p1.patch \
+           file://CVE-2026-119377_p2.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

