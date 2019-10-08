Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id E097460557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:56 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id y35so10457047pgl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sAecXwFetLqq5oxp7g2yIGOrvSbE7UXx/zJq5ndjxvU=;
	b=dJCkkPJdMO93QoYmTBzeWC7Z1nopgrjxVrktDZUx1blChh852UEZKSupZmrGgJRsDb
	+p/iFp72hbcEauDmW7Srz4Lzp/lSJuzK7pQrc6UdWYxjAJiKhOTO3tFlDnMPHJbxM5TX
	zzIKpFT0WwzivD88YPsyNAY0pfeEJV533qZeSiLZz7INeCVh6QmvaAw9ssPGoPB9exEz
	0HgGhUgfWYS/uYo4roK4hWrnFa/OHORtNaZUy0bPEEVO0o0V+CtkvVDZAqZUhxuBbAR4
	eqo9uqu1LUDqDmfMPauGT1xdtU9EEYSr7QvioovZTpWVkT7TNvojYsDxS458VhkIj2H0
	iyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sAecXwFetLqq5oxp7g2yIGOrvSbE7UXx/zJq5ndjxvU=;
	b=RKT+ePC9szeuJQP6nCRN6Owd9rVeQU0COPGlYVNfO24/YXmOnZ8XEYREL4PtO5ulcv
	QVtGYVnC/YuNNHm5wbRVKjyXQLJIPJp2DC/5gF2/C+ojJMX7weLdgb767jFd/TALWg9x
	erOktZYkljx4rkit/rnufEUX3VHSCdBOoBxG4zxvh7Q9yGrHSrWfaD+TjBqj72wflT+9
	/frpj6AxOW/VxXIwcFpqrO5/syXonzE3CUlrWu0SUE65oqdRkjU7YtG3ORhUe2+vXyMX
	f4QQ6Bvqy8bIMU0F0QPEL/8wnh9fi39G0IsFUgO1w579VoBhGFAv4QccTjSMJesLOqOM
	mdpw==
X-Gm-Message-State: APjAAAUaNTnDqFif2FD+Pappvl2kvc/pmfY3aiUxMeY8EEp0k4AtQu2M
	HWNA+TZL+TRMhxDFXA5VGAdPHcCK5cs=
X-Google-Smtp-Source: APXvYqwaQcxREMZ3jWozSMueVXcWK9buMuHvt5Qt9qdhID4R8h6gf/7QTrXQzXgDEpThBb/jOUQOkg==
X-Received: by 2002:a17:90a:e001:: with SMTP id
	u1mr6470427pjy.102.1570548417636; 
	Tue, 08 Oct 2019 08:26:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:39 -0700
Message-Id: <c0c66d213b4b6deb0a5e9a688810d2e9674d3ecf.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 07/12] sqlite3: Security fix for CVE-2019-8457
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:57 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

Signed-off-by: Shubham Agrawal <shuagr@microsoft.com>
[Cleaned up patch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sqlite/files/CVE-2019-8457.patch               | 126 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-8457.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2019-8457.patch b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
new file mode 100644
index 0000000..5883774
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
@@ -0,0 +1,126 @@
+From fbf2392644f0ae4282fa4583c9bb67260995d983 Mon Sep 17 00:00:00 2001
+From: Shubham Agrawal <shuagr@microsoft.com>
+Date: Mon, 23 Sep 2019 20:58:47 +0000
+Subject: [PATCH] sqlite: fix for CVE-2019-8457
+
+Upstream-Status: Backport
+CVE: CVE-2019-8457
+Signed-off-by: Shubham Agrawal <shuagr@microsoft.com>
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


