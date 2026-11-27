Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1453.1795801777595138642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OUcWyz58;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so41172995e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801776; x=1796406576; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEZciIYleNtI1A9J/PQcUzczSZfINYVuoSwStHsLTX4=;
        b=OUcWyz58fZWFmBJM1PBtizSX3RmNjZz646EluYaVE8OjWTDNSbA/oMpToeOOrhMGa9
         p2sRpb+b5zksRaJrQTxIBJnmCLWyBDn/QtoqTRa4e9d6G21cKbJwAP6VVhxAiCFiSiKa
         Fo1jtFor5cGrUCqzgzUSrLTfrMWBhFGFV0HFg+dtcbUwtxV8ljz1OvNTUlmH9OqR/fTa
         MJ6NcKedo4dRsoVwbV7ChOoYnDv9ArsQWZstaTWzh2Rr/zYzd6JLJNZo0Ioszr1r2+Bm
         9VmLUTvj3QZTBTA9N5EpS02PE4VPSZ9V6htUhDtzH9VrnNuXQTqWmu1CAX2/gC7ad4Xs
         TW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801776; x=1796406576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEZciIYleNtI1A9J/PQcUzczSZfINYVuoSwStHsLTX4=;
        b=ugw1MPctKZfR+hOovN5Zf3lGa3GSuJU3mEORYG5+sGi0v7+0Wn+up7LAe5S1T+mSrL
         C5UhhUbe68XLEbJIp3WEDdNie0aZl10Q9qIkGlymRCPABlCQIRoQH4y7KwqxNiWK/tqs
         q73VRkl+m7U3cteOL7Wkh6j9G83+83sFEmbtdInVb9m+b6o8w9ALjn26W7BWP0caJnhs
         5iJIP8lN4VEQgjQdyGnxYKt3yUD9/O2miNetzwIfaqAdrC/hULNK5PYAJi3T1PEyEcP+
         hpvXkP6tnCZ9yqW/7bALYmfJe5V1KUtua9ixqmueCeE34m+3fORMsUL+/M/7kr0PlezC
         8ZAQ==
X-Gm-Message-State: APuU4Z+FzJT1bsMrrylKEK3+k8lDSbO1aHMlroQSBaDfH6hF0kSV/Qld
	tXb2QJfcupRlv4hdMkWdD53AjqbTP1WttNWHSkjNPW2XtAnWBX+eUPC3I73KAb0qhZP6hgiAlV0
	5mrZ7aRM=
X-Gm-Gg: AZFdTZePKQMD5I+ogDiJfE3mC/iXI4IMC+xzgDVSoZsYv3ObCuPellKQ3/gIb3qh/D0
	qZby/fiCyh4RL4Bv4M2iHqrj+VhcCNTB97av+AH5GZkgvq4shB1ySXxygcfj6mreorrTuPuw6uZ
	Y/c1d1Ewo3Y4k+kXzTo00odwxSqdsi+4ECcvPD+r3wzVaXfmNGHT3nY5kbzHrv0/1F7NueZLVnY
	zL/rTLcECK5d52gDt0CzpP8gMxUXwNl/YYXPPRyW8RAnmvFchE9S83t3ujnhHFTl0KGYo/sP+82
	zuoS3LEJIiSY1sm4WGxNBmCEkomPiSrJtaE4rLwgyJ8eCRlE0tMYjvyEk97SNlqll8jXwxAPTIu
	IREY3MJ6bXMkix7WC4vb3I1VnSIw3d1/9Km2XLUc9xpiQZ8m/I9TO1TkeO0SlVOLpi4cmjfD5Ma
	B3BG1Vxm9ueCEqm5ToMBnWvv3KTii/HCrc59iAs4ESTDCV/KfuyIFW7AUSwq2Axd2bd0dDGRpWU
	vLJOnH/TgUIojpJpz7ZGvQe64nu5wFcK8wg0fuDMXFgpi4NEL2xwUTgo5pHvBFZv82GO2a70a05
	SdtWFPLIKOgOiaH3vroVtoFQhDbkWuQ5qqasyClMMak91WRu7PoAao/yQ6rIkfeSYtRYeC32qXp
	57pgMu+szcNcNi59OY+IcFF9TUsM4
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr546314765e9.14.1795801775817;
        Fri, 27 Nov 2026 09:49:35 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/37] sqlite3: fix CVE-2026-119373
Date: Fri, 27 Nov 2026 18:48:47 +0100
Message-ID: <107ffa6bb98cbb394bb881f60ebafdffee797922.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251410
Content-Type: text/plain; charset="utf-8"

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
3.54.0.

Backport the fix to sqlite v3.45.3.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-119373
[2] https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119373.patch      | 48 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
new file mode 100644
index 00000000000..ff89746e6c2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
@@ -0,0 +1,48 @@
+From ab37658e91b4a19923eb930a9e2ee62b561a4ec6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
+Date: Wed, 4 Nov 2026 16:38:46 +0100
+Subject: [PATCH] In fts5, account for the possibility of negative docids when
+ allocating a buffer to store the results of merging detail=none prefix lists.
+ Fix for report [bugs:/info/2026-08-04T08:49:27Z | 2026-08-04T08:49:27Z].
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+FossilOrigin-Name: a7f8c92f623e9cbe8a61266d949916acc9e5110c94dff4aa6fd1ad2ea8a60d4e
+
+CVE: CVE-2026-119373
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/e1c9934f9f11a499029abb020ea715a08970da80]
+
+Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ sqlite3.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 6acf46a..2b1e6b9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244805,7 +244805,7 @@ static void fts5MergeRowidLists(
+   (void)nBuf;
+   memset(&out, 0, sizeof(out));
+   assert( nBuf==1 );
+-  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n);
++  sqlite3Fts5BufferSize(&p->rc, &out, p1->n + p2->n + 9);
+   if( p->rc ) return;
+ 
+   fts5NextRowid(p1, &i1, &iRowid1);
+@@ -244813,12 +244813,12 @@ static void fts5MergeRowidLists(
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 975f3bdab84..e7c5bcdac4e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-7709.patch \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
-          "
+           file://CVE-2026-119373.patch \
+"
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
