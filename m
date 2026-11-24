Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30977.1795560744940654911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CSPekGtk;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so4621382f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560743; x=1796165543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XZsT8sW0Kn5L9VpirvVov91gVTSX+7u93BkTI9y6ydY=;
        b=CSPekGtkJ33gxVSh+SqPt85VHAafgimV/URXk1eNmFkpKbxy3fsjbnQzuLWl8jCCZw
         Z9rktYRXwkJwPBsH8j0ny8UeLhWLrzUZC8kYrHzrachpHul8XHy6Wc2NkcJaEymja0Rp
         PuopHchg+vrdz1xHaIY5juXrYNQpYva6nSLExPe4iipLRH8ece6mFiZF0LdMGjr8HQoi
         xkaH2HYZfa99New7fzfKJa3jsNXssjWkgvh9lKl1hUWi7v3EdReYb9OvtMuy6gEn4MBw
         2Q3PNbaztyTEdRfC0GfucVzoJV0hdeD18rw7vZSbzZataa2Liv3a4Ll/268lZCm1d3bE
         kVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560743; x=1796165543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XZsT8sW0Kn5L9VpirvVov91gVTSX+7u93BkTI9y6ydY=;
        b=fHJdfz6Y5KiqTAlVfR14nzrMCTSr9dNyg1XuTH9tw4PLwJ3BCyrRTa0lVuVIYDOUiF
         pMVk/kpGS6gd5pCqIwnGDEZsql22pnLUARWBr4s95N7VevkJyOBgYGnUIPbeHa/Yqiyc
         sbYESS4BbIdlxzVpnKDD4j6rBIl4AoBVvBFTRJaRbfnKV0kFPg8OFhLFV0kLdgT51VkC
         /U6+msCl7s3i++WXuAXbtHXVj/d9/toHk37Y4RYNkOXGFdQVXLgfEXT2PPDbaw7Tmh0x
         k0w6k0JOede3iOWbrXbwjW+DFxSvchqsNcixe48ckRdrQsqc3pjfh13u8Ky5j8ZO2sZl
         jyxA==
X-Gm-Message-State: APuU4Z90DegJMgxrvBGj+LlpSTS+E9tRGVYUe/fUUyIQ9R8q/d0mSKzy
	ioU/NQ1qzCaQpvULpH0MlNQf9GaXRHwDlwdNMz2VVyNBz87YWSgZnt0PwXK90UgVegLaz39ds9a
	CoW9+BXE=
X-Gm-Gg: AZFdTZeOYEoquinT9b9/2+4CSGZ/FYB2WorRphdkwF3mucvQaX8c0Fof3NzFh5s5ta6
	BmGfpNXz+V6EAVdvz5OgKk38pT5B6vPvJ2IrnRhpD0acVcTUmWVL6ZUoSUbOQwK87ho5plHDxvu
	WJX9c5BszYgoFCHLk/Xys3/adQr7NypF2C9LGDpm04BhBza2wv9HBtaQLJgCPNPCFfeVFdhoMyO
	TGA518/IGBM52R31eh6MW7bHzfqdQltvilrOvRmSZqk2uwTvURwmdEF9ZRTNsSc9GoUSGJwB0+r
	L4sksU1pKcRra3S6SOY+iP9uoo6i/zQMpwVZReqWfqQmNH8XePy2WO9oCc26XRkGbe5gzp3TQ52
	tHwclK+XMVHcEu243eidNCaD+AKw7rwnwEGqTOZkEg6yg2ydCn3NJmdLfqPz0jPfPpIDrbjZvag
	VazeKVaIx44QP7TVWhMcXNCVDPkYc4OqoPAVd/azTLd8d7WATNWXCUZnRARy8sTFOLhX1FcT+cB
	PGgnrop6jXzv69+rHWGHbhTJv8G8Sqk/8PSfMRxArgiF1Bn2z4fHmfCP0tveSfO5wB3DqdyeHEC
	OEQH4HKssdMRvS2h8qbUrvcJlFhc6g/iVqsD2c3zwaEFsXWLG9wfRREGjL4AoxGnjOVWwyQLy0D
	UkoQCXdoAF5Wmqw8E8jtYtr1vI7cu
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr19773057f8f.50.1795560743121;
        Tue, 24 Nov 2026 14:52:23 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 07/21] sqlite3: fix CVE-2026-119372
Date: Tue, 24 Nov 2026 23:51:14 +0100
Message-ID: <45e72e075a6f7a2e9ef29f2c5b46ccd3d37716bd.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251087
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
new file mode 100644
index 00000000000..37fbba21be9
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
index 2a0517efe67..911f5720298 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -29,6 +29,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119374.patch \
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
+	file://CVE-2026-119372.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
