Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27739.1793856392225095439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EFZD6ohC;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4016; q=dns/txt;
  s=iport01; t=1793856392; x=1795065992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vfRwK+kzNvG1i3bofr1KCKvq0119ps+NMgWCVeh+Fyc=;
  b=EFZD6ohCbfnhpLj0Z6aSL6/0CqISwJ553SWwlzauPjTwTQrVZ4alYK+w
   dNN0u44fsLeomnIjyKTqUcbC0Wlo964tYTPMyGrP6ZEr79+vygbfvFNpe
   dzxuIbhn4E0Dr5ySErAIAaDt4ctjQyQuw2FSAODDJ5D+72V6jvvRosJ4x
   CboooMm0CxUwBX2VaI/+agOD/porYzfEjYiJ1jkA0y6Psr/TT8Ohz+OAF
   q3M8xuCN9v6NmG40Et2g5Nutx+E9P03SOmG4mxJgFjaMgbGk1vfW11qt3
   8feC2h4b/5OrTUTMM9QMt26MIOSU/sutU6XS1usX2KaKPJy6T/G3Ad0wS
   w==;
X-CSE-ConnectionGUID: G9OSEDb6Rh6A2b9rczhpiw==
X-CSE-MsgGUID: RY7SPHyZT/eQztd9uoHHaw==
X-IPAS-Result: =?us-ascii?q?A0AaAACDEuxq/47/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWZ4kgX4PAQEBD0QNBAEBhD9Gjh8CJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECW?=
 =?us-ascii?q?iMhgwIBgnQDEbw6gXkzgQGCZkMBPwJDUNlLgWgBCxQBBYEzAYU/ModxXRgBh?=
 =?us-ascii?q?H0nG4FJRIR+gQWBXAEBiCYEgy6BWo0YAoFShnBIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FH?=
 =?us-ascii?q?CZAGwoYGA1IESw3FRkEPm4Hki+DEQGBDQErgQVAYhajRIIhoRGEKoFoijyVO?=
 =?us-ascii?q?hozhVulFguYfY4KllGEaYFoPEaBAQsHMxoIGxWDIglKGQ+OKwMLC4NggX+DF?=
 =?us-ascii?q?MlEJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:7hFHtKO7X9WCeZ/vrR3zlsFynXyQoLVcMsEvi/4bfWQNrUohhWcEx
 zQXXGGFOPzbNDf1c9ByPIri80sF6MCGyocyGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69o/K3obEYdGwOYpKDtEp
 OYTOjAVbw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIJskhOa0nnDXeDxDo1XTrq0yi4TW5FEtjOezaoGLJrRmQ+1vrxmjn
 kLXzVi+DygIKNDO1D2l0nuz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:CwDCwK1rZeYx//Zf0FADywqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AplL/B2pfZCyyPnBAUdylnG3mUe90VUbw4H2OGU/?=
 =?us-ascii?q?mIDxjGaeeW1+I+bwxxg=3D=3D?=
X-Talos-MUID: 9a23:Me+UMQWCRAAfia3q/AXd2wpaFNZa3+OjMVIRncQbvOmkPDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544762364"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:26:31 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 2564E18000223;
	Thu,  5 Nov 2026 05:26:31 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id C7A90CC2EF1; Wed,  4 Nov 2026 21:26:30 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 03/10] sqlite3: fix CVE-2026-119374
Date: Wed,  4 Nov 2026 21:26:28 -0800
Message-Id: <20261105052628.2443928-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249421
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which addresses an FTS5
secure-delete buffer overrun when handling a corrupted database.
The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9
[2] https://sqlite.org/src/info/9cd4f9e920

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119374

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 76 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 0000000000..e82f48951b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,76 @@
+From 260a971baff8140195c181b94ce2264efbb042b9 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Tue, 11 Aug 2026 14:16:12 +0000
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lead to a
+ buffer overrun when dealing with a strategically corrupted database. Problem
+ reported by YEONBA.
+
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388ff799969c31
+
+CVE: CVE-2026-119374
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9]
+
+Backport Changes:
+- Applied the fix from ext/fts5/fts5_index.c to sqlite3.c because the
+  recipe uses SQLite's amalgamated source.
+- Omitted ext/fts5/test/fts5corruptB.test because the extracted source
+  does not include the upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index bfd285777d..1889632086 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -252752,32 +252752,36 @@ static void fts5DoSecureDelete(
+   if( p->rc==SQLITE_OK ){
+     const int nMove = nPg - iNextOff;     /* Number of bytes to move */
+     int nShift = iNextOff - iOff;         /* Distance to move them */
+-
++    int nNewPg = 0;
+     int iPrevKeyOut = 0;
+-    int iKeyIn = 0;
++    i64 iKeyIn = 0;
+ 
+     memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     iPgIdx -= nShift;
+-    nPg = iPgIdx;
++    nNewPg = iPgIdx;
+     fts5PutU16(&aPg[2], iPgIdx);
+ 
+     for(iIdx=0; iIdx<nIdx; /* no-op */){
+       u32 iVal = 0;
+       iIdx += fts5GetVarint32(&aIdx[iIdx], iVal);
+       iKeyIn += iVal;
++      if( iKeyIn>nPg ){
++        FTS5_CORRUPT_IDX(p);
++        break;
++      }
+       if( iKeyIn!=iDelKeyOff ){
+         int iKeyOut = (iKeyIn - (iKeyIn>iOff ? nShift : 0));
+-        nPg += sqlite3Fts5PutVarint(&aPg[nPg], iKeyOut - iPrevKeyOut);
++        nNewPg += sqlite3Fts5PutVarint(&aPg[nNewPg], iKeyOut - iPrevKeyOut);
+         iPrevKeyOut = iKeyOut;
+       }
+     }
+ 
+-    if( iPgIdx==nPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
++    if( p->rc==SQLITE_OK && iPgIdx==nNewPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
+       fts5SecureDeleteIdxEntry(p, iSegid, pSeg->iLeafPgno);
+     }
+ 
+-    assert_nc( nPg>4 || fts5GetU16(aPg)==0 );
+-    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nPg);
++    assert_nc( nNewPg>4 || fts5GetU16(aPg)==0 );
++    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nNewPg);
+   }
+   sqlite3_free(aIdx);
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 52e7659a8e..f76ca8bd56 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -14,4 +14,5 @@ SRC_URI += "\
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
+	file://CVE-2026-119374.patch \
 "
-- 
2.35.6

