Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1E3EE14C0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4178.1694019405536599788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dG0uRbNz;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99bed101b70so587156566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019404; x=1694624204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37uFJJgk2e07C06ESI1NmuiHgQPiI9GQJFzxPGpWmMQ=;
        b=dG0uRbNzP1aUunoLKoM7B6elQP5g7qAGdfZ0sIV7YodSfniQIp3EJ0Au366mkcMZKz
         BY+9aGAx7I4jgPeLl/CvUeM9hmxiTk3vmQaLSn+09mqXHpL/TIRW5oWoaY8NDrvOd1bI
         1YWkGZJUM3Kg+R2sUJX+P6zvthQ9VewG5XzGaSu5SPMDlt1pHA0bs3vqEdX3P+CCCrEp
         xFlLmJemy/FnExrv/JpL6mGQhf943WIPGpLab9ChCLJfCPv1zJ/9IduRMCHoMZnxzMKW
         /7jTrln39jzvYqJmWpItBjY8xJlQesrmf9gcKqqtPFLMXQKkxpYI4KEgLq9AkigAscam
         P9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019404; x=1694624204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37uFJJgk2e07C06ESI1NmuiHgQPiI9GQJFzxPGpWmMQ=;
        b=F+j4mb2Oxni9f61EscWFxTw/bJsdpHPv9KQSIbW2x2Dv/0fvcU7qDz2m0OgtTTs4t4
         7siguYUwoIFDSh59BrgjUL2Nf0yLf62RPaBXNZUmGLLdUK/xpmaruKJk72yuh/BF5fPU
         RX+VeXbp4WA++9ZUzIeYZmp5NikQM0meUOhZRPhvid1rO0ApLwgLwrRXp1k9hYnyRQhq
         gXUteTyMNUBhGfsvpcDDICIKfUFCe7pmgRXRlsAKxBaqBaRC63E3nkSfsKxLl3lYHq+c
         3NabE8Socsul+0iyjp8b1RVDmakfIyC+vW+629SdjNz25IJSnlbBZ/kg87FS6Rdl1nkn
         hw+Q==
X-Gm-Message-State: AOJu0YwM84XS02nXXHUDfUvq6PLO76YA/A7k2ZRLtrVv5c0DBmIlytLr
	kD0MnqCYd2kObz8BzH7jds2FUrBz0Sg=
X-Google-Smtp-Source: AGHT+IGiasRvamt6Z/po7lA7QsFQ58lKT08PZKU5ZK5gWyklWUpcpz3MOC+QmwqNFuGrGahpThRiKA==
X-Received: by 2002:a17:906:73d2:b0:99c:e38d:e484 with SMTP id n18-20020a17090673d200b0099ce38de484mr2748015ejl.6.1694019403665;
        Wed, 06 Sep 2023 09:56:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/17] groff: update 1.22.4 -> 1.23.0
Date: Wed,  6 Sep 2023 18:56:23 +0200
Message-Id: <20230906165633.2382629-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187329

Drop backports.

Rebase
0001-Make-manpages-mulitlib-identical.patch
groff-not-search-fonts-on-build-host.patch

--without-doc has been removed upstream; replace
that with a dependency on groff-native and
substitution of groff executable from that.

Drop serial make; this was introduced in 2010 without
explanation and likely been solved long time ago.

Set urw fonts directory to something bogus to avoid host contamination.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-Fix-code-style-issues.patch    | 536 ------------------
 .../groff/files/0001-Include-config.h.patch   | 212 -------
 ...001-Make-manpages-mulitlib-identical.patch |  20 +-
 ...001-replace-perl-w-with-use-warnings.patch | 106 ----
 .../groff/files/0001-support-musl.patch       |  41 --
 ...groff-not-search-fonts-on-build-host.patch |  37 +-
 .../{groff_1.22.4.bb => groff_1.23.0.bb}      |  27 +-
 7 files changed, 42 insertions(+), 937 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-Include-config.h.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
 delete mode 100644 meta/recipes-extended/groff/files/0001-support-musl.patch
 rename meta/recipes-extended/groff/{groff_1.22.4.bb => groff_1.23.0.bb} (76%)

diff --git a/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch b/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch
deleted file mode 100644
index 221490d6a33..00000000000
--- a/meta/recipes-extended/groff/files/0001-Fix-code-style-issues.patch
+++ /dev/null
@@ -1,536 +0,0 @@
-From 99313d5c0ff35da6627e7dc985612f990ca64637 Mon Sep 17 00:00:00 2001
-From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
-Date: Mon, 16 Aug 2021 12:37:22 +1000
-Subject: [PATCH] Fix code style issues.
-
-* src/preproc/grn/hgraph.cpp:
-* src/preproc/grn/hpoint.cpp:
-* src/preproc/grn/main.cpp:
-* src/preproc/grn/hdb.cpp: Drop use of `register` storage class.
-
-* src/preproc/grn/hgraph.cpp (len, HGPrintElt, picurve):
-* src/preproc/grn/hdb.cpp (DBRead): Wrap long lines.
-
-* src/preproc/grn/hgraph.cpp: Rename function from `Paramaterize` to
-  `Parameterize`.
-
-  (HGCurve): Update call site.
-
-* src/preproc/grn/main.cpp (add_file): Drop redundant cast in
-  `realloc()` call.
-
-  (conv, interpret): Use standard English in diagnostic messages.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/groff.git/commit/?id=eead5f5cf1dedc6d180bdb34914d7157d39e270c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/preproc/grn/hdb.cpp    |  20 +++---
- src/preproc/grn/hgraph.cpp | 131 +++++++++++++++++++------------------
- src/preproc/grn/hpoint.cpp |   2 +-
- src/preproc/grn/main.cpp   |  38 +++++------
- 4 files changed, 100 insertions(+), 91 deletions(-)
-
-diff --git a/src/preproc/grn/hdb.cpp b/src/preproc/grn/hdb.cpp
-index c61e099..2b4011b 100644
---- a/src/preproc/grn/hdb.cpp
-+++ b/src/preproc/grn/hdb.cpp
-@@ -35,7 +35,7 @@ extern POINT *PTInit();
- extern POINT *PTMakePoint(double x, double y, POINT ** pplist);
- 
- 
--int DBGetType(register char *s);
-+int DBGetType(char *s);
- 
- 
- /*
-@@ -61,7 +61,7 @@ DBCreateElt(int type,
- 	    char *text,
- 	    ELT **db)
- {
--  register ELT *temp;
-+  ELT *temp = 0;
- 
-   temp = (ELT *) malloc(sizeof(ELT));
-   temp->nextelt = *db;
-@@ -80,11 +80,11 @@ DBCreateElt(int type,
-  * pointer to that database.
-  */
- ELT *
--DBRead(register FILE *file)
-+DBRead(FILE *file)
- {
--  register int i;
--  register int done;		/* flag for input exhausted */
--  register double nx;		/* x holder so x is not set before orienting */
-+  int i;
-+  int done;		/* flag for input exhausted */
-+  double nx;		/* x holder so x is not set before orienting */
-   int type;			/* element type */
-   ELT *elist;			/* pointer to the file's elements */
-   POINT *plist;			/* pointer for reading in points */
-@@ -112,7 +112,9 @@ DBRead(register FILE *file)
-     /* if (fscanf(file,"%" MAXSTRING_S "s\n", string) == EOF) */
-     /* I changed the scanf format because the element */
-     /* can have two words (e.g. CURVE SPLINE)         */
--    if (fscanf(file, "\n%" MAXSTRING_S "[^\n]%*[^\n]\n", string) == EOF) {
-+    if (fscanf(file, "\n%"
-+		      MAXSTRING_S
-+		     "[^\n]%*[^\n]\n", string) == EOF) {
-       error("'%1', error in file format", gremlinfile);
-       return (elist);
-     }
-@@ -209,7 +211,7 @@ DBRead(register FILE *file)
-  * New file format has literal names for element types.
-  */
- int
--DBGetType(register char *s)
-+DBGetType(char *s)
- {
-   if (isdigit(s[0]) || (s[0] == '-'))	/* old element format or EOF */
-     return (atoi(s));
-@@ -298,7 +300,7 @@ xscanf(FILE *f,
-        double *xp,
-        double *yp)
- {
--  register int c, i, j, m, frac;
-+  int c, i, j, m, frac;
-   int iscale = 1, jscale = 1;	/* x = i/scale, y=j/jscale */
- 
-   while ((c = getc(f)) == ' ');
-diff --git a/src/preproc/grn/hgraph.cpp b/src/preproc/grn/hgraph.cpp
-index dbc0086..ad051ea 100644
---- a/src/preproc/grn/hgraph.cpp
-+++ b/src/preproc/grn/hgraph.cpp
-@@ -14,7 +14,8 @@
- #define PointsPerInterval 64
- #define pi		3.14159265358979324
- #define twopi		(2.0 * pi)
--#define len(a, b)	groff_hypot((double)(b.x-a.x), (double)(b.y-a.y))
-+#define len(a, b)	groff_hypot((double)(b.x-a.x), \
-+			            (double)(b.y-a.y))
- 
- 
- extern int dotshifter;		/* for the length of dotted curves */
-@@ -48,7 +49,7 @@ extern double adj4;
- extern int res;
- 
- void HGSetFont(int font, int size);
--void HGPutText(int justify, POINT pnt, register char *string);
-+void HGPutText(int justify, POINT pnt, char *string);
- void HGSetBrush(int mode);
- void tmove2(int px, int py);
- void doarc(POINT cp, POINT sp, int angle);
-@@ -58,10 +59,10 @@ void drawwig(POINT * ptr, int type);
- void HGtline(int x1, int y1);
- void deltax(double x);
- void deltay(double y);
--void HGArc(register int cx, register int cy, int px, int py, int angle);
--void picurve(register int *x, register int *y, int npts);
-+void HGArc(int cx, int cy, int px, int py, int angle);
-+void picurve(int *x, int *y, int npts);
- void HGCurve(int *x, int *y, int numpoints);
--void Paramaterize(int x[], int y[], double h[], int n);
-+void Parameterize(int x[], int y[], double h[], int n);
- void PeriodicSpline(double h[], int z[],
- 		    double dz[], double d2z[], double d3z[],
- 		    int npoints);
-@@ -83,10 +84,10 @@ void
- HGPrintElt(ELT *element,
- 	   int /* baseline */)
- {
--  register POINT *p1;
--  register POINT *p2;
--  register int length;
--  register int graylevel;
-+  POINT *p1;
-+  POINT *p2;
-+  int length;
-+  int graylevel;
- 
-   if (!DBNullelt(element) && !Nullpoint((p1 = element->ptlist))) {
-     /* p1 always has first point */
-@@ -168,7 +169,8 @@ HGPrintElt(ELT *element,
- 
- 	  if (polyfill == FILL || polyfill == BOTH) {
- 	    /* do the interior */
--	    char command = (polyfill == BOTH && element->brushf) ? 'p' : 'P';
-+	    char command = (polyfill == BOTH && element->brushf)
-+			   ? 'p' : 'P';
- 
- 	    /* include outline, if there is one and */
- 	    /* the -p flag was set                  */
-@@ -278,7 +280,7 @@ HGPrintElt(ELT *element,
- void
- HGPutText(int justify,
- 	  POINT pnt,
--	  register char *string)
-+	  char *string)
- {
-   int savelasty = lasty;	/* vertical motion for text is to be */
- 				/* ignored.  Save current y here     */
-@@ -387,7 +389,7 @@ HGSetFont(int font,
- void
- HGSetBrush(int mode)
- {
--  register int printed = 0;
-+  int printed = 0;
- 
-   if (linmod != style[--mode]) {
-     /* Groff doesn't understand \Ds, so we take it out */
-@@ -417,7 +419,7 @@ HGSetBrush(int mode)
- void
- deltax(double x)
- {
--  register int ix = (int) (x * troffscale);
-+  int ix = (int) (x * troffscale);
- 
-   printf(" %du", ix - lastx);
-   lastx = ix;
-@@ -437,7 +439,7 @@ deltax(double x)
- void
- deltay(double y)
- {
--  register int iy = (int) (y * troffscale);
-+  int iy = (int) (y * troffscale);
- 
-   printf(" %du", iy - lastyline);
-   lastyline = iy;
-@@ -457,8 +459,8 @@ void
- tmove2(int px,
-        int py)
- {
--  register int dx;
--  register int dy;
-+  int dx;
-+  int dy;
- 
-   if ((dy = py - lasty)) {
-     printf("\\v'%du'", dy);
-@@ -483,10 +485,10 @@ tmove2(int px,
- void
- tmove(POINT * ptr)
- {
--  register int ix = (int) (ptr->x * troffscale);
--  register int iy = (int) (ptr->y * troffscale);
--  register int dx;
--  register int dy;
-+  int ix = (int) (ptr->x * troffscale);
-+  int iy = (int) (ptr->y * troffscale);
-+  int dx;
-+  int dy;
- 
-   if ((dy = iy - lasty)) {
-     printf(".sp %du\n", dy);
-@@ -547,7 +549,7 @@ void
- drawwig(POINT * ptr,
- 	int type)
- {
--  register int npts;			/* point list index */
-+  int npts;			/* point list index */
-   int x[MAXPOINTS], y[MAXPOINTS];	/* point list */
- 
-   for (npts = 1; !Nullpoint(ptr); ptr = PTNextPoint(ptr), npts++) {
-@@ -574,20 +576,20 @@ drawwig(POINT * ptr,
-  *----------------------------------------------------------------------------*/
- 
- void
--HGArc(register int cx,
--      register int cy,
-+HGArc(int cx,
-+      int cy,
-       int px,
-       int py,
-       int angle)
- {
-   double xs, ys, resolution, fullcircle;
-   int m;
--  register int mask;
--  register int extent;
--  register int nx;
--  register int ny;
--  register int length;
--  register double epsilon;
-+  int mask;
-+  int extent;
-+  int nx;
-+  int ny;
-+  int length;
-+  double epsilon;
- 
-   xs = px - cx;
-   ys = py - cy;
-@@ -633,15 +635,15 @@ HGArc(register int cx,
-  *----------------------------------------------------------------------------*/
- 
- void
--picurve(register int *x,
--	register int *y,
-+picurve(int *x,
-+	int *y,
- 	int npts)
- {
--  register int nseg;		/* effective resolution for each curve */
--  register int xp;		/* current point (and temporary) */
--  register int yp;
--  int pxp, pyp;			/* previous point (to make lines from) */
--  int i;			/* inner curve segment traverser */
-+  int nseg;		/* effective resolution for each curve */
-+  int xp;		/* current point (and temporary) */
-+  int yp;
-+  int pxp, pyp;		/* previous point (to make lines from) */
-+  int i;		/* inner curve segment traverser */
-   int length = 0;
-   double w;			/* position factor */
-   double t1, t2, t3;		/* calculation temps */
-@@ -671,7 +673,8 @@ picurve(register int *x,
- 				/* 'nseg' is the number of line    */
- 				/* segments that will be drawn for */
- 				/* each curve segment.             */
--    nseg = (int) ((double) (nseg + (int) groff_hypot((double) xp, (double) yp)) /
-+    nseg = (int) ((double) (nseg + (int) groff_hypot((double) xp,
-+						     (double) yp)) /
- 		  res * PointsPerInterval);
- 
-     for (i = 1; i < nseg; i++) {
-@@ -710,10 +713,10 @@ HGCurve(int *x,
-   double h[MAXPOINTS], dx[MAXPOINTS], dy[MAXPOINTS];
-   double d2x[MAXPOINTS], d2y[MAXPOINTS], d3x[MAXPOINTS], d3y[MAXPOINTS];
-   double t, t2, t3;
--  register int j;
--  register int k;
--  register int nx;
--  register int ny;
-+  int j;
-+  int k;
-+  int nx;
-+  int ny;
-   int lx, ly;
-   int length = 0;
- 
-@@ -725,7 +728,7 @@ HGCurve(int *x,
-    * Solve for derivatives of the curve at each point separately for x and y
-    * (parametric).
-    */
--  Paramaterize(x, y, h, numpoints);
-+  Parameterize(x, y, h, numpoints);
- 
-   /* closed curve */
-   if ((x[1] == x[numpoints]) && (y[1] == y[numpoints])) {
-@@ -771,15 +774,15 @@ HGCurve(int *x,
-  *----------------------------------------------------------------------------*/
- 
- void
--Paramaterize(int x[],
-+Parameterize(int x[],
- 	     int y[],
- 	     double h[],
- 	     int n)
- {
--  register int dx;
--  register int dy;
--  register int i;
--  register int j;
-+  int dx;
-+  int dy;
-+  int i;
-+  int j;
-   double u[MAXPOINTS];
- 
-   for (i = 1; i <= n; ++i) {
-@@ -937,9 +940,9 @@ NaturalEndSpline(double h[],	/* parameterization */
-  *----------------------------------------------------------------------------*/
- 
- void
--change(register int x,
--       register int y,
--       register int vis)
-+change(int x,
-+       int y,
-+       int vis)
- {
-   static int length = 0;
- 
-@@ -967,17 +970,17 @@ void
- HGtline(int x_1,
- 	int y_1)
- {
--  register int x_0 = lastx;
--  register int y_0 = lasty;
--  register int dx;
--  register int dy;
--  register int oldcoord;
--  register int res1;
--  register int visible;
--  register int res2;
--  register int xinc;
--  register int yinc;
--  register int dotcounter;
-+  int x_0 = lastx;
-+  int y_0 = lasty;
-+  int dx;
-+  int dy;
-+  int oldcoord;
-+  int res1;
-+  int visible;
-+  int res2;
-+  int xinc;
-+  int yinc;
-+  int dotcounter;
- 
-   if (linmod == SOLID) {
-     line(x_1, y_1);
-@@ -1045,4 +1048,8 @@ HGtline(int x_1,
-     change(x_1, y_1, 0);
- }
- 
--/* EOF */
-+// Local Variables:
-+// fill-column: 72
-+// mode: C++
-+// End:
-+// vim: set cindent noexpandtab shiftwidth=2 textwidth=72:
-diff --git a/src/preproc/grn/hpoint.cpp b/src/preproc/grn/hpoint.cpp
-index b581cb0..77bfc9d 100644
---- a/src/preproc/grn/hpoint.cpp
-+++ b/src/preproc/grn/hpoint.cpp
-@@ -32,7 +32,7 @@ PTMakePoint(double x,
- 	    double y,
- 	    POINT **pplist)
- {
--  register POINT *pt;
-+  POINT *pt;
- 
-   if (Nullpoint(pt = *pplist)) {	/* empty list */
-     *pplist = (POINT *) malloc(sizeof(POINT));
-diff --git a/src/preproc/grn/main.cpp b/src/preproc/grn/main.cpp
-index 833fd60..d1887b6 100644
---- a/src/preproc/grn/main.cpp
-+++ b/src/preproc/grn/main.cpp
-@@ -88,7 +88,7 @@ extern "C" const char *Version_string;
- 
- extern void HGPrintElt(ELT *element, int baseline);
- extern ELT *DBInit();
--extern ELT *DBRead(register FILE *file);
-+extern ELT *DBRead(FILE *file);
- extern POINT *PTInit();
- extern POINT *PTMakePoint(double x, double y, POINT **pplist);
- 
-@@ -231,9 +231,9 @@ int compatibility_flag = FALSE;	/* TRUE if in compatibility mode */
- 
- void getres();
- int doinput(FILE *fp);
--void conv(register FILE *fp, int baseline);
-+void conv(FILE *fp, int baseline);
- void savestate();
--int has_polygon(register ELT *elist);
-+int has_polygon(ELT *elist);
- void interpret(char *line);
- 
- 
-@@ -256,7 +256,7 @@ add_file(char **file,
- {
-   if (*count >= *cur_size) {
-     *cur_size += FILE_SIZE_INCR;
--    file = (char **) realloc((char **) file, *cur_size * sizeof(char *));
-+    file = (char **) realloc(file, *cur_size * sizeof(char *));
-     if (file == NULL) {
-       fatal("unable to extend file array");
-     }
-@@ -283,9 +283,9 @@ main(int argc,
- {
-   setlocale(LC_NUMERIC, "C");
-   program_name = argv[0];
--  register FILE *fp;
--  register int k;
--  register char c;
-+  FILE *fp;
-+  int k;
-+  char c;
-   int gfil = 0;
-   char **file = NULL;
-   int file_cur_size = INIT_FILE_SIZE;
-@@ -466,7 +466,7 @@ doinput(FILE *fp)
- void
- initpic()
- {
--  register int i;
-+  int i;
- 
-   for (i = 0; i < STYLES; i++) {	/* line thickness defaults */
-     thick[i] = defthick[i];
-@@ -511,12 +511,12 @@ initpic()
-  *----------------------------------------------------------------------------*/
- 
- void
--conv(register FILE *fp,
-+conv(FILE *fp,
-      int baseline)
- {
--  register FILE *gfp = NULL;	/* input file pointer */
--  register int done = 0;	/* flag to remember if finished */
--  register ELT *e;		/* current element pointer */
-+  FILE *gfp = NULL;		/* input file pointer */
-+  int done = 0;		/* flag to remember if finished */
-+  ELT *e;			/* current element pointer */
-   ELT *PICTURE;			/* whole picture data base pointer */
-   double temp;			/* temporary calculating area */
-   /* POINT ptr; */		/* coordinates of a point to pass to 'mov' */
-@@ -543,7 +543,7 @@ conv(register FILE *fp,
- 
-       if (!gremlinfile[0]) {
- 	if (!setdefault)
--	  error("at line %1: no picture filename.\n", baseline);
-+	  error("no picture file name at line %1", baseline);
- 	return;
-       }
-       char *path;
-@@ -577,7 +577,7 @@ conv(register FILE *fp,
-       }				/* here, troffscale is the */
- 				/* picture's scaling factor */
-       if (pointscale) {
--	register int i;		/* do pointscaling here, when */
-+	int i;			/* do pointscaling here, when */
- 				/* scale is known, before output */
- 	for (i = 0; i < SIZES; i++)
- 	  tsize[i] = (int) (troffscale * (double) tsize[i] + 0.5);
-@@ -700,7 +700,7 @@ conv(register FILE *fp,
- void
- savestate()
- {
--  register int i;
-+  int i;
- 
-   for (i = 0; i < STYLES; i++)	/* line thickness defaults */
-     defthick[i] = thick[i];
-@@ -761,8 +761,8 @@ interpret(char *line)
- {
-   char str1[MAXINLINE];
-   char str2[MAXINLINE];
--  register char *chr;
--  register int i;
-+  char *chr;
-+  int i;
-   double par;
- 
-   str2[0] = '\0';
-@@ -811,7 +811,7 @@ interpret(char *line)
- 
-     if (str2[0] < '0') {
-   nofont:
--      error("no fontname specified in line %1", linenum);
-+      error("no font name specified in line %1", linenum);
-       break;
-     }
-     if (str1[1] == 't')
-@@ -935,7 +935,7 @@ interpret(char *line)
-  */
- 
- int
--has_polygon(register ELT *elist)
-+has_polygon(ELT *elist)
- {
-   while (!DBNullelt(elist)) {
-     if (elist->type == POLYGON)
--- 
-2.39.0
-
diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.patch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
deleted file mode 100644
index 99f590bef32..00000000000
--- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 6cfa9f8126c1d6ec26f120d273e714fb19108873 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 4 Aug 2019 16:32:41 -0700
-Subject: [PATCH] Include config.h
-
-This helps avoid the include conflicts where <stdlib.h> is including
-<math.h> and since -I./lib is used and a local math.h wrapper is
-residing in there, the build breaks since stdlib.h really wants the
-standard system math.h to be included, this ensures that right macros
-are predefined and included before stdlib.h is included
-
-fixes
-In file included from src/libs/libgroff/assert.cpp:20:
-In file included from TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-r0/recipe-sysroot/usr/include/c++/v1/stdlib.h:100:
-./lib/math.h:38:3: error: "Please include config.h first."
- #error "Please include config.h first."
-  ^
-./lib/math.h:40:1: error: unknown type name '_GL_INLINE_HEADER_BEGIN'
-
-We delete eqn.cpp and qen.hpp in do_configure
-to ensure they're regenerated and deterministic.
-
-Issue is fixed upstream with similar patches:
-https://git.savannah.gnu.org/cgit/groff.git/commit/?id=979f3f4266151c7681a68a40d2c4913842a7271d
-https://git.savannah.gnu.org/cgit/groff.git/commit/?id=fe121eeacd53c96105f23209b2c205f436f97359
-
-Upstream-Status: Backport [see links above]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libs/libgroff/assert.cpp  |   4 +
- src/libs/libgroff/curtime.cpp |   4 +
- src/libs/libgroff/device.cpp  |   4 +
- src/libs/libgroff/error.cpp   |   4 +
- src/libs/libgroff/fatal.cpp   |   4 +
- src/libs/libgroff/string.cpp  |   4 +
- src/libs/libgroff/strsave.cpp |   4 +
- src/preproc/eqn/eqn.cpp       | 450 ++++++++++++++++++----------------
- src/preproc/eqn/eqn.hpp       |  12 +-
- src/preproc/eqn/eqn.ypp       |   4 +
- src/preproc/eqn/other.cpp     |   4 +
- src/preproc/eqn/text.cpp      |   4 +
- src/preproc/pic/object.cpp    |   4 +
- 13 files changed, 285 insertions(+), 221 deletions(-)
-
-diff --git a/src/libs/libgroff/assert.cpp b/src/libs/libgroff/assert.cpp
-index aceed05..97780d6 100644
---- a/src/libs/libgroff/assert.cpp
-+++ b/src/libs/libgroff/assert.cpp
-@@ -16,6 +16,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdio.h>
- #include <stdlib.h>
- #include "assert.h"
-diff --git a/src/libs/libgroff/curtime.cpp b/src/libs/libgroff/curtime.cpp
-index 72fe067..9ddba08 100644
---- a/src/libs/libgroff/curtime.cpp
-+++ b/src/libs/libgroff/curtime.cpp
-@@ -15,6 +15,10 @@ for more details.
- The GNU General Public License version 2 (GPL2) is available in the
- internet at <http://www.gnu.org/licenses/gpl-2.0.txt>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <errno.h>
- #include <limits.h>
- #include <stdlib.h>
-diff --git a/src/libs/libgroff/device.cpp b/src/libs/libgroff/device.cpp
-index 0d28b85..c211f85 100644
---- a/src/libs/libgroff/device.cpp
-+++ b/src/libs/libgroff/device.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdlib.h>
- #include "device.h"
- #include "defs.h"
-diff --git a/src/libs/libgroff/error.cpp b/src/libs/libgroff/error.cpp
-index 9a18803..7b63d3d 100644
---- a/src/libs/libgroff/error.cpp
-+++ b/src/libs/libgroff/error.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/libs/libgroff/fatal.cpp b/src/libs/libgroff/fatal.cpp
-index c0dcb35..fd6003e 100644
---- a/src/libs/libgroff/fatal.cpp
-+++ b/src/libs/libgroff/fatal.cpp
-@@ -16,6 +16,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdlib.h>
- 
- #define FATAL_ERROR_EXIT_CODE 3
-diff --git a/src/libs/libgroff/string.cpp b/src/libs/libgroff/string.cpp
-index 46c015c..449f3a6 100644
---- a/src/libs/libgroff/string.cpp
-+++ b/src/libs/libgroff/string.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdlib.h>
- 
- #include "lib.h"
-diff --git a/src/libs/libgroff/strsave.cpp b/src/libs/libgroff/strsave.cpp
-index f95c05e..d875045 100644
---- a/src/libs/libgroff/strsave.cpp
-+++ b/src/libs/libgroff/strsave.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <string.h>
- #include <stdlib.h>
- 
-diff --git a/src/preproc/eqn/eqn.ypp b/src/preproc/eqn/eqn.ypp
-index fb318c3..b7b647e 100644
---- a/src/preproc/eqn/eqn.ypp
-+++ b/src/preproc/eqn/eqn.ypp
-@@ -16,6 +16,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- %{
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdio.h>
- #include <string.h>
- #include <stdlib.h>
-diff --git a/src/preproc/eqn/other.cpp b/src/preproc/eqn/other.cpp
-index 8db993f..38db396 100644
---- a/src/preproc/eqn/other.cpp
-+++ b/src/preproc/eqn/other.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdlib.h>
- 
- #include "eqn.h"
-diff --git a/src/preproc/eqn/text.cpp b/src/preproc/eqn/text.cpp
-index f3d06f9..3b244d5 100644
---- a/src/preproc/eqn/text.cpp
-+++ b/src/preproc/eqn/text.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <ctype.h>
- #include <stdlib.h>
- #include "eqn.h"
-diff --git a/src/preproc/pic/object.cpp b/src/preproc/pic/object.cpp
-index d8ba610..f26a831 100644
---- a/src/preproc/pic/object.cpp
-+++ b/src/preproc/pic/object.cpp
-@@ -17,6 +17,10 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with this program.  If not, see <http://www.gnu.org/licenses/>. */
- 
-+#if HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
- #include <stdlib.h>
- 
- #include "pic.h"
--- 
-2.22.0
-
diff --git a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
index c3cfc7cea82..6dc84c90623 100644
--- a/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
+++ b/meta/recipes-extended/groff/files/0001-Make-manpages-mulitlib-identical.patch
@@ -1,27 +1,25 @@
-From e738f9185ba90f2083c846ade3551234bb5a7cbc Mon Sep 17 00:00:00 2001
+From aa1f37f1e0ff0dc0eeb199b52959e0deb275721e Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Sat, 7 Mar 2020 00:59:13 +0000
 Subject: [PATCH] Make manpages mulitlib identical
 
 Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d18c49b..6175fe9 100644
+index f7ab410..7e1f3fb 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -917,7 +917,7 @@ SUFFIXES += .man
- 	     -e "s|[@]MDATE[@]|`$(PERL) $(top_srcdir)/mdate.pl $<`|g" \
- 	     -e "s|[@]OLDFONTDIR[@]|`echo $(oldfontdir) | sed -f $(makevarescape)`|g" \
+@@ -891,7 +891,7 @@ SUFFIXES += .man
+ 	     -e "s|[@]PAGE[@]|\\\\%$(PAGE)|g" \
  	     -e "s|[@]PDFDOCDIR[@]|`echo $(pdfdocdir) | sed -f $(makevarescape)`|g" \
+ 	     -e "s|[@]PSPRINT[@]|`echo $(PSPRINT) | sed -f $(makevarescape)`|g" \
 -	     -e "s|[@]SYSTEMMACRODIR[@]|`echo $(systemtmacdir) | sed -f $(makevarescape)`|g" \
 +	     -e "s|[@]SYSTEMMACRODIR[@]|`echo $(systemtmacdir) | sed -e 's,$(libdir),$(prefix)/lib*,' | sed -f $(makevarescape)`|g" \
- 	     -e "s|[@]TMAC_AN_PREFIX[@]|$(tmac_an_prefix)|g" \
- 	     -e "s|[@]TMAC_M_PREFIX[@]|$(tmac_m_prefix)|g" \
- 	     -e "s|[@]TMAC_MDIR[@]|$(tmacdir)/mm|g" \
--- 
-2.23.0
-
+ 	     -e "s|[@]TMAC_AN_PREFIX[@]|\\\\%$(tmac_an_prefix)|g" \
+ 	     -e "s|[@]TMAC_M_PREFIX[@]|\\\\%$(tmac_m_prefix)|g" \
+ 	     -e "s|[@]TMAC_MDIR[@]|`echo $(tmacdir) | sed -f $(makevarescape)`/mm|g" \
diff --git a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
deleted file mode 100644
index b028fa20aa6..00000000000
--- a/meta/recipes-extended/groff/files/0001-replace-perl-w-with-use-warnings.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 6821a23e6cf34df37c351b45be413a8da9115f9f Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 11 May 2019 17:03:03 +0800
-Subject: [PATCH 1/2] replace "perl -w" with "use warnings"
-
-The shebang's max length is usually 128 as defined in
-/usr/include/linux/binfmts.h:
-  #define BINPRM_BUF_SIZE 128
-
-There would be errors when @PERL@ is longer than 128, use
-'/usr/bin/env perl' can fix the problem, but '/usr/bin/env perl -w'
-doesn't work:
-
-/usr/bin/env: perl -w: No such file or directory
-
-So replace "perl -w" with "use warnings" to make it work.
-
-Upstream-Status: Submitted [by email to g.branden.robinson@gmail.com]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Rebase to 1.22.4.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- font/devpdf/util/BuildFoundries.pl | 3 ++-
- src/devices/gropdf/gropdf.pl       | 3 ++-
- src/devices/gropdf/pdfmom.pl       | 3 ++-
- src/utils/afmtodit/afmtodit.pl     | 3 ++-
- 4 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/font/devpdf/util/BuildFoundries.pl b/font/devpdf/util/BuildFoundries.pl
-index f8af826..9584e28 100644
---- a/font/devpdf/util/BuildFoundries.pl
-+++ b/font/devpdf/util/BuildFoundries.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/perl -w
-+#!/usr/bin/perl
- #
- #   BuildFoundries   : Given a Foundry file generate groff and download files
- #   Deri James       : Monday 07 Feb 2011
-@@ -22,6 +22,7 @@
- # along with this program.  If not, see <http://www.gnu.org/licenses/>.
- 
- use strict;
-+use warnings;
- 
- (my $progname = $0) =~s @.*/@@;
- my $where=shift||'';
-diff --git a/src/devices/gropdf/gropdf.pl b/src/devices/gropdf/gropdf.pl
-index 2ec52d0..ce5a06f 100644
---- a/src/devices/gropdf/gropdf.pl
-+++ b/src/devices/gropdf/gropdf.pl
-@@ -1,4 +1,4 @@
--#!@PERL@ -w
-+#!@PERL@
- #
- #	gropdf		: PDF post processor for groff
- #
-@@ -21,6 +21,7 @@
- # along with this program. If not, see <http://www.gnu.org/licenses/>.
- 
- use strict;
-+use warnings;
- use Getopt::Long qw(:config bundling);
- 
- use constant
-diff --git a/src/devices/gropdf/pdfmom.pl b/src/devices/gropdf/pdfmom.pl
-index c9b08b2..61124f3 100644
---- a/src/devices/gropdf/pdfmom.pl
-+++ b/src/devices/gropdf/pdfmom.pl
-@@ -1,4 +1,4 @@
--#!@PERL@ -w
-+#!@PERL@
- #
- #	pdfmom		: Frontend to run groff -mom to produce PDFs
- #	Deri James	: Friday 16 Mar 2012
-@@ -23,6 +23,7 @@
- # along with this program.  If not, see <http://www.gnu.org/licenses/>.
- 
- use strict;
-+use warnings;
- use File::Temp qw/tempfile/;
- my @cmd;
- my $dev='pdf';
-diff --git a/src/utils/afmtodit/afmtodit.pl b/src/utils/afmtodit/afmtodit.pl
-index 954c58e..81a6c97 100644
---- a/src/utils/afmtodit/afmtodit.pl
-+++ b/src/utils/afmtodit/afmtodit.pl
-@@ -1,4 +1,4 @@
--#! /usr/bin/perl -w
-+#! /usr/bin/perl
- # -*- Perl -*-
- # Copyright (C) 1989-2018 Free Software Foundation, Inc.
- #      Written by James Clark (jjc@jclark.com)
-@@ -19,6 +19,7 @@
- # along with this program.  If not, see <http://www.gnu.org/licenses/>.
- 
- use strict;
-+use warnings;
- 
- @afmtodit.tables@
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/groff/files/0001-support-musl.patch b/meta/recipes-extended/groff/files/0001-support-musl.patch
deleted file mode 100644
index a837b11b1b2..00000000000
--- a/meta/recipes-extended/groff/files/0001-support-musl.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 695965c27be74acb5968f19d51af86065c4b71a9 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 13 May 2019 09:48:14 +0800
-Subject: [PATCH] support musl
-
-...
-|./lib/math.h:2877:1: error: 'int signbit(float)' conflicts with a previous declaration
-| _GL_MATH_CXX_REAL_FLOATING_DECL_2 (signbit)
-| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-|In file included from recipe-sysroot/usr/include/c++/8.3.0/math.h:36,
-|                 from ./lib/math.h:27,
-|                 from ./src/include/driver.h:27,
-|                 from src/devices/grodvi/dvi.cpp:20:
-|recipe-sysroot/usr/include/c++/8.3.0/cmath:661:3: note: previous declaration 'constexpr bool std::signbit(float)'
-|   signbit(float __x)
-|   ^~~~~~~
-...
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=453ff940449bbbde9ec00f0bbf82a359c5598fc7]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gnulib_m4/signbit.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gnulib_m4/signbit.m4 b/gnulib_m4/signbit.m4
-index 9e7884d..8b9c70c 100644
---- a/gnulib_m4/signbit.m4
-+++ b/gnulib_m4/signbit.m4
-@@ -31,6 +31,8 @@ AC_DEFUN([gl_SIGNBIT],
-         [case "$host_os" in
-                           # Guess yes on glibc systems.
-            *-gnu* | gnu*) gl_cv_func_signbit="guessing yes" ;;
-+                          # Guess yes on musl systems.
-+           *-musl*)       gl_cv_func_signbit="guessing yes" ;;
-                           # Guess yes on native Windows.
-            mingw*)        gl_cv_func_signbit="guessing yes" ;;
-                           # If we don't know, assume the worst.
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
index c80a2a5c38e..23992576f9e 100644
--- a/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
+++ b/meta/recipes-extended/groff/files/groff-not-search-fonts-on-build-host.patch
@@ -1,7 +1,7 @@
-From 75761ae7adc88412de4379d1cf5484b055cd5f18 Mon Sep 17 00:00:00 2001
+From eb16276c3e2e34aa2e57f6a0e68554657b90cd28 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 11 May 2019 17:06:29 +0800
-Subject: [PATCH 2/2] groff searchs fonts which are provided by ghostscript on
+Subject: [PATCH] groff searchs fonts which are provided by ghostscript on
  build host. It causes non-determinism issue. So not search font dirs on host.
 
 Upstream-Status: Inappropriate [cross build specific]
@@ -10,23 +10,30 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Rebase to 1.22.4
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- font/devpdf/Foundry.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ font/devpdf/Foundry.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/font/devpdf/Foundry.in b/font/devpdf/Foundry.in
-index 93e9b66..235b23b 100644
+index e5aba65..5441734 100644
 --- a/font/devpdf/Foundry.in
 +++ b/font/devpdf/Foundry.in
-@@ -65,7 +65,7 @@ ZD|Y||||Dingbats!d050000l.pfb
- #======================================================================
+@@ -20,7 +20,7 @@
  
- #Foundry|Name|Searchpath
--foundry|U|(gs):@urwfontsdir@ :/usr/share/fonts/type1/gsfonts :/opt/local/share/fonts/urw-fonts # the URW fonts delivered with ghostscript (may be different)
-+foundry|U|(gs) # the URW fonts delivered with ghostscript (may be different)
- #Define Flags for afmtodit
+ #=======================================================================
+ #Foundry|Name|Search path
+-foundry||@urwfontsdir@:(gs):/usr/share/fonts/type1/gsfonts:/usr/share/fonts/default/Type1:/usr/share/fonts/default/Type1/adobestd35:/usr/share/fonts/type1/urw-base35:/opt/local/share/fonts/urw-fonts:/usr/local/share/fonts/ghostscript
++foundry||(gs)
+ 
+ # Enable the font description files for grops (generated from Adobe
+ # foundry font files) to be used with gropdf.  afmtodit must not be
+@@ -72,7 +72,7 @@ EURO|N||||*../devps/freeeuro.pfa
+ # URW fonts are typically shipped with Ghostscript, but can be replaced.
+ 
+ #Foundry|Name|Search path
+-foundry|U|@urwfontsdir@:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/default/Type1:/usr/share/fonts/default/Type1/adobestd35:/usr/share/fonts/type1/urw-base35:/opt/local/share/fonts/urw-fonts:/usr/local/share/fonts/ghostscript:(gs)
++foundry|U|(gs)
+ 
+ # Define flags for afmtodit.
  
- r=-i 0 -m
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
similarity index 76%
rename from meta/recipes-extended/groff/groff_1.22.4.bb
rename to meta/recipes-extended/groff/groff_1.23.0.bb
index 244c0e1625b..1dcd0bb605c 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -8,29 +8,21 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
-	file://0001-replace-perl-w-with-use-warnings.patch \
-	file://groff-not-search-fonts-on-build-host.patch \
-	file://0001-support-musl.patch \
-	file://0001-Include-config.h.patch \
-	file://0001-Make-manpages-mulitlib-identical.patch \
-	file://0001-Fix-code-style-issues.patch \
-"
+           file://groff-not-search-fonts-on-build-host.patch \
+           file://0001-Make-manpages-mulitlib-identical.patch \
+           "
 
-SRC_URI[md5sum] = "08fb04335e2f5e73f23ea4c3adbf0c5f"
-SRC_URI[sha256sum] = "e78e7b4cb7dec310849004fa88847c44701e8d133b5d4c13057d876c1bad0293"
+SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
 
-# Remove at the next upgrade
-PR = "r1"
-
-DEPENDS = "bison-native"
+DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"
 
 inherit autotools-brokensep texinfo multilib_script pkgconfig
 
-MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bindir}/grog"
+MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
 
-EXTRA_OECONF = "--without-x --without-doc"
-PARALLEL_MAKE = ""
+EXTRA_OECONF = "--without-x --with-urw-fonts-dir=/completely/bogus/dir/"
+EXTRA_OEMAKE:class-target = "GROFFBIN=groff GROFF_BIN_PATH=${STAGING_BINDIR_NATIVE}"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl' ac_cv_path_BASH_PROG='no' PAGE=A4"
 
@@ -67,6 +59,9 @@ do_install:append() {
 	# not ship /usr/bin/grap2graph and its releated man files
 	rm -rf ${D}${bindir}/grap2graph
 	rm -rf ${D}${mandir}/man1/grap2graph*
+
+        # strip hosttool path out of generated files
+        sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/*.roff
 }
 
 do_install:append:class-native() {
-- 
2.30.2


