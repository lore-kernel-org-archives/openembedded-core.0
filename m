Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id BAE8E7E31D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:38 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id b8so3917791pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sAecXwFetLqq5oxp7g2yIGOrvSbE7UXx/zJq5ndjxvU=;
	b=vRphPRngvvg0w/ynFD2nLi6iUk28+L1gEQXG3HHdUpkF6KgZf6YBbR96XGtTk61ti1
	tDsTA+X+IOiHWM0Td2yj3MmLZBOBvfRNwNqUHSLbhG/1/T+9OZIyhKxqbGvuh7ohWSF2
	uIZss2mCaZUaeIJj3Kg+K8vPNx6wXU6rqE/XmVCQYQOG76ZDcy4DFj1hL/Izg8CAaC72
	CIgW3AvbNWe7JhPxzcT74bmk9C6Ks42JWSsbQJFeLMkBN5yP9NWAi3oYckmcByuukuyZ
	CDAl7V7zEL+6j5JjR3/JOJhT8SpWiDbkdYFQWKsmAIWhL+pxfeA7LtMFllva08dYwpSI
	sSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sAecXwFetLqq5oxp7g2yIGOrvSbE7UXx/zJq5ndjxvU=;
	b=L/aBi5Yw17YgytcmVjaBxsH6HcZ2TguyIV5PIhRiS40WQ74er+xhmsRQ2tT0smtv5e
	S0cdnRxPtw7NrmBzYnZGbMNgeMBxd6vvrzX1KgADErSizb6x/Xr91Ka3RsRU4hhbVzpW
	2jT+FR1TakZo+XgJ70kWdiD4k6//ROAWpnSJodj1pOEg8azVLOW1greAqyrObqDjTscs
	UBFyr3Xd5W4AHPDZcp/KWwYBG1esrfbvvhd+v1JJa1E95sj5uGbyHIeodVB3nlTnld7h
	pWkAIh0iJ7V3ouwfuO8ma4TcTaAERIMxNYVmaAEM4Qv/WzxdqjmUttz5edK53lKbD7G4
	e1DQ==
X-Gm-Message-State: APjAAAURe26CYLeQ0+mtIQZyDXLkyhdML4tTn2LEDfC/qPAa8olWrJYX
	mNf9ocyCpkbPQr2lM4xKI7ot/hvO
X-Google-Smtp-Source: APXvYqyFuyMbeMkMMAhYCjOAMRSlvPlix4WlVDWrQ2yTNGIg8JT4mVr+nzktbeshbmx4paxLikc1yw==
X-Received: by 2002:a65:5302:: with SMTP id m2mr11570353pgq.336.1570722579431; 
	Thu, 10 Oct 2019 08:49:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:19 -0700
Message-Id: <c0c66d213b4b6deb0a5e9a688810d2e9674d3ecf.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:39 -0000

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


