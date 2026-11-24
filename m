Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31016.1795560743773929112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=lLWfejhf;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4898163f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560742; x=1796165542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mu/DbNCUQxkTGBZhcAE7oQHGkRCiLhL4YIaZcKee6Tc=;
        b=lLWfejhfP2I2RS2At61KYblQijggmRZ4XZycoWL/NR3Q7EN9OrRYXJTEu97lAuw+2c
         /wwIvSwJFY2fbXcNy06G3KJktNGL1J3j1RDJ3QBKd4t+JeyAW2xpara5SVEGbsolQxS6
         +H7tGcsgEdnt1ZPW1fWkOFa2izuoOQX8Y6rrRcE6aN94fCiBrLQ7TyvTmGJNzbR2bma6
         Tf57dDTVXVlcc9Fr5+sx1zTb09lOzqEoTay45+gTzHkol6Gvu6Pjvm8Qh7KjSS61xVQG
         VYJg1EdwGsdxpfVgIPaDSk0bwPbXkOa+ng/DMd4VoP1WyvgrVjtHPpv4rXIZ4r5BFhOw
         LEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560742; x=1796165542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mu/DbNCUQxkTGBZhcAE7oQHGkRCiLhL4YIaZcKee6Tc=;
        b=JxN39XO2h6CWjTQ6FlWtWHX5c3pxT+TTRQjTgrIUI7p1dST04bRxfKWlwnIXMpdyPx
         Pk84yYrNsp7KZ33SMw1n3vyTMmXiOk3R6DJOTku5tWBt+4PA6tGQWTf9rOxcJBBJ1CWv
         MweMU3TC1VdYxsHBRrcLxb3TenR0hGBW9vbYQfMXJccz/waXNIbiHZMyC7zX1NeC3W3o
         GfNAKU6jImou8Fur0O5wcM0z8KiOAg9g6t0VkoU2PUKsjaXHCgYKIGP2bfCxFvGWMtPC
         5fdb58S3XrXXvqX6RJT59hFguYgagbLBj7EDdEQmAgwxPS+AdvZ5KJg3w+HRPsxauMwN
         uIsg==
X-Gm-Message-State: APuU4Z8L884Nqhhn/om1grM94jXzkEtIAgBS3JRN5lhGGlYN+VSgUNU/
	3SqG0klz85X2OpWufJyBeCehqLXcy0umHrIvqKLNwdaxv5LGMMhOeDkEGc6orpuTPSFs0DDLQvN
	qD+LerxE=
X-Gm-Gg: AZFdTZfi+46Iz+I2vtK15NdDc8eA8h87E2mVTattnfp/TNddyMa1OJTeVS/+3BIvWOl
	8KBMzm98v2lZC2FY5BAZYrvLipX9LBhoid29+SMKiGzjujxUELj1BPB31gdxa35KkqBSc8mkpAN
	cS8TNTbqQIq1BJbpRAQhzrK0Zru7FJB+PCX0uGKNmd4TaU3cU6+eiHO/MU+zWCqElqCX1l80Va9
	JKKq5/QxqFC2Ilmdi+rmMIIsz3IX3M07Uq4oK2dRTgt7Hh98xA1EbMGLwwAEnUV/eBptzh1zlRY
	mmloPzceY7sqjPffpBdWsbO1k/qAisVUmxle/pZJn0F/VpD2hWXqRlwPU0ZHgO+jNBM6Ed3fSMz
	xd7Q95jhXEzgQ+luoIFt31TgTWSkjBo5qE9nAq+4xWUqSPZR3gFr5po+nNBWpV4K8sfZ22X7aEt
	vWyGR3IAJzuZK655vTSPnF3+3F7kmQ9IKl8FM3z/dZVuoHhzYZKpGDilUIh/6eXCMNpBBR6RN3A
	q4u67I/buCZbTBtWg5ZfhQ1jJWG2VypVDRe10NNzEJ5hzj0odYREyou+somk97uglcqPJs3QiQa
	1Uokqy/LlK7+u2qIS6P4DSlDmastdc8o185Gur4/k6DlYLnOfBGstO8ztOBBp8m7fr6W9IqZYro
	B3EG78Z3WkfoqAlTrb3P5KSipvyaN
X-Received: by 2002:a5d:6f06:0:b0:4a6:8d5b:7338 with SMTP id ffacd0b85a97d-4abb3a4d35fmr32084442f8f.37.1795560741771;
        Tue, 24 Nov 2026 14:52:21 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 04/21] sqlite3: fix CVE-2026-119374
Date: Tue, 24 Nov 2026 23:51:11 +0100
Message-ID: <d5a1393342a363931caf95642712ff1d36f2b0eb.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251084
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
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
new file mode 100644
index 00000000000..15ca70d338f
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
+index 06ceecf..4fb0674 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -256381,34 +256381,38 @@ static void fts5DoSecureDelete(
+   if( p->rc==SQLITE_OK ){
+     const int nMove = nPg - iNextOff;     /* Number of bytes to move */
+     int nShift = iNextOff - iOff;         /* Distance to move them */
+-
++    int nNewPg = 0;
+     int iPrevKeyOut = 0;
+-    int iKeyIn = 0;
++    i64 iKeyIn = 0;
+ 
+     if( nMove>0 ){
+       memmove(&aPg[iOff], &aPg[iNextOff], nMove);
+     }
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
index 4ec6eb230e0..0c7b7137289 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://0001-Add-option-to-disable-zlib.patch \
 	file://CVE-2026-119377_p1.patch \
 	file://CVE-2026-119377_p2.patch \
 	file://CVE-2026-119373.patch \
+	file://CVE-2026-119374.patch \
 "
 SRC_URI[sha256sum] = "0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c"
 
