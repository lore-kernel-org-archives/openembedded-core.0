Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31032.1795560766490323516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=LIe14ZHs;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so2502808f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560765; x=1796165565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86e3ZPwAfToFVSutqegtxi+Akwjm9Ga8SgZEn37MujA=;
        b=LIe14ZHs9ILoIyB/C4IOP94s99jP4xARA5floz3FJ8P8fsOyfIN1SXEFkSrGxRHdld
         0OegCXyUQHD0MVo1LlnnQ36F8KvcESx1n7/HwUILii2yox7iiT3N6z1I8IrNTxVUoZzA
         piM+NG+wyipXJZr9F+Ws8X4FvmTIklVxfPFsIkCZ3Q8UnE4+iI8rk9DqdRDYQ3f0YO+d
         Wb7TZIq2flDr+DP6+ysIOSXW8g+F7XffQY9oq+tGRUBI7EeWov/8MtPrcTBkKjdBYzUq
         t0siQd7leXslSGJYrLZPLp+BH0/5x52GM4faUb1dOUlnxeAW7QEWtL5Jv9ZTMaIsH4FI
         KZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560765; x=1796165565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=86e3ZPwAfToFVSutqegtxi+Akwjm9Ga8SgZEn37MujA=;
        b=SwbRIm115BJprTC2qaZcx5TLlTu0mrekTOkt1fqLmtMFoEu7KxLISwLSiOuewtz+kl
         9e9Ji+9aYVqMe9FzE2pkcIXBpeVkAmrHJ/JZ6VJwAlCfYzab3VjObRLisTBUy14Gh7zw
         cwetML7QuJBa4jjjElMTC1fC04+pUoTuoBJZOb/e73SShmG9M64JJRy/qSkRBeNV11Gp
         mOuY5j1fN0Wkx+8GJBI7Ioc8R9nn5hDotDxrVdUbF/7kzMC/vt3E6ZHWpatMPxKSSZtX
         +g9HRMHb7LIet5CQBlDJgmmzHRuWzeHu0ll1fV95rA6DolbK8IF2eOKwKrJx4pDCZfBR
         wq7Q==
X-Gm-Message-State: APuU4Z+9h3eK17+krKlG+eSx+cWAN+ftP8OpsjzYQYS6CP6fmmZ2w3FO
	gws+8HvComveiuCN+X9c3kpdB+lD9lQZOu7Z5y1VmQrQNPJ5TYLAyWH/g/p1kbEGvqMxXGyaHxD
	M/cMg0fQ=
X-Gm-Gg: AZFdTZe60TESf1x+PiFnqQSsfVdVrFo9b7vsMc8h/kjAdn38pJ/PfWt7hlmIp5NfNUi
	sNW7dRc0IisXusVL/9VPj6KZOkkbPHs/ICyMj6eQrBcdJSGPs6S1SBx3ZD5Wohh5dHYHisVA/vu
	lMh/fKx8wxORftVjkQPqC0O+piyUVCxnbd15167fFX+avS29UMXSi2954OMEZAOWgTcU+iVzFye
	SOtG5BK0q6k4EKAqMnJD3ymL6WpzFVlC1/1NEwUW9m4ZWnn4r14gQG/u3ygnA4/CetVA612eMfk
	K5rgc4osNt0WanTvfiygyiPidpSCZK55+3QIElzemX7jyWQAlHCO4qa4CGVkDBCvLwBYWqIbO9R
	4t2SjWQ+/GobncAiiTtZrnV738dEaI4ya3yedGM9KN5Ewfsc8kGk+Vi/58ZdFlLdNObRiiF2nXI
	mCNZjYKjWlIEKpNmGDfC7/iKYGLHEkm1aHTIueSGoOJRcPV5oxoyltyzT0Wqpb0f84mHTGlkL3O
	hA8hIIf3frZNGuu24MFZXbR41uScSyDrTmfUxUF7Iq3MV7/Traz520Uos94NPmvQ5dkZHQO9mP9
	LrbAN+ZiF12vzu3wuSB0/IsgO0PdthDwo3xSUU4/wPjYNbE7PxXdnKTht/iOUoA74b7UCKt7MvN
	vc6xtOwwz4saYgpqHdRzKDE3rkmi+
X-Received: by 2002:a05:6000:29c6:b0:4a9:b2f1:aac4 with SMTP id ffacd0b85a97d-4abb42ea141mr20914256f8f.22.1795560764623;
        Tue, 24 Nov 2026 14:52:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/21] sqlite3: fix CVE-2026-119373
Date: Tue, 24 Nov 2026 23:52:21 +0100
Message-ID: <b11657e8ea2c303e8ed7bca8c64f28d577e26568.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251106
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which prevents a buffer
overflow when merging FTS5 detail=none prefix lists with negative
docids. The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80
[2] https://sqlite.org/src/info/a7f8c92f62

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119373

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 56 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 00000000000..6bf27f3a1f2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,56 @@
+From ddb597d563f2b17e9f42911f78ef0573cae047ed Mon Sep 17 00:00:00 2001
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
+index bb908566d4..bfd285777d 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -253340,7 +253340,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -253348,12 +253348,12 @@ static void fts5MergeRowidLists(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 2f821769135..52e7659a8ef 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -13,4 +13,5 @@ SRC_URI += "\
 	file://CVE-2026-119377-dependent_p2.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
+	file://CVE-2026-119373.patch \
 "
