Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDA8796B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 16:44:58 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id l9-v6so7813111pff.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5o4dxp4yQhPcJ2GQOpr5K3RdkM1x5srtRSUvKb3/VS4=;
	b=D+iEk4iQt652nKjGLdKLTGe7TuW+Xt/fmkp7kzrMrdc3FoPF13hQL4oCAAvLBugmGW
	Ljb5J8aCQKWTtDkWsXVGULb0sQPVoMstWl04EL4630fdG+/Kp0kxsYFVSp6WrQGWJGdz
	EREvYf/FAJOrTQciM1BZIj76SUItIgg0xsFH49X5sB5aUHFIKyuL65rEfRWQH5RubFK6
	5nUwhpdnGYKzulmmrurdigwNw5E+Phsm14JttIwJmppKEukQjlwatNMtZOQGkUWnh+It
	dSyuaHdYpLtepHzeACBJcZY9+aIs7CcTOoa2rOQwzCKZj8jqoX1H/3yk5rAFT2pNrh5D
	sV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5o4dxp4yQhPcJ2GQOpr5K3RdkM1x5srtRSUvKb3/VS4=;
	b=KRjiQUZId67rFH5IMctwikavI/RS2ABSPGJT/3juHnJjCwD8RAhcOCG1j+PUUvqZI1
	NiTAZ1F8znZujyXNXIwdqJ8YSTDAqXVC+gFG2KtlhvDmYB8LYa8jbP7TULrFsgQsmBSs
	b8o4pPW9LOolDC+zIPZN9XBL9DDQJxcFnObr5VKQVlpct9ZZZKqCEX1ZPTyklRmw3/cO
	NmJcMABud517YVbMoRRTdH78rhht0SPP2pcX1dAKeuqC0SQH0ZqM4ZM5cn64DWm6vbyl
	lbO3PlShtkiHwPqeax6wXFu4KuzfjEwj2T8rTL6uldlfVMyPBiCO8QyPNhuGmZG5qraN
	+H0w==
X-Gm-Message-State: APzg51DMmM+MI1+BdDfsRSKZ6l3sAaT+K4KVID5b6qLOBNEF/yJ7dX9C
	6RX6RvE0sa0pJqIGodTJxbIxyy1G1UU=
X-Google-Smtp-Source: ANB0VdZp0pVLNGSj0lMStGTNMfDwRs1cj4JLJY+5H6opLA/H90cjJJNVqPq3N/v7KbMbz/qm2b8+Tw==
X-Received: by 2002:a63:c20:: with SMTP id
	b32-v6mr24152900pgl.400.1537202698620; 
	Mon, 17 Sep 2018 09:44:58 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.165.85])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm18140834pga.40.2018.09.17.09.44.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Sep 2018 09:44:57 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 22:14:50 +0530
Message-Id: <1537202690-5887-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ghostscript: upgrade to 9.25
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
X-List-Received-Date: Mon, 17 Sep 2018 16:44:58 -0000

Removed below patches, as v9.25 source already has those
changes/security fixes:

0001-Bug-699665-memory-corruption-in-aesdecode.patch
0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
0004-Hide-the-.shfill-operator.patch
0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
remove-direct-symlink.patch

Re-worked ghostscript-9.21-native-fix-disable-system-libtiff.patch
and ghostscript-9.21-prevent_recompiling.patch
to fix warnings in do_patch task of ghostscript v9.25 recipe.

Highlights of ghostscript v9.25 release:
---------------------------------------
- This release fixes problems with argument handling, some unintended results
  of the security fixes to the SAFER file access restrictions
  (specifically accessing ICC profile files), and some additional security
  issues over the recent 9.24 release.

- Note: The ps2epsi utility does not, and cannot call Ghostscript with
  the -dSAFER command line option. It should never be called with input
  from untrusted sources.

- Security issues have been the primary focus of this release, including
  solving several (well publicised) real and potential exploits.

- As well as Ghostscript itself, jbig2dec has had a significant amount of work
  improving its robustness in the face of out specification files.

- IMPORTANT: We are in the process of forking LittleCMS. LCMS2 is not thread
  safe, and cannot be made thread safe without breaking the ABI.
  Our fork will be thread safe, and include performance enhancements
  (these changes have all be been offered and rejected upstream). We will
  maintain compatibility between Ghostscript and LCMS2 for a time, but not in
  perpetuity. Our fork will be available as its own package separately from
  Ghostscript (and MuPDF).

- The usual round of bug fixes, compatibility changes, and incremental
  improvements.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...Bug-699665-memory-corruption-in-aesdecode.patch | 56 -------------
 ...ard-against-trying-to-output-an-infinite-.patch | 49 ------------
 ...Handle-LockDistillerParams-not-being-a-bo.patch | 53 -------------
 ...660-shading_param-incomplete-type-checkin.patch | 91 ----------------------
 .../0004-Hide-the-.shfill-operator.patch           | 35 ---------
 ...properly-apply-file-permissions-to-.tempf.patch | 54 -------------
 ...pt-9.21-native-fix-disable-system-libtiff.patch |  9 ++-
 .../ghostscript-9.21-prevent_recompiling.patch     |  9 ++-
 .../ghostscript/remove-direct-symlink.patch        | 40 ----------
 .../{ghostscript_9.23.bb => ghostscript_9.25.bb}   | 13 +---
 10 files changed, 13 insertions(+), 396 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/remove-direct-symlink.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.23.bb => ghostscript_9.25.bb} (85%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
deleted file mode 100644
index df654f721d..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b9fa1157e1f4982d42241146c9b7c6c789d6f076 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Thu, 23 Aug 2018 15:42:02 +0100
-Subject: [PATCH 1/5] Bug 699665 "memory corruption in aesdecode"
-
-The specimen file calls aesdecode without specifying the key to be
-used, though it does manage to do enough work with the PDF interpreter
-routines to get access to aesdecode (which isn't normally available).
-
-This causes us to read uninitialised memory, which can (and often does)
-lead to a segmentation fault.
-
-In this commit we set the key to NULL explicitly during intialisation
-and then check it before we read it. If its NULL we just return.
-
-It seems bizarre that we don't return error codes, we should probably
-look into that at some point, but this prevents the code trying to
-read uninitialised memory.
-
-CVE: CVE-2018-15911
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/aes.c  | 3 +++
- base/saes.c | 1 +
- 2 files changed, 4 insertions(+)
-
-diff --git a/base/aes.c b/base/aes.c
-index a6bce93..e86f000 100644
---- a/base/aes.c
-+++ b/base/aes.c
-@@ -662,6 +662,9 @@ void aes_crypt_ecb( aes_context *ctx,
-     }
- #endif
- 
-+    if (ctx == NULL || ctx->rk == NULL)
-+        return;
-+
-     RK = ctx->rk;
- 
-     GET_ULONG_LE( X0, input,  0 ); X0 ^= *RK++;
-diff --git a/base/saes.c b/base/saes.c
-index 6db0e8b..307ed74 100644
---- a/base/saes.c
-+++ b/base/saes.c
-@@ -120,6 +120,7 @@ s_aes_process(stream_state * ss, stream_cursor_read * pr,
-         gs_throw(gs_error_VMerror, "could not allocate aes context");
-         return ERRC;
-       }
-+      memset(state->ctx, 0x00, sizeof(aes_context));
-       if (state->keylength < 1 || state->keylength > SAES_MAX_KEYLENGTH) {
-         gs_throw1(gs_error_rangecheck, "invalid aes key length (%d bytes)",
-                 state->keylength);
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
deleted file mode 100644
index bac7365f3c..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 39b1e54b2968620723bf32e96764c88797714879 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Wed, 18 Apr 2018 15:46:32 +0100
-Subject: [PATCH] pdfwrite - Guard against trying to output an infinite number
-
-Bug #699255 " Buffer overflow on pprintg1 due to mishandle postscript file data to pdf"
-
-The file uses an enormous parameter to xyxhow, causing an overflow in
-the calculation of text positioning (value > 1e39).
-
-Since this is basically a nonsense value, and PostScript only supports
-real values up to 1e38, this patch follows the same approach as for
-a degenerate CTM, and treats it as 0.
-
-Adobe Acrobat Distiller throws a limitcheck error, so we could do that
-instead if this approach proves to be a problem.
-
-Upstream-Status: Backport
-git://git.ghostscript.com/ghostpdl.git
-CVE: CVE-2018-10194
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- devices/vector/gdevpdts.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/devices/vector/gdevpdts.c b/devices/vector/gdevpdts.c
-index 848ad78..172fe6b 100644
---- a/devices/vector/gdevpdts.c
-+++ b/devices/vector/gdevpdts.c
-@@ -103,9 +103,14 @@ append_text_move(pdf_text_state_t *pts, double dw)
- static int
- set_text_distance(gs_point *pdist, double dx, double dy, const gs_matrix *pmat)
- {
--    int code = gs_distance_transform_inverse(dx, dy, pmat, pdist);
-+    int code;
-     double rounded;
- 
-+    if (dx > 1e38 || dy > 1e38)
-+        code = gs_error_undefinedresult;
-+    else
-+        code = gs_distance_transform_inverse(dx, dy, pmat, pdist);
-+
-     if (code == gs_error_undefinedresult) {
-         /* The CTM is degenerate.
-            Can't know the distance in user space.
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch b/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
deleted file mode 100644
index a16f215bd3..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 1b516be5f6829ab6ce37835529ba08abd6d18663 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 21 Aug 2018 16:42:45 +0100
-Subject: [PATCH 2/5] Bug 699656: Handle LockDistillerParams not being a
- boolean
-
-This caused a function call commented as "Can't fail" to fail, and resulted
-in memory correuption and a segfault.
-
-CVE: CVE-2018-15910
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- devices/vector/gdevpdfp.c | 2 +-
- psi/iparam.c              | 7 ++++---
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/devices/vector/gdevpdfp.c b/devices/vector/gdevpdfp.c
-index 522db7a..f2816b9 100644
---- a/devices/vector/gdevpdfp.c
-+++ b/devices/vector/gdevpdfp.c
-@@ -364,7 +364,7 @@ gdev_pdf_put_params_impl(gx_device * dev, const gx_device_pdf * save_dev, gs_par
-      * LockDistillerParams is read again, and reset if necessary, in
-      * psdf_put_params.
-      */
--    ecode = param_read_bool(plist, "LockDistillerParams", &locked);
-+    ecode = param_read_bool(plist, (param_name = "LockDistillerParams"), &locked);
-     if (ecode < 0)
-         param_signal_error(plist, param_name, ecode);
- 
-diff --git a/psi/iparam.c b/psi/iparam.c
-index 68c20d4..0279455 100644
---- a/psi/iparam.c
-+++ b/psi/iparam.c
-@@ -822,10 +822,11 @@ static int
- ref_param_read_signal_error(gs_param_list * plist, gs_param_name pkey, int code)
- {
-     iparam_list *const iplist = (iparam_list *) plist;
--    iparam_loc loc;
-+    iparam_loc loc = {0};
- 
--    ref_param_read(iplist, pkey, &loc, -1);	/* can't fail */
--    *loc.presult = code;
-+    ref_param_read(iplist, pkey, &loc, -1);
-+    if (loc.presult)
-+        *loc.presult = code;
-     switch (ref_param_read_get_policy(plist, pkey)) {
-         case gs_param_policy_ignore:
-             return 0;
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch b/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
deleted file mode 100644
index 174f79e42a..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 759238fd904aab1706dc1007826a13a670cda320 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Thu, 23 Aug 2018 14:12:48 +0100
-Subject: [PATCH 3/5] Fix Bug 699660 "shading_param incomplete type checking"
-
-Its possible to pass a t_struct parameter to .shfill which is not a
-shading function built by .buildshading. This could then lead to memory
-corruption or a segmentation fault by treating the object passed in
-as if it were a shading.
-
-Its non-trivial to check the t_struct, because this function can take
-7 different kinds of structures as a parameter. Checking these is
-possible, of course, but would add a performance penalty.
-
-However, we can note that we never call .shfill without first calling
-.buildshading, and we never call .buildshading without immediately
-calling .shfill. So we can treat these as an atomic operation. The
-.buildshading function takes all its parameters as PostScript objects
-and validates them, so that should be safe.
-
-This allows us to 'hide' the .shfill operator preventing the possibility
-of passing an invalid parameter.
-
-CVE: CVE-2018-15909
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Resource/Init/gs_init.ps  | 4 ++--
- Resource/Init/gs_ll3.ps   | 7 ++++++-
- Resource/Init/pdf_draw.ps | 3 +--
- 3 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
-index 6c8da53..1956ed5 100644
---- a/Resource/Init/gs_init.ps
-+++ b/Resource/Init/gs_init.ps
-@@ -2181,8 +2181,8 @@ SAFER { .setsafeglobal } if
- /.getiodevice /.getdevparms /.putdevparams /.bbox_transform /.matchmedia /.matchpagesize /.defaultpapersize
- /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
- /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.saslprep
--/.buildshading1 /.buildshadin2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
--/.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
-+/.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
-+%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
- /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.systemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.systemvmfile /.systemvmlibfile
- /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserparams /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
- /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath
-diff --git a/Resource/Init/gs_ll3.ps b/Resource/Init/gs_ll3.ps
-index 5aa56a3..1d37e53 100644
---- a/Resource/Init/gs_ll3.ps
-+++ b/Resource/Init/gs_ll3.ps
-@@ -440,6 +440,11 @@ systemdict /.reuseparamdict mark
-     /shfill .systemvar /undefined signalerror
-   } ifelse
- } bind def
-+
-+/.buildshading_and_shfill {
-+  .buildshading .shfill
-+} bind def
-+
- systemdict /.reuseparamdict undef
- 
- /.buildpattern2 {	% <template> <matrix> .buildpattern2
-@@ -464,7 +469,7 @@ systemdict /.reuseparamdict undef
-         % Currently, .shfill requires that the color space
-         % in the pattern be the current color space.
-         % Disable overprintmode for shfill
--  { dup gsave 0 .setoverprintmode .buildshading .shfill } stopped
-+  { dup gsave 0 .setoverprintmode .buildshading_and_shfill } stopped
-   grestore {
-     /$error .systemvar /errorinfo 2 copy known {
-       pop pop
-diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
-index e8ca213..a7144d3 100644
---- a/Resource/Init/pdf_draw.ps
-+++ b/Resource/Init/pdf_draw.ps
-@@ -1365,9 +1365,8 @@ drawopdict begin
-     { dup /.shading .knownget {
-         exch pop
-       } {
--       .buildshading
-+       .buildshading_and_shfill
-       } ifelse
--      .shfill
-     } stopped {
-       pop
-       (   **** Error: Ignoring invalid smooth shading object, output may be incorrect.\n)
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch b/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
deleted file mode 100644
index 7c6d002620..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ee9e8065e7d7b3adbc25fd655727ca72861ee032 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Fri, 24 Aug 2018 12:44:26 +0100
-Subject: [PATCH 4/5] Hide the .shfill operator
-
-Commit 0b6cd1918e1ec4ffd087400a754a845180a4522b was supposed to make
-the .shfill operator unobtainable, but I accidentally left a comment
-in the line doing so.
-
-Fix it here, without this the operator can still be exploited.
-
-CVE: CVE-2018-15909
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Resource/Init/gs_init.ps | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
-index 1956ed5..955b843 100644
---- a/Resource/Init/gs_init.ps
-+++ b/Resource/Init/gs_init.ps
-@@ -2182,7 +2182,7 @@ SAFER { .setsafeglobal } if
- /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
- /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.saslprep
- /.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
--%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
-+/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
- /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.systemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.systemvmfile /.systemvmlibfile
- /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserparams /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
- /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch b/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
deleted file mode 100644
index ccd40216c0..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f4f50ceea8e8852b8c3ac73f5807d8b54b735c3e Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 21 Aug 2018 20:17:05 +0100
-Subject: [PATCH 5/5] Bug 699657: properly apply file permissions to .tempfile
-
-CVE: CVE-2018-15908
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- psi/zfile.c | 20 ++++++++++++++++++--
- 1 file changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/psi/zfile.c b/psi/zfile.c
-index a0acd5a..19996b0 100644
---- a/psi/zfile.c
-+++ b/psi/zfile.c
-@@ -134,7 +134,7 @@ check_file_permissions_reduced(i_ctx_t *i_ctx_p, const char *fname, int len,
-     /* we're protecting arbitrary file system accesses, not Postscript device accesses.
-      * Although, note that %pipe% is explicitly checked for and disallowed elsewhere
-      */
--    if (iodev != iodev_default(imemory)) {
-+    if (iodev && iodev != iodev_default(imemory)) {
-         return 0;
-     }
- 
-@@ -734,7 +734,23 @@ ztempfile(i_ctx_t *i_ctx_p)
-     }
- 
-     if (gp_file_name_is_absolute(pstr, strlen(pstr))) {
--        if (check_file_permissions(i_ctx_p, pstr, strlen(pstr),
-+        int plen = strlen(pstr);
-+        const char *sep = gp_file_name_separator();
-+#ifdef DEBUG
-+        int seplen = strlen(sep);
-+        if (seplen != 1)
-+            return_error(gs_error_Fatal);
-+#endif
-+        /* strip off the file name prefix, leave just the directory name
-+         * so we can check if we are allowed to write to it
-+         */
-+        for ( ; plen >=0; plen--) {
-+            if (pstr[plen] == sep[0])
-+                break;
-+        }
-+        memcpy(fname, pstr, plen);
-+        fname[plen] = '\0';
-+        if (check_file_permissions(i_ctx_p, fname, strlen(fname),
-                                    NULL, "PermitFileWriting") < 0) {
-             code = gs_note_error(gs_error_invalidfileaccess);
-             goto done;
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
index 9f2df0cc8f..a382c7f891 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
@@ -11,9 +11,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-Rebase to ghostscript 9.23.
+Rebase to ghostscript 9.25.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 ---
  configure.ac | 5 +++++
  1 file changed, 5 insertions(+)
@@ -22,15 +23,15 @@ diff --git a/configure.ac b/configure.ac
 index 80a60b1..f3e9efb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1284,6 +1284,7 @@ case "x$with_system_libtiff" in
- esac
+@@ -1319,6 +1319,7 @@ AC_TRY_COMPILE([], [return 0;],
+ CFLAGS=$CGLAGS_STORE
  
  if test x"$SHARE_LIBTIFF" = x"0" ; then
 +    if test -e $LIBTIFFDIR/configure; then
        echo "Running libtiff configure script..."
        olddir=`pwd`
        if ! test -d "$LIBTIFFCONFDIR" ; then
-@@ -1302,6 +1303,10 @@ if test x"$SHARE_LIBTIFF" = x"0" ; then
+@@ -1337,6 +1338,10 @@ if test x"$SHARE_LIBTIFF" = x"0" ; then
  
        echo
        echo "Continuing with Ghostscript configuration..."
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
index e39d23d467..c76915fb81 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
@@ -11,8 +11,9 @@ Upstream-Status: Pending
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
-Rebase to 9.23
+Rebase to 9.25
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 ---
  base/unix-aux.mak | 44 --------------------------------------------
  1 file changed, 44 deletions(-)
@@ -21,9 +22,9 @@ diff --git a/base/unix-aux.mak b/base/unix-aux.mak
 index 5bf72e9..9cb39d7 100644
 --- a/base/unix-aux.mak
 +++ b/base/unix-aux.mak
-@@ -64,50 +64,6 @@ $(GLOBJ)gp_sysv.$(OBJ): $(GLSRC)gp_sysv.c $(stdio__h) $(time__h) $(AK)\
-  $(UNIX_AUX_MAK) $(MAKEDIRS)
- 	$(GLCC) $(GLO_)gp_sysv.$(OBJ) $(C_) $(GLSRC)gp_sysv.c
+@@ -54,50 +54,6 @@ $(AUX)gp_stdia.$(OBJ): $(GLSRC)gp_stdia.
+   $(stdio__h) $(time__h) $(unistd__h) $(gx_h) $(gp_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
+ 	$(GLCCAUX) $(AUXO_)gp_stdia.$(OBJ) $(C_) $(GLSRC)gp_stdia.c
  
 -# -------------------------- Auxiliary programs --------------------------- #
 -
diff --git a/meta/recipes-extended/ghostscript/ghostscript/remove-direct-symlink.patch b/meta/recipes-extended/ghostscript/ghostscript/remove-direct-symlink.patch
deleted file mode 100644
index 410004e8f4..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/remove-direct-symlink.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2ce79942ca509663ddf8171f45d1d324bb71bad6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 29 Mar 2018 17:22:35 +0800
-Subject: [PATCH] remove direct symlink
-
-The upstream create a direct symlink to stay backward
-compatible, a symlink is automatically created to point
-from the old location (/usr/share/ghostscript/<version>/doc)
-to the new location.
-
-It caused do_populate_sysroot failure
-...
-|ERROR: ghostscript-9.23-r0 do_populate_sysroot: sstate found an absolute
-path symlink
-...
-
-Without the symlink is no harm for OE
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/unixinst.mak | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/base/unixinst.mak b/base/unixinst.mak
-index 7fec86c..0cf2361 100644
---- a/base/unixinst.mak
-+++ b/base/unixinst.mak
-@@ -165,7 +165,6 @@ install-doc: $(PSDOCDIR)/News.htm
- 	$(SH) -c 'for f in $(DOC_PAGES) ;\
- 	do if ( test -f $(PSDOCDIR)/$$f ); then $(INSTALL_DATA) $(PSDOCDIR)/$$f $(DESTDIR)$(docdir); fi;\
- 	done'
--	ln -s $(DESTDIR)$(docdir) $(DESTDIR)$(gsdatadir)/doc
- 
- # install the man pages for each locale
- MAN_LCDIRS=. de
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
similarity index 85%
rename from meta/recipes-extended/ghostscript/ghostscript_9.23.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.25.bb
index 898b6cd985..35eaaeb2fa 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
@@ -19,18 +19,12 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs923/${BPN}-${PV}.tar.gz \
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs925/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
-                file://remove-direct-symlink.patch \
-                file://0001-Bug-699665-memory-corruption-in-aesdecode.patch \
-                file://0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch \
-                file://0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch \
-                file://0004-Hide-the-.shfill-operator.patch \
-                file://0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
@@ -38,7 +32,6 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
-           file://0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
@@ -46,8 +39,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "5a47ab47cd22dec1eb5f51c06f1c9d9c"
-SRC_URI[sha256sum] = "f65964807a3c97a2c0810d4b9806585367e73129e57ae33378cea18e07a1ed9b"
+SRC_URI[md5sum] = "eebd0fadbfa8e800094422ce65e94d5d"
+SRC_URI[sha256sum] = "baafa64740b090bff50b220a6df3be95c46069b7e30f4b4effed28316e5b2389"
 
 # Put something like
 #
-- 
2.16.1


