Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2178.1793955248973552344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=c7UF53am;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3653; q=dns/txt;
  s=iport01; t=1793955249; x=1795164849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HD1D7l58QQoxxpM5Ru2ZuBsIYyRjEg2JlvKYtRGz2JI=;
  b=c7UF53amLgW9cTzoVsxWwacafMNac0dc+FMAJ5Mm6JSUJwemkjBQnVq8
   zo+4xRGk4qdgEXnWkwHuqwkIteZ/qWPkfdBaHDfjTK+xfN1WyNybq91Pt
   CksRiYwgfImcBvL8oFjO+GFRkdnaAYwJSbPDSHJyVTKlSUOCJ13r3CYii
   XeBHEj9SimbaXFja4DMC5vNnFMLC/WMQP6zzsdilmVywrIJ5QcqpIRy5R
   faKX27BD0n96Wf39uy9b00CkeiNSLa8nxxGlpQO/jGu87KrYXcoFY10Fm
   Qa+uhRr5r+ZC5BnFraBFHSYE/GK1Kl6yMZNOl1zS45Pgw4A38f4B6Pry8
   Q==;
X-CSE-ConnectionGUID: r5mnAh2IQDO0VTXyED4FWA==
X-CSE-MsgGUID: hxPZEq+dRim8RWCKTEIEKA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBUle1q/4v/Ja1aglmCV3VgQ0mWSwOeIYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZCYJ5AYJ0AxG8BoF5M4EBg?=
 =?us-ascii?q?mZDAT8CQ1DZS4FoAQsUAQWBM4VAModxXRgBhH0nG4FJRIQIdoEFgVwBAYEnh?=
 =?us-ascii?q?n8EgxwSgVoejHoCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSPYMLBwEsRxoBExcBgUV4kwCQRIIhoRGEKoFoijyVOhozhVulFguYf?=
 =?us-ascii?q?Y4KllGEaYFoPIFHCwczGggbFYMiCUoZD44tAQsLg2CBf4MUxn0mMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:d/NQyamCpFDMHZPdt6gJ1JXo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWm6BP/jeNGT1fI0ia4/j/EgGvMTSnd8xSwA5qSxgRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZdF/+BeATtvz
 NA/cA4xXgGuq76Y/5vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnDlazxEsFu9rqss6G+Vxwt0uFToGIeJJoXQHpQIwy50o
 ErG71zLLwhZOOaezGq/zVmPusLusADSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:/0ldTa5e6bGLeJro2QPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:P/J7jGz67hjun4Zp2w8LBgUOR8UjW32H7U78BBeGNVZ4ZZHJZ2C5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AQZ/3jA/wrmcoQF0L+j4BBe+Qf8d425aDEQMBq5Q?=
 =?us-ascii?q?D6/O7Hg9MFhawrx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544123955"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:08 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 051B218000206;
	Fri,  6 Nov 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 58951CBF23D; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 07/10] sqlite3: fix CVE-2026-119378
Date: Fri,  6 Nov 2026 00:54:02 -0800
Message-Id: <20261106085405.3517095-7-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249615
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a use-after-free
in R-Tree when a manipulated shadow-table schema causes
sqlite3_last_insert_rowid() to return 0. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04
[2] https://sqlite.org/src/info/6a9e1415659f9e75

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119378

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119378.patch      | 52 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 0000000000..98937c7bc9
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
@@ -0,0 +1,52 @@
+From 347b0263ce597345446fcfd259d063ef86228191 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 24 Sep 2026 20:14:31 +0000
+Subject: [PATCH] Avoid a use-after-free problem in rtree triggered by an
+ attacker manipulating the shadow table schema to ensure
+ sqlite3_last_insert_rowid() returns 0 after certain INSERTs. Problem reported
+ by Claude and Ada Logics.
+
+FossilOrigin-Name: 6a9e1415659f9e75940b3c3a6f6e123f61c5e9e2a7a612693ee395d7b7567bef
+
+CVE: CVE-2026-119378
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04]
+
+Backport Changes:
+- Applied the ext/rtree/rtree.c fix to sqlite3.c because the recipe
+  source uses the amalgamated SQLite layout.
+- Omitted ext/rtree/rtreeI.test because the extracted source does not
+  include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 62a8d5128b..4b1c310fd6 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -209661,7 +209661,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
+     sqlite3_bind_null(p, 2);
+     if( pNode->iNode==0 && rc==SQLITE_OK ){
+       pNode->iNode = sqlite3_last_insert_rowid(pRtree->db);
+-      nodeHashInsert(pRtree, pNode);
++      if( pNode->iNode==0 ){
++        /* If the SQL statement has succeeded but sqlite3_last_insert_rowid()
++        ** returns 0, then the shadow table schema has been corrupted somehow
++        ** (e.g. the %_node table has been replaced by a WITHOUT ROWID table).
++        ** It would be dangerous to continue in this case as the hash table
++        ** implementation assumes iNode==0 means that the node is not part
++        ** of the hash table. */
++        rc = SQLITE_CORRUPT_VTAB;
++      }else{
++        nodeHashInsert(pRtree, pNode);
++      }
+     }
+   }
+   return rc;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index eabc6566c2..2ad46aa5f2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119375.patch \
            file://CVE-2026-119379.patch \
            file://CVE-2026-119372.patch \
+           file://CVE-2026-119378.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

