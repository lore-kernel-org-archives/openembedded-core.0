Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3242.1794374735135445517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fjUm5kqD;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3655; q=dns/txt;
  s=iport01; t=1794374735; x=1795584335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lA8igl0ZwOBXzc5LTqlG5/sfZKQo64NebVILOF3/VY8=;
  b=fjUm5kqDw3baLHI1PUD3sXUt66m4rn0+PfrkSHlBioXxBzaZedgntzFp
   GU6fBFEce+fseKzzOxf5jaxJVWmdTvr1kuF3SPLt+H40dPf35F/DihMZw
   xHjUaCMfNrcEsIx0I1URPwyEi7P1yX7oCCcL6eZ83hNyf/higDjUmzhHG
   M8aKant/CgaqEnKwj3nK3Q3/cyzJCFTA/22wQPC4NwSKDEIWp/M5l9Pxg
   oNrZ+O7/kYuGndBwEf3uuLjDl6D2xaFMUXIvjKo+Wv1faO+jf24qcEdqs
   AB7XBgQ3BA7di4H2koCZrEMtI8WJgfPWkG1UqZHz5voG4bVXVN1LJCYTh
   w==;
X-CSE-ConnectionGUID: 4SQsZZBTQrGcBzIz9MXp3w==
X-CSE-MsgGUID: lZ3vHABASNSoZg2IfZGneA==
X-IPAS-Result: =?us-ascii?q?A0AnAAAG+/Nq/4r/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIoF+DwEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rI?=
 =?us-ascii?q?wgZgwIBgnQDEblWgXkzgQGDKQE/AkNQ2UuBaAELFAEFgTMBhUEyh3JdGAGEf?=
 =?us-ascii?q?ScbgUlEhH6BBYFcAQGIJgSDHBKBWo0aAoFPhyVIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHIEegRKBB12BKyhdASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FG?=
 =?us-ascii?q?iY+Gwp+GA1IESw3FRkEPm4Hkm6DDgcBWDUBExiBBUB4kwCQRIIhoRGEKoFoi?=
 =?us-ascii?q?jyVOhozhVulFwuYfY4KllGEaoFoPIFHCwczGggbFYMiCUoZD44rAwsLg2CBf?=
 =?us-ascii?q?4MUyUgmMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Gu7SKa6qjCOKGp/vGhf/2AxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mUbCj+Ca/zYZGLxfNsjaYy29UpQvpCBn9Q3HgBq/iwwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztNsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYbYh4dRFK1137
 9MTAiIsfEGmt/rt3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAj2PnciFAoXqepLE85C7YywkZPL3FbYaLJoPaHJUI9qqej
 mb0pHrZKzszD/qkzgiKqFOitMDJkAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:SaTlVKBj3T9MEVDlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AATbuA2iQApRcAefI+hZCMbA2ZDJuLkbk10XiCXO?=
 =?us-ascii?q?BE0liYq+0Ww61yLs/jJ87?=
X-Talos-MUID: 9a23:VHH/lgWgRnm4LEzq/Dve3y9CHe1B2IKVD3ICy7QIieaCOAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546478185"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:25:34 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 74268180001CD;
	Wed, 11 Nov 2026 05:25:34 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id B7CF7CBF23C; Tue, 10 Nov 2026 21:25:33 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][blacksail][PATCH 06/10] sqlite3: fix CVE-2026-119372
Date: Tue, 10 Nov 2026 21:25:28 -0800
Message-Id: <20261111052532.1258975-6-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052532.1258975-1-arpitpa@cisco.com>
References: <20261111052532.1258975-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 05:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249951
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a use-after-free
in FTS3 snippet() processing. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/a87bd2471a9c0606e78d3c3678bcd9cecaa0e731
[2] https://sqlite.org/src/info/e4635c41536a

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119372

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119372.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 0000000000..37fbba21be
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
@@ -0,0 +1,56 @@
+From a5fe767d0ba12d3082bd22b3c5341fdb6cc6ef95 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Mon, 17 Aug 2026 13:55:38 +0000
+Subject: [PATCH] Avoid a problem causing a use-after-free in the fts3
+ snippet() function. Report [bugs:/info/2026-08-17T09:18:24Z |
+ 2026-08-17T09:18:24Z].
+
+FossilOrigin-Name: e4635c41536a0b3620780c3f1c872de33121370bafb608fce9fe7e3113e2ae01
+
+CVE: CVE-2026-119372
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/a87bd2471a9c0606e78d3c3678bcd9cecaa0e731]
+
+Backport Changes:
+- Applied the ext/fts3/fts3_snippet.c fix to sqlite3.c because the
+  recipe source uses the amalgamated SQLite layout.
+- Omitted test/fts3snippet2.test because the extracted source does not
+  include the upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 8a0f44c..76cb284 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -210732,6 +210732,7 @@ static int fts3BestSnippet(
+   sqlite3_int64 nByte;            /* Number of bytes of space to allocate */
+   int iBestScore = -1;            /* Best snippet score found so far */
+   int i;                          /* Loop counter */
++  Fts3Expr *pExpr = pCsr->pExpr;
+ 
+   memset(&sIter, 0, sizeof(sIter));
+ 
+@@ -210760,9 +210761,12 @@ static int fts3BestSnippet(
+   sIter.nSnippet = nSnippet;
+   sIter.nPhrase = nList;
+   sIter.iCurrent = -1;
+-  rc = sqlite3Fts3ExprIterate(
+-      pCsr->pExpr, fts3SnippetFindPositions, (void*)&sIter
+-  );
++  rc = sqlite3Fts3ExprIterate(pExpr, fts3SnippetFindPositions, (void*)&sIter);
++  if( rc==SQLITE_OK ){
++    /* Iterate through the expression twice, in case pointers garnered during
++    ** the first iteration are invalidated by a call to fts5EvalRestart(). */
++    rc = sqlite3Fts3ExprIterate(pExpr, fts3SnippetFindPositions, (void*)&sIter);
++  }
+   if( rc==SQLITE_OK ){
+ 
+     /* Set the *pmSeen output variable. */
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 2a0517efe6..911f572029 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
+	file://CVE-2026-119372.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
-- 
2.35.6

