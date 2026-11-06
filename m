Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2129.1793955248950874260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pe65n5XT;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4833; q=dns/txt;
  s=iport01; t=1793955248; x=1795164848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=laSJCytpL/IPxBP+TRrOSD0M5ot6aiwORfU7uK92KL4=;
  b=Pe65n5XT4Ef1bYtzXGZdJn2U2lumf9DzYJKYnnhjCiCVSSaq2aERZYXo
   2zNPTwuOvA+u4a2FPRzb+YSyc10YUOzn0TUaVpfMrQtGFWN7jhI2NdIb3
   6kI7+k+zZlpXdCgW5R+FqogKhNwV+j+RR+ISSdsAXZDULBTXXOaJwdDWA
   XFrzeNtTk2lG1txKKqKQ6f9T1c5wdjTD+aNfhsbbpX4I8OhQHvZQv6/zi
   ynUC1nRTiWL6paiwMU6U1fApOG934xx+iyIezPGvsBGq5oDgjbq46rBGD
   Yq3DkFYcQDe51sDuLLYQddIzFJHv0PIBDL7JoF0MXovaSpFtOs8/b7Zeo
   Q==;
X-CSE-ConnectionGUID: Q0HrCociQSC3XN99J69KpQ==
X-CSE-MsgGUID: feOwt5+zQSasY7plFkMPLg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBxlO1q/5H/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iGBfg8BAQEPRA0EAQGEP0YCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGQmCeQGCdAMRv?=
 =?us-ascii?q?AKBeTOBAYJmQwE/AkNQ2UuBaAELFAEFgTOFQDKHcV0YAYR9JxuBSUSCUIIug?=
 =?us-ascii?q?QWBXAEBgTiGbgSDHBKBWh6MegKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKL?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5I9gn8TAYENASoBgj2jRIIhoRGEKoFoijyVOhozhVulF?=
 =?us-ascii?q?guYfY4KllGEaYFoPIFHCwczGggbFYMiCUoZD44uCwuDYIF/gxTGfSYyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:ihsAb6w4gGX/XXy62/56t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUPm
 DMeWG/QOvuJazP8ed0kO96+/EgDvJTTmNViHAc/+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHhuHZcz/e12OFplr
 sw+eWEvMEGgn9vjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tO6ynnjjazRwo1OOrq1x6G/WpOB0+OWxbIWEJYzVFa25mG6Wq
 0XZ4zm6ECghPceuliKB3HGJvsvAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:fUJSvq/zD0rtVlXSEWZuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3AErKs0GoLHcnTepru3Ut0FCXmUfl9Umf2y3zRGnS?=
 =?us-ascii?q?TUlZPGey3Fw6z4Joxxg=3D=3D?=
X-Talos-MUID: 9a23:O1ncRwhwkwuQ8FW6sh+NscMpOspP/LjzS1I0qpwdipacMQJzHg+5g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544797878"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:08 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 058CF180001C5;
	Fri,  6 Nov 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 5BFF3CBF23E; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 08/10] sqlite3: fix CVE-2026-119376
Date: Fri,  6 Nov 2026 00:54:03 -0800
Message-Id: <20261106085405.3517095-8-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249616
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
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
new file mode 100644
index 0000000000..975054e843
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
index 2ad46aa5f2..761087f1a3 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119379.patch \
            file://CVE-2026-119372.patch \
            file://CVE-2026-119378.patch \
+           file://CVE-2026-119376.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

