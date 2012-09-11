Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBP-0001jA-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:41 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:09 -0700
Received: by mail-we0-f175.google.com with SMTP id r6so507606wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=IPMiK0UfhjDgy4b+ka8rCqOiCFzyA4Uk8DIpyOy740M=;
	b=g65FmeJCwAxZ0L8jkRVhlDtL1Z9TC5KFWTsyhnWN4eJgh18tqZtKlF6wSjRodKRJN4
	gBmEulGAA5nsXggY/jpNITD0GjnW+blh1Z94P2NViHc2uhFv0MYNBMNWkC1s+g5Wjp69
	BAwtmcpo3eXtK8HscyZ4/o8ewGHrSJG4QZyrUphEIeEI1HOjJ/ddv4fNNbOIzBMvFFNj
	sWJCL6fIGu/35waR3csASmrhVGL9A70Eu+Hf+PHjyskUSN8ZOcOG2a7InrCpGS+yVIfv
	AFWK535H7/XrLtdcTsuiKtv6EKJvN8KWT1TI/aNKSOBNBKTzN/ZOG3+zr/lJfl5TBJtq
	bPYA==
Received: by 10.216.52.18 with SMTP id d18mr10596560wec.173.1347391148676;
	Tue, 11 Sep 2012 12:19:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:58 +0100
Message-Id: <1347391088-30390-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQknQq7uT9isfReAOktLuobLGdLolw4CN5+DzAO2T6WTvzmEZbqJsf7SbqOkh1JTEwaNm4yM
Subject: [RFC 08/18] libx11: merge patches into a single directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:31:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libx11-1.5.0/keysymdef_include.patch  |   23 -
 .../libx11-1.5.0/makekeys_crosscompile.patch       |   76 ---
 .../libx11-1.5.0/x11_disable_makekeys.patch        |   34 --
 .../xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff   |  541 --------------------
 .../libx11-diet-1.5.0/fix-disable-xlocale.diff     |   17 -
 .../libx11-diet-1.5.0/fix-utf8-wrong-define.patch  |   19 -
 .../libx11-diet-1.5.0/keysymdef_include.patch      |   23 -
 .../libx11-diet-1.5.0/x11_disable_makekeys.patch   |   34 --
 .../libx11-trim-1.5.0/keysymdef_include.patch      |   23 -
 .../libx11-trim-1.5.0/makekeys_crosscompile.patch  |   76 ---
 .../libx11-trim-1.5.0/x11_disable_makekeys.patch   |   34 --
 meta/recipes-graphics/xorg-lib/libx11.inc          |    4 +-
 .../xorg-lib/libx11/X18NCMSstubs.diff              |  541 ++++++++++++++++++++
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |   17 +
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |   19 +
 .../xorg-lib/libx11/keysymdef_include.patch        |   23 +
 .../xorg-lib/libx11/makekeys_crosscompile.patch    |   76 +++
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |   34 ++
 18 files changed, 713 insertions(+), 901 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch
deleted file mode 100644
index d1bdab9..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/keysymdef_include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch
deleted file mode 100644
index daf3696..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/makekeys_crosscompile.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Because the size of "unsigned long" is different between 32-bit
-and 64-bit, judge whether target is 32-bit or 64-bit and tell
-"makekey".
-
-The error information from LSB Test suite is as follow:
-VSW5TESTSUITE PURPOSE 7
-Assertion XStringToKeysym-7.(A)
-When the string argument is the name of a KeySym in the 
-table with the prefix XK_ removed, then a call to
-XStringToKeysym returns that KeySym.
-METH: For each KeySym name in table with code G:
-METH: Call XStringToKeysym to obtain the KeySym defined for that string.
-METH: Verify that XStringToKeysym did not return NoSymbol.
-METH: Verify that the returned string is correct.
-CHECK: XStringToKeysym-7 1, line 130 
-CHECK: XStringToKeysym-7 2, line 140 
-CHECK: XStringToKeysym-7 3, line 150 
-CHECK: XStringToKeysym-7 4, line 160 
-CHECK: XStringToKeysym-7 5, line 170 
-CHECK: XStringToKeysym-7 6, line 180 
-CHECK: XStringToKeysym-7 7, line 190 
-CHECK: XStringToKeysym-7 8, line 200 
-CHECK: XStringToKeysym-7 9, line 210 
-CHECK: XStringToKeysym-7 10, line 220 
-CHECK: XStringToKeysym-7 11, line 230 
-CHECK: XStringToKeysym-7 12, line 240 
-CHECK: XStringToKeysym-7 13, line 250 
-CHECK: XStringToKeysym-7 14, line 260 
-CHECK: XStringToKeysym-7 15, line 270 
-CHECK: XStringToKeysym-7 16, line 280 
-CHECK: XStringToKeysym-7 17, line 290 
-CHECK: XStringToKeysym-7 18, line 300 
-CHECK: XStringToKeysym-7 19, line 310 
-CHECK: XStringToKeysym-7 20, line 320
-
-Upstream-Status: Pending
-
-Signed-off-by: dbuitenh@windriver.com
-
---- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
-+++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
-@@ -33,6 +33,7 @@
- #include <X11/keysymdef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- typedef unsigned long Signature;
- 
-@@ -124,7 +125,12 @@
- 	    name = info[i].name;
- 	    sig = 0;
- 	    while ((c = *name++))
--		sig = (sig << 1) + c;
-+#ifdef USE32
-+		sig = (uint32_t)(sig << 1) + c;
-+#else
-+		sig = (uint64_t)(sig << 1) + c;
-+#endif
-+		
- 	    first = j = sig % z;
- 	    for (k = 0; tab[j]; k++) {
- 		j += first + 1;
-@@ -163,7 +169,11 @@
- 	name = info[i].name;
- 	sig = 0;
- 	while ((c = *name++))
--	    sig = (sig << 1) + c;
-+#ifdef USE32
-+	    sig = (uint32_t)(sig << 1) + c;
-+#else
-+	    sig = (uint64_t)(sig << 1) + c;
-+#endif
- 	first = j = sig % z;
- 	while (offsets[j]) {
- 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
deleted file mode 100644
index 69f9e6c..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-1.5.0/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Index: libX11-1.5.0/src/util/Makefile.am
-===================================================================
---- libX11-1.5.0.orig/src/util/Makefile.am
-+++ libX11-1.5.0/src/util/Makefile.am
-@@ -1,27 +1,2 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--makekeys_CPPFLAGS = \
--	-I$(top_srcdir)/include
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
deleted file mode 100644
index 8cd1870..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
+++ /dev/null
@@ -1,541 +0,0 @@
-Upstream-Status: Pending
-
-Upstream-Status: Inappropriate [configuration]
-Index: libX11-1.3/src/imConv.c
-===================================================================
---- libX11-1.3.orig/src/imConv.c
-+++ libX11-1.3/src/imConv.c
-@@ -83,6 +83,7 @@ static const struct SubstRec SubstTable[
-  * from UCS char to specified charset char.
-  * This converter is needed for _XimGetCharCode subroutine.
-  */
-+#ifdef XLOCALE
- XPointer
- _XimGetLocaleCode (
-     _Xconst char*	encoding_name)
-@@ -96,6 +97,7 @@ _XimGetLocaleCode (
-     }
-     return cvt;
- }
-+#endif
- 
- /*
-  * Returns the locale dependent representation of a keysym.
-@@ -106,6 +108,7 @@ _XimGetLocaleCode (
-  * terminating NUL byte. Return 0 if the keysym is not representable in the
-  * locale
-  */
-+#ifdef XLOCALE
- /*ARGSUSED*/
- int
- _XimGetCharCode (
-@@ -135,6 +138,7 @@ _XimGetCharCode (
-         buf[count]= '\0';
-     return count;
- }
-+#endif
- 
- #ifdef XKB
- static int lookup_string(
-Index: libX11-1.3/src/X18NCMSstubs.c
-===================================================================
---- /dev/null
-+++ libX11-1.3/src/X18NCMSstubs.c
-@@ -0,0 +1,428 @@
-+/*
-+ * X18NCMSstubs.c
-+ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
-+ *
-+ * Copyright © 2003 Matthew Allum
-+ *
-+ * Permission to use, copy, modify, distribute, and sell this software and its
-+ * documentation for any purpose is hereby granted without fee, provided that
-+ * the above copyright notice appear in all copies and that both that
-+ * copyright notice and this permission notice appear in supporting
-+ * documentation, and that the name of Matthew Allum not be used in
-+ * advertising or publicity pertaining to distribution of the software without
-+ * specific, written prior permission.  Keith Packard and Compaq makes no
-+ * representations about the suitability of this software for any purpose.  It
-+ * is provided "as is" without express or implied warranty.
-+ *
-+ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
-+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, 
-+ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
-+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
-+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
-+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-+ * PERFORMANCE OF THIS SOFTWARE.
-+ */
-+
-+#include <stdlib.h>
-+#include "Xlibint.h"
-+#include "Xlcint.h"
-+#include <X11/Xlocale.h>
-+#include <X11/Xos.h>
-+#ifdef WIN32
-+#undef close
-+#endif
-+#include <X11/Xutil.h>
-+#include "XlcPubI.h"
-+
-+#include "Xcmsint.h" 		/* for XcmsCCC type  */
-+#include "XlcPubI.h"            /* for XLCd type */
-+#include "config.h"
-+
-+#if ! XLOCALE
-+
-+Bool
-+XSupportsLocale()
-+{
-+  return False; 		
-+}
-+
-+char *
-+XSetLocaleModifiers(
-+    const char *modifiers)
-+{
-+  return NULL;
-+}
-+
-+XLCd
-+_XOpenLC(
-+    char *name)
-+{
-+  return NULL;
-+}
-+
-+XLCd
-+_XlcCurrentLC()
-+{
-+  return NULL;
-+}
-+
-+void
-+_XlcVaToArgList(
-+    va_list var,
-+    int count,
-+    XlcArgList *args_ret)
-+{
-+  return;
-+}
-+
-+void
-+_XlcCountVaList(
-+    va_list var,
-+    int *count_ret)
-+{
-+  return;
-+}
-+
-+void
-+_XCloseLC(
-+    XLCd lcd)
-+{
-+  return;
-+}
-+
-+int
-+_XlcConvert(
-+    XlcConv conv,
-+    XPointer *from,
-+    int *from_left,
-+    XPointer *to,
-+    int *to_left,
-+    XPointer *args,
-+    int num_args)
-+{
-+  return 0;
-+}
-+
-+/* XIM Stubs */
-+
-+XPointer
-+_XimGetLocaleCode ( _Xconst char* encoding_name )
-+{
-+  return NULL;
-+}
-+
-+int
-+_XimGetCharCode (
-+    XPointer            ucs_conv,
-+    KeySym              keysym,
-+    unsigned char*      buf,
-+    int                 nbytes)
-+{
-+  return 0;
-+}
-+
-+/* Xrm Stubs */
-+
-+XrmMethods
-+_XrmInitParseInfo(
-+    XPointer *state)
-+{
-+    return (XrmMethods) NULL;
-+}
-+
-+/* Xwc Stubs */
-+
-+int
-+XwcTextExtents(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len,
-+    XRectangle         *overall_ink_extents,
-+    XRectangle         *overall_logical_extents)
-+{
-+  return 0;
-+}
-+
-+void 
-+XwcDrawString(Display *display,
-+	      Drawable d,
-+	      XFontSet font_set,
-+	      GC gc,
-+	      int x, int y,
-+	      _Xconst wchar_t *string,
-+	      int num_wchars)
-+{
-+  ;
-+}
-+
-+void
-+XwcDrawText(
-+    Display            *dpy,
-+    Drawable            d,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    XwcTextItem        *text_items,
-+    int                 nitems)
-+{
-+  ;
-+}
-+
-+void
-+XwcDrawImageString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst wchar_t    *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+int
-+XwcTextEscapement(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len)
-+{
-+  return 0;
-+}
-+
-+Status
-+XwcTextPerCharExtents(
-+    XFontSet            font_set,
-+    _Xconst wchar_t    *text,
-+    int                 text_len,
-+    XRectangle         *ink_extents_buffer,
-+    XRectangle         *logical_extents_buffer,
-+    int                 buffer_size,
-+    int                *num_chars,
-+    XRectangle         *max_ink_extents,
-+    XRectangle         *max_logical_extents)
-+{
-+  return(XcmsFailure);
-+}
-+
-+int
-+XwcTextPropertyToTextList(
-+    Display *dpy,
-+    const XTextProperty *text_prop,
-+    wchar_t ***list_ret,
-+    int *count_ret)
-+{
-+  return 0;
-+}
-+
-+int
-+XwcTextListToTextProperty(
-+    Display *dpy,
-+    wchar_t **list,
-+    int count,
-+    XICCEncodingStyle style,
-+    XTextProperty *text_prop)
-+{
-+  return 0;
-+}
-+
-+void
-+XwcFreeStringList(wchar_t **list)
-+{
-+  return;
-+}
-+
-+
-+void XmbSetWMProperties (        /* Actually from mbWMProps.c */
-+    Display *dpy,
-+    Window w,
-+    _Xconst char *windowName,
-+    _Xconst char *iconName,
-+    char **argv,
-+    int argc,
-+    XSizeHints *sizeHints,
-+    XWMHints *wmHints,
-+    XClassHint *classHints)
-+{
-+  return;
-+}
-+
-+int
-+XmbTextPropertyToTextList(
-+    Display *dpy,
-+    const XTextProperty *text_prop,
-+    char ***list_ret,
-+    int *count_ret)
-+{
-+  return XLocaleNotSupported;
-+}
-+
-+int
-+XmbTextListToTextProperty(
-+    Display *dpy,
-+    char **list,
-+    int count,
-+    XICCEncodingStyle style,
-+    XTextProperty *text_prop)
-+{
-+  return XLocaleNotSupported;
-+}
-+
-+int
-+XmbTextExtents(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len,
-+    XRectangle     *overall_ink_extents,
-+    XRectangle     *overall_logical_extents)
-+{
-+  return 0;
-+}
-+
-+void
-+XmbDrawText(
-+    Display            *dpy,
-+    Drawable            d,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    XmbTextItem        *text_items,
-+    int                 nitems)
-+{
-+  ;
-+}
-+
-+void
-+XmbDrawString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst char       *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+void
-+XmbDrawImageString(
-+    Display            *dpy,
-+    Drawable            d,
-+    XFontSet            font_set,
-+    GC                  gc,
-+    int                 x,
-+    int                 y,
-+    _Xconst char       *text,
-+    int                 text_len)
-+{
-+  ;
-+}
-+
-+int
-+XmbTextEscapement(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len)
-+{
-+  return 0;
-+}
-+
-+Status
-+XmbTextPerCharExtents(
-+    XFontSet        font_set,
-+    _Xconst char   *text,
-+    int             text_len,
-+    XRectangle     *ink_extents_buffer,
-+    XRectangle     *logical_extents_buffer,
-+    int             buffer_size,
-+    int            *num_chars,
-+    XRectangle     *max_ink_extents,
-+    XRectangle     *max_logical_extents)
-+{
-+  return 0;
-+}
-+
-+unsigned int
-+KeySymToUcs4(KeySym keysym)
-+{
-+  return 0;
-+}
-+
-+#endif 
-+
-+#if ! XCMS
-+
-+XcmsCCC 
-+XcmsCCCOfColormap(dpy, cmap)
-+    Display *dpy;
-+    Colormap cmap;
-+{
-+  return NULL;
-+}
-+
-+Status
-+_XcmsResolveColorString (
-+    XcmsCCC ccc,
-+    const char **color_string,
-+    XcmsColor *pColor_exact_return,
-+    XcmsColorFormat result_format)
-+{
-+  return(XcmsFailure);
-+}
-+
-+void
-+_XcmsUnresolveColor(
-+    XcmsCCC ccc,
-+    XcmsColor *pColor)
-+{
-+  return;
-+}
-+
-+void
-+_XUnresolveColor(
-+    XcmsCCC ccc,
-+    XColor *pXColor)
-+{
-+  return;
-+}
-+
-+XcmsCmapRec *
-+_XcmsAddCmapRec(dpy, cmap, windowID, visual)
-+    Display *dpy;
-+    Colormap cmap;
-+    Window windowID;
-+    Visual *visual;
-+{
-+  return NULL;
-+}
-+
-+void
-+_XcmsRGB_to_XColor(
-+    XcmsColor *pColors,
-+    XColor *pXColors,
-+    unsigned int nColors)
-+{
-+  return;
-+}
-+
-+XcmsCmapRec *
-+_XcmsCopyCmapRecAndFree(
-+    Display *dpy,
-+    Colormap src_cmap,
-+    Colormap copy_cmap)
-+{
-+  return NULL;
-+}
-+
-+void
-+_XcmsDeleteCmapRec(
-+    Display *dpy,
-+    Colormap cmap)
-+{
-+  return;
-+}
-+
-+#endif
-Index: libX11-1.3/src/Makefile.am
-===================================================================
---- libX11-1.3.orig/src/Makefile.am
-+++ libX11-1.3/src/Makefile.am
-@@ -335,6 +335,8 @@ if THRSTUBS
- libX11_la_SOURCES+=UIThrStubs.c
- endif
- 
-+libX11_la_SOURCES+=X18NCMSstubs.c
-+
- x11datadir = @X11_DATADIR@
- x11data_DATA = XKeysymDB XErrorDB
- 
-@@ -342,7 +344,8 @@ EXTRA_DIST = \
- 	$(x11data_DATA) \
- 	os2Stubs.c \
- 	udcInf.c \
--	UIThrStubs.c 
-+	UIThrStubs.c \
-+	X18NCMSstubs.c
- 
- if XCB
- libX11_la_SOURCES += \
-Index: libX11-1.3/src/locking.c
-===================================================================
---- libX11-1.3.orig/src/locking.c
-+++ libX11-1.3/src/locking.c
-@@ -66,7 +66,9 @@ in this Software without prior written a
- #define NUM_FREE_CVLS 4
- 
- /* in lcWrap.c */
-+#ifdef XLOCALE
- extern LockInfoPtr _Xi18n_lock;
-+#endif
- 
- #ifdef WIN32
- static DWORD _X_TlsIndex = (DWORD)-1;
-@@ -594,9 +596,11 @@ Status XInitThreads(void)
-     _Xglobal_lock = &global_lock;
-     xmutex_init(_Xglobal_lock->lock);
-     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
-+#ifdef XLOCALE
-     _Xi18n_lock = &i18n_lock;
-     xmutex_init(_Xi18n_lock->lock);
-     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
-+#endif
-     _XLockMutex_fn = _XLockMutex;
-     _XUnlockMutex_fn = _XUnlockMutex;
-     _XCreateMutex_fn = _XCreateMutex;
-Index: libX11-1.3/configure.ac
-===================================================================
---- libX11-1.3.orig/configure.ac
-+++ libX11-1.3/configure.ac
-@@ -289,7 +289,14 @@ else
- fi
- AC_SUBST(KEYSYMDEF)
- 
--AM_CONDITIONAL(UDC, test xfalse = xtrue)
-+AC_ARG_ENABLE(udc,
-+              AC_HELP_STRING([--disable-udc],
-+                [Disable Xlib support for UDC *EXPERIMENTAL*]),
-+              [UDC=$enableval],[UDC=yes])
-+AM_CONDITIONAL(UDC, [test x$UDC = xyes ])
-+if test x"$UDC" = "xyes"; then
-+	AC_DEFINE(UDC,1,[Include support for UDC])
-+fi
- 
- AC_ARG_ENABLE(xcms,
-               AC_HELP_STRING([--disable-xcms],
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff
deleted file mode 100644
index a7c3984..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
-+++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
-@@ -701,7 +701,11 @@
-     }
-     if (l - 2 - (p - charset) < 0)
- 	return 0;
-+#ifdef XLOCALE
-     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
-+#else
-+    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
-+#endif
- 	return 0;
-     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
- 	return 0;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch
deleted file mode 100644
index c6347f5..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
-+++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
-@@ -103,7 +103,7 @@
- 
- /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
-    November 2000. Its presence is indicated through the following macro. */
--#define X_HAVE_UTF8_STRING 1
-+#undef X_HAVE_UTF8_STRING
- 
- typedef char *XPointer;
- 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch
deleted file mode 100644
index d1bdab9..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
deleted file mode 100644
index 69f9e6c..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Index: libX11-1.5.0/src/util/Makefile.am
-===================================================================
---- libX11-1.5.0.orig/src/util/Makefile.am
-+++ libX11-1.5.0/src/util/Makefile.am
-@@ -1,27 +1,2 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--makekeys_CPPFLAGS = \
--	-I$(top_srcdir)/include
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch
deleted file mode 100644
index d1bdab9..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch
deleted file mode 100644
index daf3696..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Because the size of "unsigned long" is different between 32-bit
-and 64-bit, judge whether target is 32-bit or 64-bit and tell
-"makekey".
-
-The error information from LSB Test suite is as follow:
-VSW5TESTSUITE PURPOSE 7
-Assertion XStringToKeysym-7.(A)
-When the string argument is the name of a KeySym in the 
-table with the prefix XK_ removed, then a call to
-XStringToKeysym returns that KeySym.
-METH: For each KeySym name in table with code G:
-METH: Call XStringToKeysym to obtain the KeySym defined for that string.
-METH: Verify that XStringToKeysym did not return NoSymbol.
-METH: Verify that the returned string is correct.
-CHECK: XStringToKeysym-7 1, line 130 
-CHECK: XStringToKeysym-7 2, line 140 
-CHECK: XStringToKeysym-7 3, line 150 
-CHECK: XStringToKeysym-7 4, line 160 
-CHECK: XStringToKeysym-7 5, line 170 
-CHECK: XStringToKeysym-7 6, line 180 
-CHECK: XStringToKeysym-7 7, line 190 
-CHECK: XStringToKeysym-7 8, line 200 
-CHECK: XStringToKeysym-7 9, line 210 
-CHECK: XStringToKeysym-7 10, line 220 
-CHECK: XStringToKeysym-7 11, line 230 
-CHECK: XStringToKeysym-7 12, line 240 
-CHECK: XStringToKeysym-7 13, line 250 
-CHECK: XStringToKeysym-7 14, line 260 
-CHECK: XStringToKeysym-7 15, line 270 
-CHECK: XStringToKeysym-7 16, line 280 
-CHECK: XStringToKeysym-7 17, line 290 
-CHECK: XStringToKeysym-7 18, line 300 
-CHECK: XStringToKeysym-7 19, line 310 
-CHECK: XStringToKeysym-7 20, line 320
-
-Upstream-Status: Pending
-
-Signed-off-by: dbuitenh@windriver.com
-
---- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
-+++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
-@@ -33,6 +33,7 @@
- #include <X11/keysymdef.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <stdint.h>
- 
- typedef unsigned long Signature;
- 
-@@ -124,7 +125,12 @@
- 	    name = info[i].name;
- 	    sig = 0;
- 	    while ((c = *name++))
--		sig = (sig << 1) + c;
-+#ifdef USE32
-+		sig = (uint32_t)(sig << 1) + c;
-+#else
-+		sig = (uint64_t)(sig << 1) + c;
-+#endif
-+		
- 	    first = j = sig % z;
- 	    for (k = 0; tab[j]; k++) {
- 		j += first + 1;
-@@ -163,7 +169,11 @@
- 	name = info[i].name;
- 	sig = 0;
- 	while ((c = *name++))
--	    sig = (sig << 1) + c;
-+#ifdef USE32
-+	    sig = (uint32_t)(sig << 1) + c;
-+#else
-+	    sig = (uint64_t)(sig << 1) + c;
-+#endif
- 	first = j = sig % z;
- 	while (offsets[j]) {
- 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
deleted file mode 100644
index 69f9e6c..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Index: libX11-1.5.0/src/util/Makefile.am
-===================================================================
---- libX11-1.5.0.orig/src/util/Makefile.am
-+++ libX11-1.5.0/src/util/Makefile.am
-@@ -1,27 +1,2 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--makekeys_CPPFLAGS = \
--	-I$(top_srcdir)/include
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
- 
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index a524c5f..1e9f942 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -8,8 +8,10 @@ require xorg-lib-common.inc
 
 inherit siteinfo
 
+FILESPATH = "${FILE_DIRNAME}/libx11"
+
 PE = "1"
-INC_PR = "r4"
+INC_PR = "r5"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
new file mode 100644
index 0000000..8cd1870
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
@@ -0,0 +1,541 @@
+Upstream-Status: Pending
+
+Upstream-Status: Inappropriate [configuration]
+Index: libX11-1.3/src/imConv.c
+===================================================================
+--- libX11-1.3.orig/src/imConv.c
++++ libX11-1.3/src/imConv.c
+@@ -83,6 +83,7 @@ static const struct SubstRec SubstTable[
+  * from UCS char to specified charset char.
+  * This converter is needed for _XimGetCharCode subroutine.
+  */
++#ifdef XLOCALE
+ XPointer
+ _XimGetLocaleCode (
+     _Xconst char*	encoding_name)
+@@ -96,6 +97,7 @@ _XimGetLocaleCode (
+     }
+     return cvt;
+ }
++#endif
+ 
+ /*
+  * Returns the locale dependent representation of a keysym.
+@@ -106,6 +108,7 @@ _XimGetLocaleCode (
+  * terminating NUL byte. Return 0 if the keysym is not representable in the
+  * locale
+  */
++#ifdef XLOCALE
+ /*ARGSUSED*/
+ int
+ _XimGetCharCode (
+@@ -135,6 +138,7 @@ _XimGetCharCode (
+         buf[count]= '\0';
+     return count;
+ }
++#endif
+ 
+ #ifdef XKB
+ static int lookup_string(
+Index: libX11-1.3/src/X18NCMSstubs.c
+===================================================================
+--- /dev/null
++++ libX11-1.3/src/X18NCMSstubs.c
+@@ -0,0 +1,428 @@
++/*
++ * X18NCMSstubs.c
++ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
++ *
++ * Copyright © 2003 Matthew Allum
++ *
++ * Permission to use, copy, modify, distribute, and sell this software and its
++ * documentation for any purpose is hereby granted without fee, provided that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Matthew Allum not be used in
++ * advertising or publicity pertaining to distribution of the software without
++ * specific, written prior permission.  Keith Packard and Compaq makes no
++ * representations about the suitability of this software for any purpose.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS 
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, 
++ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
++ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
++ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
++ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++ * PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <stdlib.h>
++#include "Xlibint.h"
++#include "Xlcint.h"
++#include <X11/Xlocale.h>
++#include <X11/Xos.h>
++#ifdef WIN32
++#undef close
++#endif
++#include <X11/Xutil.h>
++#include "XlcPubI.h"
++
++#include "Xcmsint.h" 		/* for XcmsCCC type  */
++#include "XlcPubI.h"            /* for XLCd type */
++#include "config.h"
++
++#if ! XLOCALE
++
++Bool
++XSupportsLocale()
++{
++  return False; 		
++}
++
++char *
++XSetLocaleModifiers(
++    const char *modifiers)
++{
++  return NULL;
++}
++
++XLCd
++_XOpenLC(
++    char *name)
++{
++  return NULL;
++}
++
++XLCd
++_XlcCurrentLC()
++{
++  return NULL;
++}
++
++void
++_XlcVaToArgList(
++    va_list var,
++    int count,
++    XlcArgList *args_ret)
++{
++  return;
++}
++
++void
++_XlcCountVaList(
++    va_list var,
++    int *count_ret)
++{
++  return;
++}
++
++void
++_XCloseLC(
++    XLCd lcd)
++{
++  return;
++}
++
++int
++_XlcConvert(
++    XlcConv conv,
++    XPointer *from,
++    int *from_left,
++    XPointer *to,
++    int *to_left,
++    XPointer *args,
++    int num_args)
++{
++  return 0;
++}
++
++/* XIM Stubs */
++
++XPointer
++_XimGetLocaleCode ( _Xconst char* encoding_name )
++{
++  return NULL;
++}
++
++int
++_XimGetCharCode (
++    XPointer            ucs_conv,
++    KeySym              keysym,
++    unsigned char*      buf,
++    int                 nbytes)
++{
++  return 0;
++}
++
++/* Xrm Stubs */
++
++XrmMethods
++_XrmInitParseInfo(
++    XPointer *state)
++{
++    return (XrmMethods) NULL;
++}
++
++/* Xwc Stubs */
++
++int
++XwcTextExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *overall_ink_extents,
++    XRectangle         *overall_logical_extents)
++{
++  return 0;
++}
++
++void 
++XwcDrawString(Display *display,
++	      Drawable d,
++	      XFontSet font_set,
++	      GC gc,
++	      int x, int y,
++	      _Xconst wchar_t *string,
++	      int num_wchars)
++{
++  ;
++}
++
++void
++XwcDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XwcTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XwcDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XwcTextEscapement(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  return 0;
++}
++
++Status
++XwcTextPerCharExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *ink_extents_buffer,
++    XRectangle         *logical_extents_buffer,
++    int                 buffer_size,
++    int                *num_chars,
++    XRectangle         *max_ink_extents,
++    XRectangle         *max_logical_extents)
++{
++  return(XcmsFailure);
++}
++
++int
++XwcTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    wchar_t ***list_ret,
++    int *count_ret)
++{
++  return 0;
++}
++
++int
++XwcTextListToTextProperty(
++    Display *dpy,
++    wchar_t **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return 0;
++}
++
++void
++XwcFreeStringList(wchar_t **list)
++{
++  return;
++}
++
++
++void XmbSetWMProperties (        /* Actually from mbWMProps.c */
++    Display *dpy,
++    Window w,
++    _Xconst char *windowName,
++    _Xconst char *iconName,
++    char **argv,
++    int argc,
++    XSizeHints *sizeHints,
++    XWMHints *wmHints,
++    XClassHint *classHints)
++{
++  return;
++}
++
++int
++XmbTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    char ***list_ret,
++    int *count_ret)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextListToTextProperty(
++    Display *dpy,
++    char **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *overall_ink_extents,
++    XRectangle     *overall_logical_extents)
++{
++  return 0;
++}
++
++void
++XmbDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XmbTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XmbDrawString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++void
++XmbDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XmbTextEscapement(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len)
++{
++  return 0;
++}
++
++Status
++XmbTextPerCharExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *ink_extents_buffer,
++    XRectangle     *logical_extents_buffer,
++    int             buffer_size,
++    int            *num_chars,
++    XRectangle     *max_ink_extents,
++    XRectangle     *max_logical_extents)
++{
++  return 0;
++}
++
++unsigned int
++KeySymToUcs4(KeySym keysym)
++{
++  return 0;
++}
++
++#endif 
++
++#if ! XCMS
++
++XcmsCCC 
++XcmsCCCOfColormap(dpy, cmap)
++    Display *dpy;
++    Colormap cmap;
++{
++  return NULL;
++}
++
++Status
++_XcmsResolveColorString (
++    XcmsCCC ccc,
++    const char **color_string,
++    XcmsColor *pColor_exact_return,
++    XcmsColorFormat result_format)
++{
++  return(XcmsFailure);
++}
++
++void
++_XcmsUnresolveColor(
++    XcmsCCC ccc,
++    XcmsColor *pColor)
++{
++  return;
++}
++
++void
++_XUnresolveColor(
++    XcmsCCC ccc,
++    XColor *pXColor)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsAddCmapRec(dpy, cmap, windowID, visual)
++    Display *dpy;
++    Colormap cmap;
++    Window windowID;
++    Visual *visual;
++{
++  return NULL;
++}
++
++void
++_XcmsRGB_to_XColor(
++    XcmsColor *pColors,
++    XColor *pXColors,
++    unsigned int nColors)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsCopyCmapRecAndFree(
++    Display *dpy,
++    Colormap src_cmap,
++    Colormap copy_cmap)
++{
++  return NULL;
++}
++
++void
++_XcmsDeleteCmapRec(
++    Display *dpy,
++    Colormap cmap)
++{
++  return;
++}
++
++#endif
+Index: libX11-1.3/src/Makefile.am
+===================================================================
+--- libX11-1.3.orig/src/Makefile.am
++++ libX11-1.3/src/Makefile.am
+@@ -335,6 +335,8 @@ if THRSTUBS
+ libX11_la_SOURCES+=UIThrStubs.c
+ endif
+ 
++libX11_la_SOURCES+=X18NCMSstubs.c
++
+ x11datadir = @X11_DATADIR@
+ x11data_DATA = XKeysymDB XErrorDB
+ 
+@@ -342,7 +344,8 @@ EXTRA_DIST = \
+ 	$(x11data_DATA) \
+ 	os2Stubs.c \
+ 	udcInf.c \
+-	UIThrStubs.c 
++	UIThrStubs.c \
++	X18NCMSstubs.c
+ 
+ if XCB
+ libX11_la_SOURCES += \
+Index: libX11-1.3/src/locking.c
+===================================================================
+--- libX11-1.3.orig/src/locking.c
++++ libX11-1.3/src/locking.c
+@@ -66,7 +66,9 @@ in this Software without prior written a
+ #define NUM_FREE_CVLS 4
+ 
+ /* in lcWrap.c */
++#ifdef XLOCALE
+ extern LockInfoPtr _Xi18n_lock;
++#endif
+ 
+ #ifdef WIN32
+ static DWORD _X_TlsIndex = (DWORD)-1;
+@@ -594,9 +596,11 @@ Status XInitThreads(void)
+     _Xglobal_lock = &global_lock;
+     xmutex_init(_Xglobal_lock->lock);
+     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
++#ifdef XLOCALE
+     _Xi18n_lock = &i18n_lock;
+     xmutex_init(_Xi18n_lock->lock);
+     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
++#endif
+     _XLockMutex_fn = _XLockMutex;
+     _XUnlockMutex_fn = _XUnlockMutex;
+     _XCreateMutex_fn = _XCreateMutex;
+Index: libX11-1.3/configure.ac
+===================================================================
+--- libX11-1.3.orig/configure.ac
++++ libX11-1.3/configure.ac
+@@ -289,7 +289,14 @@ else
+ fi
+ AC_SUBST(KEYSYMDEF)
+ 
+-AM_CONDITIONAL(UDC, test xfalse = xtrue)
++AC_ARG_ENABLE(udc,
++              AC_HELP_STRING([--disable-udc],
++                [Disable Xlib support for UDC *EXPERIMENTAL*]),
++              [UDC=$enableval],[UDC=yes])
++AM_CONDITIONAL(UDC, [test x$UDC = xyes ])
++if test x"$UDC" = "xyes"; then
++	AC_DEFINE(UDC,1,[Include support for UDC])
++fi
+ 
+ AC_ARG_ENABLE(xcms,
+               AC_HELP_STRING([--disable-xcms],
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
new file mode 100644
index 0000000..a7c3984
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+--- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
++++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
+@@ -701,7 +701,11 @@
+     }
+     if (l - 2 - (p - charset) < 0)
+ 	return 0;
++#ifdef XLOCALE
+     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
++#else
++    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
++#endif
+ 	return 0;
+     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
+ 	return 0;
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
new file mode 100644
index 0000000..c6347f5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
++++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
+@@ -103,7 +103,7 @@
+ 
+ /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
+    November 2000. Its presence is indicated through the following macro. */
+-#define X_HAVE_UTF8_STRING 1
++#undef X_HAVE_UTF8_STRING
+ 
+ typedef char *XPointer;
+ 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
new file mode 100644
index 0000000..d1bdab9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch
new file mode 100644
index 0000000..daf3696
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/makekeys_crosscompile.patch
@@ -0,0 +1,76 @@
+Because the size of "unsigned long" is different between 32-bit
+and 64-bit, judge whether target is 32-bit or 64-bit and tell
+"makekey".
+
+The error information from LSB Test suite is as follow:
+VSW5TESTSUITE PURPOSE 7
+Assertion XStringToKeysym-7.(A)
+When the string argument is the name of a KeySym in the 
+table with the prefix XK_ removed, then a call to
+XStringToKeysym returns that KeySym.
+METH: For each KeySym name in table with code G:
+METH: Call XStringToKeysym to obtain the KeySym defined for that string.
+METH: Verify that XStringToKeysym did not return NoSymbol.
+METH: Verify that the returned string is correct.
+CHECK: XStringToKeysym-7 1, line 130 
+CHECK: XStringToKeysym-7 2, line 140 
+CHECK: XStringToKeysym-7 3, line 150 
+CHECK: XStringToKeysym-7 4, line 160 
+CHECK: XStringToKeysym-7 5, line 170 
+CHECK: XStringToKeysym-7 6, line 180 
+CHECK: XStringToKeysym-7 7, line 190 
+CHECK: XStringToKeysym-7 8, line 200 
+CHECK: XStringToKeysym-7 9, line 210 
+CHECK: XStringToKeysym-7 10, line 220 
+CHECK: XStringToKeysym-7 11, line 230 
+CHECK: XStringToKeysym-7 12, line 240 
+CHECK: XStringToKeysym-7 13, line 250 
+CHECK: XStringToKeysym-7 14, line 260 
+CHECK: XStringToKeysym-7 15, line 270 
+CHECK: XStringToKeysym-7 16, line 280 
+CHECK: XStringToKeysym-7 17, line 290 
+CHECK: XStringToKeysym-7 18, line 300 
+CHECK: XStringToKeysym-7 19, line 310 
+CHECK: XStringToKeysym-7 20, line 320
+
+Upstream-Status: Pending
+
+Signed-off-by: dbuitenh@windriver.com
+
+--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.000000000 +0800
++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0800
+@@ -33,6 +33,7 @@
+ #include <X11/keysymdef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ 
+ typedef unsigned long Signature;
+ 
+@@ -124,7 +125,12 @@
+ 	    name = info[i].name;
+ 	    sig = 0;
+ 	    while ((c = *name++))
+-		sig = (sig << 1) + c;
++#ifdef USE32
++		sig = (uint32_t)(sig << 1) + c;
++#else
++		sig = (uint64_t)(sig << 1) + c;
++#endif
++		
+ 	    first = j = sig % z;
+ 	    for (k = 0; tab[j]; k++) {
+ 		j += first + 1;
+@@ -163,7 +169,11 @@
+ 	name = info[i].name;
+ 	sig = 0;
+ 	while ((c = *name++))
+-	    sig = (sig << 1) + c;
++#ifdef USE32
++	    sig = (uint32_t)(sig << 1) + c;
++#else
++	    sig = (uint64_t)(sig << 1) + c;
++#endif
+ 	first = j = sig % z;
+ 	while (offsets[j]) {
+ 	    j += first + 1;
diff --git a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
new file mode 100644
index 0000000..69f9e6c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+Index: libX11-1.5.0/src/util/Makefile.am
+===================================================================
+--- libX11-1.5.0.orig/src/util/Makefile.am
++++ libX11-1.5.0/src/util/Makefile.am
+@@ -1,27 +1,2 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-makekeys_CPPFLAGS = \
+-	-I$(top_srcdir)/include
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+ 
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
-- 
1.7.10



