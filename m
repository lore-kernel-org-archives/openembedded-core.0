Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31015.1795560743102573239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Z3e8jayo;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3289467f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560741; x=1796165541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GkAbrxDPzAK8jyPKa4KKQ/cV8Rc/4SeyjCjifluhGsc=;
        b=Z3e8jayouinNbJW9TEgBKPy7Hi2LE/GEC+36utH/0akm1kdR9op/XyIhA/qqB/irSY
         YeZpDtOIXfTB0oey9j7PO4qcRxIPOHHOTE+AazWWCaSy1nlOuGck607MDi2+TXDPW6m3
         oc7PqibqyAmLnJlDuauJzbpCE7nyD8ApyfJwqUl8SzmYswN8HIT5DWUcCgLXP1NUfmvm
         01k6eZI3+Krp6aWBLITNXrRfxyki3oiFi4nKYJQ4tFRsMQdas+SUOurz25N7RvR6X1lw
         VDe92lcOtcaOfLp3hyGBfVeGExP9wxwkkc/JlGInx+xC+HcaaHyzbRRRTG7D3bTy/3LD
         6ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560741; x=1796165541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GkAbrxDPzAK8jyPKa4KKQ/cV8Rc/4SeyjCjifluhGsc=;
        b=U4yY3t9VvA9Vylm5GcCTdXRx5oddueU8YZNLTHYlkWOtgSHeQn/xs5ZCJNsrU1KcE7
         bxEYpn+VlAACcyzScw9fKcfEvDIA0CDkW/HiWMOVWTyoyeiTZ8R116j6FXsJC98h1uwP
         hNfTBN5d8+Xutpt22Fbz8ShN83DSWIzigkSX1UyIW9xwz3aEyN8J4hikIBBJytbmVAgG
         15M4KAYek4faM4WYUQzD7c/OAS2AQgK6P6gMCyks6Fa/Q1IvIOIdPo6ECDwZmxUh30Ld
         nYi0hFoUG1T8JIg1z5eqysSrzA/Fay6kjI+escmzJ28rJyJ4PRy/BQ2aWtQeyL5pgbYU
         6a3A==
X-Gm-Message-State: APuU4Z8AZnLQyFgXkg6LEFuDzb28nNfWXuo/lKgflT+V2IUkmlJxDstY
	bZLF3kggzROtBEkTc/Uq3ZbySLwFLfmZpFXuJIBFYxSzoum48Odxw5Kkj85jWesBeytnMI9W3cv
	mFTM4XY4=
X-Gm-Gg: AZFdTZdn60Ret+SCXWIapGSVLU7XhtHendEW22ebl+98q2hX2bkEHrMp9S6OgP3sNDe
	Vg2LJ1T1vwKBjjbAadYn6mz+a8/LzHrVRM8D++FvLZs7FQm9eNYVUathmDTFYR4hn0wx+GmKxKW
	noKuIw9P6ksHr8KZKM+4cZaUU2Q6VdneJBGjxaVYcDJuyxVbGFsqpQUHi92tzIhoCZLvY5BG1y3
	g1ovmhAlTzJSG5UgTZ9lFxuNsmc5DhcKpbZ4HEigYbTMcEPNMz/DoSAy3yLOE8OgdIWCezz8mb3
	eUqCYqIxc0gOL8p1Nnm6EHf9/Q8epyg+loSP3lk7R2oTwo1qyb3MVs/uQoJOG02sQqGqvlHgG56
	L2MXIrQEwugE5DEIrQZ6zjlhltXz+/Es1a4Vvn6DogIxjAiXjBZNL9yxcum+1nLhB7tbqpQ92cm
	sRJnVv4YRkbEcSMzw0PUCo8cip7oQemKcqxsplxxXRIrMV2m77tyZg3u6XjW657SWz3+QTEOjH5
	azMcLCTSBeLS9esYM8EQzx4SEn5mCGpzm4OS+NgqcaOwADW5YUgcIdODoi6bI175/ranOa/Je8+
	kKspQZvNwcgnQTpWENacepcXivY/cGapuTJsEbOYsVmxKjBe1UQjGeJWF9BQgnniLicnYloBeYm
	yz9YssT7lPs1emk7Bs4EgTqSn8dy0
X-Received: by 2002:a05:6000:184d:b0:4b7:66fb:b15d with SMTP id ffacd0b85a97d-4b766fbb8b1mr5788326f8f.11.1795560741277;
        Tue, 24 Nov 2026 14:52:21 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 03/21] sqlite3: fix CVE-2026-119373
Date: Tue, 24 Nov 2026 23:51:10 +0100
Message-ID: <8ff7b2598ac3eaa1deef06751c06eaf9869d5b6c.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251083
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 00000000000..bb2eb09d0a5
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
+index 6130466..06ceecf 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -256971,7 +256971,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -256979,12 +256979,12 @@ static void fts5MergeRowidLists(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index c7c081b3935..4ec6eb230e0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377-dependent_p2.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
+	file://CVE-2026-119373.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
