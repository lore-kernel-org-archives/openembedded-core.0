Return-Path: <shuagr97@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 05EAD7DD6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 18:13:00 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d16so2210241qtq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 11:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:reply-to;
	bh=azY8LuIt00n02wO+pDH4hwuHIeAfi/R2Z39LuWtWLD0=;
	b=ddrrj2UPACjeF8ZuKQu8RDo7jfvXsP6FMb2GamNNBp0x5Bs0uMaw6gwDHaaQ/Npt4T
	xAfuvfVyCA0yfm/4WLoPb4/f9DOtzYMePYUMu+b/tHbbkousFXIAjhxgMxnehgZVCuEL
	WlLPgT/VjBJPrlJxA4dr2lK5iz/V2su5zViL8KySz8LFU17tmPhY8oyko6EdRgBJGmoH
	WlTypoyQKsEj4SMvjNXcxTjBLGVa0lcpyoc17AbWwoX7uSBcWRiajSbYU70PYkhTSACH
	BuMohZvtK9HkL/G4KR/esweUchmxxCtAkM1P/TG4PjWqVtoz+GaNwAyRO39EtWMOo1Oh
	4ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=azY8LuIt00n02wO+pDH4hwuHIeAfi/R2Z39LuWtWLD0=;
	b=j5Ciy5z/oM2BCOyNAXM3Nu61klxE0YAAS0bajMFZZCz2+VMpkMlTdDBoodlMXDohqf
	pBId2tlLTvq8CVCelP+meDRPNU9sAhaKxWekwkFTn4TCK/4delGHV53oQ9W6T4HXkw7N
	Gx0uuuqjpgbg7xlezAuCAcBBbtCROj1fCRGruASqfgCoRCx1W9QRTlVf6K2qAvJ++uVt
	vqGtGDHbNTI/2KD1C4BHc0lZRACqLYdQGEiI/+5DAtGEtyAGn0i0yvXiFvTzN8ZKe7GZ
	NJcDWvrXUCKrze7JZqnawSzSU/ZOaNqQ2/ys+yT5wI0RkvCw9zlxxc5GrzVTnoqQEFGv
	GQJw==
X-Gm-Message-State: APjAAAX6SQq7v46bJNtvtKdVfxwRh6nUyF64DINjYOb7Ldp/P6ox68t5
	WVvv+1NQtNRpI58UTGOEoqx+p06e
X-Google-Smtp-Source: APXvYqy8d0HyUndeG1KBcaSyE9aUwDdchtAA+EwMNAHbvp7cf6rXbYYfAV+aRFHXwRKMxtOm6EG6Zw==
X-Received: by 2002:ac8:c01:: with SMTP id k1mr31498901qti.59.1569953581554;
	Tue, 01 Oct 2019 11:13:01 -0700 (PDT)
Received: from
	shuagr-yocto-build.eqm2f5n1p1fehm0fb53klgonjh.cx.internal.cloudapp.net
	([137.116.56.217]) by smtp.gmail.com with ESMTPSA id
	t63sm8021347qkf.48.2019.10.01.11.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Oct 2019 11:13:00 -0700 (PDT)
From: shuagr97@gmail.com
X-Google-Original-From: shuagr@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 18:12:49 +0000
Message-Id: <1569953569-21886-1-git-send-email-shuagr@microsoft.com>
X-Mailer: git-send-email 2.7.4
Reply-To: shuagr@microsoft.com
Subject: [thud][PATCH] sqlite3: CVE-2019-8457.patch fix Backport from 3.28.0 Sign off: Shubham Agrawal<shuagr@microsoft.com>
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
X-List-Received-Date: Tue, 01 Oct 2019 18:13:01 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

---
 .../sqlite/files/CVE-2019-8457.patch               | 124 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-8457.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2019-8457.patch b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
new file mode 100644
index 0000000..a103dd8
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
@@ -0,0 +1,124 @@
+From fbf2392644f0ae4282fa4583c9bb67260995d983 Mon Sep 17 00:00:00 2001
+From: Shubham Agrawal <shuagr@microsoft.com>
+Date: Mon, 23 Sep 2019 20:58:47 +0000
+Subject: [PATCH] CVE: CVE-2019-8457 Upstream-Status: Backport
+
+Sign off: Shubham Agrawal <shuagr@microsoft.com>
+---
+ sqlite3.c | 50 +++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 31 insertions(+), 19 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 00513d4..5c8c7f4 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -172325,6 +172325,33 @@
+ }
+ 
+ 
++/* Allocate and initialize a new dynamic string object */
++StrAccum *sqlite3_str_new(sqlite3 *db){
++  StrAccum *p = sqlite3DbMallocRaw(db, sizeof(*p));
++  if( p ){
++    sqlite3StrAccumInit(p, db, 0, 0, SQLITE_MAX_LENGTH);
++  }
++  return p;
++}
++
++/* Finalize a string created using sqlite3_str_new().
++*/
++
++char *sqlite3_str_finish(StrAccum *p){
++  char *z;
++  if( p ){
++    z = sqlite3StrAccumFinish(p);
++    sqlite3DbFree(p->db, p);
++  }else{
++    z = 0;
++  }
++  return z;
++}
++/* Return any error code associated with p */
++int sqlite3_str_errcode(StrAccum *p){
++  return p ? p->accError : SQLITE_NOMEM;
++}
++
+ /*
+ ** Implementation of a scalar function that decodes r-tree nodes to
+ ** human readable strings. This can be used for debugging and analysis.
+@@ -172342,49 +172369,53 @@
+ ** <num-dimension>*2 coordinates.
+ */
+ static void rtreenode(sqlite3_context *ctx, int nArg, sqlite3_value **apArg){
+-  char *zText = 0;
++
+   RtreeNode node;
+   Rtree tree;
+   int ii;
++  int nData;
++  int errCode;
++  StrAccum *pOut;
+ 
+   UNUSED_PARAMETER(nArg);
+   memset(&node, 0, sizeof(RtreeNode));
+   memset(&tree, 0, sizeof(Rtree));
+   tree.nDim = (u8)sqlite3_value_int(apArg[0]);
++  if( tree.nDim<1 || tree.nDim>5 ) return;
+   tree.nDim2 = tree.nDim*2;
+   tree.nBytesPerCell = 8 + 8 * tree.nDim;
+   node.zData = (u8 *)sqlite3_value_blob(apArg[1]);
++  nData = sqlite3_value_bytes(apArg[1]);
++  if( nData<4 ) return;
++  if( nData<NCELL(&node)*tree.nBytesPerCell ) return;
+ 
++  pOut = sqlite3_str_new(0);
+   for(ii=0; ii<NCELL(&node); ii++){
+-    char zCell[512];
+-    int nCell = 0;
++
++
+     RtreeCell cell;
+     int jj;
+ 
+     nodeGetCell(&tree, &node, ii, &cell);
+-    sqlite3_snprintf(512-nCell,&zCell[nCell],"%lld", cell.iRowid);
+-    nCell = (int)strlen(zCell);
++    if( ii>0 ) sqlite3StrAccumAppend(pOut, " ", 1);
++    sqlite3XPrintf(pOut, "{%lld", cell.iRowid);
++
+     for(jj=0; jj<tree.nDim2; jj++){
+ #ifndef SQLITE_RTREE_INT_ONLY
+-      sqlite3_snprintf(512-nCell,&zCell[nCell], " %g",
+-                       (double)cell.aCoord[jj].f);
++
++      sqlite3XPrintf(pOut, " %g", (double)cell.aCoord[jj].f);
+ #else
+-      sqlite3_snprintf(512-nCell,&zCell[nCell], " %d",
+-                       cell.aCoord[jj].i);
++
++      sqlite3XPrintf(pOut, " %d", cell.aCoord[jj].i);
+ #endif
+-      nCell = (int)strlen(zCell);
+-    }
+ 
+-    if( zText ){
+-      char *zTextNew = sqlite3_mprintf("%s {%s}", zText, zCell);
+-      sqlite3_free(zText);
+-      zText = zTextNew;
+-    }else{
+-      zText = sqlite3_mprintf("{%s}", zCell);
+     }
++    sqlite3StrAccumAppend(pOut, "}", 1);
+   }
+-  
+-  sqlite3_result_text(ctx, zText, -1, sqlite3_free);
++
++  errCode = sqlite3_str_errcode(pOut);
++  sqlite3_result_text(ctx, sqlite3_str_finish(pOut), -1, sqlite3_free);
++  sqlite3_result_error_code(ctx, errCode);
+ }
+ 
+ /* This routine implements an SQL function that returns the "depth" parameter
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
index d214ea1..7df61cd 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   file://CVE-2018-20505.patch \
   file://CVE-2018-20506.patch \
+  file://CVE-2019-8457.patch \
   "
 SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
 SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
-- 
2.7.4


