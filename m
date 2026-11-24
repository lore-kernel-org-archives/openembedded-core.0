Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31033.1795560766834164289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ETpS5a7z;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4413661f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560765; x=1796165565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jtd1jtKAM+JOxfX3VcsWoFkFDfdOQ5z3tQtFN8qKyA4=;
        b=ETpS5a7z9ThqdN673fsMcgNcmXLQnQ3eTvd3gRlOhIdse/SPa3AV8ZgssU+W9JniI4
         g4SpTOYPwaUSL/O986pVFE/FgMD499RpCHRzZgE1CzmCsx79OHcRans/MwuflMAakh/i
         6yObT/MsZmWNeyAopDgzSpeDmlZbVGu/SWlEolCCbcKTpRwc6msgwnrHi1wE3/fZEOG0
         IOde5VWzeNnRDIcVAIYOc6AJZldZSr/WKeWWg0qi2RauQhPOCM8mF7uIBlH8Ci+EEoyp
         HKQIKKRqTbfgFjFDkJBugkkLUdZUiXFGFJIjQOXWthMBF3W7fVusxHk2dwcPP2G8kVr4
         /zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560765; x=1796165565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jtd1jtKAM+JOxfX3VcsWoFkFDfdOQ5z3tQtFN8qKyA4=;
        b=HuuPIBjcKb3oaqHol0/I5rkmEstTErzU+YEliT6uG9sYbnwJJv7f8pZ7psMfxMJ0k5
         kcXwzInFnlPaqdMEbtNFb6n+0+59u3ZgvJDNP6HQV32Zlv/NauQO+IVHzZLkKmPDG+iA
         /FSUWfnd/IZG7ydgAUxKL7TzCxHNGoCDr8I7yO2gMIiZvdeEgyJs76UMwu1vCSH8e3j3
         Bvxal7amMGIZTgaVaaJbg7X4ZrcPHz0/FP6vT/79pGtv6AtkkxzKCwCHEF8tzTZwQ6hg
         X0rLo7Rk8t+gHp9O79Wy+WbL+Wt/P6h5lcPGBfN3EatfALXWoo4cSfy5lxQo4Khl35X/
         nH6g==
X-Gm-Message-State: APuU4Z9HDZA3B6JhP/uzyHJxvA+zjlIEniPiLBJwNkZ34BXtfzbWDz3T
	EROF7YYzNv5vhW4LXgrV/SQylt8VSDMlseAALIgjRSdu69OoKrU/baQC4Ep7CD/lMVNwmBJKmlE
	7i8CMfeU=
X-Gm-Gg: AZFdTZeEQko8INeJTkudKSCho00K5BxTxQxOVUsMBKe+Zq8p9xqLtS8GuXerCFvl3Gx
	q+WNlFlSLSyEt1C+WJPXR6UjqH4YLs7S5iyJyg+DQ48Tg3qRSS7tkvjSxGF1rL8BMimoN9WyN50
	2NklMk6RKrVejxMSWib8p2t4Aze8fu4KZa18IA1wyRsFtlqeHz/tkX071b7cMyHGDZhc1iaQ3er
	LUTZGsGEJmAjjoRYN/GgwVUkTyF0+4OCkZk0ZAKMqFzkY1ntu1nxv3K9C9rRfE/vT0FZGTDi+9S
	sHIZkKLUFhAaE9yAurHxQf0/QF0igE69gPkpU6GqIUagMZ73qgfv7GqsYTMKoTVz2jATqVX3dI4
	Q5zSBl7ZBTyonOSFUIZKm8RY7kbmXaBco6Y143bUzjchy7JT3mlsWq4twK2wPwKVel4e7UKreSR
	LJ1g8njfSgHNpVHH3qCylA7604k5FPp+SwBmj0d3NqRkF3ocCIFgtDkZkXP8F87IJsxa72vryMP
	GgyOqUe4NOfPin5kcXe7NcqVvDoi3DyuVXar9wVwInxAGFv70CsLrW9pGCVB6xULY/cvbqxN9rc
	1vMbadg/fJ5uajYjhbRQWX2Lf4c0ltzBCOZDkMmuFjTWVT4wjF+D/Yj+RqgSzvs6dMRuYHYoYq2
	EzH0VMQ3Tpmc2/PjVp0Nstl/w2s9bVKjA9Cp8JIWS0us7mHQV7Q==
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr324174285e9.0.1795560765103;
        Tue, 24 Nov 2026 14:52:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/21] sqlite3: fix CVE-2026-119374
Date: Tue, 24 Nov 2026 23:52:22 +0100
Message-ID: <b82d3d3ef2dd7eb469b171466b966ca78331db3a.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251107
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which addresses an FTS5
secure-delete buffer overrun when handling a corrupted database.
The GitHub mirror commit [1] corresponds to the SQLite Fossil
check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9
[2] https://sqlite.org/src/info/9cd4f9e920

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119374

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 76 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 00000000000..e82f48951b8
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,76 @@
+From 260a971baff8140195c181b94ce2264efbb042b9 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Tue, 11 Aug 2026 14:16:12 +0000
+Subject: [PATCH] Fix a problem in fts5 secure-delete code that could lead to a
+ buffer overrun when dealing with a strategically corrupted database. Problem
+ reported by YEONBA.
+
+FossilOrigin-Name: 9cd4f9e9205c5a5096388397a39349db9ff5377d19095c6b20388ff799969c31
+
+CVE: CVE-2026-119374
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d9de6eedbe918c074c7556400fa21df5960704d9]
+
+Backport Changes:
+- Applied the fix from ext/fts5/fts5_index.c to sqlite3.c because the
+  recipe uses SQLite's amalgamated source.
+- Omitted ext/fts5/test/fts5corruptB.test because the extracted source
+  does not include the upstream Tcl test tree.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index bfd285777d..1889632086 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -252752,32 +252752,36 @@ static void fts5DoSecureDelete(
+   if( p->rc==SQLITE_OK ){
+     const int nMove = nPg - iNextOff;     /* Number of bytes to move */
+     int nShift = iNextOff - iOff;         /* Distance to move them */
+-
++    int nNewPg = 0;
+     int iPrevKeyOut = 0;
+-    int iKeyIn = 0;
++    i64 iKeyIn = 0;
+ 
+     memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     iPgIdx -= nShift;
+-    nPg = iPgIdx;
++    nNewPg = iPgIdx;
+     fts5PutU16(&aPg[2], iPgIdx);
+ 
+     for(iIdx=0; iIdx<nIdx; /* no-op */){
+       u32 iVal = 0;
+       iIdx += fts5GetVarint32(&aIdx[iIdx], iVal);
+       iKeyIn += iVal;
++      if( iKeyIn>nPg ){
++        FTS5_CORRUPT_IDX(p);
++        break;
++      }
+       if( iKeyIn!=iDelKeyOff ){
+         int iKeyOut = (iKeyIn - (iKeyIn>iOff ? nShift : 0));
+-        nPg += sqlite3Fts5PutVarint(&aPg[nPg], iKeyOut - iPrevKeyOut);
++        nNewPg += sqlite3Fts5PutVarint(&aPg[nNewPg], iKeyOut - iPrevKeyOut);
+         iPrevKeyOut = iKeyOut;
+       }
+     }
+ 
+-    if( iPgIdx==nPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
++    if( p->rc==SQLITE_OK && iPgIdx==nNewPg && nIdx>0 && pSeg->iLeafPgno!=1 ){
+       fts5SecureDeleteIdxEntry(p, iSegid, pSeg->iLeafPgno);
+     }
+ 
+-    assert_nc( nPg>4 || fts5GetU16(aPg)==0 );
+-    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nPg);
++    assert_nc( nNewPg>4 || fts5GetU16(aPg)==0 );
++    fts5DataWrite(p, FTS5_SEGMENT_ROWID(iSegid,pSeg->iLeafPgno), aPg, nNewPg);
+   }
+   sqlite3_free(aIdx);
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index 52e7659a8ef..f76ca8bd564 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -14,4 +14,5 @@ SRC_URI += "\
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
+	file://CVE-2026-119374.patch \
 "
