Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31036.1795560768857385964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lbpp0dXh;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4782656f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560767; x=1796165567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ywkrYbaCnUvikY2AoR38QdUzN16/AnTbcqe+cmINtNc=;
        b=lbpp0dXhGhxZSyuiC4tpcLG05RdcL3HHIezYtq4RBXG3ee/NcMX508TYlN/PdXod0O
         ZCHnMk/ZKucsXGMaGUEBdyTGOe7TmKcg4inx0iyl0YJ20HlBO4Z0zmCF1FIqeLuciOdh
         jLOdnM5W20dbnnbocqUipAhyUeYt/+J7+9f3QN8sSTuRdw8ViwAkudIlZNM3854VtMzx
         rxtPW3h54/HJILZpy309lxmeIiGNFJSqOwzJaDqh0slj+rGZNxC6hN+vlvg/ivyAme3c
         lXm3JjKVBb9oKNNLJG18AlelltYvvv1He7B921zH/ktB+nmhvqCtVQ10yhiSrVl9C9Ig
         rQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560767; x=1796165567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ywkrYbaCnUvikY2AoR38QdUzN16/AnTbcqe+cmINtNc=;
        b=r80+NdNwkq70MIV5QMjZalZ25ve2vKMl5Q2LXMjHPAru6ZFv5IwdwtYyST5jpmC9/Q
         j0aoAuvbtRB/oDpP8PzvYJ6xOX9PXEpKMsA+DGNMUt2WmnDmq9Z3SrZ02ntXQGSKVW/5
         s5yvQfugmKSRzGaRcr0yXE1VMUQdblkT4Y0TT+J4Z1tJwEj0Knj5PNQMuPol4F6GQjE1
         fSoibLSDDal7FT/0ZpkjJ0/OLIM1bUZH+FXklSeA5Q0HBCJxeaYnzn/OAUY+VtVIT/53
         QhWjWICZ4AQBM6npiYlPer1axJMPic193k7tBG7Lrct7apfikl+bI28/vlyQIDyIVdN4
         Xrvw==
X-Gm-Message-State: APuU4Z9Agj1hcH4levutllRiTAQcfXFncHnecWEnNuK01g9JD7D3lkO9
	5HnzMxDRLeHxMcy+ALwlRmLU5AeOOG0oisrtnMOdk5zbUFVZc2kfezM6HnwnAmaZD7lPBy86JTz
	qLu0e0hs=
X-Gm-Gg: AZFdTZf3DomOSlFROdE4J0kK5LT9EQlJa3eYaYsTpeq7t/bq+AsPmaP61PP88Av4jwK
	JSxsyfrw7QAiQcgYgIKxAqRybIo5zrW9MJqlqu3fWQI8HfUJ/AIcrOUgVOMCzr0GzwPWZaNtEhx
	ny/bpj4O8EVswXKJovyQNVhGUS1JidDA602r03HUFwQwBF2g24MVBDsi9F+YN4i7fUm8L6wpm9T
	O+agR+KSEJpV8J3lqxV4wfoxTSFa8FPu9k36fxBRSzaCntN7NLsB17fJ143SyPH2fQc5Q6KthPQ
	FqmfYK6Uq5e1sJzZt7Pj+PAkNCeaR0nYRbzqHouMQlIJwYKqDITWYJco+1VbQ09hxrxDO2ZzQid
	Lwz1K2P7G+uOctT4xak2HPe0lUurx1/7ASB/d+6nIba3WfJpdwXn39tLQYMVHskVK2AaerY8Bi5
	OwNMKLlhaFwhgaP7fKwhLZ/RlVpVYkA+cUmi44040z1IkdvaXhoaVrX90D5lexBDM7WzYnGFn9E
	p3YOGH9SiNLKV61GsK8Q+mhX8fbuoyaMYXduu82+hyaZurF9bSwFxZGx/Fmd8mVIyqeFsiZK/gT
	Hq5dZl3BvrNgCrg9beAlxp0eQy7x5WEV9atTlwdNt9VNfJ7M2tRQaYMlvqbcrH+NCbYTXg20cb+
	A8+yjhl+yCX6NH0JAPjj+uwa9O2Fl
X-Received: by 2002:a05:6000:2c0e:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-4abad5ac62emr32414248f8f.5.1795560767044;
        Tue, 24 Nov 2026 14:52:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/21] sqlite3: fix CVE-2026-119372
Date: Tue, 24 Nov 2026 23:52:25 +0100
Message-ID: <03e32765bb74923208ca473061c2e51a51f03a0b.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251110
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119372.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 00000000000..c05000cb491
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
@@ -0,0 +1,56 @@
+From 52acd34ba6d51393d9f714b3e0c5ae7d805ddeae Mon Sep 17 00:00:00 2001
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
+index 83a018d3fc..cbad7b2ae5 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -208133,6 +208133,7 @@ static int fts3BestSnippet(
+   sqlite3_int64 nByte;            /* Number of bytes of space to allocate */
+   int iBestScore = -1;            /* Best snippet score found so far */
+   int i;                          /* Loop counter */
++  Fts3Expr *pExpr = pCsr->pExpr;
+ 
+   memset(&sIter, 0, sizeof(sIter));
+ 
+@@ -208161,9 +208162,12 @@ static int fts3BestSnippet(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 9dd182b168a..c6a19525fa7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -17,4 +17,5 @@ SRC_URI += "\
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
+	file://CVE-2026-119372.patch \
 "
