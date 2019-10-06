Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id EE9757D68F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 22:25:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x127so7382842pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 15:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1+28+fvVM3Sm45QPYE6wXUjeDAAslSM/3Sqv9sxI9wU=;
	b=FWEPvmdseSCji83RaKagl/BAgA9YnFSutXIfEYw4D7b8Tf3eI66EUmLTH+SLakLDez
	gOLieosdXpifwpj/JLf5wwbxDKTsi0XJEicxHQBEkUDESwQketIObjeBu07Dlh36svR/
	S6prx0AXN1y3YcdZ2nJ0gILTiQ5e2pS49ZQ7vWZhjPbY/x5urbylDpKY24972qkRhZjz
	Sq9AmZ3/yhiaBWiSFXnwBkJb2ikPaU3iPu0fHl1xx4U38z/xlBu6j+77+wwFYYzpq7za
	PFrpXN5M0++NGGKbf9P2SwdKyf5WR384Bgme8OzX2jTAmf5C3ryDjD40v6Lu2PCp88pe
	vUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=1+28+fvVM3Sm45QPYE6wXUjeDAAslSM/3Sqv9sxI9wU=;
	b=JQOmcHwkY9OH1BPdSzQcMi2DBMEhZxDwSZXe46dp3AxkFJZuVjMbLqk0H7sjd4j1xB
	ggRQftkfeWqaGSn84JJXoSj6P+DFHZ4A896W/3jjteZf6Xc4SiPJiK1aCm4RkhwKDCd+
	Yz1xB0Yifx/BXOGF93fuPlYscGYRiGTPSUSscf/INcmgF/O3g3ZrKO631HsBSqMazXju
	Kv1lKoGaey0lz/17PTA5Mdccj9qUHvioKfJSg5JM9zqrW0aIWifeNodoWO5AeeCjySKL
	RvYbLQmxsnhWS5KUcgVQsCxHD/3Nmhk/TqP1KRGsNaG7q3Sn4dqWYBoRwSicdjJYO1Lr
	N9KA==
X-Gm-Message-State: APjAAAWZozoPJ5rOCJK9TxkEZ3t950gS3NU0iyKzWRIu9dFmTFoa0sib
	RSIx7yXtM/SnQlz1h7EKrXLkDs3wYAI=
X-Google-Smtp-Source: APXvYqzHQyPIwKR/M0g3pwmDF78k59kabGwF6uCJUtl+ZHPfbIA5CuMQAE0UwiH9CPSdg8qwdxieYA==
X-Received: by 2002:a63:5621:: with SMTP id k33mr3532520pgb.86.1570400742814; 
	Sun, 06 Oct 2019 15:25:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:65e8:7322:d189:1d85?
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	b14sm13214139pfi.95.2019.10.06.15.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Oct 2019 15:25:42 -0700 (PDT)
To: shuagr@microsoft.com, openembedded-core@lists.openembedded.org
References: <1569953569-21886-1-git-send-email-shuagr@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4a86d8f7-69ce-6454-7365-3243fdabde4e@gmail.com>
Date: Sun, 6 Oct 2019 15:25:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569953569-21886-1-git-send-email-shuagr@microsoft.com>
Subject: Re: [thud][PATCH] sqlite3: CVE-2019-8457.patch fix Backport from 3.28.0 Sign off: Shubham Agrawal<shuagr@microsoft.com>
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
X-List-Received-Date: Sun, 06 Oct 2019 22:25:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/1/19 11:12 AM, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>

I cleaned up the patch to conform to the patch guide.

see
https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/thud-nmut&id=c0c66d213b4b6deb0a5e9a688810d2e9674d3ecf 
as an example of what was meant.

- armin
>
> ---
>  .../sqlite/files/CVE-2019-8457.patch               | 124 +++++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   1 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2019-8457.patch
>
> diff --git a/meta/recipes-support/sqlite/files/CVE-2019-8457.patch b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
> new file mode 100644
> index 0000000..a103dd8
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/CVE-2019-8457.patch
> @@ -0,0 +1,124 @@
> +From fbf2392644f0ae4282fa4583c9bb67260995d983 Mon Sep 17 00:00:00 2001
> +From: Shubham Agrawal <shuagr@microsoft.com>
> +Date: Mon, 23 Sep 2019 20:58:47 +0000
> +Subject: [PATCH] CVE: CVE-2019-8457 Upstream-Status: Backport
> +
> +Sign off: Shubham Agrawal <shuagr@microsoft.com>
> +---
> + sqlite3.c | 50 +++++++++++++++++++++++++++++++-------------------
> + 1 file changed, 31 insertions(+), 19 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 00513d4..5c8c7f4 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -172325,6 +172325,33 @@
> + }
> + 
> + 
> ++/* Allocate and initialize a new dynamic string object */
> ++StrAccum *sqlite3_str_new(sqlite3 *db){
> ++  StrAccum *p = sqlite3DbMallocRaw(db, sizeof(*p));
> ++  if( p ){
> ++    sqlite3StrAccumInit(p, db, 0, 0, SQLITE_MAX_LENGTH);
> ++  }
> ++  return p;
> ++}
> ++
> ++/* Finalize a string created using sqlite3_str_new().
> ++*/
> ++
> ++char *sqlite3_str_finish(StrAccum *p){
> ++  char *z;
> ++  if( p ){
> ++    z = sqlite3StrAccumFinish(p);
> ++    sqlite3DbFree(p->db, p);
> ++  }else{
> ++    z = 0;
> ++  }
> ++  return z;
> ++}
> ++/* Return any error code associated with p */
> ++int sqlite3_str_errcode(StrAccum *p){
> ++  return p ? p->accError : SQLITE_NOMEM;
> ++}
> ++
> + /*
> + ** Implementation of a scalar function that decodes r-tree nodes to
> + ** human readable strings. This can be used for debugging and analysis.
> +@@ -172342,49 +172369,53 @@
> + ** <num-dimension>*2 coordinates.
> + */
> + static void rtreenode(sqlite3_context *ctx, int nArg, sqlite3_value **apArg){
> +-  char *zText = 0;
> ++
> +   RtreeNode node;
> +   Rtree tree;
> +   int ii;
> ++  int nData;
> ++  int errCode;
> ++  StrAccum *pOut;
> + 
> +   UNUSED_PARAMETER(nArg);
> +   memset(&node, 0, sizeof(RtreeNode));
> +   memset(&tree, 0, sizeof(Rtree));
> +   tree.nDim = (u8)sqlite3_value_int(apArg[0]);
> ++  if( tree.nDim<1 || tree.nDim>5 ) return;
> +   tree.nDim2 = tree.nDim*2;
> +   tree.nBytesPerCell = 8 + 8 * tree.nDim;
> +   node.zData = (u8 *)sqlite3_value_blob(apArg[1]);
> ++  nData = sqlite3_value_bytes(apArg[1]);
> ++  if( nData<4 ) return;
> ++  if( nData<NCELL(&node)*tree.nBytesPerCell ) return;
> + 
> ++  pOut = sqlite3_str_new(0);
> +   for(ii=0; ii<NCELL(&node); ii++){
> +-    char zCell[512];
> +-    int nCell = 0;
> ++
> ++
> +     RtreeCell cell;
> +     int jj;
> + 
> +     nodeGetCell(&tree, &node, ii, &cell);
> +-    sqlite3_snprintf(512-nCell,&zCell[nCell],"%lld", cell.iRowid);
> +-    nCell = (int)strlen(zCell);
> ++    if( ii>0 ) sqlite3StrAccumAppend(pOut, " ", 1);
> ++    sqlite3XPrintf(pOut, "{%lld", cell.iRowid);
> ++
> +     for(jj=0; jj<tree.nDim2; jj++){
> + #ifndef SQLITE_RTREE_INT_ONLY
> +-      sqlite3_snprintf(512-nCell,&zCell[nCell], " %g",
> +-                       (double)cell.aCoord[jj].f);
> ++
> ++      sqlite3XPrintf(pOut, " %g", (double)cell.aCoord[jj].f);
> + #else
> +-      sqlite3_snprintf(512-nCell,&zCell[nCell], " %d",
> +-                       cell.aCoord[jj].i);
> ++
> ++      sqlite3XPrintf(pOut, " %d", cell.aCoord[jj].i);
> + #endif
> +-      nCell = (int)strlen(zCell);
> +-    }
> + 
> +-    if( zText ){
> +-      char *zTextNew = sqlite3_mprintf("%s {%s}", zText, zCell);
> +-      sqlite3_free(zText);
> +-      zText = zTextNew;
> +-    }else{
> +-      zText = sqlite3_mprintf("{%s}", zCell);
> +     }
> ++    sqlite3StrAccumAppend(pOut, "}", 1);
> +   }
> +-  
> +-  sqlite3_result_text(ctx, zText, -1, sqlite3_free);
> ++
> ++  errCode = sqlite3_str_errcode(pOut);
> ++  sqlite3_result_text(ctx, sqlite3_str_finish(pOut), -1, sqlite3_free);
> ++  sqlite3_result_error_code(ctx, errCode);
> + }
> + 
> + /* This routine implements an SQL function that returns the "depth" parameter
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> index d214ea1..7df61cd 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> @@ -7,6 +7,7 @@ SRC_URI = "\
>    http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>    file://CVE-2018-20505.patch \
>    file://CVE-2018-20506.patch \
> +  file://CVE-2019-8457.patch \
>    "
>  SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
>  SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"


