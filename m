Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2130.1793955248964473815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BvEcdedw;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: arpitpa@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3678; q=dns/txt;
  s=iport01; t=1793955248; x=1795164848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tfkKrpR7b6e6nDqaM1xkZmp5PlksRGenjC8v99jY0dI=;
  b=BvEcdedwvS5TZiDFCUxSZe16wFD/1zfzvNFpTic7EHNxhy2ocSi1lyiC
   0RwxFaKyvn9vPbgi1B77Shg8oIikV+yK2BzoeKr0Rka1N/oCpyHRm5W0k
   46DKd8kseEq71Ozz4X+CBbBLsGvjTa7ambb4wYG+aaKd78pGZPumfHLlM
   A9nzKQFqpveZ9uzzLOFCsIHi5+dKYlHeFPycQQjViRBJyuexJXJpTV4JX
   BKFG+zj3TME7LvTGTOF8IPEbkVoZCDN8UKaOySZueiug2C5KBhXbm5e0j
   3gy2jVl/jXr6y5BHs10DHJsS6ZjKIMQsAvSBq5qh2CT0HMjXOzC+TupOz
   A==;
X-CSE-ConnectionGUID: vX4AmXq1T6SuOl2v5blaqw==
X-CSE-MsgGUID: KlMLNAniTjWGYBANWkeMLA==
X-IPAS-Result: =?us-ascii?q?A0AnAADmlO1q/4r/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKJWQOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rI?=
 =?us-ascii?q?wgZCYJ5AYJ0AxG8BoF5M4EBgykBPwJDUNlLgWgBCxQBBYEzAYU/ModxXRgBh?=
 =?us-ascii?q?H0nG4FJRIR+gQWBXAEBiCYEgxwSgVoejHoCgVGGeUiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUcJj4bCi8YDUgRLDcVGQQ+bgeSPYMLBwGBDQETFwGBBUB4kwCQRIIhoRGEK?=
 =?us-ascii?q?oFoijyVOhozhVulFguYfY4KllGEaYFoPIFHCwczGggbFYMiCUoZD44rAwsLg?=
 =?us-ascii?q?2CBf4MUxn0mMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:034Geaveh/f3/UFa59lnoWMSFufnVABfMUV32f8akzHdYApBsoF/q
 tZmKT+FO/vfZTf2Ld12YNzj9UkC7cPVmNQxSwZurXgzQSxGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5NYrKGR+7
 KUkdgsQSRTZmb+8xLuiVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3XeidAqU6NrII84nPYy0p6172F3N/9J4DXHp0KxhrDz
 o7A10f9JzU8Hdqe9Ti63UOGr8nwni7efKtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmcHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:of37Vq//K1l3ZpmYmcluk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:pFZj+2Mkx20QEe5DRhk73UskA5kZLEbA63OKPRKyDW9wV+jA
X-Talos-MUID: 9a23:Ar+xSQhZ8HqQvvqNW1MpNMMpF8NNx4KHDkExk6opiuOtExNzNhK5pWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545307043"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 08:54:08 +0000
Received: from sjc-ads-10129.cisco.com (sjc-ads-10129.cisco.com [10.30.210.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 01FA8180001DB;
	Fri,  6 Nov 2026 08:54:08 +0000 (GMT)
Received: by sjc-ads-10129.cisco.com (Postfix, from userid 1877011)
	id 53EE4CBF23C; Fri,  6 Nov 2026 00:54:07 -0800 (PST)
From: Arpit Patel <arpitpa@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 06/10] sqlite3: fix CVE-2026-119372
Date: Fri,  6 Nov 2026 00:54:01 -0800
Message-Id: <20261106085405.3517095-6-arpitpa@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106085405.3517095-1-arpitpa@cisco.com>
References: <20261106085405.3517095-1-arpitpa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10129.cisco.com [10.30.210.133];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.133, sjc-ads-10129.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249617
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
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 0000000000..96a9fdab6c
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
+index 8cbe1d3ec7..62a8d5128b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -201458,6 +201458,7 @@ static int fts3BestSnippet(
+   sqlite3_int64 nByte;            /* Number of bytes of space to allocate */
+   int iBestScore = -1;            /* Best snippet score found so far */
+   int i;                          /* Loop counter */
++  Fts3Expr *pExpr = pCsr->pExpr;
+ 
+   memset(&sIter, 0, sizeof(sIter));
+ 
+@@ -201486,9 +201487,12 @@ static int fts3BestSnippet(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index e852ff79d8..eabc6566c2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119374.patch \
            file://CVE-2026-119375.patch \
            file://CVE-2026-119379.patch \
+           file://CVE-2026-119372.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.35.6

