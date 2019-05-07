Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7094B7D912
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 16:11:11 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id n134so10448539lfn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6mnywo+P4cmUKfbnnpcQv7Vl69Zk85rAmavYdZM/hlg=;
	b=apEE7jNnx9NX8YQ4yb2tTy4XsTNiOS3jm9tfZCwcbb23dpOcNuQJO1ZobRIxMLieLf
	zeOLRQLflBdRxwL5K+rSl269wxzDFXlVLhSiAByQDAB0PHEvgSCrX2yjkn0V86NSJH4a
	mEKA7gg3CenIgJ9u94nsh5hF1j1sw1q5xzL+3zfP1kTpn2aqjbZKam3b78SSb8Oj3cj5
	Y38DvKCJ9hwH6y1QyxK1xD+9K5k2MNd71fLws1yr26iC+29Y1Dap8jtbISsmgTn7crhG
	mHxEK+/qKwp5nfS2dQ5HG+cV2YzOxU2vVRa8XAg/o7BwQnTsxcfCyNRyKUZxBuiFj1Eh
	ifTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6mnywo+P4cmUKfbnnpcQv7Vl69Zk85rAmavYdZM/hlg=;
	b=cv6ij/ACdA1UdT+1Lqem6ZVwDbrUXsqXqBi39urzJ+owektNeaQmFoyAJyqA8GuKvT
	QZwd13o2f4egXWycN7UTLlHxcigjLwpErGUQ91q6hTQDgTPhhP+iAR7ijgkQcfrBvGnh
	qeXF8mBVj2Ztno7Qx3db4aVecDTxOEg3ojILx+8jbt1RNhbEJdUluCQPYFUxfzi2ZNxm
	WPv39EquZ/MAChzI4khQHHMXpNJhuMY/LlmLwJvrcl1onn4Xk59JPIrJCzW6HVghk7h5
	vI+c+lDXykPcSMU5OdYTUOLbYaVDtRGXcPc3TIrEKhsbuO3QlH8O3hGR0ZIC66Co49K3
	jvmA==
X-Gm-Message-State: APjAAAWsldfSbl0FPTioptYeHIyW8w5+OS6LNpz4lblVQkWKycUUjW6r
	9/UF99LHAjjMXDwtvyoN+LxfZJ4iD44=
X-Google-Smtp-Source: APXvYqzjGKqUdQHJkFZ8c7+nqastWyT4Jnhh1WUyotrltqinjXzCgZ5MBopgWOZBEasPhVSxGmMwLA==
X-Received: by 2002:a19:f243:: with SMTP id d3mr16540784lfk.168.1557245471476; 
	Tue, 07 May 2019 09:11:11 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id c7sm3750455lja.90.2019.05.07.09.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 09:11:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 18:11:09 +0200
Message-Id: <20190507161109.5420-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] sqlite3: update to 3.28.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 16:11:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../sqlite/sqlite3/CVE-2019-9936.patch        |  28 ---
 .../sqlite/sqlite3/CVE-2019-9937.patch        | 187 ------------------
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb |  13 --
 meta/recipes-support/sqlite/sqlite3_3.28.0.bb |   8 +
 4 files changed, 8 insertions(+), 228 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.27.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.28.0.bb

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
deleted file mode 100644
index 1b907b9d4d..0000000000
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9936.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Running fts5 prefix queries inside a transaction could trigger a heap-based
-buffer over-read in fts5HashEntrySort in sqlite3.c, which may lead to an
-information leak.
-
-CVE: CVE-2019-9936
-Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=45c73deb440496e8&to=b3fa58dd7403dbd4]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- sqlite3.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 4729f45..65527d8 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -207759,7 +207759,9 @@ static int fts5HashEntrySort(
-   for(iSlot=0; iSlot<pHash->nSlot; iSlot++){
-     Fts5HashEntry *pIter;
-     for(pIter=pHash->aSlot[iSlot]; pIter; pIter=pIter->pHashNext){
--      if( pTerm==0 || 0==memcmp(fts5EntryKey(pIter), pTerm, nTerm) ){
-+      if( pTerm==0
-+       || (pIter->nKey+1>=nTerm && 0==memcmp(fts5EntryKey(pIter), pTerm, nTerm))
-+      ){
-         Fts5HashEntry *pEntry = pIter;
-         pEntry->pScanNext = 0;
-         for(i=0; ap[i]; i++){
--- 
-2.20.1
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch
deleted file mode 100644
index baa5666dda..0000000000
--- a/meta/recipes-support/sqlite/sqlite3/CVE-2019-9937.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-Interleaving reads and writes in a single transaction with an fts5 virtual table
-will lead to a NULL Pointer Dereference in fts5ChunkIterate in sqlite3.c.
-
-CVE: CVE-2019-9937
-Upstream-Status: Backport [https://sqlite.org/src/vpatch?from=c2f50aa4e7bad882&to=45c73deb440496e8]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- sqlite3.c | 83 ++++++++++++++++++++++++++++++++++++++-----------------
- 1 file changed, 57 insertions(+), 26 deletions(-)
-
-diff --git a/sqlite3.c b/sqlite3.c
-index 65527d8..b1a8799 100644
---- a/sqlite3.c
-+++ b/sqlite3.c
-@@ -200668,8 +200668,9 @@ static void sqlite3Fts5HashClear(Fts5Hash*);
- 
- static int sqlite3Fts5HashQuery(
-   Fts5Hash*,                      /* Hash table to query */
-+  int nPre,
-   const char *pTerm, int nTerm,   /* Query term */
--  const u8 **ppDoclist,           /* OUT: Pointer to doclist for pTerm */
-+  void **ppObj,			  /* OUT: Pointer to doclist for pTerm */
-   int *pnDoclist                  /* OUT: Size of doclist in bytes */
- );
- 
-@@ -207501,19 +207502,25 @@ static int fts5HashResize(Fts5Hash *pHash){
-   return SQLITE_OK;
- }
- 
--static void fts5HashAddPoslistSize(Fts5Hash *pHash, Fts5HashEntry *p){
-+static int fts5HashAddPoslistSize(
-+  Fts5Hash *pHash,
-+  Fts5HashEntry *p,
-+  Fts5HashEntry *p2
-+){
-+  int nRet = 0;
-   if( p->iSzPoslist ){
--    u8 *pPtr = (u8*)p;
-+    u8 *pPtr = p2 ? (u8*)p2 : (u8*)p;
-+    int nData = p->nData;
-     if( pHash->eDetail==FTS5_DETAIL_NONE ){
--      assert( p->nData==p->iSzPoslist );
-+      assert( nData==p->iSzPosList );
-       if( p->bDel ){
--        pPtr[p->nData++] = 0x00;
-+        pPtr[nData++] = 0x00;
-         if( p->bContent ){
--          pPtr[p->nData++] = 0x00;
-+          pPtr[nData++] = 0x00;
-         }
-       }
-     }else{
--      int nSz = (p->nData - p->iSzPoslist - 1);       /* Size in bytes */
-+      int nSz = (nData - p->iSzPoslist - 1);       /* Size in bytes */
-       int nPos = nSz*2 + p->bDel;                     /* Value of nPos field */
- 
-       assert( p->bDel==0 || p->bDel==1 );
-@@ -207523,14 +207530,19 @@ static void fts5HashAddPoslistSize(Fts5Hash *pHash, Fts5HashEntry *p){
-         int nByte = sqlite3Fts5GetVarintLen((u32)nPos);
-         memmove(&pPtr[p->iSzPoslist + nByte], &pPtr[p->iSzPoslist + 1], nSz);
-         sqlite3Fts5PutVarint(&pPtr[p->iSzPoslist], nPos);
--        p->nData += (nByte-1);
-+        nData += (nByte-1);
-       }
-     }
- 
--    p->iSzPoslist = 0;
--    p->bDel = 0;
--    p->bContent = 0;
-+    nRet = nData - p->nData;
-+    if( p2 == 0 ){
-+      p->iSzPoslist = 0;
-+      p->bDel = 0;
-+      p->bContent = 0;
-+      p->nData = nData;
-+    }
-   }
-+  return nRet;
- }
- 
- /*
-@@ -207642,7 +207654,7 @@ static int sqlite3Fts5HashWrite(
-   /* If this is a new rowid, append the 4-byte size field for the previous
-   ** entry, and the new rowid for this entry.  */
-   if( iRowid!=p->iRowid ){
--    fts5HashAddPoslistSize(pHash, p);
-+    fts5HashAddPoslistSize(pHash, p, 0);
-     p->nData += sqlite3Fts5PutVarint(&pPtr[p->nData], iRowid - p->iRowid);
-     p->iRowid = iRowid;
-     bNew = 1;
-@@ -207789,8 +207801,9 @@ static int fts5HashEntrySort(
- */
- static int sqlite3Fts5HashQuery(
-   Fts5Hash *pHash,                /* Hash table to query */
-+  int nPre,
-   const char *pTerm, int nTerm,   /* Query term */
--  const u8 **ppDoclist,           /* OUT: Pointer to doclist for pTerm */
-+  void **ppOut,			  /* OUT: Pointer to new object */
-   int *pnDoclist                  /* OUT: Size of doclist in bytes */
- ){
-   unsigned int iHash = fts5HashKey(pHash->nSlot, (const u8*)pTerm, nTerm);
-@@ -207804,11 +207817,20 @@ static int sqlite3Fts5HashQuery(
-   }
- 
-   if( p ){
--    fts5HashAddPoslistSize(pHash, p);
--    *ppDoclist = (const u8*)&zKey[nTerm+1];
--    *pnDoclist = p->nData - (sizeof(Fts5HashEntry) + nTerm + 1);
-+    int nHashPre = sizeof(Fts5HashEntry) + nTerm + 1;
-+    int nList = p->nData - nHashPre;
-+    u8 *pRet = (u8*)(*ppOut = sqlite3_malloc64(nPre + nList + 10));
-+    if ( pRet ){
-+       Fts5HashEntry *pFaux = (Fts5HashEntry*)&pRet[nPre-nHashPre];
-+       memcpy(&pRet[nPre], &((u8*)p)[nHashPre], nList);
-+       nList += fts5HashAddPoslistSize(pHash, p, pFaux);
-+       *pnDoclist = nList;
-+    }else{
-+       *pnDoclist = 0;
-+       return SQLITE_NOMEM;
-+    }
-   }else{
--    *ppDoclist = 0;
-+    *ppOut = 0;
-     *pnDoclist = 0;
-   }
- 
-@@ -207841,7 +207863,7 @@ static void sqlite3Fts5HashScanEntry(
-   if( (p = pHash->pScan) ){
-     char *zKey = fts5EntryKey(p);
-     int nTerm = (int)strlen(zKey);
--    fts5HashAddPoslistSize(pHash, p);
-+    fts5HashAddPoslistSize(pHash, p, 0);
-     *pzTerm = zKey;
-     *ppDoclist = (const u8*)&zKey[nTerm+1];
-     *pnDoclist = p->nData - (sizeof(Fts5HashEntry) + nTerm + 1);
-@@ -210311,31 +210333,40 @@ static void fts5SegIterHashInit(
-   int flags,                      /* Mask of FTS5INDEX_XXX flags */
-   Fts5SegIter *pIter              /* Object to populate */
- ){
--  const u8 *pList = 0;
-   int nList = 0;
-   const u8 *z = 0;
-   int n = 0;
-+  Fts5Data *pLeaf = 0;
- 
-   assert( p->pHash );
-   assert( p->rc==SQLITE_OK );
- 
-   if( pTerm==0 || (flags & FTS5INDEX_QUERY_SCAN) ){
-+    const u8 *pList = 0;
-+
-     p->rc = sqlite3Fts5HashScanInit(p->pHash, (const char*)pTerm, nTerm);
-     sqlite3Fts5HashScanEntry(p->pHash, (const char**)&z, &pList, &nList);
-     n = (z ? (int)strlen((const char*)z) : 0);
-+    if ( pList ){
-+      pLeaf = fts5IdxMalloc(p, sizeof(Fts5Data));
-+      if ( pLeaf ){
-+        pLeaf->p = pList;
-+      }
-+    }
-   }else{
--    pIter->flags |= FTS5_SEGITER_ONETERM;
--    sqlite3Fts5HashQuery(p->pHash, (const char*)pTerm, nTerm, &pList, &nList);
-+    p->rc = sqlite3Fts5HashQuery(p->pHash, sizeof(Fts5Data),
-+        (const char*)pTerm, nTerm, (void**)&pLeaf, &nList
-+    );
-+    if( pLeaf ){
-+      pLeaf->p = (u8*)&pLeaf[1];
-+    }
-     z = pTerm;
-     n = nTerm;
-+    pIter->flags |= FTS5_SEGITER_ONETERM;
-   }
- 
--  if( pList ){
--    Fts5Data *pLeaf;
-+  if( pLeaf ){
-     sqlite3Fts5BufferSet(&p->rc, &pIter->term, n, z);
--    pLeaf = fts5IdxMalloc(p, sizeof(Fts5Data));
--    if( pLeaf==0 ) return;
--    pLeaf->p = (u8*)pList;
-     pLeaf->nn = pLeaf->szLeaf = nList;
-     pIter->pLeaf = pLeaf;
-     pIter->iLeafOffset = fts5GetVarint(pLeaf->p, (u64*)&pIter->iRowid);
--- 
-2.20.1
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
deleted file mode 100644
index 4bdb04f4d1..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  file://CVE-2019-9936.patch \
-  file://CVE-2019-9937.patch \
-  "
-
-SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
-SRC_URI[sha256sum] = "50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.28.0.bb b/meta/recipes-support/sqlite/sqlite3_3.28.0.bb
new file mode 100644
index 0000000000..438a4ea471
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.28.0.bb
@@ -0,0 +1,8 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[md5sum] = "3c68eb400f8354605736cd55400e1572"
+SRC_URI[sha256sum] = "d61b5286f062adfce5125eaf544d495300656908e61fca143517afcc0a89b7c3"
-- 
2.17.1


