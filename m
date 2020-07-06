Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.61283.1594051921730067123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dTb0E+YM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id j20so1480576pfe.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Kno1jS+YEYXbS9LfK+m7snhkGLSGON2yDhbexBXjvH0=;
        b=dTb0E+YMtNmQC+55i7mQGJ0F7OFzjfZrmOLV6P7NDgnuChfcTB5DgTjsKYgt4fwdDn
         LxxTFv3M8DPX96TQqN2etRMMy07HJMXRJqhvTGH4y8AUtimKiTKE3UcGKZXoAmSAn4cW
         rGfIq2eiEqQNMojNu5wTAfhsYKsREdRT6w4/S5gREp2xfw2accN2FoZRHiNDFoy5ycss
         jkFpZAp2Hep030ebcvo+j3wvYKny4dSi6AOY4McKAUll9QB+NM2RO76rYh81SmQDAO3t
         VBb5c8JvKE4hTPBXf1bLiE2EIEtVud1FeRVb/Y79zedxDYzHYWypIHYkRBanE1o5HASo
         mGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Kno1jS+YEYXbS9LfK+m7snhkGLSGON2yDhbexBXjvH0=;
        b=m3P+f/arQJIE09RoBOakOgq/RYvNXcwg0VlLKIdfmI0N+AT9y+0qVWWu7NUFYHuCZC
         1QGlM6sNWVz5eKqy69bk0dEjWhGpKyR0AZdyw9AEgd29vKiIk0IVvW312fdQgG59LjT4
         3FgHlJk/02rfb+53kUpYGCvPOc/Gi10UvPiQei4ZxYlazTYEfvwebtkxqu4Dxpo8PiD8
         ogC3+B3bfBfjRDnVhYwe6zFdOSBFyT4UAuB6PC0vQ5QqHHbpFHSNCjKvBvzH1x5WX2Eo
         tZQwOGKhD1mSIm56ZAfS0YICsJd1Z+i3DQRmeoIiCDXWvPbWh/J7O21d+5jPso6KQVjz
         4oRQ==
X-Gm-Message-State: AOAM530VzSTP99sI2xbvKWMqyjx+06YGTGgho+PDThZylc3bRSiOThY9
	sWliqw9SO5Xap8r9y5cCwZdIL51RNAHWJw==
X-Google-Smtp-Source: ABdhPJyVdAlD1wHAc9txg75K7IGyzWN7e/vroG9czp2Qrnpp8j01y5A5Y4EH9iQvOAPXn7HNeQPXMw==
X-Received: by 2002:aa7:988e:: with SMTP id r14mr36272172pfl.35.1594051920748;
        Mon, 06 Jul 2020 09:12:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/25] sqlite3: Security fix for CVE-2020-15358
Date: Mon,  6 Jul 2020 06:10:25 -1000
Message-Id: <5cb016f1cbaebe636ad97f8521df7d2c4a79122e.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

Source: sqlite.org
MR: 104526
Type: Security Fix
Disposition: Backport from https://www.sqlite.org/src/vinfo/10fa79d00f8091e5?diff=1
ChangeID: a1c012b8c8aecd4970f3ae16686bf25f2376f542
Description:

Affects sqlite < 3.32.3

Fixes CVE CVE-2020-15358

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-15358.patch         | 47 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-15358.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-15358.patch b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
new file mode 100644
index 0000000000..086f6ef913
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-15358.patch
@@ -0,0 +1,47 @@
+Fix a defect in the query-flattener optimization identified by ticket [8f157e8010b22af0]. 
+
+Upstream-Status: Backport
+https://www.sqlite.org/src/info/10fa79d00f8091e5
+CVE: CVE-2020-15358
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: sqlite-autoconf-3310100/sqlite3.c
+===================================================================
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -18349,6 +18349,7 @@ struct Select {
+ #define SF_WhereBegin    0x0080000 /* Really a WhereBegin() call.  Debug Only */
+ #define SF_WinRewrite    0x0100000 /* Window function rewrite accomplished */
+ #define SF_View          0x0200000 /* SELECT statement is a view */
++#define SF_NoopOrderBy   0x0400000 /* ORDER BY is ignored for this query */
+ 
+ /*
+ ** The results of a SELECT can be distributed in several ways, as defined
+@@ -130607,9 +130608,7 @@ static int multiSelect(
+                           selectOpName(p->op)));
+         rc = sqlite3Select(pParse, p, &uniondest);
+         testcase( rc!=SQLITE_OK );
+-        /* Query flattening in sqlite3Select() might refill p->pOrderBy.
+-        ** Be sure to delete p->pOrderBy, therefore, to avoid a memory leak. */
+-        sqlite3ExprListDelete(db, p->pOrderBy);
++        assert( p->pOrderBy==0 );
+         pDelete = p->pPrior;
+         p->pPrior = pPrior;
+         p->pOrderBy = 0;
+@@ -131958,7 +131957,7 @@ static int flattenSubquery(
+     ** We look at every expression in the outer query and every place we see
+     ** "a" we substitute "x*3" and every place we see "b" we substitute "y+10".
+     */
+-    if( pSub->pOrderBy ){
++    if( pSub->pOrderBy && (pParent->selFlags & SF_NoopOrderBy)==0 ){
+       /* At this point, any non-zero iOrderByCol values indicate that the
+       ** ORDER BY column expression is identical to the iOrderByCol'th
+       ** expression returned by SELECT statement pSub. Since these values
+@@ -133659,6 +133658,7 @@ SQLITE_PRIVATE int sqlite3Select(
+     sqlite3ExprListDelete(db, p->pOrderBy);
+     p->pOrderBy = 0;
+     p->selFlags &= ~SF_Distinct;
++    p->selFlags |= SF_NoopOrderBy;
+   }
+   sqlite3SelectPrep(pParse, p, 0);
+   if( pParse->nErr || db->mallocFailed ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 57a791385c..e5071b48bb 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-9327.patch \
            file://CVE-2020-11656.patch \
            file://CVE-2020-11655.patch \
+           file://CVE-2020-15358.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1

