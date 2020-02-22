Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFA561738
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 18:34:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id j17so2215675pjz.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 10:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=+D5xPpjPX/6pMYxUkeY44gMZB2xWczlHMYfQSMm/gSI=;
	b=W0SwKUBe+tfHYMg2Q90cnnFrHjN7OX2L3+9YvxNx/F5J0x1H5EyDLeWqo5ZA1IwGMR
	UnNmp4LGsrTXxs/hJoywCgqk6MD2+v5deiFZVeaXmAvVsKZ1HWSa6eJO1eKLY7aVfP3m
	SwAlvY36cgmHrgFndIB3cSda7zhxbk/LGy+AdCl4oSf7a57JYbu9yAQOdND0MoBi3Brk
	u6SIULznXbqDpPGMsifktKpFNtmLvWjgLD7IPiSO/RsnXW2lCwPqrwcgjlnyLv7Iewuo
	MqzXsxkLlZ6LSYvDhO3HoE7D3qYB7PpHPuEM9x/wLeeYeL5bpUIHE3vTcQqhpFHD+GE9
	oZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language;
	bh=+D5xPpjPX/6pMYxUkeY44gMZB2xWczlHMYfQSMm/gSI=;
	b=qE71hVuxxjrCJv7Qw5R+B7TkAo+9XHXbF60Yx/CnNth4G14rUTaLeK3+rZWm/IDiVC
	BUCGM0/bNdZkJr3fcDbN+Grl41TRhPYlBHGfyloaud8lnt0AlMY9dKSzUt9GQSrHe0V/
	5ZfMe2uViiV1DhUcPCOuFSeyAec9N5cNRf7NwWZj8T80iXWDPg9DMelAzk/3MpD9Kca+
	z3roc44cL+IDmIN0SkskC2j54vS5jvgj8/Gsp7QdCCET04Xl4JK/lvZjU9R6BGlRL2NL
	uQ0zR04PghkCSCprZ5oKGOFPOaeaEQCnbzbxgol6AUvn0PCiEoM61hh3F2RsCbtJeLu8
	3FAQ==
X-Gm-Message-State: APjAAAX/wj24bi9OdQhh5j2vUMRSlXoS8WK5yDEIsF83CzqRZOteRHjV
	pS+k1GRjA9ue9ddL75uuV5DeZasv
X-Google-Smtp-Source: APXvYqw9H96A7yWUnbK/EfPdfwt87JwOaaiBg/NOhZngtL9BPv50GDC5pRwS4KKour9lSPFdbk3esw==
X-Received: by 2002:a17:902:7687:: with SMTP id
	m7mr41999941pll.136.1582396484136; 
	Sat, 22 Feb 2020 10:34:44 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:f455:4f9:e4a2:b3f5?
	([2601:202:4180:a5c0:f455:4f9:e4a2:b3f5])
	by smtp.gmail.com with ESMTPSA id b1sm7028093pfp.44.2020.02.22.10.34.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 22 Feb 2020 10:34:43 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20200221205942.27168-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b0916411-11d3-d4f2-3d37-7a020a26375d@gmail.com>
Date: Sat, 22 Feb 2020 10:34:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221205942.27168-1-bunk@stusta.de>
Subject: Re: [zeus][PATCH] sqlite: fix numerous CVEs
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
X-List-Received-Date: Sat, 22 Feb 2020 18:34:43 -0000
Content-Type: multipart/alternative;
	boundary="------------9212FC311078AF0D5411DBEA"
Content-Language: en-US

--------------9212FC311078AF0D5411DBEA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Adrian,

On 2/21/20 12:59 PM, Adrian Bunk wrote:
> From: Ross Burton <ross.burton@intel.com>
>
> Fix the following CVEs:
>
> - CVE-2019-19244
> - CVE-2019-19880
> - CVE-2019-19923
> - CVE-2019-19924
> - CVE-2019-19925
> - CVE-2019-19926
> - CVE-2019-19959
> - CVE-2019-20218
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Thanks for backporting these changes. One question. The master commit
f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75
<https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/sqlite?id=f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75>
has merge conflicts and there is no mention in the commit message that
you made any changes to get them to apply.

Did you have to fixup any of the patches? Master and Zeus have different
versions of sqlite.

- armin
> ---
>  .../sqlite/sqlite3/CVE-2019-19244.patch       | 33 ++++++++++
>  .../sqlite/sqlite3/CVE-2019-19880.patch       | 33 ++++++++++
>  .../sqlite/sqlite3/CVE-2019-19923.patch       | 50 ++++++++++++++
>  .../sqlite/sqlite3/CVE-2019-19924.patch       | 65 +++++++++++++++++++
>  .../sqlite/sqlite3/CVE-2019-19925.patch       | 33 ++++++++++
>  .../sqlite/sqlite3/CVE-2019-19926.patch       | 31 +++++++++
>  .../sqlite/sqlite3/CVE-2019-19959.patch       | 46 +++++++++++++
>  .../sqlite/sqlite3/CVE-2019-20218.patch       | 31 +++++++++
>  meta/recipes-support/sqlite/sqlite3_3.29.0.bb | 11 +++-
>  9 files changed, 332 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
>
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
> new file mode 100644
> index 0000000000..3f70979acc
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19244
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 0f690d4ae5ffe656762fdbb7f36cc4c2dcbb2d9d Mon Sep 17 00:00:00 2001
> +From: dan <dan@noemail.net>
> +Date: Fri, 22 Nov 2019 10:14:01 +0000
> +Subject: [PATCH] Fix a crash that could occur if a sub-select that uses both
> + DISTINCT and window functions also used an ORDER BY that is the same as its
> + select list.
> +
> +Amalgamation version of the patch:
> +FossilOrigin-Name: bcdd66c1691955c697f3d756c2b035acfe98f6aad72e90b0021bab6e9023b3ba
> +---
> + sqlite3.c | 5 +++--
> + sqlite3.h | 2 +-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 8fd740b..db1c649 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -131679,6 +131679,7 @@ SQLITE_PRIVATE int sqlite3Select(
> +   */
> +   if( (p->selFlags & (SF_Distinct|SF_Aggregate))==SF_Distinct 
> +    && sqlite3ExprListCompare(sSort.pOrderBy, pEList, -1)==0
> ++   && p->pWin==0
> +   ){
> +     p->selFlags &= ~SF_Distinct;
> +     pGroupBy = p->pGroupBy = sqlite3ExprListDup(db, pEList, 0);
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
> new file mode 100644
> index 0000000000..ca5c31c57b
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19880
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 3622d20ad10dfac9586d4423547ed960cbc66fcf Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Wed, 18 Dec 2019 00:05:50 +0000
> +Subject: [PATCH] When processing constant integer values in ORDER BY clauses
> + of window definitions (see check-in [7e4 ---
> +
> +---
> + sqlite3.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index db1c649..a83b3d2 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -147584,9 +147584,11 @@ static ExprList *exprListAppendList(
> +     int nInit = pList ? pList->nExpr : 0;
> +     for(i=0; i<pAppend->nExpr; i++){
> +       Expr *pDup = sqlite3ExprDup(pParse->db, pAppend->a[i].pExpr, 0);
> ++      assert( pDup==0 || !ExprHasProperty(pDup, EP_MemToken) );
> +       if( bIntToNull && pDup && pDup->op==TK_INTEGER ){
> +         pDup->op = TK_NULL;
> +         pDup->flags &= ~(EP_IntValue|EP_IsTrue|EP_IsFalse);
> ++        pDup->u.zToken = 0;
> +       }
> +       pList = sqlite3ExprListAppend(pParse, pList, pDup);
> +       if( pList ) pList->a[nInit+i].sortFlags = pAppend->a[i].sortFlags;
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
> new file mode 100644
> index 0000000000..b1b866b250
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
> @@ -0,0 +1,50 @@
> +CVE: CVE-2019-19923
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From b64463719dc53bde98b0ce3930b10a32560c3a02 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Wed, 18 Dec 2019 20:51:58 +0000
> +Subject: [PATCH] Continue to back away from the LEFT JOIN optimization of
> + check-in [41c27bc0ff1d3135] by disallowing query flattening if the outer
> + query is DISTINCT.  Without this fix, if an index scan is run on the table
> + within the view on the right-hand side of the LEFT JOIN, stale result
> + registers might be accessed yielding incorrect results, and/or an
> + OP_IfNullRow opcode might be invoked on the un-opened table, resulting in a
> + NULL-pointer dereference.  This problem was found by the Yongheng and Rui
> + fuzzer.
> +
> +FossilOrigin-Name: 862974312edf00e9d1068115d1a39b7235b7db68b6d86b81d38a12f025a4748e
> +---
> + sqlite3.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index d29da07..5bc06c8 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -129216,6 +129216,7 @@ static void substSelect(
> + **        (3b) the FROM clause of the subquery may not contain a virtual
> + **             table and
> + **        (3c) the outer query may not be an aggregate.
> ++**        (3d) the outer query may not be DISTINCT.
> + **
> + **   (4)  The subquery can not be DISTINCT.
> + **
> +@@ -129412,8 +129413,11 @@ static int flattenSubquery(
> +   */
> +   if( (pSubitem->fg.jointype & JT_OUTER)!=0 ){
> +     isLeftJoin = 1;
> +-    if( pSubSrc->nSrc>1 || isAgg || IsVirtual(pSubSrc->a[0].pTab) ){
> +-      /*  (3a)             (3c)     (3b) */
> ++    if( pSubSrc->nSrc>1                   /* (3a) */
> ++     || isAgg                             /* (3b) */
> ++     || IsVirtual(pSubSrc->a[0].pTab)     /* (3c) */
> ++     || (p->selFlags & SF_Distinct)!=0    /* (3d) */
> ++    ){
> +       return 0;
> +     }
> +   }
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
> new file mode 100644
> index 0000000000..80d5edbb0c
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
> @@ -0,0 +1,65 @@
> +CVE: CVE-2019-19924
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 854fe21e8a987f84da81f6bb9e90abc5355c6621 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 20:37:32 +0000
> +Subject: [PATCH] When an error occurs while rewriting the parser tree for
> + window functions in the sqlite3WindowRewrite() routine, make sure that
> + pParse->nErr is set, and make sure that this shuts down any subsequent code
> + generation that might depend on the transformations that were implemented. 
> + This fixes a problem discovered by the Yongheng and Rui fuzzer.
> +
> +Amalgamation format of backported patch
> +FossilOrigin-Name: e2bddcd4c55ba3cbe0130332679ff4b048630d0ced9a8899982edb5a3569ba7f
> +---
> + sqlite3.c | 16 +++++++++++-----
> + sqlite3.h |  2 +-
> + 2 files changed, 12 insertions(+), 6 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 408ec4c..857c28e 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -77798,7 +77798,8 @@ SQLITE_PRIVATE void sqlite3VdbeSetP4KeyInfo(Parse *pParse, Index *pIdx){
> + */
> + static void vdbeVComment(Vdbe *p, const char *zFormat, va_list ap){
> +   assert( p->nOp>0 || p->aOp==0 );
> +-  assert( p->aOp==0 || p->aOp[p->nOp-1].zComment==0 || p->db->mallocFailed );
> ++  assert( p->aOp==0 || p->aOp[p->nOp-1].zComment==0 || p->db->mallocFailed
> ++          || p->pParse->nErr>0 );
> +   if( p->nOp ){
> +     assert( p->aOp );
> +     sqlite3DbFree(p->db, p->aOp[p->nOp-1].zComment);
> +@@ -97872,6 +97873,7 @@ static int codeCompare(
> +   int addr;
> +   CollSeq *p4;
> + 
> ++  if( pParse->nErr ) return 0;
> +   p4 = sqlite3BinaryCompareCollSeq(pParse, pLeft, pRight);
> +   p5 = binaryCompareP5(pLeft, pRight, jumpIfNull);
> +   addr = sqlite3VdbeAddOp4(pParse->pVdbe, opcode, in2, dest, in1,
> +@@ -147627,7 +147629,7 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
> + 
> +     pTab = sqlite3DbMallocZero(db, sizeof(Table));
> +     if( pTab==0 ){
> +-      return SQLITE_NOMEM;
> ++      return sqlite3ErrorToParser(db, SQLITE_NOMEM);
> +     }
> + 
> +     p->pSrc = 0;
> +@@ -147731,6 +147733,10 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
> +     sqlite3DbFree(db, pTab);
> +   }
> + 
> ++  if( rc && pParse->nErr==0 ){
> ++    assert( pParse->db->mallocFailed );
> ++    return sqlite3ErrorToParser(pParse->db, SQLITE_NOMEM);
> ++  }
> +   return rc;
> + }
> + 
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
> new file mode 100644
> index 0000000000..ffc2c6afff
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19925
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From e92580434d2cdca228649d32f76167492de4f512 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 15:15:40 +0000
> +Subject: [PATCH] Fix the zipfile extension so that INSERT works even if the
> + pathname of the file being inserted is a NULL.  Bug discovered by the
> + Yongheng and Rui fuzzer.
> +
> +FossilOrigin-Name: a80f84b511231204658304226de3e075a55afc2e3f39ac063716f7a57f585c06
> +---
> + shell.c   | 1 +
> + sqlite3.c | 4 ++--
> + sqlite3.h | 2 +-
> + 3 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/shell.c b/shell.c
> +index 053180c..404a8d4 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -5827,6 +5827,7 @@ static int zipfileUpdate(
> + 
> +     if( rc==SQLITE_OK ){
> +       zPath = (const char*)sqlite3_value_text(apVal[2]);
> ++      if( zPath==0 ) zPath = "";
> +       nPath = (int)strlen(zPath);
> +       mTime = zipfileGetTime(apVal[4]);
> +     }
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
> new file mode 100644
> index 0000000000..92bc7908bc
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
> @@ -0,0 +1,31 @@
> +CVE: CVE-2019-19926
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 4165b1e1e0001165ace9051a70f938099505eadc Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 22:08:19 +0000
> +Subject: [PATCH] Continuation of [e2bddcd4c55ba3cb]: Add another spot where it
> + is necessary to abort early due to prior errors in sqlite3WindowRewrite().
> +
> +FossilOrigin-Name: cba2a2a44cdf138a629109bb0ad088ed4ef67fc66bed3e0373554681a39615d2
> +---
> + sqlite3.c | 7 ++++---
> + sqlite3.h | 2 +-
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 857c28e..19a474d 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -128427,6 +128427,7 @@ static int multiSelect(
> +     }
> +   #endif
> +   }
> ++  if( pParse->nErr ) goto multi_select_end;
> +   
> +   /* Compute collating sequences used by 
> +   ** temporary tables needed to implement the compound select.
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
> new file mode 100644
> index 0000000000..cba8ec9d30
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
> @@ -0,0 +1,46 @@
> +CVE: CVE-2019-19959
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From f83f7e8141ee7cbbf7f2dc8985279a7372b259b6 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Mon, 23 Dec 2019 21:04:33 +0000
> +Subject: [PATCH] Fix the zipfile() function in the zipfile extension so that
> + it is able to deal with goofy filenames that contain embedded zeros.
> +
> +FossilOrigin-Name: cc0fb00a128fd0773db5ff7891f7aa577a3671d570166d2cbb30df922344adcf
> +---
> + shell.c   | 4 ++--
> + sqlite3.c | 4 ++--
> + sqlite3.h | 2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/shell.c b/shell.c
> +index 404a8d4..48065e9 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -5841,7 +5841,7 @@ static int zipfileUpdate(
> +         zFree = sqlite3_mprintf("%s/", zPath);
> +         if( zFree==0 ){ rc = SQLITE_NOMEM; }
> +         zPath = (const char*)zFree;
> +-        nPath++;
> ++        nPath = (int)strlen(zPath);
> +       }
> +     }
> + 
> +@@ -6242,11 +6242,11 @@ void zipfileStep(sqlite3_context *pCtx, int nVal, sqlite3_value **apVal){
> +   }else{
> +     if( zName[nName-1]!='/' ){
> +       zName = zFree = sqlite3_mprintf("%s/", zName);
> +-      nName++;
> +       if( zName==0 ){
> +         rc = SQLITE_NOMEM;
> +         goto zipfile_step_out;
> +       }
> ++      nName = (int)strlen(zName);
> +     }else{
> +       while( nName>1 && zName[nName-2]=='/' ) nName--;
> +     }
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
> new file mode 100644
> index 0000000000..fb6cd6df2d
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
> @@ -0,0 +1,31 @@
> +CVE: CVE-2019-20218
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 6bbd76d34f29f61483791231f2ce579dcadab8a5 Mon Sep 17 00:00:00 2001
> +From: Dan Kennedy <danielk1977@gmail.com>
> +Date: Fri, 27 Dec 2019 20:54:42 +0000
> +Subject: [PATCH] Do not attempt to unwind the WITH stack in the Parse object
> + following an error. This fixes a separate case to [de6e6d68].
> +
> +FossilOrigin-Name: d29edef93451cc67a5d69c1cce1b1832d9ca8fff1f600afdd51338b74d077b92
> +---
> + sqlite3.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 5bc06c8..408ec4c 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -130570,7 +130570,7 @@ static int selectExpander(Walker *pWalker, Select *p){
> + 
> +   /* Process NATURAL keywords, and ON and USING clauses of joins.
> +   */
> +-  if( db->mallocFailed || sqliteProcessJoin(pParse, p) ){
> ++  if( pParse->nErr || db->mallocFailed || sqliteProcessJoin(pParse, p) ){
> +     return WRC_Abort;
> +   }
> + 
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> index 34066fbe89..61145851be 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> @@ -4,6 +4,15 @@ LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
>  
>  SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> -           file://0001-Fix-CVE-2019-16168.patch"
> +           file://0001-Fix-CVE-2019-16168.patch \
> +           file://CVE-2019-19244.patch \
> +           file://CVE-2019-19880.patch \
> +           file://CVE-2019-19923.patch \
> +           file://CVE-2019-19924.patch \
> +           file://CVE-2019-19925.patch \
> +           file://CVE-2019-19926.patch \
> +           file://CVE-2019-19959.patch \
> +           file://CVE-2019-20218.patch \
> +"
>  SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
>  SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"


--------------9212FC311078AF0D5411DBEA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Adrian,<br>
    <br>
    <div class="moz-cite-prefix">On 2/21/20 12:59 PM, Adrian Bunk wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200221205942.27168-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">From: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>

Fix the following CVEs:

- CVE-2019-19244
- CVE-2019-19880
- CVE-2019-19923
- CVE-2019-19924
- CVE-2019-19925
- CVE-2019-19926
- CVE-2019-19959
- CVE-2019-20218

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de">&lt;bunk@stusta.de&gt;</a></pre>
    </blockquote>
    <br>
    Thanks for backporting these changes. One question. The master
    commit <a
href="https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/sqlite?id=f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75">f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75</a><br>
    has merge conflicts and there is no mention in the commit message
    that you made any changes to get them to apply.<br>
    <br>
    Did you have to fixup any of the patches? Master and Zeus have
    different versions of sqlite.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:20200221205942.27168-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">
---
 .../sqlite/sqlite3/CVE-2019-19244.patch       | 33 ++++++++++
 .../sqlite/sqlite3/CVE-2019-19880.patch       | 33 ++++++++++
 .../sqlite/sqlite3/CVE-2019-19923.patch       | 50 ++++++++++++++
 .../sqlite/sqlite3/CVE-2019-19924.patch       | 65 +++++++++++++++++++
 .../sqlite/sqlite3/CVE-2019-19925.patch       | 33 ++++++++++
 .../sqlite/sqlite3/CVE-2019-19926.patch       | 31 +++++++++
 .../sqlite/sqlite3/CVE-2019-19959.patch       | 46 +++++++++++++
 .../sqlite/sqlite3/CVE-2019-20218.patch       | 31 +++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb | 11 +++-
 9 files changed, 332 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From 0f690d4ae5ffe656762fdbb7f36cc4c2dcbb2d9d Mon Sep 17 00:00:00 2001
+From: dan <a class="moz-txt-link-rfc2396E" href="mailto:dan@noemail.net">&lt;dan@noemail.net&gt;</a>
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
+   if( (p-&gt;selFlags &amp; (SF_Distinct|SF_Aggregate))==SF_Distinct 
+    &amp;&amp; sqlite3ExprListCompare(sSort.pOrderBy, pEList, -1)==0
++   &amp;&amp; p-&gt;pWin==0
+   ){
+     p-&gt;selFlags &amp;= ~SF_Distinct;
+     pGroupBy = p-&gt;pGroupBy = sqlite3ExprListDup(db, pEList, 0);
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
new file mode 100644
index 0000000000..ca5c31c57b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2019-19880
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From 3622d20ad10dfac9586d4423547ed960cbc66fcf Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
+Date: Wed, 18 Dec 2019 00:05:50 +0000
+Subject: [PATCH] When processing constant integer values in ORDER BY clauses
+ of window definitions (see check-in [7e4 ---
+
+---
+ sqlite3.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index db1c649..a83b3d2 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -147584,9 +147584,11 @@ static ExprList *exprListAppendList(
+     int nInit = pList ? pList-&gt;nExpr : 0;
+     for(i=0; i&lt;pAppend-&gt;nExpr; i++){
+       Expr *pDup = sqlite3ExprDup(pParse-&gt;db, pAppend-&gt;a[i].pExpr, 0);
++      assert( pDup==0 || !ExprHasProperty(pDup, EP_MemToken) );
+       if( bIntToNull &amp;&amp; pDup &amp;&amp; pDup-&gt;op==TK_INTEGER ){
+         pDup-&gt;op = TK_NULL;
+         pDup-&gt;flags &amp;= ~(EP_IntValue|EP_IsTrue|EP_IsFalse);
++        pDup-&gt;u.zToken = 0;
+       }
+       pList = sqlite3ExprListAppend(pParse, pList, pDup);
+       if( pList ) pList-&gt;a[nInit+i].sortFlags = pAppend-&gt;a[i].sortFlags;
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From b64463719dc53bde98b0ce3930b10a32560c3a02 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
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
+   if( (pSubitem-&gt;fg.jointype &amp; JT_OUTER)!=0 ){
+     isLeftJoin = 1;
+-    if( pSubSrc-&gt;nSrc&gt;1 || isAgg || IsVirtual(pSubSrc-&gt;a[0].pTab) ){
+-      /*  (3a)             (3c)     (3b) */
++    if( pSubSrc-&gt;nSrc&gt;1                   /* (3a) */
++     || isAgg                             /* (3b) */
++     || IsVirtual(pSubSrc-&gt;a[0].pTab)     /* (3c) */
++     || (p-&gt;selFlags &amp; SF_Distinct)!=0    /* (3d) */
++    ){
+       return 0;
+     }
+   }
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
new file mode 100644
index 0000000000..80d5edbb0c
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
@@ -0,0 +1,65 @@
+CVE: CVE-2019-19924
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From 854fe21e8a987f84da81f6bb9e90abc5355c6621 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
+Date: Thu, 19 Dec 2019 20:37:32 +0000
+Subject: [PATCH] When an error occurs while rewriting the parser tree for
+ window functions in the sqlite3WindowRewrite() routine, make sure that
+ pParse-&gt;nErr is set, and make sure that this shuts down any subsequent code
+ generation that might depend on the transformations that were implemented. 
+ This fixes a problem discovered by the Yongheng and Rui fuzzer.
+
+Amalgamation format of backported patch
+FossilOrigin-Name: e2bddcd4c55ba3cbe0130332679ff4b048630d0ced9a8899982edb5a3569ba7f
+---
+ sqlite3.c | 16 +++++++++++-----
+ sqlite3.h |  2 +-
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 408ec4c..857c28e 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -77798,7 +77798,8 @@ SQLITE_PRIVATE void sqlite3VdbeSetP4KeyInfo(Parse *pParse, Index *pIdx){
+ */
+ static void vdbeVComment(Vdbe *p, const char *zFormat, va_list ap){
+   assert( p-&gt;nOp&gt;0 || p-&gt;aOp==0 );
+-  assert( p-&gt;aOp==0 || p-&gt;aOp[p-&gt;nOp-1].zComment==0 || p-&gt;db-&gt;mallocFailed );
++  assert( p-&gt;aOp==0 || p-&gt;aOp[p-&gt;nOp-1].zComment==0 || p-&gt;db-&gt;mallocFailed
++          || p-&gt;pParse-&gt;nErr&gt;0 );
+   if( p-&gt;nOp ){
+     assert( p-&gt;aOp );
+     sqlite3DbFree(p-&gt;db, p-&gt;aOp[p-&gt;nOp-1].zComment);
+@@ -97872,6 +97873,7 @@ static int codeCompare(
+   int addr;
+   CollSeq *p4;
+ 
++  if( pParse-&gt;nErr ) return 0;
+   p4 = sqlite3BinaryCompareCollSeq(pParse, pLeft, pRight);
+   p5 = binaryCompareP5(pLeft, pRight, jumpIfNull);
+   addr = sqlite3VdbeAddOp4(pParse-&gt;pVdbe, opcode, in2, dest, in1,
+@@ -147627,7 +147629,7 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
+ 
+     pTab = sqlite3DbMallocZero(db, sizeof(Table));
+     if( pTab==0 ){
+-      return SQLITE_NOMEM;
++      return sqlite3ErrorToParser(db, SQLITE_NOMEM);
+     }
+ 
+     p-&gt;pSrc = 0;
+@@ -147731,6 +147733,10 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
+     sqlite3DbFree(db, pTab);
+   }
+ 
++  if( rc &amp;&amp; pParse-&gt;nErr==0 ){
++    assert( pParse-&gt;db-&gt;mallocFailed );
++    return sqlite3ErrorToParser(pParse-&gt;db, SQLITE_NOMEM);
++  }
+   return rc;
+ }
+ 
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From e92580434d2cdca228649d32f76167492de4f512 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From 4165b1e1e0001165ace9051a70f938099505eadc Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
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
++  if( pParse-&gt;nErr ) goto multi_select_end;
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From f83f7e8141ee7cbbf7f2dc8985279a7372b259b6 Mon Sep 17 00:00:00 2001
+From: "D. Richard Hipp" <a class="moz-txt-link-rfc2396E" href="mailto:drh@hwaci.com">&lt;drh@hwaci.com&gt;</a>
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
+       while( nName&gt;1 &amp;&amp; zName[nName-2]=='/' ) nName--;
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
+Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
+
+From 6bbd76d34f29f61483791231f2ce579dcadab8a5 Mon Sep 17 00:00:00 2001
+From: Dan Kennedy <a class="moz-txt-link-rfc2396E" href="mailto:danielk1977@gmail.com">&lt;danielk1977@gmail.com&gt;</a>
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
+-  if( db-&gt;mallocFailed || sqliteProcessJoin(pParse, p) ){
++  if( pParse-&gt;nErr || db-&gt;mallocFailed || sqliteProcessJoin(pParse, p) ){
+     return WRC_Abort;
+   }
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index 34066fbe89..61145851be 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -4,6 +4,15 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66">"file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"</a>
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz\-file://0001-Fix-CVE-2019-16168.patch">"http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://0001-Fix-CVE-2019-16168.patch"</a>
+           <a class="moz-txt-link-freetext" href="file://0001-Fix-CVE-2019-16168.patch">file://0001-Fix-CVE-2019-16168.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19244.patch">file://CVE-2019-19244.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19880.patch">file://CVE-2019-19880.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19923.patch">file://CVE-2019-19923.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19924.patch">file://CVE-2019-19924.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19925.patch">file://CVE-2019-19925.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19926.patch">file://CVE-2019-19926.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-19959.patch">file://CVE-2019-19959.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2019-20218.patch">file://CVE-2019-20218.patch</a> \
+"
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9212FC311078AF0D5411DBEA--
