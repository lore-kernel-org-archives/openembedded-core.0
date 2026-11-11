Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3331.1794374735405499012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VGCO8994;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4810; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KuFJzfQ+JGmOGk7By8RkrrZyU4zv8FSXH+dGlyOBQyU=;
  b=VGCO8994fFUTDPqj1lFOhuXNFh5p+EjZiPIeN01b3AaxI0aQom6vfhoC
   B34QlQHqZwthMdNpc7wVxgJABrjJlX9FmfTLEwaWGt802/9zpDdkio9yt
   li145s8/kiYh6b51YiXNZgCIGBQ+M3dhLgyQgqptmBTWS+UEPBUmEzDzf
   0X3xZREWFPKQHrT5T1P2RkHzUUF4Jzyd7rq9frOfE/W5m2UuqE8MqqLMY
   fMhZv2a9fOKQjkbyUwNcrPyRg0bACgO1qID9m13qlRJ+K9hsQjeDfifud
   Lw/jmS0sxNsyMUTlNBOfTrxVSRzRgoqbT7adOqKtiNOWmkWu5bKesTbDn
   w==;
X-CSE-ConnectionGUID: 0y8YjfvCSMuH/gsu3/2Nsg==
X-CSE-MsgGUID: 5iV5rabnRu6LGICQrWb65w==
X-IPAS-Result: =?us-ascii?q?A0AnAAAG+/Nq/5P/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIoF+DwEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rI?=
 =?us-ascii?q?wgZgwIBgnQDEblWgXkzgQGCZkMBPwJDUNlLgWgBCxQBBYEzAYVBModyXRgBh?=
 =?us-ascii?q?H0nG4FJRIJQgi6BBYFcAQGBOIZuBIMcEoFajRoCgU+HJUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjPheBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQM?=
 =?us-ascii?q?B4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSboMCEwFYNQErgj2jRIIhoRGEKoFoi?=
 =?us-ascii?q?jyVOhozhVulFwuYfY4KllGEaoFoPIFHCwczGggbFYMiCUoZD44uCwuDYIF/g?=
 =?us-ascii?q?xTJSCYyAgkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:M6/IWaOLpYLvfxLvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoq1jxVy
 jBNUDiOOq3eNjbxKdxxPtvj8BhUvpWDztJkQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gmcsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj661/XHA0M5MzwcNqISZB7
 uFDb2ordR/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJskhOa0nnDXeDxDo1XTrq0yi4TW5FEtjue8b4eEKrRmQ+0In3jFv
 GvM+V7kXDU1Ffem0wWPrC+z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:erdmpa0dTS71b6bUJpGArQqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:DF+HK2FUvJm3H0VRqmI/5R4lGM47WUb40VeXLFSlUiEzbqaaHAo=
X-Talos-MUID: 9a23:g2fTFgthc/4RM7I+I82n2TBcad1h6aKUFR4pvrQtgtO7P3ItJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546797598"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 74B551800025B;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id C461ACBF23E; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 08/10] sqlite3: fix CVE-2026-119376
Date: Tue, 10 Nov 2026 21:25:30 -0800
Message-Id: <20261111052532.1258975-8-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249947
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which includes COLLATE
expressions in expression tree depth calculations and prevents bypass
of the expression depth limit. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d54522a5b832422ab893a1e9fa7a99ab314ea4e2
[2] https://sqlite.org/src/info/252c0b7bf5a727d2

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119376

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119376.patch      | 75 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
new file mode 100644
index 0000000000..5a6bc97259
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
index 1aea7cb374..06cd34818f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
+	file://CVE-2026-119376.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

