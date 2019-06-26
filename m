Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE35E7E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:38 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id m30so1652438pff.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7MP90QPFzf3RShunZple+56TVE27c53lNZqFaVH+v+0=;
	b=rGwZ2DV/3wBwptTVaEmlryszdpjEr+a5dAs/Eicf1UBvdzRFVKC9dGVZpYLuqCNTP0
	mN368fuEmlpxIPcNOdHjT137BIK9xARksNiBMxGYJRT2ijgBurOWydo7w5WrpTB97sO/
	A1DHtF9CG0B1kMPEsjCbXA7+Qu9O4jer33AkzLQjbqurqqIhGWJe0Bq1eVmmHE/eLua6
	fXYRYlLjvyv50TLROC1xTELraCP39KaVUFMV8Q5sQZSxGteQCwsB7hZE6vvYPDktjyFP
	q7N2VPhsWbm8VDQUt/7TYj9Fm5I3f2IoRR7PNa9lboX1BmyTOufEwd/CJZn0ydQiOllx
	rsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7MP90QPFzf3RShunZple+56TVE27c53lNZqFaVH+v+0=;
	b=Uqknh9NAoqrNIbM8+xjYxdCBjooA7giPhgPTq/pvebqp+watAv2ITNFzEFv7Q+TCPm
	6glKFZf2s9sJC2ByW70UAzQqFKvREE1tL65XfF663ZBxqgInhY3jZEJRtFN9677U48j4
	pXQQgdyVJJp3tjfvi50tTwpMWwb48SKqjeAoh1VHdKXz3//f4mgSmxy7EKBoQZAy4sFJ
	diLwVom4i0e9BWFVpe2IbMdeHoslIXHRGkGr3nz5wfMwgdMQChaamgLqp/ySxVUTRU/6
	Rb5wjapwtxMKFXmRFVSwBLUCRwqUOodK2glBi/hExqsh9pFSVW6lVqyZ9TU9/QJ2jEG1
	p4pw==
X-Gm-Message-State: APjAAAX+NLs1I9XrHpgapc/HUgBEh1qhTZdRc2RnXbMYZ4n4iaFc8QjO
	BLQuIjjn08q/SjMqKVLkbCmSX/hc/oY=
X-Google-Smtp-Source: APXvYqwwBfWNvxM9Z0z+wp1ZWprMu29Z5zLSvusSkd224lqF9vdcQz/27jVO3UgVXyrogPxt7Whb5A==
X-Received: by 2002:a65:63d1:: with SMTP id n17mr3965617pgv.382.1561568019633; 
	Wed, 26 Jun 2019 09:53:39 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:08 -0700
Message-Id: <e2f9efdc93068bce00b07021aa447f0b8786f69d.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 07/25] sqlite3: Security fixes for CVE-2018-20505 & 20506
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:39 -0000

From: Armin Kuster <akuster@mvista.com>

Source: sqlite.org
MR: 97484, 97490
Type: Security Fix
Disposition: Backport from sqilte.org
ChangeID: c6105b5d3ce4fb2c0f38c3cab745b769d2df38f5
Description:

Affects < 3.26.0
fixes:
CVE-2018-20505
CVE-2018-20506

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sqlite/files/CVE-2018-20505.patch              |  31 +++++++
 .../sqlite/files/CVE-2018-20506.patch              | 103 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2018-20505.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2018-20506.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2018-20505.patch b/meta/recipes-support/sqlite/files/CVE-2018-20505.patch
new file mode 100644
index 0000000..d1119f3
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2018-20505.patch
@@ -0,0 +1,31 @@
+From: D. Richard Hipp <drh@hwaci.com>
+Date: Sat, 3 Nov 2018 13:11:24 +0000 (+0000)
+Subject: Fix a assert() in the query planner that can arise when doing row-value
+X-Git-Tag: version-3.26.0~59
+X-Git-Url: https://repo.or.cz/sqlite.git/commitdiff_plain/24298027a30cf7941f16a8cc878d0c1f9f14308f
+
+Fix a assert() in the query planner that can arise when doing row-value
+operations on a PRIMARY KEY that contains duplicate columns.
+Ticket [1a84668dcfdebaf12415d].
+
+https://sqlite.org/src/info/1a84668dcfdebaf12415d
+
+upstream-Status: Backport
+CVE: CVE-2018-20505
+affects <= 3.26.0
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: sqlite-autoconf-3230100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3230100.orig/sqlite3.c
++++ sqlite-autoconf-3230100/sqlite3.c
+@@ -131231,7 +131231,7 @@ static Expr *removeUnindexableInClauseTe
+     for(i=iEq; i<pLoop->nLTerm; i++){
+       if( pLoop->aLTerm[i]->pExpr==pX ){
+         int iField = pLoop->aLTerm[i]->iField - 1;
+-        assert( pOrigRhs->a[iField].pExpr!=0 );
++        if( pOrigRhs->a[iField].pExpr==0 ) continue; /* Duplicate PK column */
+         pRhs = sqlite3ExprListAppend(pParse, pRhs, pOrigRhs->a[iField].pExpr);
+         pOrigRhs->a[iField].pExpr = 0;
+         assert( pOrigLhs->a[iField].pExpr!=0 );
diff --git a/meta/recipes-support/sqlite/files/CVE-2018-20506.patch b/meta/recipes-support/sqlite/files/CVE-2018-20506.patch
new file mode 100644
index 0000000..7919f9b
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2018-20506.patch
@@ -0,0 +1,103 @@
+From: Dan Kennedy <danielk1977@gmail.com>
+Date: Sat, 3 Nov 2018 16:51:30 +0000 (+0000)
+Subject: Add extra defenses against strategically corrupt databases to fts3/4.
+X-Git-Tag: version-3.26.0~58
+X-Git-Url: https://repo.or.cz/sqlite.git/commitdiff_plain/19816852d4e82e115338b1997540c26a1b794d18
+
+Add extra defenses against strategically corrupt databases to fts3/4.
+
+https://sqlite.org/src/info/940f2adc8541a838
+
+Upstream-Status: Backport
+CVE: CVE-2018-20506
+Affects <= 3.26.0
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: sqlite-autoconf-3230100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3230100.orig/sqlite3.c
++++ sqlite-autoconf-3230100/sqlite3.c
+@@ -152368,7 +152368,7 @@ static int fts3ScanInteriorNode(
+   const char *zCsr = zNode;       /* Cursor to iterate through node */
+   const char *zEnd = &zCsr[nNode];/* End of interior node buffer */
+   char *zBuffer = 0;              /* Buffer to load terms into */
+-  int nAlloc = 0;                 /* Size of allocated buffer */
++  i64 nAlloc = 0;                 /* Size of allocated buffer */
+   int isFirstTerm = 1;            /* True when processing first term on page */
+   sqlite3_int64 iChild;           /* Block id of child node to descend to */
+ 
+@@ -152406,14 +152406,14 @@ static int fts3ScanInteriorNode(
+     zCsr += fts3GetVarint32(zCsr, &nSuffix);
+     
+     assert( nPrefix>=0 && nSuffix>=0 );
+-    if( &zCsr[nSuffix]>zEnd ){
++    if( nPrefix>zCsr-zNode || nSuffix>zEnd-zCsr ){
+       rc = FTS_CORRUPT_VTAB;
+       goto finish_scan;
+     }
+-    if( nPrefix+nSuffix>nAlloc ){
++    if( (i64)nPrefix+nSuffix>nAlloc ){
+       char *zNew;
+-      nAlloc = (nPrefix+nSuffix) * 2;
+-      zNew = (char *)sqlite3_realloc(zBuffer, nAlloc);
++      nAlloc = ((i64)nPrefix+nSuffix) * 2;
++      zNew = (char *)sqlite3_realloc64(zBuffer, nAlloc);
+       if( !zNew ){
+         rc = SQLITE_NOMEM;
+         goto finish_scan;
+@@ -162012,15 +162012,19 @@ static int fts3SegReaderNext(
+   ** safe (no risk of overread) even if the node data is corrupted. */
+   pNext += fts3GetVarint32(pNext, &nPrefix);
+   pNext += fts3GetVarint32(pNext, &nSuffix);
+-  if( nPrefix<0 || nSuffix<=0 
+-   || &pNext[nSuffix]>&pReader->aNode[pReader->nNode] 
++  if( nSuffix<=0 
++   || (&pReader->aNode[pReader->nNode] - pNext)<nSuffix
++   || nPrefix>pReader->nTermAlloc
+   ){
+     return FTS_CORRUPT_VTAB;
+   }
+ 
+-  if( nPrefix+nSuffix>pReader->nTermAlloc ){
+-    int nNew = (nPrefix+nSuffix)*2;
+-    char *zNew = sqlite3_realloc(pReader->zTerm, nNew);
++  /* Both nPrefix and nSuffix were read by fts3GetVarint32() and so are
++  ** between 0 and 0x7FFFFFFF. But the sum of the two may cause integer
++  ** overflow - hence the (i64) casts.  */
++  if( (i64)nPrefix+nSuffix>(i64)pReader->nTermAlloc ){
++    i64 nNew = ((i64)nPrefix+nSuffix)*2;
++    char *zNew = sqlite3_realloc64(pReader->zTerm, nNew);
+     if( !zNew ){
+       return SQLITE_NOMEM;
+     }
+@@ -162042,7 +162046,7 @@ static int fts3SegReaderNext(
+   ** b-tree node. And that the final byte of the doclist is 0x00. If either 
+   ** of these statements is untrue, then the data structure is corrupt.
+   */
+-  if( &pReader->aDoclist[pReader->nDoclist]>&pReader->aNode[pReader->nNode] 
++  if( (&pReader->aNode[pReader->nNode] - pReader->aDoclist)<pReader->nDoclist
+    || (pReader->nPopulate==0 && pReader->aDoclist[pReader->nDoclist-1])
+   ){
+     return FTS_CORRUPT_VTAB;
+@@ -164367,7 +164371,9 @@ static int nodeReaderNext(NodeReader *p)
+       p->iOff += fts3GetVarint32(&p->aNode[p->iOff], &nPrefix);
+     }
+     p->iOff += fts3GetVarint32(&p->aNode[p->iOff], &nSuffix);
+-
++    if( nPrefix>p->iOff || nSuffix>p->nNode-p->iOff ){
++      return SQLITE_CORRUPT_VTAB;
++    }
+     blobGrowBuffer(&p->term, nPrefix+nSuffix, &rc);
+     if( rc==SQLITE_OK ){
+       memcpy(&p->term.a[nPrefix], &p->aNode[p->iOff], nSuffix);
+@@ -164375,6 +164381,9 @@ static int nodeReaderNext(NodeReader *p)
+       p->iOff += nSuffix;
+       if( p->iChild==0 ){
+         p->iOff += fts3GetVarint32(&p->aNode[p->iOff], &p->nDoclist);
++        if( (p->nNode-p->iOff)<p->nDoclist ){
++          return SQLITE_CORRUPT_VTAB;
++        }
+         p->aDoclist = &p->aNode[p->iOff];
+         p->iOff += p->nDoclist;
+       }
diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
index 3755761..d214ea1 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://CVE-2018-20505.patch \
+  file://CVE-2018-20506.patch \
   "
 SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
 SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
-- 
2.7.4


