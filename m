Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web08.15552.1604072886663586599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 08:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nU3yg1NA;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id l16so7175142eds.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nwxF9Zk/2D4cvaqLAlO77SRjYAiZsWfqW7zaiz5RkI4=;
        b=nU3yg1NAsWUr/q3RbcnWXCuSkHkFOJWtjr7keCBJhj/WwceClXlQd3+HzSVjh7UKsM
         y+wC//8aM7vM87EqrraiJm8Phe+kWpSVyOSXoWFtTQPNef7byjA5422PAaFKT5i/Bp+6
         rY0ehq23N+q22qHmSlGhO92s+XNvYl4ADong8utYhmlXWYaTHVRGQvQfaZk62BKbxGEn
         s2Er9viLNuANO8e9mY2Yhr1AALJxslinBqR9N9bBnzUJ9bZn18d148POvtXUe4d6Bml3
         l9r8kU8Gcgz8NC1+leoDymH+j/ZKjm22eNdR3kXWpgWC2NJiuI/A5vyLPOK6h8DcRk84
         Np5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nwxF9Zk/2D4cvaqLAlO77SRjYAiZsWfqW7zaiz5RkI4=;
        b=l3Hi6EIF1iX2LA+jSH4CS75GHj1VdIP5OkoYuR5t8/zWELAOCTfJKxICVHUvRDcJuR
         NI2lPCoiTz6CCTKYOOSTFdBEEAH6evq719WXmwciOQpBEoiCopkfgwauuThT+xVjWtuR
         3kYVfx0WGrSsWNKlic34U/oNY2H/pr29AF5+3uY/djP2V8cUrhZ7kMORM2RQG++I/YQj
         HYhTY30eEQL4MWWthw0ASeTEaHVdM0Mk/vUUValGJeJV6lKbQWbLYpZwS/Bn/rT3b2ti
         OKy1SZ+/7YHmQpNGSruXDBlytVCccbfUE8XlT032lOn3eG8gob2uXPUxRu4IZ9hVGvUh
         YAJg==
X-Gm-Message-State: AOAM531VDzoA0pMlkTL5Bk/CA4yDWtW+FOSma7MTMbqACkPkSYpsLQb6
	vhA/03moOeYK2J3IKpKUNtnk1/wggV1bZznl7nvSfA==
X-Google-Smtp-Source: ABdhPJw9FurICuyHJIvJBIU7rNwv3tSkfouuYnlFKMuxkh1euLhxOloXY3IfpKkICVgrulMyVvTPInQBjTWfuCzPyFg=
X-Received: by 2002:aa7:d550:: with SMTP id u16mr2973222edr.147.1604072884985;
 Fri, 30 Oct 2020 08:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <1604059001-17159-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1604059001-17159-1-git-send-email-akash.hadke@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 30 Oct 2020 05:47:53 -1000
Message-ID: <CAOSpxdaqt9iPDdgaQanjM6YOW=McH9+hTd_h59mkd=qzUwa-fQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] sqlite3: Apply security fixes from Ubuntu
To: akash hadke <akash.hadke@kpit.com>, Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>, aditya.tayade@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 1:57 AM akash hadke <akash.hadke@kpit.com> wrote:
>
> Applied CVE patches of below issues which are present on
> ubuntu site given below.
>
> Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/sqlite3=
/3.31.1-4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.tar.xz
>
> CVE Issues are as below:
> CVE-2020-13434
> CVE-2020-13435
> CVE-2020-13630
> CVE-2020-13631
> CVE-2020-13632
>
> Testing was done in an ARM64 product CI system.
>
> Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
> ---
>  ...qlite3_CVEs_from_3.31.1-4ubuntu0.2.debian.patch | 334 ++++++++++++++=
+++++++
>  meta/recipes-support/sqlite/sqlite3_3.31.1.bb      |   1 +
>  2 files changed, 335 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/files/sqlite3_CVEs_from_=
3.31.1-4ubuntu0.2.debian.patch
>
> diff --git a/meta/recipes-support/sqlite/files/sqlite3_CVEs_from_3.31.1-=
4ubuntu0.2.debian.patch b/meta/recipes-support/sqlite/files/sqlite3_CVEs_fr=
om_3.31.1-4ubuntu0.2.debian.patch
> new file mode 100644
> index 0000000..d10c9af
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/files/sqlite3_CVEs_from_3.31.1-4ubuntu=
0.2.debian.patch
> @@ -0,0 +1,334 @@
> +Downloaded Ubuntu 20.04 LTS Sources
> +https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/sqlite3/3.31=
.1-4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.tar.xz
> +
> +Then copied the full tree and applied following CVE patches from
> +Ubuntu debian tar ball from path debian/patches using "patch -p1":
> +CVE-2020-13434
> +CVE-2020-13435-1
> +CVE-2020-13435-2
> +CVE-2020-13435-pre1
> +CVE-2020-13630
> +CVE-2020-13631
> +CVE-2020-13632

Please add these to the recipe as individual patch files, the contents
of the patch files should be unchanged except for the addition of the
Upstream-Status: and CVE: tags

See: https://wiki.yoctoproject.org/wiki/Security
in the "Patch name convention and commit message" section for details

Ross: in cases like this where there are multiple patch files for a
single CVE do we need the CVE: tag in all three files?

> +These patches were applied in the file sqlite3.c since we are
> +following amalgam format and the final patch was created after
> +taking diff of file sqlite3.c
> +
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primar=
y/+sourcefiles/sqlite3/3.31.1-4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.t=
ar.xz]
> +
> +Comment: Refreshed some hunks by adding SQLITE_PRIVATE to some function=
s.
> +         As our codebase having SQLITE_PRIVATE for functions.

I'm not going to be able to take security patches that have been
changed from the upstream in this way.

You would have to do this kind of patching in your own layer.

Thanks again for helping with CVE's.

Steve

> +CVE: CVE-2020-13434
> +CVE: CVE-2020-13435
> +CVE: CVE-2020-13630
> +CVE: CVE-2020-13631
> +CVE: CVE-2020-13632
> +
> +--- a/sqlite3.c       2020-01-27 20:25:19.000000000 +0000
> ++++ b/sqlite3.c   2020-10-10 11:28:20.622405611 +0000
> +@@ -18965,6 +18965,9 @@
> + SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker*, Expr*);
> + SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker*, Select*);
> + SQLITE_PRIVATE int sqlite3SelectWalkFail(Walker*, Select*);
> ++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker*,Select*);
> ++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker*,Select*);
> ++
> + #ifdef SQLITE_DEBUG
> + SQLITE_PRIVATE void sqlite3SelectWalkAssert2(Walker*, Select*);
> + #endif
> +@@ -19945,8 +19948,10 @@
> + SQLITE_PRIVATE int sqlite3ReadOnlyShadowTables(sqlite3 *db);
> + #ifndef SQLITE_OMIT_VIRTUALTABLE
> + SQLITE_PRIVATE   int sqlite3ShadowTableName(sqlite3 *db, const char *z=
Name);
> ++SQLITE_PRIVATE   int sqlite3IsShadowTableOf(sqlite3*,Table*,const char=
*);
> + #else
> + # define sqlite3ShadowTableName(A,B) 0
> ++# define sqlite3IsShadowTableOf(A,B,C) 0
> + #endif
> + SQLITE_PRIVATE int sqlite3VtabEponymousTableInit(Parse*,Module*);
> + SQLITE_PRIVATE void sqlite3VtabEponymousTableClear(sqlite3*,Module*);
> +@@ -28148,6 +28153,13 @@
> + #define etBUFSIZE SQLITE_PRINT_BUF_SIZE  /* Size of the output buffer =
*/
> +
> + /*
> ++** Hard limit on the precision of floating-point conversions.
> ++*/
> ++#ifndef SQLITE_PRINTF_PRECISION_LIMIT
> ++# define SQLITE_FP_PRECISION_LIMIT 100000000
> ++#endif
> ++
> ++/*
> + ** Render a string given by "fmt" into the StrAccum object.
> + */
> + SQLITE_API void sqlite3_str_vappendf(
> +@@ -28468,6 +28480,11 @@
> +         length =3D 0;
> + #else
> +         if( precision<0 ) precision =3D 6;         /* Set default prec=
ision */
> ++#ifdef SQLITE_FP_PRECISION_LIMIT
> ++        if( precision>SQLITE_FP_PRECISION_LIMIT ){
> ++          precision =3D SQLITE_FP_PRECISION_LIMIT;
> ++        }
> ++#endif
> +         if( realvalue<0.0 ){
> +           realvalue =3D -realvalue;
> +           prefix =3D '-';
> +@@ -96761,6 +96778,42 @@
> +   return WRC_Continue;
> + }
> +
> ++/* Increase the walkerDepth when entering a subquery, and
> ++** descrease when leaving the subquery.
> ++*/
> ++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker *pWalker, Select =
*pSelect){
> ++  UNUSED_PARAMETER(pSelect);
> ++  pWalker->walkerDepth++;
> ++  return WRC_Continue;
> ++}
> ++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker *pWalker, Select=
 *pSelect){
> ++  UNUSED_PARAMETER(pSelect);
> ++  pWalker->walkerDepth--;
> ++}
> ++
> ++/*
> ++** No-op routine for the parse-tree walker.
> ++**
> ++** When this routine is the Walker.xExprCallback then expression trees
> ++** are walked without any actions being taken at each node.  Presumabl=
y,
> ++** when this routine is used for Walker.xExprCallback then
> ++** Walker.xSelectCallback is set to do something useful for every
> ++** subquery in the parser tree.
> ++*/
> ++SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2=
){
> ++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
> ++  return WRC_Continue;
> ++}
> ++
> ++/*
> ++** No-op routine for the parse-tree walker for SELECT statements.
> ++** subquery in the parser tree.
> ++*/
> ++SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotU=
sed2){
> ++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
> ++  return WRC_Continue;
> ++}
> ++
> + /************** End of walker.c **************************************=
********/
> + /************** Begin file resolve.c *********************************=
********/
> + /*
> +@@ -96789,6 +96842,8 @@
> + **
> + ** incrAggFunctionDepth(pExpr,n) is the main routine.  incrAggDepth(..=
)
> + ** is a helper function - a callback for the tree walker.
> ++**
> ++** See also the sqlite3WindowExtraAggFuncDepth() routine in window.c
> + */
> + static int incrAggDepth(Walker *pWalker, Expr *pExpr){
> +   if( pExpr->op=3D=3DTK_AGG_FUNCTION ) pExpr->op2 +=3D pWalker->u.n;
> +@@ -102447,7 +102502,10 @@
> +   switch( op ){
> +     case TK_AGG_COLUMN: {
> +       AggInfo *pAggInfo =3D pExpr->pAggInfo;
> +-      struct AggInfo_col *pCol =3D &pAggInfo->aCol[pExpr->iAgg];
> ++      struct AggInfo_col *pCol;
> ++      assert( pAggInfo!=3D0 );
> ++      assert( pExpr->iAgg>=3D0 && pExpr->iAgg<pAggInfo->nColumn );
> ++      pCol =3D &pAggInfo->aCol[pExpr->iAgg];
> +       if( !pAggInfo->directMode ){
> +         assert( pCol->iMem>0 );
> +         return pCol->iMem;
> +@@ -102741,7 +102799,10 @@
> +     }
> +     case TK_AGG_FUNCTION: {
> +       AggInfo *pInfo =3D pExpr->pAggInfo;
> +-      if( pInfo=3D=3D0 ){
> ++      if( pInfo=3D=3D0
> ++       || NEVER(pExpr->iAgg<0)
> ++       || NEVER(pExpr->iAgg>=3DpInfo->nFunc)
> ++      ){
> +         assert( !ExprHasProperty(pExpr, EP_IntValue) );
> +         sqlite3ErrorMsg(pParse, "misuse of aggregate: %s()", pExpr->u.=
zToken);
> +       }else{
> +@@ -104480,15 +104541,6 @@
> +   }
> +   return WRC_Continue;
> + }
> +-static int analyzeAggregatesInSelect(Walker *pWalker, Select *pSelect)=
{
> +-  UNUSED_PARAMETER(pSelect);
> +-  pWalker->walkerDepth++;
> +-  return WRC_Continue;
> +-}
> +-static void analyzeAggregatesInSelectEnd(Walker *pWalker, Select *pSel=
ect){
> +-  UNUSED_PARAMETER(pSelect);
> +-  pWalker->walkerDepth--;
> +-}
> +
> + /*
> + ** Analyze the pExpr expression looking for aggregate functions and
> +@@ -104502,8 +104554,8 @@
> + SQLITE_PRIVATE void sqlite3ExprAnalyzeAggregates(NameContext *pNC, Exp=
r *pExpr){
> +   Walker w;
> +   w.xExprCallback =3D analyzeAggregate;
> +-  w.xSelectCallback =3D analyzeAggregatesInSelect;
> +-  w.xSelectCallback2 =3D analyzeAggregatesInSelectEnd;
> ++  w.xSelectCallback =3D sqlite3WalkerDepthIncrease;
> ++  w.xSelectCallback2 =3D sqlite3WalkerDepthDecrease;
> +   w.walkerDepth =3D 0;
> +   w.u.pNC =3D pNC;
> +   w.pParse =3D 0;
> +@@ -104742,7 +104794,10 @@
> +   /* Check that a table or index named 'zName' does not already exist
> +   ** in database iDb. If so, this is an error.
> +   */
> +-  if( sqlite3FindTable(db, zName, zDb) || sqlite3FindIndex(db, zName, =
zDb) ){
> ++  if( sqlite3FindTable(db, zName, zDb)
> ++   || sqlite3FindIndex(db, zName, zDb)
> ++   || sqlite3IsShadowTableOf(db, pTab, zName)
> ++  ){
> +     sqlite3ErrorMsg(pParse,
> +         "there is already another table or index with this name: %s", =
zName);
> +     goto exit_rename_table;
> +@@ -111252,6 +111307,28 @@
> +   recomputeColumnsNotIndexed(pPk);
> + }
> +
> ++
> ++#ifndef SQLITE_OMIT_VIRTUALTABLE
> ++/*
> ++** Return true if pTab is a virtual table and zName is a shadow table =
name
> ++** for that virtual table.
> ++*/
> ++SQLITE_PRIVATE int sqlite3IsShadowTableOf(sqlite3 *db, Table *pTab, co=
nst char *zName){
> ++  int nName;                    /* Length of zName */
> ++  Module *pMod;                 /* Module for the virtual table */
> ++
> ++  if( !IsVirtual(pTab) ) return 0;
> ++  nName =3D sqlite3Strlen30(pTab->zName);
> ++  if( sqlite3_strnicmp(zName, pTab->zName, nName)!=3D0 ) return 0;
> ++  if( zName[nName]!=3D'_' ) return 0;
> ++  pMod =3D (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]=
);
> ++  if( pMod=3D=3D0 ) return 0;
> ++  if( pMod->pModule->iVersion<3 ) return 0;
> ++  if( pMod->pModule->xShadowName=3D=3D0 ) return 0;
> ++  return pMod->pModule->xShadowName(zName+nName+1);
> ++}
> ++#endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
> ++
> + #ifndef SQLITE_OMIT_VIRTUALTABLE
> + /*
> + ** Return true if zName is a shadow table name in the current database
> +@@ -111263,8 +111340,6 @@
> + SQLITE_PRIVATE int sqlite3ShadowTableName(sqlite3 *db, const char *zNa=
me){
> +   char *zTail;                  /* Pointer to the last "_" in zName */
> +   Table *pTab;                  /* Table that zName is a shadow of */
> +-  Module *pMod;                 /* Module for the virtual table */
> +-
> +   zTail =3D strrchr(zName, '_');
> +   if( zTail=3D=3D0 ) return 0;
> +   *zTail =3D 0;
> +@@ -111272,11 +111347,7 @@
> +   *zTail =3D '_';
> +   if( pTab=3D=3D0 ) return 0;
> +   if( !IsVirtual(pTab) ) return 0;
> +-  pMod =3D (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]=
);
> +-  if( pMod=3D=3D0 ) return 0;
> +-  if( pMod->pModule->iVersion<3 ) return 0;
> +-  if( pMod->pModule->xShadowName=3D=3D0 ) return 0;
> +-  return pMod->pModule->xShadowName(zTail+1);
> ++  return sqlite3IsShadowTableOf(db, pTab, zName);
> + }
> + #endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
> +
> +@@ -133053,29 +133124,6 @@
> +   return WRC_Continue;
> + }
> +
> +-/*
> +-** No-op routine for the parse-tree walker.
> +-**
> +-** When this routine is the Walker.xExprCallback then expression trees
> +-** are walked without any actions being taken at each node.  Presumabl=
y,
> +-** when this routine is used for Walker.xExprCallback then
> +-** Walker.xSelectCallback is set to do something useful for every
> +-** subquery in the parser tree.
> +-*/
> +-SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2=
){
> +-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
> +-  return WRC_Continue;
> +-}
> +-
> +-/*
> +-** No-op routine for the parse-tree walker for SELECT statements.
> +-** subquery in the parser tree.
> +-*/
> +-SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotU=
sed2){
> +-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
> +-  return WRC_Continue;
> +-}
> +-
> + #if SQLITE_DEBUG
> + /*
> + ** Always assert.  This xSelectCallback2 implementation proves that th=
e
> +@@ -150214,6 +150262,23 @@
> + }
> +
> + /*
> ++** When rewriting a query, if the new subquery in the FROM clause
> ++** contains TK_AGG_FUNCTION nodes that refer to an outer query,
> ++** then we have to increase the Expr->op2 values of those nodes
> ++** due to the extra subquery layer that was added.
> ++**
> ++** See also the incrAggDepth() routine in resolve.c
> ++*/
> ++static int sqlite3WindowExtraAggFuncDepth(Walker *pWalker, Expr *pExpr=
){
> ++  if( pExpr->op=3D=3DTK_AGG_FUNCTION
> ++   && pExpr->op2>=3DpWalker->walkerDepth
> ++  ){
> ++    pExpr->op2++;
> ++  }
> ++  return WRC_Continue;
> ++}
> ++
> ++/*
> + ** If the SELECT statement passed as the second argument does not invo=
ke
> + ** any SQL window functions, this function is a no-op. Otherwise, it
> + ** rewrites the SELECT statement so that window function xStep functio=
ns
> +@@ -150321,6 +150386,7 @@
> +     p->pSrc =3D sqlite3SrcListAppend(pParse, 0, 0, 0);
> +     if( p->pSrc ){
> +       Table *pTab2;
> ++      Walker w;
> +       p->pSrc->a[0].pSelect =3D pSub;
> +       sqlite3SrcListAssignCursors(pParse, p->pSrc);
> +       pSub->selFlags |=3D SF_Expanded;
> +@@ -150335,6 +150401,11 @@
> +         pTab->tabFlags |=3D TF_Ephemeral;
> +         p->pSrc->a[0].pTab =3D pTab;
> +         pTab =3D pTab2;
> ++        memset(&w, 0, sizeof(w));
> ++        w.xExprCallback =3D sqlite3WindowExtraAggFuncDepth;
> ++        w.xSelectCallback =3D sqlite3WalkerDepthIncrease;
> ++        w.xSelectCallback2 =3D sqlite3WalkerDepthDecrease;
> ++        sqlite3WalkSelect(&w, pSub);
> +       }
> +     }else{
> +       sqlite3SelectDelete(db, pSub);
> +@@ -170206,6 +170277,7 @@
> +                 fts3EvalNextRow(pCsr, pLeft, pRc);
> +               }
> +             }
> ++            pRight->bEof =3D pLeft->bEof =3D 1;
> +           }
> +         }
> +         break;
> +@@ -181747,7 +181819,7 @@
> +     iStart =3D pExpr->iPhrase * ((p->nCol + 31) / 32);
> +   }
> +
> +-  while( 1 ){
> ++  if( pIter ) while( 1 ){
> +     int nHit =3D fts3ColumnlistCount(&pIter);
> +     if( (pPhrase->iColumn>=3DpTab->nColumn || pPhrase->iColumn=3D=3DiC=
ol) ){
> +       if( p->flag=3D=3DFTS3_MATCHINFO_LHITS ){
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipe=
s-support/sqlite/sqlite3_3.31.1.bb
> index e5071b4..9017593 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
> @@ -8,6 +8,7 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-=
${SQLITE_PV}.tar.gz \
>             file://CVE-2020-11656.patch \
>             file://CVE-2020-11655.patch \
>             file://CVE-2020-15358.patch \
> +           file://sqlite3_CVEs_from_3.31.1-4ubuntu0.2.debian.patch \
>             "
>  SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
>  SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68=
b7825a2b6b51949ae"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
