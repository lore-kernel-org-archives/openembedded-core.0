Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27772.1793856596944158097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NEPW1z0m;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3499; q=dns/txt;
  s=iport01; t=1793856596; x=1795066196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eKhT5xplhHv2UyFL7BoQcixxCy+loGhkeKyQdFo+pNs=;
  b=NEPW1z0mMRWfjrd3o+kHdzzZjto9w2rqoCZDRwi+1T6Fq2E/vywlWxUY
   9tDEIAwQn22SwQUgJ45VkjjNkjOh4ZhmGXVAx2tlsElHugmXCg7nAq4B+
   6ZAL42xFi2nzR57cTjGpCXI2Mi1swcuwPyWIs2JPP2SwODkKJ+DSNC6xh
   NmR7LLDs7y+vd+PJtyQch4IxBdxMHcGoNNp73NfMawf8sySgbEY85tf42
   +JZkUoRJ3desPCnYqqtFzs9ccMxZzC7otLnFG6+2Zvrwp+xgZr5+1v/U8
   Apj/ROkJeIy+04vzOJtQcqFFwCDPn4VJD6b3FC4oWoKhCHuwSfsSK5jW6
   g==;
X-CSE-ConnectionGUID: I6DeSFbkTAirOLEUfU52yQ==
X-CSE-MsgGUID: Rqsw7vW4RYWoEfhtWWFQcA==
X-IPAS-Result: =?us-ascii?q?A0BFAgCDE+xq/5D/Ja1aglmCV3VgQ0mWS54kgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9Gjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEbw/gXkzgQGCZkMBPwJDU?=
 =?us-ascii?q?NlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhAh2gQWBXAEBgSeGfwSDLoFaj?=
 =?us-ascii?q?RgCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BE?=
 =?us-ascii?q?oEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MKB?=
 =?us-ascii?q?wEsRxoBExiBRXiTAJBEgiGhEYQqgWiKPJU6GjOFW6UWC5h9jgqWUYRpgWg8g?=
 =?us-ascii?q?UcLBzMaCBsVgyIJShkPji0BCwuDYIF/gxTJSCYyAgkyAQEHAgcOAwuBaJAAg?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:mosicaCjo+TrQhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApD90hDAOx
 jEfD22Gaa2JNGGjfN8jbNjk8U8PvZ/Vz4cxOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4qtCAXoYN44k0+dtJkVjy
 PIldWocV0XW7w626OrTpuhEnM8vKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYzBPjDS0Un1lM/AYgmnfuwj1H0ciZTrxSeoq9fD237kVcpiuK8aYaOEjCMbf9MhVnHu
 F2axVXGBTwUNMCg9hS8+Vv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvWS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:svx0m65KxePHn0HJQgPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AZZkKvmmiBo443/CCS+ot/LbUGbrXOVyD4HrrDUW?=
 =?us-ascii?q?7NU9oUpqxZGKexf4+gvM7zg=3D=3D?=
X-Talos-MUID: 9a23:wPoq1Qla1Bb7Zhw7jbEIdnpYLdx3vLqRVHo8rpIrtcmYChNeAjy02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="530229143"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:29:56 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id CE86C180003C5;
	Thu,  5 Nov 2026 05:29:55 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 7A0AFCC2EF1; Wed,  4 Nov 2026 21:29:55 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 07/10] sqlite3: fix CVE-2026-119378
Date: Wed,  4 Nov 2026 21:29:53 -0800
Message-Id: <20261105052953.2448155-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249431
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
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 0000000000..5228e32cb6
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
@@ -0,0 +1,52 @@
+From e92efe57e1f9cc51f7d819bb7fb05bff182b708b Mon Sep 17 00:00:00 2001
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
+index cbad7b2ae5..45ade42b16 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -216677,7 +216677,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index c6a19525fa..7c8658a977 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -18,4 +18,5 @@ SRC_URI += "\
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
+	file://CVE-2026-119378.patch \
 "
-- 
2.35.6

