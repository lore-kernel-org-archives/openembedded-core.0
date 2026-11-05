Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27760.1793856535727475321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hvXLkGbz;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4058; q=dns/txt;
  s=iport01; t=1793856535; x=1795066135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JsbhnijrIqUTdL4la4cAi95tGro9w6ayWJZ3/Gwkv5s=;
  b=hvXLkGbzOo2NegvOxeUZhMUXNRjQ8irboHKL5glRlFOTpzJwFeG1ooD4
   v5wSDWnFAesVK257X3GOfdY3dFNhuZ6OBTghTYTxcHreflrfurA/kLABF
   8BP2LVTZs/bkEi8UwOv1WRuPpOPmurxMCwcBwcCfhI8M2BfnwfKbDlXgf
   Zwvp+ySORpCVhuXfJhhzbSgxMAfCUwaTkEhVKKfBdyOLegx/rsQ2yFdgz
   ICVIOGgCMtQ5zpFTCapPCui+F+Ax0hxsuFDZ/+fVuP7oF10Sd+FbPndBN
   AbSK2WngpCzuNIxwj6/bB3jPL7PaEUgewuFOHIgCXi80++oLzTBMuO6eY
   g==;
X-CSE-ConnectionGUID: HSBAx+uzTYeqpRxcJt6mhg==
X-CSE-MsgGUID: B5JwdRHmRnKXJ/srI3NiVA==
X-IPAS-Result: =?us-ascii?q?A0BFAgCDEuxq/5X/Ja1aglmCV3VgQ0mWS54kgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9Gjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkBIBAgEqCwEYAS0sAwECWiMhgwIBgnQDEbw6gXkzgQGCZkMBPwJDU?=
 =?us-ascii?q?NlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEglCCLoEFgVwBAYgmBIMugVqNG?=
 =?us-ascii?q?AKBUoZwSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESg?=
 =?us-ascii?q?QddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5IvgxEBP?=
 =?us-ascii?q?FEBK4IENgOTAJBEgiGhEYQqgWiKPJU6GjOFW6UWC5h9jgqWUYRpgWg8gUcLB?=
 =?us-ascii?q?zMaCBsVgyIJShkPji4LC4NggX+DFMlEJjICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:nfM0YKoL4z8klVBZsuP9EP3oREJeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmAOPiMZjD1ed9/YYS09kNV75CDndE1T1drrn1nFHhBo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sZMK0het
 uEKFAEAdwi5l+mU3Oy+SuY506zPLOGzVG8ekmtrwTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWfrSn8/w7pX7WzRCsFOJvaMf6GnIxws327/oWDbQUoHWGZkJzhjD/
 Aoq+UzTXzMFOOa/zACD0UKOwfTVvHjdWbw7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:AejH/KkMcne428BDVL9w6oJeGa3pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:8nlMCmGTkGivD1VMqmJHz2Q9CoM4YEHswW7IGV+zK3o3Tb2aHAo=
X-Talos-MUID: 9a23:Ieyn5wX+6dclW8rq/BWxpi5uDudt2aKNOGJKio8n4O+FCwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544448632"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:28:54 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id C5330180001D3;
	Thu,  5 Nov 2026 05:28:54 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 71F52CC2EF1; Wed,  4 Nov 2026 21:28:54 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 05/10] sqlite3: fix CVE-2026-119379
Date: Wed,  4 Nov 2026 21:28:52 -0800
Message-Id: <20261105052852.2446500-1-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249429
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a buffer
overrun when applying a strategically corrupted changeset through
SQLite's session extension. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52
[2] https://sqlite.org/src/info/3f57024aecea0f3b

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119379

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119379.patch      | 79 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
new file mode 100644
index 0000000000..3a882bd0a9
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
@@ -0,0 +1,79 @@
+From f613058ee3c084c6ec1b49e5b9874197df6e7304 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Mon, 17 Aug 2026 11:31:59 +0000
+Subject: [PATCH] Avoid a buffer overrun when processing a strategically
+ corrupted changeset. Report [bugs:/info/2026-08-16T10:15:25Z |
+ 2026-08-16T10:15:25Z].
+
+FossilOrigin-Name: 3f57024aecea0f3b565ed823cf94b085031c481fd6323c1f2e4319a53500864f
+
+CVE: CVE-2026-119379
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/64459c87cc702d600704fb77ee40ca1782398a52]
+
+Backport Changes:
+- Applied the ext/session/sqlite3session.c fix to sqlite3.c because
+  the recipe source uses the amalgamated SQLite layout.
+- Omitted ext/session/sessioncorrupt.test because the extracted source
+  does not include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  metadata and are not required for this backport.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index bcd317206b..83a018d3fc 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -236199,10 +236199,10 @@ static int sessionChangesetApply(
+   int schemaMismatch = 0;
+   int rc = SQLITE_OK;             /* Return code */
+   const char *zTab = 0;           /* Name of current table */
+-  int nTab = 0;                   /* Result of sqlite3Strlen30(zTab) */
+   SessionApplyCtx sApply;         /* changeset_apply() context object */
+   int bPatchset;
+   u64 savedFlag = db->flags & SQLITE_FkNoAction;
++  int bNew = 0;                   /* True for first entry of new table */
+ 
+   assert( xConflict!=0 );
+ 
+@@ -236223,15 +236223,16 @@ static int sessionChangesetApply(
+   if( rc==SQLITE_OK ){
+     rc = sqlite3_exec(db, "PRAGMA defer_foreign_keys = 1", 0, 0, 0);
+   }
+-  while( rc==SQLITE_OK && SQLITE_ROW==sqlite3changeset_next(pIter) ){
++  while( rc==SQLITE_OK && SQLITE_ROW==sessionChangesetNext(pIter, 0, 0,&bNew) ){
+     int nCol;
+     int op;
+     const char *zNew;
+ 
+     sqlite3changeset_op(pIter, &zNew, &nCol, &op, 0);
+ 
+-    if( zTab==0 || sqlite3_strnicmp(zNew, zTab, nTab+1) ){
++    if( bNew ){
+       u8 *abPK;
++      bNew = 0;
+ 
+       rc = sessionRetryConstraints(
+           db, pIter->bPatchset, zTab, &sApply, xConflict, pCtx
+@@ -236266,7 +236267,6 @@ static int sessionChangesetApply(
+           rc = SQLITE_NOMEM;
+           break;
+         }
+-        nTab = (int)strlen(zTab);
+         sApply.azCol = (const char **)zTab;
+       }else{
+         int nMinCol = 0;
+@@ -236319,7 +236319,6 @@ static int sessionChangesetApply(
+             sApply.bStat1 = 0;
+           }
+         }
+-        nTab = sqlite3Strlen30(zTab);
+       }
+     }
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 79d12d4b03..9dd182b168 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -16,4 +16,5 @@ SRC_URI += "\
 	file://CVE-2026-119373.patch \
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
+	file://CVE-2026-119379.patch \
 "
-- 
2.35.6

