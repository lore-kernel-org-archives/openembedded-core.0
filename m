Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1531.1795801780194954370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=V6eXWi8u;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so4779760f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801778; x=1796406578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S6OzZg2G3Ta5Ty+VO3qbqy5T/L1RyDjpXe3CTqPFwh8=;
        b=V6eXWi8uJIkgsB236scHPqx2/+UUgyC2nj4wXRZV3ADxriwvQcQ4jTwW8k5296e5UH
         EhiiycbDNMUosJFYYmVYFemNyh8W/vp1zrt0TxNOOtKswmgJCSGu0B+yMxYYk5jQV0ac
         NOtiG+fxjkW8v+DQ2VThtImWAtKaSFG3bV/O25BvV6dVW8PAGqtjW7w0CDhHCJfd2iTp
         5uYU8tyTj96N0oipDqyl42dzouU9x2Hk0X/u5ZzfyZsZiGwj0Bu0fHrCCjAFjGyqdemb
         xpsP/2ZfWHqkqZv0jPHbdzwXF+Bxejv43ue13H+7+GpqO6bxqnMvdRLvFw6dvMt/usKB
         f9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801778; x=1796406578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S6OzZg2G3Ta5Ty+VO3qbqy5T/L1RyDjpXe3CTqPFwh8=;
        b=krBzeJvSdO45S4N3w60qScG5SrkQK9NCSNCLUyLS5b38P8XshVDeoxeZaYxrcc7II/
         VHg7AD5rxYwH0QRjJj4BAXD666Dtr6OMzfKqHoLWoyFkL51UoWnrAK2s7XXr/wAaXZeI
         cRLcylLfhwLg//Nu+3UAjmQsJnBdMacPgNMbygJI/d1u+vK7vyJ6tpr+L6s24CT/e4Jh
         5nsrw5c5/CpNHA767qB3OlZLCxWC6WMndvO5V7HjRgj/Zt3r83ZzPceOm5OT8zStGScO
         aY3AC1Z5sSFwYM6jfDeXXt9t6radinFgks0NeqoP8ewQ0VegDaVPIrEet4Cn1DBypOjA
         lECQ==
X-Gm-Message-State: APuU4Z9dZtZqaARWWTr8VqrCEstvIjS9qNT8ZfPMM7pAOVmuuxJGvtZ+
	NQvt8ZkxJ+VMwnNy/mcWPbwy+Wn1ze+j58zKErRnjzJ56+LmGQpRvi7pmoDjbmX0Rmr4E3ODWWe
	S6CvlmGM=
X-Gm-Gg: AZFdTZdK2aLOXDloqbzfGQVN9M6c3ttuQbvBt0tsi+F+Fr8HiV/nw/BY1QRk87jqZfM
	Xj+Qowi1HG1m6BSpFE1xJ9UVWXYNXkBpWu5l+zxcgYCTdMbGMBa+I1wB17emrSbRhLnDjuY1+Da
	WzZbdtaEHYh5i1Cy9z1MbCmhLjHPTJ2UC0oGAol50DEnYV3Tx/BBPqqezjA96+kUwBJ5Itey3ay
	GSoN2F4eimBwqRIBXhTMqnPJkhJxPGa3/9TpXbTLoXI11QWHlOl8zYZpzpm5fMBXrfkiAj1rC8j
	UkCVrSdc75pe4AR4K/ErbLBcHbJlsai9RwEZ2EtYkHXAEshMt30GfUq3LEU4SXmym6vJw0I0DZJ
	OLC6aJbXpPvt8GcMRaa+iYXLDb6hpnAd861V1CKhDL1hR1xJhqzMYVDYz0X3IPJ2FcYJGFYo6fy
	f2fZuRvXmtig0PNHMn+mj0ozuDTeP+QExCUn7AIftX76zZzwYElcGe1hBSogJIG1QVQKEdlkZ0z
	TUrg3wqkBIw8UdQ9+9mJsN0POkRVHg9vncmGdqgFvr0UHbWSdcPdRc9zysm70fNdW9sivS+2Zrt
	cCH1XyLiCGNRmx7Elt3gyLJ2rztEoGq44Um5zybXdHzoiBGskgcT9z7tpWW6nCeNsIc68UaRkg/
	SRuv2ku9MZfE/JoQGENrxBaw8rrRY
X-Received: by 2002:a05:6000:29ce:b0:492:820d:1e with SMTP id ffacd0b85a97d-4abb0f3c464mr33317461f8f.11.1795801778462;
        Fri, 27 Nov 2026 09:49:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:37 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/37] sqlite3: fix CVE-2026-119372
Date: Fri, 27 Nov 2026 18:48:52 +0100
Message-ID: <fef2d591d25a445315c4ca21b399e35811219f3b.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251415
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which prevents a use-after-free
in FTS3 snippet() processing. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/a87bd2471a9c0606e78d3c3678bcd9cecaa0e731
[2] https://sqlite.org/src/info/e4635c41536a

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119372

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119372.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 +-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 00000000000..96a9fdab6cc
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
index d5d5f101b0a..378903944bb 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -17,9 +17,8 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377-dependent_p2.patch \
            file://CVE-2026-119377_p1.patch \
            file://CVE-2026-119377_p2.patch \
-           file://CVE-2026-119373.patch \
-           file://CVE-2026-119374.patch \
            file://CVE-2026-119375.patch \
+           file://CVE-2026-119372.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
