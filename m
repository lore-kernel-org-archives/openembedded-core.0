Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3330.1794374735166642856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i0qBo1s8;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5379; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iyEI8mweewzXXWsqUO+WHzPWm48hsfqk+iIukcbE4cg=;
  b=i0qBo1s80W2/4F6lYpaoScC4dfQP9pBpZrcuJHkC246krpA4VNhT9ed9
   qMVb+I/X3pZaJNTppwbE4mZPigHtdW55htWpTXqxwYHd8MCJ/yc1yNkIv
   om3tsqUvLgnH76AWZPIzR4rmo27AkuOtPwl077Q85LSXGn4InJcuEeb8e
   UKyTw+00wmRAyW1nC5VcfZttm+ns3cLZJPNJD4PocwDxTR7cOy5FCGVKs
   qFlrDuqmT+oF7L4JBfZ7BCRSCkTlYyueQ+VI7iXT+GjhIBivUhwD0l3js
   EJy06Si2vwWWO6WJm2ZD0Jo+yC1M8nzVGqinzVwB+iA+Tdn38CDur+oMg
   A==;
X-CSE-ConnectionGUID: pt7GoCpNR16Jkh31ubQz3w==
X-CSE-MsgGUID: 8K05nqK8SU2IDt3BERMZ4g==
X-IPAS-Result: =?us-ascii?q?A0AnAAAG+/Nq/4z/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOTIIsCgX4PAQEBD0QNBAEBhD9GAo4eAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECL?=
 =?us-ascii?q?ysjCBmDAgGCdAMRuVaBeTOBAYMpAT8CQ1DZS4FoAQsUAQWBMwGFQTKHcl0YA?=
 =?us-ascii?q?YR9JxuBSUSEfoEFgVwBAYE4hm4EgxwSgVqBAowYAoFPhyVIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHIEegRKBB12BKyhdASGBCIF2AoJRg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5E?=
 =?us-ascii?q?DAeJC8FGiY+Gwp+GA1IESw3FRkEPm4Hkm6DFQE8HCITASuCPZMukBaCIaERh?=
 =?us-ascii?q?CqBaIo8lToaM4VbpRcLmH2OCpZRhGqBaDyBRwsHMxoIGxU7gmcJShkPji4LC?=
 =?us-ascii?q?4NggX+DFMlIJjICCTIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:eVsxnaJSMyAKH7KzFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS1zcEz
 GIeWGCFOPjZamune9l1Oty1p04G7cLczNIyQFMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmctajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN12EB4ZOqYA3NwuX0NN9
 adBNTo0fEuc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLo3hv+pmmH2WzZZs1mS46Ew5gA/ySQsjOa2aISFJ4biqcN9zmXA+
 2Tf3DTCP0s7GMDE4xe/10Dwibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:xkDIrq4fIB85pKiLrgPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:lWiN0W0gJp+peQm2ly2A+7xfAtx6XXr21FHqehGaCmYyEaCfcE3L5/Yx
X-Talos-MUID: 9a23:G+pGsAvDIwL78OYMx82n1BI6acFxwPSVNRosvYldkeS+EB4sNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546306852"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 77269180001C8;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id C8678CBF23F; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 09/10] sqlite3: fix CVE-2026-119371
Date: Tue, 10 Nov 2026 21:25:31 -0800
Message-Id: <20261111052532.1258975-9-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249948
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream CTE recursion limit [1]. It uses the
expression-depth counter and limit already present in SQLite 3.53.4, so
the prerequisite patch is not needed. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb
[2] https://sqlite.org/src/info/f54730871303e655

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119371

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
new file mode 100644
index 0000000000..ecd644dd3d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
@@ -0,0 +1,103 @@
+From e6ff280c839fdfc7418fd5add12e8f32702a17fb Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 09:32:24 +0000
+Subject: [PATCH] Limit the depth of recursion for CTEs using
+ SQLITE_LIMIT_EXPR_DEPTH. [bugs:/info/2026-10-04T04:58:58Z|Bug
+ 2026-10-04T04:58:58Z].
+
+FossilOrigin-Name: f54730871303e655a70f3167ce1a39dcd4e53fcf017d225f429e2bb67ad96604
+
+CVE: CVE-2026-119371
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e6ff280c839fdfc7418fd5add12e8f32702a17fb]
+
+Backport Changes:
+- Ported src/select.c changes into the amalgamated sqlite3.c file.
+- Omitted test/with2.test because the extracted source lacks the
+  upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 816b998..3432915 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -151472,6 +151472,20 @@ SQLITE_PRIVATE void sqlite3SubqueryColumnTypes(
+   pTab->szTabRow = 1; /* Any non-zero value works */
+ }
+ 
++/*
++** Check the current subquery nesting depth.  Return true and set an
++** error if it has gone too deep.
++*/
++static int checkSubqueryNestingDepth(Parse *pParse){
++#if SQLITE_MAX_EXPR_DEPTH>0
++  if( pParse->nNestSel >= pParse->db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
++    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
++    return 1;
++  }
++#endif
++  return 0;
++}
++
+ /*
+ ** Given a SELECT statement, generate a Table structure that describes
+ ** the result set of that SELECT.
+@@ -151482,12 +151496,7 @@ SQLITE_PRIVATE Table *sqlite3ResultSetOfSelect(Parse *pParse, Select *pSelect, c
+   u64 savedFlags;
+ 
+   pParse->nNestSel++;
+-#if SQLITE_MAX_EXPR_DEPTH>0
+-  if( pParse->nNestSel >= db->aLimit[SQLITE_LIMIT_EXPR_DEPTH] ){
+-    sqlite3ErrorMsg(pParse, "VIEWs and/or subqueries nested too deep");
+-    return 0;
+-  }
+-#endif
++  if( checkSubqueryNestingDepth(pParse) ) return 0;
+   savedFlags = db->flags;
+   db->flags &= ~(u64)SQLITE_FullColNames;
+   db->flags |= SQLITE_ShortColNames;
+@@ -154703,14 +154712,13 @@ SQLITE_PRIVATE With *sqlite3WithPush(Parse *pParse, With *pWith, u8 bFree){
+ }
+ 
+ /*
+-** This function checks if argument pFrom refers to a CTE declared by
++** This function checks to see if argument pFrom refers to a CTE declared by
+ ** a WITH clause on the stack currently maintained by the parser (on the
+-** pParse->pWith linked list).  And if currently processing a CTE
+-** CTE expression, through routine checks to see if the reference is
+-** a recursive reference to the CTE.
++** pParse->pWith linked list).  And if currently processing a CTE expression,
++** it also checks to see if the reference is a recursive reference to the CTE.
+ **
+-** If pFrom matches a CTE according to either of these two above, pFrom->pSTab
+-** and other fields are populated accordingly.
++** If pFrom matches a CTE, pFrom->pSTab and other fields are populated
++** accordingly.
+ **
+ ** Return 0 if no match is found.
+ ** Return 1 if a match is found.
+@@ -154839,6 +154847,8 @@ static int resolveFromTermToCte(
+       pRecTerm = pRecTerm->pPrior;
+     }
+ 
++    pParse->nNestSel++;
++    if( checkSubqueryNestingDepth(pParse) ) return 2;
+     pCte->zCteErr = "circular reference: %s";
+     pSavedWith = pParse->pWith;
+     pParse->pWith = pWith;
+@@ -154863,6 +154873,8 @@ static int resolveFromTermToCte(
+       }
+     }
+     pParse->pWith = pWith;
++    pParse->nNestSel--;
++    assert( pParse->nNestSel>=0 );
+ 
+     for(pLeft=pSel; pLeft->pPrior; pLeft=pLeft->pPrior);
+     pEList = pLeft->pEList;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 06cd34818f..93ee778292 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119372.patch \
 	file://CVE-2026-119378.patch \
 	file://CVE-2026-119376.patch \
+	file://CVE-2026-119371.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

