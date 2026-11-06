Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2177.1793955248827567715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jQ71jls+;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2871; q=dns/txt;
  s=iport01; t=1793955249; x=1795164849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5jXhlhKdSDJumgOn4Xg2ojQ3iiiZywaLTqF0xHSfViA=;
  b=jQ71jls+n6s9QDRghaCcSi4qRLmRix78bECr63KTeK6xwafd39GvXaPC
   Ks439IrYXT/T8T0vEF/1ZqZ/wio0tAvGrWpWGyieq5PEhjwTubnXHuktu
   WI1CK0e0IJ+gSEMh7iheiQmtJuUz09XCxPt8Djq7qgxd6V3iZ4qLyReLU
   IwLydv3pbD3asULZjtB51HRo7dRkVRdPqdh8pCoDFZ7XGriUWMAoxZA/a
   WT8hWDjyVtS5ig7rfW+Q6Cq1ki8pdHFBthHyFBlgqEF/ZIjL5YHxE0Sj4
   OI8pzkt3SATXGNsqD+d0W+UeSJ5shxAb7+NKbSz98FizthTRuOpOHw077
   g==;
X-CSE-ConnectionGUID: aGcNW6QnR8C2QAKHLzuMCw==
X-CSE-MsgGUID: WPSY3zaAROq7wklMspRUoA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBUle1q/5D/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZCYJ5AYJ0AxG8BoF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhH6BBYFcAQGCLYV5B?=
 =?us-ascii?q?IMcEoFaHox6AoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkj2DEQEBgQ0BKgGBQ3oroxmCIaERhCqBaIo8lToaM6pxC5h9jgqWUYRpg?=
 =?us-ascii?q?Wg8gUcLBzMaCBsVgyIJShkPji4LC4NggX+DFMZ9JjICCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:ru7etaD4XmJVjBVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGgkhGQCz
 TRMUW2POfaOMTOjet4ga4Xl80hU75TWmoRmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEytplKn5oBIsiqs0tOEht1
 dgKNRUmcUXW7w626OrTpuhEnM8vKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYzBPjDS0Un1lM/AYgmnfuwj1H0ciZTrxSeoq9fD237kVAtgeiwboOPEjCMbfptpXfDt
 GvvxUPgXQ4ZMPmE0QC49Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7NV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:JtIo467J2rEyhdr6pAPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:DEhoWG+Ok9LM44UF2zaVv0c7EeYaLETb9if7eXaRKkZNWqCwYkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AmC03hwxemr92mdCJ48NOUDoQA/uaqJuWM3FWg5w?=
 =?us-ascii?q?vge6dajNzPxKGlA6KRaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544985612"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:08 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 06F7D180003CF;
	Fri,  6 Nov 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 646C3CBEF83; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 10/10] sqlite3: fix CVE-2026-119591
Date: Fri,  6 Nov 2026 00:54:05 -0800
Message-Id: <20261106085405.3517095-10-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249621
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1] for stack exhaustion in the
count-of-view optimization. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2
[2] https://sqlite.org/src/info/ab621a3e11ee4acc

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119591

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119591.patch      | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 0000000000..3162d7af45
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 5dbe255431ad2b935db31e8e3c2c66284e2709ef Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 12:18:23 +0000
+Subject: [PATCH] Prevent the expression generated by the count-of-view
+ optimization from getting too deep and causing a CPU stack overflow.
+ [bugs:/info/2026-10-04T05:34:47Z|Bug 2026-10-04T05:34:47Z]
+
+FossilOrigin-Name: ab621a3e11ee4accce14bf6c90a7cc273d9c25a7c3d9dd2466f2bdc2bbbf8084
+
+CVE: CVE-2026-119591
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2]
+
+Backport Changes:
+- Ported the src/select.c change into the amalgamated sqlite3.c.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source layout.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 27b3bff8ea..788e23a839 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -149172,6 +149172,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
+     }else{
+       pExpr = sqlite3PExpr(pParse, TK_PLUS, pTerm, pExpr);
+     }
++    if( pParse->nErr ){
++      sqlite3ExprDelete(db, pExpr);
++      pExpr = 0;
++    }
+     pSub = pPrior;
+   }
+   p->pEList->a[0].pExpr = pExpr;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index da12a6194a..3b682613c3 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119376.patch \
            file://CVE-2026-119371-dependent.patch \
            file://CVE-2026-119371.patch \
+           file://CVE-2026-119591.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

