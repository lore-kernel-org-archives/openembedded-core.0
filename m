Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE0D-0006CP-P3
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:30 +0200
Received: by mail-gx0-f175.google.com with SMTP id q1so3019435ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=RQQHkdmAs5VBXkxK9rqDhDQR4i+WQ+8fyRq0fZeh3ls=;
	b=hcM5VFlmC/yXAdh1kiauhoSlYRX/iNyuLFb4/iilcP4Ro5LVREUPv0VofOnp+LDvQL
	hF4z3QgrkEKRJf4OWCuIEbyYgQehRg+8tIS+z9bNkE5wkCRcKhUuYrzKNRW6Qg1SMBOI
	/iz4VDcCArH3Ws3KohdgDFy/tR7ee4cAMOEyA=
Received: by 10.223.88.71 with SMTP id z7mr11936914fal.26.1318007333580;
	Fri, 07 Oct 2011 10:08:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm13607464fan.17.2011.10.07.10.08.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:20 +0200
Message-Id: <2cfc1f9997ea98983bc6f5b12c21055d3c70c827.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 25/31] libx11: drop old 1.2.2 git version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:14:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |   17 -
 .../xorg-lib/libx11-git/X18NCMSstubs.diff          |  570 --------------------
 .../xorg-lib/libx11-git/fix-disable-xlocale.diff   |   16 -
 .../libx11-git/fix-utf8-wrong-define.patch         |   17 -
 .../xorg-lib/libx11-git/include_fix.patch          |   25 -
 .../xorg-lib/libx11-git/nodolt.patch               |   14 -
 .../xorg-lib/libx11-git/x11_disable_makekeys.patch |   30 -
 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb  |   13 -
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |   16 -
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |   11 -
 10 files changed, 0 insertions(+), 729 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.inc

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
deleted file mode 100644
index 4cda779..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require libx11.inc
-require libx11_git.inc
-
-DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
-this version."
-
-SRC_URI += "file://X18NCMSstubs.diff \
-            file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch"
-
-DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
-
-SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
-
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
-CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
deleted file mode 100644
index b49fc22..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
+++ /dev/null
@@ -1,570 +0,0 @@
-Upstream-Status: Pending
-
----
- configure.ac       |    9 -
- src/Makefile.am    |    5 
- src/X18NCMSstubs.c |  428 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- src/imConv.c       |    4 
- src/locking.c      |    4 
- 5 files changed, 448 insertions(+), 2 deletions(-)
-
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -263,11 +263,18 @@ if test -f "$KEYSYMDEF"; then
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
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
-                 [Disable Xlib support for CMS *EXPERIMENTAL*]),
-               [XCMS=$enableval],[XCMS=yes])
---- git.orig/src/Makefile.am
-+++ git/src/Makefile.am
-@@ -329,18 +329,21 @@ endif
- 
- if THRSTUBS
- libX11_la_SOURCES+=UIThrStubs.c
- endif
- 
-+libX11_la_SOURCES+=X18NCMSstubs.c
-+
- x11datadir = @X11_DATADIR@
- x11data_DATA = XKeysymDB XErrorDB
- 
- EXTRA_DIST = \
- 	$(x11data_DATA) \
- 	os2Stubs.c \
- 	udcInf.c \
--	UIThrStubs.c 
-+	UIThrStubs.c \
-+	X18NCMSstubs.c
- 
- if XCB
- libX11_la_SOURCES += \
-                   xcb_lock.c \
-                   xcb_disp.c \
---- /dev/null
-+++ git/src/X18NCMSstubs.c
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
-+  ;
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
---- git.orig/src/imConv.c
-+++ git/src/imConv.c
-@@ -81,10 +81,11 @@ static const struct SubstRec SubstTable[
- /*
-  * Given the name of a charset, returns the pointer to convertors
-  * from UCS char to specified charset char.
-  * This converter is needed for _XimGetCharCode subroutine.
-  */
-+#ifdef XLOCALE
- XPointer
- _XimGetLocaleCode (
-     _Xconst char*	encoding_name)
- {
-     XPointer cvt = _Utf8GetConvByName(encoding_name);
-@@ -94,10 +95,11 @@ _XimGetLocaleCode (
-            if (!strcmp(encoding_name, SubstTable[i].encoding_name))
-                return _Utf8GetConvByName(SubstTable[i].charset_name);
-     }
-     return cvt;
- }
-+#endif
- 
- /*
-  * Returns the locale dependent representation of a keysym.
-  * The locale's encoding is passed in form of pointer to UCS convertor.
-  * The resulting multi-byte sequence is placed starting at buf (a buffer
-@@ -105,10 +107,11 @@ _XimGetLocaleCode (
-  * Returns the length of the resulting multi-byte sequence, excluding the
-  * terminating NUL byte. Return 0 if the keysym is not representable in the
-  * locale
-  */
- /*ARGSUSED*/
-+#ifdef XLOCALE
- int
- _XimGetCharCode (
-     XPointer            ucs_conv,
-     KeySym 		keysym,
-     unsigned char*	buf,
-@@ -133,10 +136,11 @@ _XimGetCharCode (
-         return nbytes;
-     if (count<nbytes)
-         buf[count]= '\0';
-     return count;
- }
-+#endif
- 
- #ifdef XKB
- static int lookup_string(
-     XKeyEvent*		event,
-     char*		buffer,
---- git.orig/src/locking.c
-+++ git/src/locking.c
-@@ -53,11 +53,13 @@ in this Software without prior written a
- #endif
- 
- #define NUM_FREE_CVLS 4
- 
- /* in lcWrap.c */
-+#ifdef XLOCALE
- extern LockInfoPtr _Xi18n_lock;
-+#endif
- 
- #ifdef WIN32
- static DWORD _X_TlsIndex = (DWORD)-1;
- 
- void _Xthread_init()
-@@ -623,13 +625,15 @@ Status XInitThreads()
- 	return 0;
-     }
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
-     _XFreeMutex_fn = _XFreeMutex;
-     _XInitDisplayLock_fn = _XInitDisplayLock;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
deleted file mode 100644
index 7dcdd6a..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
deleted file mode 100644
index 26d3349..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
deleted file mode 100644
index b3bcbab..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.ac |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- libX11-1.1.5.orig/configure.ac
-+++ libX11-1.1.5/configure.ac
-@@ -218,13 +218,13 @@ AC_SUBST(XDMCP_LIBS)
- AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
- 
- #
- # Find keysymdef.h
- #
--AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+ 	KEYSYMDEF=$withval, KEYSYMDEF="")
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
deleted file mode 100644
index cc05fdc..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libX11-1.2.1/configure.ac
-===================================================================
---- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
-+++ libX11-1.2.1/configure.ac	2009-07-02 14:08:01.000000000 +0100
-@@ -20,7 +20,6 @@
- 
- # Checks for programs.
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_CC
- XORG_CWARNFLAGS
- 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
deleted file mode 100644
index 5dc6f06..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- src/util/Makefile.am |   17 -----------------
- 1 file changed, 17 deletions(-)
-
-Index: git/src/util/Makefile.am
-===================================================================
---- git.orig/src/util/Makefile.am	2010-01-28 22:24:29.000000000 +0000
-+++ git/src/util/Makefile.am	2010-01-28 22:29:26.000000000 +0000
-@@ -1,19 +1,2 @@
- 
--noinst_PROGRAMS=makekeys
- 
--makekeys_CFLAGS=$(X11_CFLAGS)
--
--CC = @CC_FOR_BUILD@
--
--EXTRA_DIST = mkks.sh
--
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
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
deleted file mode 100644
index d1bf67b..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require libx11.inc
-require libx11_git.inc
-
-DESCRIPTION += " Support for XCB, and XCMS is disabled in this version."
-
-PR = "r2"
-SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
-
-DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
-
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-xcms --with-xcb"
-CFLAGS += "-D_GNU_SOURCE"
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.bb b/meta/recipes-graphics/xorg-lib/libx11_git.bb
deleted file mode 100644
index afa1560..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require libx11.inc
-require libx11_git.inc
-
-inherit gettext
-
-SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
-PR = "r2"
-
-DEPENDS = "xproto xextproto xcmiscproto xf86bigfontproto kbproto inputproto \
-           bigreqsproto xtrans libxau libxcb libxdmcp util-macros"
-
-DEFAULT_PREFERENCE = "-1"
-
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.inc b/meta/recipes-graphics/xorg-lib/libx11_git.inc
deleted file mode 100644
index 4de424d..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_git.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-PV = "1.2.1+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libX11;protocol=git"
-S = "${WORKDIR}/git"
-
-SRC_URI += "file://x11_disable_makekeys.patch \
-            file://include_fix.patch \
-            file://nodolt.patch"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11-git"
-FILESPATH = "${FILE_DIRNAME}/libx11-git"
-- 
1.7.7



