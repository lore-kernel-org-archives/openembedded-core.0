Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3243.1794374735250697674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O6aHDJO1;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3630; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HGpxgNU2phkS3O8ytwWI+me0ofNXFcQgXVeY3ste6vg=;
  b=O6aHDJO1ERgBpmYeLFVSTHaWT8H+M9rAB09FrIM0nSwwYccUDszG+XND
   Ha41UYxAC8bgozhLGoGbz1Ht+uN+MOodyK2Bqi0pOuqg3BeTZo8k0Jzzu
   eC+lpF/pCwThH2b3yJnNtgn0okVBC26zJF4shHVwEfvlZLqzxn8eEMZG6
   dmoiQTuHTdW/QEZZzLvB0YKCnKQj68kk7KwnC9fwU32UV1t4tMVWmEkjU
   lglcMu7gC71x5C60ML20789gxpKRATAgYDPeLzDHuoybZlAZvgC2y/uzr
   RQSi//rYdfIU7YQlE5tiLOFcDkKuBc1IzlQ8Zd11pe2W7OUAnyrhufCx6
   g==;
X-CSE-ConnectionGUID: DFLtKCtyRBqzgQG870hwNw==
X-CSE-MsgGUID: 7s9Tc5TQSIWQ8N8S1doVCA==
X-IPAS-Result: =?us-ascii?q?A0BIAgAG+/Nq/4z/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iKBfg8BAQEPRA0EAQGEP0YCjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxG5V?=
 =?us-ascii?q?oF5M4EBgmZDAT8CQ1DZS4FoAQsUAQWBM4VCModyXRgBhH0nG4FJRIQIdoEFg?=
 =?us-ascii?q?VwBAYEnhn8EgxwSgVqNGgKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EHGwYFgRyBHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5Jugw4HASwsGxoBExiBRXiTAJBEgiGhEYQqgWiKPJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqWUYRqgWg8gUcLBzMaCBsVgyIJShkPji0BCwuDYIF/gxTJSCYyA?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:UAaoV6p8+Lx330baf6EUklqnWAZeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmFOPyNamX8etwkbY608U1U6pKHyNBmTFA5rnxjRCwW9+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0spZJX1t3
 uAJEhoUfB+6qLLpmLKkbPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7WzRCsFOJvaMf6GnIxws327/oWDbQUoHWGJUFzhjF+
 Qoq+UymGUAmP4Gj8AGkzUv8oL/0xC/8Zqk7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:C4Vj86nmF1Eem5KH7HmVY/5ZM4rpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3A3vrnJGveMVvPJp9W5eVCbWW/6IsJXFnB71zMMnW?=
 =?us-ascii?q?SEHRmcZLFFgeQ54V7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AamFhLA8C7+2AswDYrZsE4x6Qf5hzspilVXw0qrQ?=
 =?us-ascii?q?5gpmiZRcpNzCjpx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="545888657"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 74956180001C1;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id BE2FDCBF23D; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 07/10] sqlite3: fix CVE-2026-119378
Date: Tue, 10 Nov 2026 21:25:29 -0800
Message-Id: <20261111052532.1258975-7-arpitpa@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249949
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 0000000000..23d9aaf6aa
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
+index 76cb284..d2c0f23 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -219417,7 +219417,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 911f572029..1aea7cb374 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
+	file://CVE-2026-119378.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

