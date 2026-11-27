Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1454.1795801777981853658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jS4gDIFU;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5990811f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801776; x=1796406576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qze8TGD39EwA/ZSc30P7g6YCamVIHrEvXqJ+djnkIkc=;
        b=jS4gDIFUVwTl5W77QiYeo7R4RL6W+zcSySwwgOkZV8rKAnccagYDNoEZws5Icd4XTf
         d1/nv4RF6phwru9wfvdUoDnuAMaOrxJVbKYmGe5OBu0wyC8QCZsW6jYVTLNdhB3fQZvc
         v2YLtpXBVhk/4i884oMseNFyeSChPrZQETrs90shWatH4V/zp2CYtI8uBQ2jzQPLkgzi
         ErWpfWCnaS0FpblOCYC6Cosj2cKvVIq1fYCaK0ZJOXwWqnX1PyeogReul+IR9QkNhpMX
         Mf4gCmymbH/TgS5QPkTL1Za/VQYKmti3oGQFHbSJCpkUlQ/sTDkQvzIneEZhIJ7PXXeU
         3dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801776; x=1796406576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qze8TGD39EwA/ZSc30P7g6YCamVIHrEvXqJ+djnkIkc=;
        b=fnOi5NlFP2XOH0i/xk9jt1Xr5NFk0eQtO01Fe38gE6seXfQwknKCtHOC7YmxpvoIcg
         KrQX5C+W0yXcY6utNQKacTnSc7usrDaIWvLjBgUpfAT/9SFRBW7IR/uD5VFG8dmSEW2V
         vLDBYv3tQYA2bzekGOhp3SsjdUOD3cBtixvezHeAaq+/YtIRUAJMIf9PRUmRR+/Br+og
         y0MVwPK2aqCRX2wbGBxg6ET8DEhxDdSWnHbVUcEUvvYWhAX8yUoEdya5OKgu1K/S8EGj
         hKwWJQka3WB0rJ9p1XsrM37UiwWKbZGg/FVC+q1rRt8J61l9k1S6A5gftdgaVzjDOTxZ
         qUog==
X-Gm-Message-State: APuU4Z+TixS6tVTn+MCK78IAilNDfW5FQK0km3kK3akP1ffRdDTpMZeV
	6t0pd91GRzkk2YtmFE5oQmVjwQoQbIxNa/c4oHPFrfDV0HrBDIw/ux0AIlqZo4WyES1hOorBXv/
	We/2HeoA=
X-Gm-Gg: AZFdTZe7g99HTWb+1guQdHMo9oYJ5258cIfVJGE68h5zqGmY+Z12noCN32Hu3RK/5ZL
	hZZDnXcSBOUvWqs4rRyNZSWE+cJg8w5o+JRcqGEqcYKeD8zfGADba1oqStRMOf4UxVNy34S9eu9
	FT73x8us0Ax66pgz0fHtS/QEl7L8yG3xGReGrGSBrKMdtMEfdQ4MVeeysf4Xl5wsGUUrNQieiv5
	jHHINAlPRsz3nOgsd/mziv71/nHISbg5ILakZ8u3ZZG6Kem6Y8KsmG9LnwrpH4bvsbZV+zoeHaD
	QvcUlU9TId1PQXZPyiqX4SESOqpszfXqH69l9+SsAd7BMVv087wJOu0gOCkVl6MxIlep8xCUxqL
	AoKfkgdGebvAS/xPGP96Fug0M63KfZWuSVyJNNBV/QACCFbrZbA/Ql+C3rh56kAjMIM6KCUALDz
	t9oD+dSat6weWoNk2PT4VJaLuCwHzjOGYS7wcKb0CLzv7qQaa8RGcsMJkcSiCPsWszayiJ50T+S
	aW1/T1E3kndmVfisEuvDfcp/xZes+BIDJE4CX+UOogBaPFRqf5s2pV//82zLIekdT5jqiYJpzF0
	4sFxp1WJ1ZWdqUKzGlGHYJau/ggeZPYnqhOKZULXX7T4XQ5qwbF+A7zSpHePdpbfukRPEepyD9r
	aOL+sJlzZeU8cddgMkxlU0FlLFF3FPg==
X-Received: by 2002:a05:6000:2c05:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4abaac57bf5mr47230783f8f.3.1795801776191;
        Fri, 27 Nov 2026 09:49:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/37] sqlite3: fix CVE-2026-119374
Date: Fri, 27 Nov 2026 18:48:48 +0100
Message-ID: <b633bf9ef64d0b9c4352fcfe509d5231a765f1c6.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251411
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
 .../sqlite/sqlite3/CVE-2026-119374.patch      | 78 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 00000000000..cf4dd9cb322
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
@@ -0,0 +1,78 @@
+From 6875e24f0c0612feccb97ab4c3f92c8444833373 Mon Sep 17 00:00:00 2001
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
+- Used p->rc = FTS5_CORRUPT; because current version of SQLite does
+  not define the newer FTS5_CORRUPT_IDX(p) helper.
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
+index 9d5790a0d9..a397e4d36b 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -244270,32 +244270,36 @@ static void fts5DoSecureDelete(
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
++        p->rc = FTS5_CORRUPT;
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index e7c5bcdac4e..c1e2006a6fe 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2025-70873.patch \
            file://CVE-2026-11822_CVE-2026-11824.patch \
            file://CVE-2026-119373.patch \
+           file://CVE-2026-119374.patch \
 "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
