Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2176.1793955248702729751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qit81qbA;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3784; q=dns/txt;
  s=iport01; t=1793955248; x=1795164848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iOx0oTRCkBUhaa9K2cZHlyA+K1wSYi5hhZsJeqS2pRg=;
  b=Qit81qbATtgKM5W/Q5uYN5ZxAoflugLuMM+y0C81E9a3++6D5VCpr3Dx
   UA/ZZosmp7K0dnzJ/83tVHrBjCo0+u8X2icOenKepj3H8CGSe0/O1ovvB
   VCdo+gOsqLv6g0ZEPJxjwUY8w1lqb8oTxjg2zRQQC5MbjzP2pfkNBBphk
   VLrzQWWE0OCzoBPI9uI9j1PmOE+3abBSw+bkueTVD5Ag4UeEMT2DrMdrH
   /Xxon5hGxl/Uj4SH1e6sadag+EjK4QCKSAju5lDBCYagOweqSw3QPkV/z
   v7jHado2Uk3Ho1SkjEfxEsV8uIaMCRK2QSyei1y+8rbwCvU7LS4O800lQ
   Q==;
X-CSE-ConnectionGUID: ivy/GccHQV+tzEVzMT1lTA==
X-CSE-MsgGUID: rTNqkCGPQkqr/6DvOaONSg==
X-IPAS-Result: =?us-ascii?q?A0BJAgBxlO1q/5D/Ja1aHgEBCxIMggULgld1YENJlksDn?=
 =?us-ascii?q?iEUgWoPAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECFhkrIwgZCYJ5AYJ0A?=
 =?us-ascii?q?xG8AoF5M4EBgykBPwJDUNlLgWgBCxQBBYEzhUAyh3FdGAGEfScbgUlEhH6BB?=
 =?us-ascii?q?YFcAQGBGYEGhgcEgxwSgVoeZYwVAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+G?=
 =?us-ascii?q?wovGA1IESw3FRkEPm4Hkj2DEgGBDQEqAYI9o0SCIaERhCqBaIo8lToaM4Vbp?=
 =?us-ascii?q?RYLmH2OCpZRhGmBaDyBRwsHMxoIGxWDIglKGQ+OLgsLg2CBf4MUxn0mMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:Jt7gg6xCez4ji6X33dJ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVTn
 2JJWziDOqvfYTD1fd0ibt/n/EtUv5Tcy4IxGwY/rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEAoLMo38e1XOF8N6
 e41FiIoUkmHu8vjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tO6ynnjjazRwo1OOrq1x6G/WpOB0+OWxbYePK43WHq25mG6Cm
 kTf/E/WOigZLcbYlxab1XuLoNTAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:o8bCT6jycU4/9XQdH9rJQzkTH3BQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: =?us-ascii?q?9a23=3AgDIoi2ulJRSuvN/zxrJrAZiT6IskbGya43zbA3a?=
 =?us-ascii?q?GSnp7ZYOHbGPJ/J9Nxp8=3D?=
X-Talos-MUID: 9a23:SWCvUgaBVFh5VOBTrQPKnTJJG/9R4L20Tx4hj7IPnO+/Onkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545529943"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:07 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 98866180003FC;
	Fri,  6 Nov 2026 08:54:07 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 40928CBF22E; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 02/10] sqlite3: fix CVE-2026-119373
Date: Fri,  6 Nov 2026 00:53:57 -0800
Message-Id: <20261106085405.3517095-2-arpitpa@cisco.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249613
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix [1], which prevents a buffer
overflow when merging FTS5 detail=none prefix lists with negative
docids. The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80
[2] https://sqlite.org/src/info/a7f8c92f62

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119373

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 0000000000..24401900dd
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,56 @@
+From 2ea652e191b5fd3e2ff13eadd907519b74e3db94 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Tue, 4 Aug 2026 11:04:17 +0000
+Subject: [PATCH] In fts5, account for the possibility of negative docids when
+ allocating a buffer to store the results of merging detail=none prefix lists.
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z].
+
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1ad2ea8a60d4e
+
+CVE: CVE-2026-119373
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80]
+
+Backport Changes:
+- Applied the FTS5 fix from ext/fts5/fts5_index.c to sqlite3.c because
+  the recipe source uses the amalgamated SQLite layout.
+- Omitted ext/fts5/test/fts5prefix2.test because the extracted source
+  does not include SQLite's Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 7761d83d08..9d5790a0d9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244833,7 +244833,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -244841,12 +244841,12 @@ static void fts5MergeRowidLists(
+   while( i1>=0 || i2>=0 ){
+     if( i1>=0 && (i2<0 || iRowid1<iRowid2) ){
+       assert( iOut==0 || iRowid1>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid1 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid1 - (u64)iOut);
+       iOut = iRowid1;
+       fts5NextRowid(p1, &i1, &iRowid1);
+     }else{
+       assert( iOut==0 || iRowid2>iOut );
+-      fts5BufferSafeAppendVarint(&out, iRowid2 - iOut);
++      fts5BufferSafeAppendVarint(&out, (u64)iRowid2 - (u64)iOut);
+       iOut = iRowid2;
+       if( i1>=0 && iRowid1==iRowid2 ){
+         fts5NextRowid(p1, &i1, &iRowid1);
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 5a87ad4c6f..c591db4eaf 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377-dependent_p2.patch \
            file://CVE-2026-119377_p1.patch \
            file://CVE-2026-119377_p2.patch \
+           file://CVE-2026-119373.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

