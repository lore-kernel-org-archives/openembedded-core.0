Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA0C61750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQJp0qWxz4c
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322186;
	bh=hzxV2FO3sg0WoHIeKPX4U9psvqeEMsQW3Vnx65eyE4E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V3DLVzYGa0eQBOF0BMNUrC/PUUnIClqXr8OkZ9UQE43Gt5FKdrucClqRhTFgoLTks
	+K2cOdSiZmwOI/AoVA9TD59aVKc5WjtW7CKVBaVyzjwPPe0LSSwCDwpKqvnIJUzBsC
	MBGJOUMLj2sI3zMrOoJSdeNel8erLJq0FMPC2Z19y1sDOW4Xn0cQQgPV2wZHypLKN3
	u1a88XVQcH4Gnkkr50pIq/BN65WnHyKicLb1zyq+eiQASiWTYcEtvQV3URYH+kl8PA
	6zLmMLUDi79N8tp3u7yUkuRy/qhsr7vf5yikU73lFiTBO3y9ddn5ZqnvFFL+eXtFWG
	U/y3+ChbERmhaIWlDX0wHZBwn15/bo/3MgRmErklmfEGi7gw0HXwLo79KLrPUUktKr
	XMuPezAX3A1NGyBso30D0hP8zqAe3QoOBO43bf1AEsH4zaDnqpzmYLshzWMtFeH30d
	iHI3GRRa2bxX+JcagX7FD2+g+D2BS9BgaejesxNi4NiiYLl+/J5oTyIOOPsIDT8Gdq
	pDBGgVSOCFxQbY8CTlFsILKhRGJG4cWjdHfckJS2kfRoy8F8WCx2pABrWEHQ+I+nMG
	QgiKoLM5KnVL8NVnGB8/78wRODfcn3xinKX0Dmr7H+ZZNVxRWDtHz/Z4mm/OcG2UtG
	G3s/0bN0QL6rv6yiUoXipB78=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:56:24 +0200
Message-Id: <20200221215624.4102-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221215624.4102-1-bunk@stusta.de>
References: <20200221215624.4102-1-bunk@stusta.de>
Subject: [warrior][PATCH 2/2] sqlite: fix numerous CVEs
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
X-List-Received-Date: Fri, 21 Feb 2020 21:56:28 -0000

From: Ross Burton <ross.burton@intel.com>

Fix the following CVEs:

- CVE-2019-19244
- CVE-2019-19923
- CVE-2019-19925
- CVE-2019-19926
- CVE-2019-19959
- CVE-2019-20218

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ removed the CVE-2019-19880 and CVE-2019-19924 fixes
  that did not apply cleanly ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../sqlite/sqlite3/CVE-2019-19244.patch       | 33 ++++++++++++
 .../sqlite/sqlite3/CVE-2019-19923.patch       | 50 +++++++++++++++++++
 .../sqlite/sqlite3/CVE-2019-19925.patch       | 33 ++++++++++++
 .../sqlite/sqlite3/CVE-2019-19926.patch       | 31 ++++++++++++
 .../sqlite/sqlite3/CVE-2019-19959.patch       | 46 +++++++++++++++++
 .../sqlite/sqlite3/CVE-2019-20218.patch       | 31 ++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb |  6 +++
 7 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
new file mode 100644
index 0000000000..3f70979acc
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2019-19244
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0f690d4ae5ffe656762fdbb7f36cc4c2dcbb2d9d Mon Sep 17 00:00:00 2001
+From: dan <dan@noemail.net>
+Date: Fri, 22 Nov 2019 10:14:01 +0000
+Subject: [PATCH] Fix a crash that could occur if a sub-select that uses both
+ DISTINCT and window functions also used an ORDER BY that is the same as its
+ select list.
+
+Amalgamation version of the patch:
+FossilOrigin-Name: bcdd66c1691955c697f3d756c2b035acfe98f6aad72e90b0021bab6e9023b3ba
+---
+ sqlite3.c | 5 +++--
+ sqlite3.h | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 8fd740b..db1c649 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -131679,6 +131679,7 @@ SQLITE_PRIVATE int sqlite3Select(
+   */
+   if( (p->selFlags & (SF_Distinct|SF_Aggregate))==SF_Distinct 
+    && sqlite3ExprListCompare(sSort.pOrderBy, pEList, -1)==0
++   && p->pWin==0
+   ){
+     p->selFlags &= ~SF_Distinct;
+     pGroupBy = p->pGroupBy = sqlite3ExprListDup(db, pEList, 0);
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
new file mode 100644
index 0000000000..b1b866b250
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
@@ -0,0 +1,50 @@
+CVE: CVE-2019-19923
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b64463719dc53bde98b0ce3930b10a32560c3a02 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <drh@hwaci.com>
+Date: Wed, 18 Dec 2019 20:51:58 +0000
+Subject: [PATCH] Continue to back away from the LEFT JOIN optimization of
+ check-in [41c27bc0ff1d3135] by disallowing query flattening if the outer
+ query is DISTINCT.  Without this fix, if an index scan is run on the table
+ within the view on the right-hand side of the LEFT JOIN, stale result
+ registers might be accessed yielding incorrect results, and/or an
+ OP_IfNullRow opcode might be invoked on the un-opened table, resulting in a
+ NULL-pointer dereference.  This problem was found by the Yongheng and Rui
+ fuzzer.
+
+FossilOrigin-Name: 862974312edf00e9d1068115d1a39b7235b7db68b6d86b81d38a12f025a4748e
+---
+ sqlite3.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index d29da07..5bc06c8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -129216,6 +129216,7 @@ static void substSelect(
+ **        (3b) the FROM clause of the subquery may not contain a virtual
+ **             table and
+ **        (3c) the outer query may not be an aggregate.
++**        (3d) the outer query may not be DISTINCT.
+ **
+ **   (4)  The subquery can not be DISTINCT.
+ **
+@@ -129412,8 +129413,11 @@ static int flattenSubquery(
+   */
+   if( (pSubitem->fg.jointype & JT_OUTER)!=0 ){
+     isLeftJoin = 1;
+-    if( pSubSrc->nSrc>1 || isAgg || IsVirtual(pSubSrc->a[0].pTab) ){
+-      /*  (3a)             (3c)     (3b) */
++    if( pSubSrc->nSrc>1                   /* (3a) */
++     || isAgg                             /* (3b) */
++     || IsVirtual(pSubSrc->a[0].pTab)     /* (3c) */
++     || (p->selFlags & SF_Distinct)!=0    /* (3d) */
++    ){
+       return 0;
+     }
+   }
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
new file mode 100644
index 0000000000..ffc2c6afff
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2019-19925
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e92580434d2cdca228649d32f76167492de4f512 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <drh@hwaci.com>
+Date: Thu, 19 Dec 2019 15:15:40 +0000
+Subject: [PATCH] Fix the zipfile extension so that INSERT works even if the
+ pathname of the file being inserted is a NULL.  Bug discovered by the
+ Yongheng and Rui fuzzer.
+
+FossilOrigin-Name: a80f84b511231204658304226de3e075a55afc2e3f39ac063716f7a57f585c06
+---
+ shell.c   | 1 +
+ sqlite3.c | 4 ++--
+ sqlite3.h | 2 +-
+ 3 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index 053180c..404a8d4 100644
+--- a/shell.c
++++ b/shell.c
+@@ -5827,6 +5827,7 @@ static int zipfileUpdate(
+ 
+     if( rc==SQLITE_OK ){
+       zPath = (const char*)sqlite3_value_text(apVal[2]);
++      if( zPath==0 ) zPath = "";
+       nPath = (int)strlen(zPath);
+       mTime = zipfileGetTime(apVal[4]);
+     }
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
new file mode 100644
index 0000000000..92bc7908bc
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2019-19926
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 4165b1e1e0001165ace9051a70f938099505eadc Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <drh@hwaci.com>
+Date: Thu, 19 Dec 2019 22:08:19 +0000
+Subject: [PATCH] Continuation of [e2bddcd4c55ba3cb]: Add another spot where it
+ is necessary to abort early due to prior errors in sqlite3WindowRewrite().
+
+FossilOrigin-Name: cba2a2a44cdf138a629109bb0ad088ed4ef67fc66bed3e0373554681a39615d2
+---
+ sqlite3.c | 7 ++++---
+ sqlite3.h | 2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 857c28e..19a474d 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -128427,6 +128427,7 @@ static int multiSelect(
+     }
+   #endif
+   }
++  if( pParse->nErr ) goto multi_select_end;
+   
+   /* Compute collating sequences used by 
+   ** temporary tables needed to implement the compound select.
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
new file mode 100644
index 0000000000..cba8ec9d30
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
@@ -0,0 +1,46 @@
+CVE: CVE-2019-19959
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From f83f7e8141ee7cbbf7f2dc8985279a7372b259b6 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <drh@hwaci.com>
+Date: Mon, 23 Dec 2019 21:04:33 +0000
+Subject: [PATCH] Fix the zipfile() function in the zipfile extension so that
+ it is able to deal with goofy filenames that contain embedded zeros.
+
+FossilOrigin-Name: cc0fb00a128fd0773db5ff7891f7aa577a3671d570166d2cbb30df922344adcf
+---
+ shell.c   | 4 ++--
+ sqlite3.c | 4 ++--
+ sqlite3.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/shell.c b/shell.c
+index 404a8d4..48065e9 100644
+--- a/shell.c
++++ b/shell.c
+@@ -5841,7 +5841,7 @@ static int zipfileUpdate(
+         zFree = sqlite3_mprintf("%s/", zPath);
+         if( zFree==0 ){ rc = SQLITE_NOMEM; }
+         zPath = (const char*)zFree;
+-        nPath++;
++        nPath = (int)strlen(zPath);
+       }
+     }
+ 
+@@ -6242,11 +6242,11 @@ void zipfileStep(sqlite3_context *pCtx, int nVal, sqlite3_value **apVal){
+   }else{
+     if( zName[nName-1]!='/' ){
+       zName = zFree = sqlite3_mprintf("%s/", zName);
+-      nName++;
+       if( zName==0 ){
+         rc = SQLITE_NOMEM;
+         goto zipfile_step_out;
+       }
++      nName = (int)strlen(zName);
+     }else{
+       while( nName>1 && zName[nName-2]=='/' ) nName--;
+     }
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
new file mode 100644
index 0000000000..fb6cd6df2d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2019-20218
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 6bbd76d34f29f61483791231f2ce579dcadab8a5 Mon Sep 17 00:00:00 2001
+From: Dan Kennedy <danielk1977@gmail.com>
+Date: Fri, 27 Dec 2019 20:54:42 +0000
+Subject: [PATCH] Do not attempt to unwind the WITH stack in the Parse object
+ following an error. This fixes a separate case to [de6e6d68].
+
+FossilOrigin-Name: d29edef93451cc67a5d69c1cce1b1832d9ca8fff1f600afdd51338b74d077b92
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 5bc06c8..408ec4c 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -130570,7 +130570,7 @@ static int selectExpander(Walker *pWalker, Select *p){
+ 
+   /* Process NATURAL keywords, and ON and USING clauses of joins.
+   */
+-  if( db->mallocFailed || sqliteProcessJoin(pParse, p) ){
++  if( pParse->nErr || db->mallocFailed || sqliteProcessJoin(pParse, p) ){
+     return WRC_Abort;
+   }
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
index 2888a56ee9..32e367d889 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
@@ -8,6 +8,12 @@ SRC_URI = "\
   file://CVE-2019-9936.patch \
   file://CVE-2019-9937.patch \
   file://0001-Fix-CVE-2019-16168.patch \
+  file://CVE-2019-19244.patch \
+  file://CVE-2019-19923.patch \
+  file://CVE-2019-19925.patch \
+  file://CVE-2019-19926.patch \
+  file://CVE-2019-19959.patch \
+  file://CVE-2019-20218.patch \
   "
 
 SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
-- 
2.17.1


