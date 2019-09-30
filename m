Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4786C3B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:08 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id a24so6687033pgj.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u06OWMrwNRAC+TVl5Yv4gg+vklT+3S8NUMbhoLT90Y4=;
	b=B9+2MBXx8szDzZD+KgipZxuP5BE9H+OPRLztgq+E8T1qCVBw9WACdAZEs/XyR9nLrE
	HOJ3GDjRKxeX7/sCb9UeD2IueUrH6VTdVGh5Llc7OA8DvjjmXP79kjX56Uw8qylXK4OA
	wzWfdLwK1WTZLySIjQmSapxDW+galOeQMWBSF7trzP9AF6XbgCQM2CazlykIfrvlWuqa
	zyCS9/3RmpY08PGI0jeZAhjyS52IjxK/Pe2ZljzvwEuZwcr48Ay10kMuRI3OPxmZmw4+
	2M9atZokv3P40EVmxO7YGPa46fX2QSXeg51VBbCArUuaNcALcU3iGYlzfWvcdxMyvmlb
	Q2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u06OWMrwNRAC+TVl5Yv4gg+vklT+3S8NUMbhoLT90Y4=;
	b=Nb9XyM1sqmXxvePM9y8xOX3yfEIBVHz7A6kOFbQ44rwGzsU+2VHYAu1d5s9zULJ0hb
	90Sg+7NMa/k9gIXfVoeNOxwfI5ueoyHt8mFksxEjRpdIgzVa7562nsbqLu/2q5P+ods5
	mKnZvTKjdo5tqCVLNniDZdBJEMLupWvU00ZPmN4D5UPyTLmZBTBkcdtzwxFBJD4soIvx
	9l72nwwsTHfUnxtXGMIGGM/4osYZSl5ZUA0NxSQPzDWD/C22wmJR54PxPNt5jZ4mh56H
	MMgLS8anjrBQioKscDYACLNxi+kRcfoPsXNszNdP8TjdPrEWDeobKnsfshs8ZcHdr9DV
	h55A==
X-Gm-Message-State: APjAAAVqxI+d9F9U0GpHrINgf5PsEkImeCs6wM5NtS1/TfVMBNjfKzBD
	E7GFq0QgvaV4jnLoHV7i43QhCgiPyLM=
X-Google-Smtp-Source: APXvYqxbF00SND5CuHdKz+ijpXXPazCnXV43W5HplGGGD5p/SKwJYXW5kjj/xq9n4qB2DJ+NjtGZXw==
X-Received: by 2002:a63:9a11:: with SMTP id o17mr22063450pge.434.1569818888825;
	Sun, 29 Sep 2019 21:48:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:10 -0700
Message-Id: <4f608782e43accb23aa144339ed9169b1718c4f0.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 15/54] ghostscript: fix CVE-2019-3839
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:08 -0000

From: Naveen Saini <naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ghostscript/CVE-2019-3839-0008.patch           | 440 +++++++++++++++++++++
 .../ghostscript/ghostscript_9.26.bb                |   1 +
 2 files changed, 441 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0008.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0008.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0008.patch
new file mode 100644
index 0000000..4be1c84
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-3839-0008.patch
@@ -0,0 +1,440 @@
+From c253752ef731f49922e0a97490d1ef09ca697c91 Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Thu, 31 Jan 2019 11:31:30 -0800
+Subject: [PATCH] Hide pdfdict and GS_PDF_ProcSet (internal stuff for the PDF
+ interp).
+
+We now keep GS_PDF_ProcSet in pdfdict, and immediately bind pdfdict
+where needed so we can undef it after the last PDF interp file has
+run (pdf_sec.ps).
+
+CVE: CVE-2019-3839
+Upstream-Status: Backport [http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=4ec9ca74bed49f2a82acb4bf430eae0d8b3b75c9]
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ Resource/Init/pdf_base.ps | 11 ++++----
+ Resource/Init/pdf_draw.ps | 59 +++++++++++++++++++--------------------
+ Resource/Init/pdf_font.ps |  9 +++---
+ Resource/Init/pdf_main.ps | 25 +++++++++--------
+ Resource/Init/pdf_ops.ps  | 11 ++++----
+ Resource/Init/pdf_sec.ps  |  4 ++-
+ 6 files changed, 60 insertions(+), 59 deletions(-)
+
+diff --git a/Resource/Init/pdf_base.ps b/Resource/Init/pdf_base.ps
+index e35e0e373..13dd51f46 100644
+--- a/Resource/Init/pdf_base.ps
++++ b/Resource/Init/pdf_base.ps
+@@ -23,7 +23,6 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
+ 
+ % Define the name interpretation dictionary for reading values.
+@@ -133,11 +132,11 @@ currentdict /num-chars-dict .undef
+ 
+ /.pdfexectoken {		% <count> <opdict> <exectoken> .pdfexectoken ?
+   PDFDEBUG {
+-    pdfdict /PDFSTEPcount known not { pdfdict /PDFSTEPcount 1 .forceput } executeonly if
++    //pdfdict /PDFSTEPcount known not { //pdfdict /PDFSTEPcount 1 .forceput } executeonly if
+     PDFSTEP {
+-      pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
++      //pdfdict /PDFtokencount 2 copy .knownget { 1 add } { 1 } ifelse .forceput
+       PDFSTEPcount 1 gt {
+-        pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
++        //pdfdict /PDFSTEPcount PDFSTEPcount 1 sub .forceput
+       } executeonly
+       {
+         dup ==only
+@@ -145,10 +144,10 @@ currentdict /num-chars-dict .undef
+         ( ? ) print flush 1 //false .outputpage
+         (%stdin) (r) file 255 string readline {
+           token {
+-            exch pop pdfdict /PDFSTEPcount 3 -1 roll .forceput
++            exch pop //pdfdict /PDFSTEPcount 3 -1 roll .forceput
+           } executeonly
+           {
+-            pdfdict /PDFSTEPcount 1 .forceput
++            //pdfdict /PDFSTEPcount 1 .forceput
+           } executeonly ifelse % token
+         } {
+           pop /PDFSTEP //false def	 % EOF on stdin
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index 36c41a9a3..2e39c87d2 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -18,8 +18,7 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+-GS_PDF_ProcSet begin
++/GS_PDF_ProcSet load begin
+ pdfdict begin
+ 
+ % For simplicity, we use a single interpretation dictionary for all
+@@ -113,7 +112,7 @@ pdfdict begin
+ 
+ /resolvefunction {	% <fndict> resolvefunction <function>
+   .resolvefn
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Function: ) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Function: ) print dup === flush } if } if
+ } bind executeonly def
+ 
+ /resolvefnproc {	% <fndict> resolvefnproc <proc>
+@@ -1086,7 +1085,7 @@ currentdict end readonly def
+ %% finished running the PaintProc.
+ 
+ /.actual_pdfpaintproc {         % <patdict> <resdict> .pdfpaintproc -
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Begin PaintProc) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Begin PaintProc) print dup === flush } if } if
+   PDFfile fileposition 3 1 roll
+   q
+   1 index /PaintType oget 1 eq {
+@@ -1121,21 +1120,21 @@ currentdict end readonly def
+       Q
+     }{
+       (\n   **** Error: File has unbalanced q/Q operators \(too many Q's\)\n               Output may be incorrect.\n)
+-      pdfdict /.Qqwarning_issued .knownget
++      //pdfdict /.Qqwarning_issued .knownget
+       {
+         {
+           pop
+         }
+         {
+-          currentglobal pdfdict gcheck .setglobal
+-          pdfdict /.Qqwarning_issued //true .forceput
++          currentglobal //pdfdict gcheck .setglobal
++          //pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+@@ -1144,21 +1143,21 @@ currentdict end readonly def
+   } loop
+   {
+     (\n   **** Error: File has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+-    pdfdict /.Qqwarning_issued .knownget
++    //pdfdict /.Qqwarning_issued .knownget
+     {
+       {
+         pop
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+     }
+     {
+-      currentglobal pdfdict gcheck .setglobal
+-      pdfdict /.Qqwarning_issued //true .forceput
++      currentglobal //pdfdict gcheck .setglobal
++      //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+@@ -1169,7 +1168,7 @@ currentdict end readonly def
+   /pdfemptycount exch def
+ 
+   Q
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%End PaintProc) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%End PaintProc) print dup === flush } if } if
+   PDFfile exch setfileposition
+ } bind executeonly odef
+ 
+@@ -1240,7 +1239,7 @@ currentdict end readonly def
+   ] cvx put
+   dup /BBox 2 copy knownoget { normrect FixPatternBBox put } { pop pop } ifelse
+   dup /.pattern_uses_transparency  1 index patternusestransparency put
+-  PDFDEBUG { pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Pattern: ) print dup === flush } if } if
++  PDFDEBUG { //pdfdict /PDFSTEPcount .knownget { 1 le } { //true } ifelse { (%Pattern: ) print dup === flush } if } if
+ } bind executeonly def
+ 
+ /ignore_color_op  (   **** Error: Ignoring a color operation in a cached context.\n               Output may be incorrect.\n) readonly def
+@@ -2361,16 +2360,16 @@ currentdict /last-ditch-bpc-csp undef
+ } bind executeonly def
+ 
+ /IncrementAppearanceNumber {
+-  pdfdict /AppearanceNumber .knownget {
+-    1 add pdfdict /AppearanceNumber 3 -1 roll .forceput
++  //pdfdict /AppearanceNumber .knownget {
++    1 add //pdfdict /AppearanceNumber 3 -1 roll .forceput
+   } executeonly
+   {
+-    pdfdict /AppearanceNumber 0 .forceput
++    //pdfdict /AppearanceNumber 0 .forceput
+   } executeonly ifelse
+ }bind executeonly odef
+ 
+ /MakeAppearanceName {
+-  pdfdict /AppearanceNumber get
++  //pdfdict /AppearanceNumber get
+   10 string cvs
+   dup length 10 add string dup 0 (\{FormName) putinterval
+   dup 3 -1 roll
+@@ -2391,17 +2390,17 @@ currentdict /last-ditch-bpc-csp undef
+   gsave initclip
+   MakeNewAppearanceName
+   .pdfFormName
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get} {//false}ifelse exch
+-  pdfdict /.PreservePDFForm true .forceput
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get} {//false}ifelse exch
++  //pdfdict /.PreservePDFForm true .forceput
+   DoForm
+-  pdfdict /.PreservePDFForm 3 -1 roll .forceput
++  //pdfdict /.PreservePDFForm 3 -1 roll .forceput
+   grestore
+ } bind executeonly odef
+ 
+ /DoForm {
+   %% save the current value, if its true we will set it to false later, in order
+   %% to prevent us preserving Forms which are used *from* an annotation /Appearance.
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get} {//false}ifelse exch
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get} {//false}ifelse exch
+ 
+   %% We may alter the Default* colour spaces, if the Resources
+   %% ColorSpace entry contains one of them. But we don't want that
+@@ -2516,13 +2515,13 @@ currentdict /last-ditch-bpc-csp undef
+   pdfemptycount countdictstack 3 -1 roll
+   /pdfemptycount count 4 sub store
+ 
+-  pdfdict /.PreservePDFForm known {pdfdict /.PreservePDFForm get}{//false} ifelse
++  //pdfdict /.PreservePDFForm known {//pdfdict /.PreservePDFForm get}{//false} ifelse
+   {
+     %% We must *not* preserve any subsidiary forms (curently at least) as PDF
+     %% form preservation doesn't really work. This is used just for Annotation
+     %% Appearances currently, and if they should happen to use a form, we do not
+     %% want to preserve it.
+-    pdfdict /.PreservePDFForm false .forceput
++    //pdfdict /.PreservePDFForm false .forceput
+     /q cvx /execform cvx 5 -2 roll
+   } executeonly
+   {
+@@ -2555,7 +2554,7 @@ currentdict /last-ditch-bpc-csp undef
+     saved_DCMYK /DefaultCMYK exch /ColorSpace defineresource pop
+     end
+   } if
+-  pdfdict /.PreservePDFForm 3 -1 roll .forceput
++  //pdfdict /.PreservePDFForm 3 -1 roll .forceput
+ } bind executeonly odef
+ 
+ /_dops_save 1 array def
+@@ -2714,13 +2713,13 @@ drawopdict begin
+     % Start by getting the object number for a Form XObject
+     dup Page /XObject obj_get dup 0 eq not {
+       % Now get the recording dictionary and see if that object number has been seen
+-      pdfdict /Recursive_XObject_D get 1 index known {
++      //pdfdict /Recursive_XObject_D get 1 index known {
+         (   **** Error: Recursive XObject detected, ignoring ") print 1 index 256 string cvs print (", object number ) print 256 string cvs print (\n) print
+         (               Output may be incorrect.\n) pdfformaterror
+         //false
+       }{
+         % We haven't seen it yet, so record it.
+-        pdfdict /Recursive_XObject_D get 1 index null put
++        //pdfdict /Recursive_XObject_D get 1 index null put
+         3 1 roll
+         //true
+       }ifelse
+@@ -2758,7 +2757,7 @@ drawopdict begin
+         (               Output may be incorrect.\n) pdfformaterror
+       } ifelse
+       PDFfile exch setfileposition
+-      pdfdict /Recursive_XObject_D get exch undef
++      //pdfdict /Recursive_XObject_D get exch undef
+     }{
+       % Otherwise ignore it and tidy up the stacks
+       pop pop
+diff --git a/Resource/Init/pdf_font.ps b/Resource/Init/pdf_font.ps
+index 7e35c02ac..6b09be61f 100644
+--- a/Resource/Init/pdf_font.ps
++++ b/Resource/Init/pdf_font.ps
+@@ -37,8 +37,7 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+-GS_PDF_ProcSet begin
++/GS_PDF_ProcSet load begin	% from userdict at this point
+ pdfdict begin
+ 
+ % We cache the PostScript font in an additional element of the
+@@ -1227,11 +1226,11 @@ currentdict /eexec_pdf_param_dict .undef
+             .pdfruncontext
+             countdictstack BuildCharDictDepth sub
+             {
+-              pdfdict /.Qqwarning_issued .knownget {not}{//true} ifelse
++              //pdfdict /.Qqwarning_issued .knownget {not}{//true} ifelse
+               {
+                 (\n   **** Warning: Type 3 glyph has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+                 pdfformatwarning
+-                pdfdict /.Qqwarning_issued //true .forceput
++                //pdfdict /.Qqwarning_issued //true .forceput
+               } executeonly if
+               Q
+             } repeat
+@@ -2361,7 +2360,7 @@ currentdict /bndef undef
+   dup //null eq
+   {pop}
+   {
+-    pdfdict /InputPDFFileName .knownget {.CRCHashFilenameAndObject} if
++    //pdfdict /InputPDFFileName .knownget {.CRCHashFilenameAndObject} if
+     exch dup /.OrigUniqueIDXUID .knownget not
+     {
+       dup /XUID .knownget not
+diff --git a/Resource/Init/pdf_main.ps b/Resource/Init/pdf_main.ps
+index 0a8929a2a..c1de1b0ef 100644
+--- a/Resource/Init/pdf_main.ps
++++ b/Resource/Init/pdf_main.ps
+@@ -18,8 +18,9 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
++/GS_PDF_ProcSet dup load def	% keep in pdfdict to hide it
++userdict /GS_PDF_ProcSet undef
+ 
+ % Patch in an obsolete variable used by some third-party software.
+ /#? //false def
+@@ -304,8 +305,8 @@ currentdict /runpdfstring .undef
+    /Page //null def
+    /DSCPageCount 0 def
+    /PDFSave //null def
+-   GS_PDF_ProcSet begin
+-   pdfdict begin
++   //pdfdict /GS_PDF_ProcSet get begin
++   //pdfdict begin
+    pdfopen begin
+    /CumulativePageCount currentpagedevice /PageCount get def
+ } bind executeonly def
+@@ -624,7 +625,7 @@ currentdict /runpdfstring .undef
+   %% copied to a temporary file) and store it in pdfdict. We will use this for
+   %% hashing fonts to detect if fonts with the same name are from different files.
+   %%
+-  dup currentglobal exch true setglobal .getfilename exch setglobal /InputPDFFileName exch pdfdict 3 1 roll .forceput
++  dup currentglobal exch true setglobal .getfilename exch setglobal /InputPDFFileName exch //pdfdict 3 1 roll .forceput
+ 
+   //runpdfbegin exec
+   //pdf_collection_files exec
+@@ -1390,7 +1391,7 @@ currentdict /xref-char-dict undef
+ } bind executeonly def
+ 
+ /pdfopenfile {		% <file> pdfopenfile <dict>
+-   pdfdict readonly pop		% can't do it any earlier than this
++   //pdfdict readonly pop		% can't do it any earlier than this
+    32 dict begin
+    /LocalResources 0 dict def
+    /DefaultQstate //null def	% establish binding
+@@ -2717,21 +2718,21 @@ currentdict /PDF2PS_matrix_key undef
+     StreamRunAborted not {
+       (\n   **** Error: File has unbalanced q/Q operators \(too many q's\)\n               Output may be incorrect.\n)
+ 
+-      pdfdict /.Qqwarning_issued .knownget
++      //pdfdict /.Qqwarning_issued .knownget
+       {
+         {
+           pop
+         }
+         {
+-          currentglobal pdfdict gcheck .setglobal
+-          pdfdict /.Qqwarning_issued //true .forceput
++          currentglobal //pdfdict gcheck .setglobal
++          //pdfdict /.Qqwarning_issued //true .forceput
+           .setglobal
+           pdfformaterror
+         } executeonly ifelse
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+@@ -2743,8 +2744,8 @@ currentdict /PDF2PS_matrix_key undef
+   Repaired		% pass Repaired state around the restore
+   RepairedAnError
+   PDFSave restore
+-  currentglobal pdfdict gcheck .setglobal
+-  pdfdict /.Qqwarning_issued //false .forceput
++  currentglobal //pdfdict gcheck .setglobal
++  //pdfdict /.Qqwarning_issued //false .forceput
+   .setglobal
+   /RepairedAnError exch def
+   /Repaired exch def
+diff --git a/Resource/Init/pdf_ops.ps b/Resource/Init/pdf_ops.ps
+index 34e2fbd58..46de547f7 100644
+--- a/Resource/Init/pdf_ops.ps
++++ b/Resource/Init/pdf_ops.ps
+@@ -24,6 +24,7 @@
+ systemdict /pdfmark known not
+  { userdict /pdfmark { cleartomark } bind executeonly put } if
+ 
++systemdict /pdfdict where { pop } { /pdfdict 100 dict put } ifelse
+ userdict /GS_PDF_ProcSet 256 dict dup begin
+ 
+ % ---------------- Abbreviations ---------------- %
+@@ -174,21 +175,21 @@ currentdict /gput_always_allow .undef
+   {
+     (\n   **** Error: File has unbalanced q/Q operators \(too many Q's\)\n               Output may be incorrect.\n)
+ 
+-    pdfdict /.Qqwarning_issued .knownget
++    //pdfdict /.Qqwarning_issued .knownget
+     {
+       {
+         pop
+       }
+       {
+-        currentglobal pdfdict gcheck .setglobal
+-        pdfdict /.Qqwarning_issued //true .forceput
++        currentglobal //pdfdict gcheck .setglobal
++        //pdfdict /.Qqwarning_issued //true .forceput
+         .setglobal
+         pdfformaterror
+       } executeonly ifelse
+     }
+     {
+-      currentglobal pdfdict gcheck .setglobal
+-      pdfdict /.Qqwarning_issued //true .forceput
++      currentglobal //pdfdict gcheck .setglobal
++      //pdfdict /.Qqwarning_issued //true .forceput
+       .setglobal
+       pdfformaterror
+     } executeonly ifelse
+diff --git a/Resource/Init/pdf_sec.ps b/Resource/Init/pdf_sec.ps
+index d8cc94c86..163dd6877 100644
+--- a/Resource/Init/pdf_sec.ps
++++ b/Resource/Init/pdf_sec.ps
+@@ -39,7 +39,6 @@
+ 
+ /.setlanguagelevel where { pop 2 .setlanguagelevel } if
+ .currentglobal //true .setglobal
+-/pdfdict where { pop } { /pdfdict 100 dict def } ifelse
+ pdfdict begin
+ 
+ % Older ghostscript versions do not have .pdftoken, so we use 'token' instead.
+@@ -748,4 +747,7 @@ currentdict /PDFScanRules_null undef
+  } bind executeonly def
+ 
+ end			% pdfdict
++
++systemdict /pdfdict .forceundef		% hide pdfdict
++
+ .setglobal
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
index 2630084..03e4569 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.26.bb
@@ -45,6 +45,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2019-3835-0004.patch \
            file://CVE-2019-3838-0001.patch \
            file://CVE-2019-3838-0002.patch \
+           file://CVE-2019-3839-0008.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.7.4


