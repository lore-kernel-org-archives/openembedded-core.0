Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2177.1793955248827567715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Aud04IVe;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4293; q=dns/txt;
  s=iport01; t=1793955248; x=1795164848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C3wlhUPDCMwQIhpEcXI63pbn+mxVxF9lVfDs9Ue7IOw=;
  b=Aud04IVeBxpbFqzlWaamUsf/tUwpPqgSWIfpoQa/ZFI3bK7Pm1s9tg86
   XtjorJ5moOF6uyECv5A+Qj1MwIUNQ/HywYmfVfrnpJtDVtWA3tzvzqFC7
   MAKsbphG8te061Oufk0Gya5TTVPVNmoOQOii3ygVH9B/s3dEX7d1JGAGB
   2/GvUIqxM32WqTaQuaMLmN2kPYxAclQOU8PdfiCOlYrZRRnBcr8uXSaMz
   GwMj2m+74PgdGTm/2ZlLZhp8X6MOpH2SzvDwAhHdEjF3gvTH4Mu0px8/q
   CBCvvcYFn0qwKuMGvw2j5QgJKD3S65U4JILzGUViv8uUEXkevQJLvi+Ln
   Q==;
X-CSE-ConnectionGUID: o6TTV883R9Kli0oprd3t9w==
X-CSE-MsgGUID: aWmJbH7MRLiNx9Y4NYNsyA==
X-IPAS-Result: =?us-ascii?q?A0AnAABUle1q/5H/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rI?=
 =?us-ascii?q?wgZCYJ5AYJ0AxG8BoF5M4EBgmZDAT8CQ1DZS4FoAQsUAQWBMwGFPzKHcV0YA?=
 =?us-ascii?q?YR9JxuBSUSEfoEFgVwBAYgmBIMcEoFaHox6AoFRhnlIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FHCY+GwovGA1IESw3FRkEPm4Hkj2DEgE8UQEqAYEFQGIWo0SCIaERhCqBa?=
 =?us-ascii?q?Io8lToaM4VbpRYLmH2OCpZRhGmBaDxGgQELBzMaCBsVgyIJShkPjisDCwuDY?=
 =?us-ascii?q?IF/gxTGfSYyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:gqCiXqlHCiZZicsPSAvfvmLo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWGrTOPyLMWPze993Ot6+90NS7JCDydNlQAE5pCw2RFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYpGxtpJUTEVz
 607LDFVaQiZi7mqka3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZz/7C7pm9AusrnDlazxEsFu9rqss6G+Vxwt0uFToGIeJJo3aGJsNzy50o
 ErPwGHbCDFFEea7yByVo0PwoN7phjLSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:hXLbDq4liktXvUP1fgPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:4954FG2QlfFv14iij0EveLxfHZ4ZTkONnCzqcmy8CD5uUKeZEkPB5/Yx
X-Talos-MUID: 9a23:6bA41wXKIxl3R4/q/DbTgRNoFJhN2YCvLlBcoMkgiu+fJAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544985609"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:07 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 9B0F9180001E4;
	Fri,  6 Nov 2026 08:54:07 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 477FBCBF22F; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 03/10] sqlite3: fix CVE-2026-119374
Date: Fri,  6 Nov 2026 00:53:58 -0800
Message-Id: <20261106085405.3517095-3-arpitpa@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249614
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
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 78 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 0000000000..cf4dd9cb32
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,78 @@
+From 6875e24f0c0612feccb97ab4c3f92c8444833373 Mon Sep 17 00:00:00 2001
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
+- Used p->rc = FTS5_CORRUPT; because current version of SQLite does
+  not define the newer FTS5_CORRUPT_IDX(p) helper.
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
+index 9d5790a0d9..a397e4d36b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244270,32 +244270,36 @@ static void fts5DoSecureDelete(
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
++        p->rc = FTS5_CORRUPT;
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index c591db4eaf..0476c71cae 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377_p1.patch \
            file://CVE-2026-119377_p2.patch \
            file://CVE-2026-119373.patch \
+           file://CVE-2026-119374.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

