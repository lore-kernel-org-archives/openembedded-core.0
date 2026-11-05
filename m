Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27881.1793856142226079723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GIjEIBK+;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12589; q=dns/txt;
  s=iport01; t=1793856142; x=1795065742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5YV5xuh2kniFNw8zGYjmXF0r92SQpdSyWVVd0RsnXOE=;
  b=GIjEIBK+bYoQRTb6S6YCIEzawgs6zrnEmutTAMJbsuczD4/y2l/PK8UT
   BxWblIevcX35A+eHo5bif9G31zQlm38tUWla7H63IGffFuWFZQLVNTgaA
   AMvjN86u7r9ERHTekGRoQlRM7vDHb144B+ba31P1M847i4EoQTg4t1W6o
   cF5ZGmsvhaxiIHCcHmapQBcFSR43fKK81XoRgUx6HZdIj8S4Ll9B51xX9
   c9rU2yi6259vQGaI1Sl71okEQ10kvdINmtr6g2ZhUQQlBECVhMZvLeJ3i
   WfjmcRiuWxZlMkFN0lfBYWE88bt8IR/TBTzKs51CQ5p0CGroHmtaVWPH6
   w==;
X-CSE-ConnectionGUID: RggySKr8Si6XKAj5LEtVZw==
X-CSE-MsgGUID: YTH/ADC2Q4aXbtZkOysW/g==
X-IPAS-Result: =?us-ascii?q?A0AaAACFEexq/43/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWZ4kgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBKgsBGAEtLAMBA?=
 =?us-ascii?q?lojIYMCAYJ0AxG8OoF5M4EBgmZDAT8CQ1DZS4FoAQsUAQWBMwGFPzKHcV0YA?=
 =?us-ascii?q?YR9JxuBSUSEfoEFgVwBAYgmBIMugVqGQIZYAoFShnBIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJ?=
 =?us-ascii?q?C8FHCZAGwoYGA1IESw3FRkEPm4Hki+DCgYBAVgiEwEHJHsdcDU6owqCIaERh?=
 =?us-ascii?q?CqBaIo8lToaM4VbpRYLmH2OCpZRhGmBaDyBRwsHMxoIGxWDIglKGQ+OLgsLg?=
 =?us-ascii?q?2CBf4MUyUQmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:66/d/KmU3HD6W79jlnvmRojo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWX2qEbqmKNDekKtB1aYizoUoAuJWAndY3GVQ9/3szHltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbcX9fdMInsez
 v1GGBMkbE2nqv6I8q3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYz/7C7pm9AusrnDlazxEsFu9rqss6G+Vxwt0uFToGIeJJoDWGZoIxy50o
 Er3w0S+Kz0xbuXDwAqP7kCvof7UomT0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:CX3We6DzBV+ymR7lHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3A7pUOKmu68oVnlxhH5idcpPkO6IsffXLM91TKc3S?=
 =?us-ascii?q?5V1ZKYb/IbXKMxpF7xp8=3D?=
X-Talos-MUID: 9a23:h4ZSTgZ1LG1yh+BThgPMwxhOH51Rv62eAlw/krIXoPbDOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544444751"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:22:21 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 0C6D718000182;
	Thu,  5 Nov 2026 05:22:21 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id A6C8BCC2EF1; Wed,  4 Nov 2026 21:22:20 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 01/10] sqlite3: Fix CVE-2026-119377
Date: Wed,  4 Nov 2026 21:22:19 -0800
Message-Id: <20261105052219.2439458-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249419
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
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  4 +
 5 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
new file mode 100644
index 0000000000..7fdcc9b99d
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
index 0000000000..e2f8320963
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
index 0000000000..1cecb49416
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
index 0000000000..743e6ba8b1
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
index 2b0a9c0e4d..2f82176913 100644
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
-- 
2.35.6

