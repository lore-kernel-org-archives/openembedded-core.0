Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0370978961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:56:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 06:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="209489532"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 19 Mar 2018 06:56:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 36511580100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:56:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 15:59:55 +0200
Message-Id: <1521467995-3521-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libsolv: refresh the patches
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
X-List-Received-Date: Mon, 19 Mar 2018 13:56:22 -0000

fixes:

WARNING: libsolv-0.6.33-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

devtool modify <recipe>
devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch
0001-Add-fallback-fopencookie-implementation.patch
patching file ext/CMakeLists.txt
patching file ext/solv_xfopen.c
Hunk #1 succeeded at 12 with fuzz 1 (offset -1 lines).
Hunk #2 succeeded at 25 (offset -18 lines).
Hunk #3 succeeded at 34 (offset -18 lines).
Hunk #4 succeeded at 46 (offset -18 lines).
patching file ext/solv_xfopen_fallback_fopencookie.c
patching file ext/solv_xfopen_fallback_fopencookie.h

Now at patch 0001-Add-fallback-fopencookie-implementation.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...0001-Add-fallback-fopencookie-implementation.patch | 19 ++++++++++---------
 ...Fixes-to-internal-fopencookie-implementation.patch |  5 +++--
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
index a575d0e..e5cb60d 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
@@ -1,4 +1,4 @@
-From 4d9b6ec30b78d00ead0a22eb5d047dcdba37e99c Mon Sep 17 00:00:00 2001
+From 47c6f1b4332a9e4935c48cca826786a6b8fe6f59 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
  =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
  <ngompa13@gmail.com>
@@ -13,6 +13,7 @@ Alex Kanavin: rebased CMakeLists.txt change to apply to latest upstream code.
 
 Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  ext/CMakeLists.txt                     |   7 ++
  ext/solv_xfopen.c                      |  10 +--
@@ -23,7 +24,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
 
 diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index 586eda8..477a2ef 100644
+index b8917a2..fac6c32 100644
 --- a/ext/CMakeLists.txt
 +++ b/ext/CMakeLists.txt
 @@ -4,6 +4,13 @@ SET (libsolvext_SRCS
@@ -41,11 +42,11 @@ index 586eda8..477a2ef 100644
      SET (libsolvext_SRCS ${libsolvext_SRCS}
          pool_fileconflicts.c repo_rpmdb.c)
 diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
-index b0421bf..31345dd 100644
+index 2c64bb6..eb3a3ad 100644
 --- a/ext/solv_xfopen.c
 +++ b/ext/solv_xfopen.c
-@@ -13,6 +13,10 @@
- #include <zlib.h>
+@@ -12,6 +12,10 @@
+ #include <string.h>
  #include <fcntl.h>
  
 +#if !defined(HAVE_FUNOPEN) && !defined(HAVE_FOPENCOOKIE)
@@ -55,7 +56,7 @@ index b0421bf..31345dd 100644
  #include "solv_xfopen.h"
  #include "util.h"
  
-@@ -39,7 +43,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -21,7 +25,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
  	ssize_t (*cwrite)(void *, const char *, size_t),
  	int (*cclose)(void *))
  {
@@ -64,7 +65,7 @@ index b0421bf..31345dd 100644
    if (!cookie)
      return 0;
    return funopen(cookie,
-@@ -48,7 +52,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -30,7 +34,7 @@ static FILE *cookieopen(void *cookie, const char *mode,
        (fpos_t (*)(void *, fpos_t, int))NULL,					/* seekfn */
        cclose
        );
@@ -73,7 +74,7 @@ index b0421bf..31345dd 100644
    cookie_io_functions_t cio;
  
    if (!cookie)
-@@ -60,8 +64,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
+@@ -42,8 +46,6 @@ static FILE *cookieopen(void *cookie, const char *mode,
      cio.write = cwrite;
    cio.close = cclose;
    return  fopencookie(cookie, *mode == 'w' ? "w" : "r", cio);
@@ -246,5 +247,5 @@ index 0000000..6a7bfee
 +
 +#endif
 -- 
-2.11.0
+2.4.0
 
diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
index efb4e3a..93b8cc9 100644
--- a/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0002-Fixes-to-internal-fopencookie-implementation.patch
@@ -1,4 +1,4 @@
-From 99b10cdf6a0f8a24e1670c1813b1d9563ae3f5b5 Mon Sep 17 00:00:00 2001
+From 84e12bf7ece49073c559dfd58005132a6099a964 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
  =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
  <ngompa13@gmail.com>
@@ -11,6 +11,7 @@ the tests all pass.
 
 Upstream-Status: Denied [https://github.com/openSUSE/libsolv/pull/112]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
  ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
@@ -100,5 +101,5 @@ index 6a7bfee..7223e3f 100644
  
  #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
 -- 
-2.11.0
+2.4.0
 
-- 
2.4.0


