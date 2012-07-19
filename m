Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVp-0001ch-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:38 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:15 -0700
Received: by mail-wi0-f178.google.com with SMTP id hr14so2255271wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=jCsZ/GWOXjP7VJ2/jydXRyYNvOOsFhEppRmxUWLJv8A=;
	b=SDoqaIhK8ClcbdKN4AGcNO2kT/3Nvd6vaEc5+zCIcZKVPGQexWriJplgswlMhed54P
	vpqb33aaoD1v7eE0eqBDTzJAoY2rC2p5hSq8N7cQrfvQDv8bOm5RJTGauiR2yBuUdop3
	Ae63ywes+/nqzOKAFJ+vE0vG3onvAldHbHG7WoLu6+oNgXh5//SZlesY7ahAuNPfjsW7
	/TMe/f5Ygvhh8t1wJVGJkzMyKebUI0iIqEpr+893GqTNntDi9+NVEPcDHHhUirqTBON6
	KKb2T31oyyDMKnD1miull37vHUUq8Qtg6TXw51cAom7O8DKFXgW1nujYcoZY/cHMsQJK
	VwuA==
Received: by 10.180.19.162 with SMTP id g2mr6064227wie.22.1342714327467;
	Thu, 19 Jul 2012 09:12:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.12.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:13 +0100
Message-Id: <7c586b3b9b06e0f9f50f085419083c63830b7900.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm3JufACsIaFVWrnHf2xudRU3MpRGhCDIZuJB3JCxvwLC/BeMDuISDxXTe4H8+Y3UEQqfCX
Subject: [PATCH 26/26] Remove gtk-doc
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:39 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc.bb |   19 ----------
 meta/recipes-gnome/gtk-doc/gtk-doc.m4 |   61 ---------------------------------
 2 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.bb
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.m4

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc.bb b/meta/recipes-gnome/gtk-doc/gtk-doc.bb
deleted file mode 100644
index 3147d4a..0000000
--- a/meta/recipes-gnome/gtk-doc/gtk-doc.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "API documentation generation tool for GTK+ and GNOME"
-DESCRIPTION = "gtk-doc is a tool for generating API reference documentation. \
-It is used for generating the documentation for GTK+, GLib \
-and GNOME."
-SECTION = "x11/base"
-SRC_URI = "file://gtk-doc.m4"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://../gtk-doc.m4;endline=10;md5=868a952d8bb2d825d724854cfaf8f14e"
-
-PR = "r4"
-
-ALLOW_EMPTY_${PN} = "1"
-
-BBCLASSEXTEND = "native"
-
-do_install () {
-	install -d ${D}${datadir}/aclocal/
-	install -m 0644 ${WORKDIR}/gtk-doc.m4 ${D}${datadir}/aclocal/
-}
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc.m4 b/meta/recipes-gnome/gtk-doc/gtk-doc.m4
deleted file mode 100644
index 2cfa1e7..0000000
--- a/meta/recipes-gnome/gtk-doc/gtk-doc.m4
+++ /dev/null
@@ -1,61 +0,0 @@
-dnl -*- mode: autoconf -*-
-
-# serial 1
-
-dnl Usage:
-dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
-AC_DEFUN([GTK_DOC_CHECK],
-[
-  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
-  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
-
-  dnl check for tools we added during development
-  AC_PATH_PROG([GTKDOC_CHECK],[gtkdoc-check])
-  AC_PATH_PROGS([GTKDOC_REBASE],[gtkdoc-rebase],[true])
-  AC_PATH_PROG([GTKDOC_MKPDF],[gtkdoc-mkpdf])
-
-  dnl for overriding the documentation installation directory
-  AC_ARG_WITH([html-dir],
-    AS_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
-    [with_html_dir='${datadir}/gtk-doc/html'])
-  HTML_DIR="$with_html_dir"
-  AC_SUBST([HTML_DIR])
-
-  dnl enable/disable documentation building
-  AC_ARG_ENABLE([gtk-doc],
-    AS_HELP_STRING([--enable-gtk-doc],
-                   [use gtk-doc to build documentation [[default=no]]]),,
-    [enable_gtk_doc=no])
-
-  if test x$enable_gtk_doc = xyes; then
-    ifelse([$1],[],
-      [PKG_CHECK_EXISTS([gtk-doc],,
-                        AC_MSG_ERROR([gtk-doc not installed and --enable-gtk-doc requested]))],
-      [PKG_CHECK_EXISTS([gtk-doc >= $1],,
-                        AC_MSG_ERROR([You need to have gtk-doc >= $1 installed to build $PACKAGE_NAME]))])
-  fi
-
-  AC_MSG_CHECKING([whether to build gtk-doc documentation])
-  AC_MSG_RESULT($enable_gtk_doc)
-
-  dnl enable/disable output formats
-  AC_ARG_ENABLE([gtk-doc-html],
-    AS_HELP_STRING([--enable-gtk-doc-html],
-                   [build documentation in html format [[default=yes]]]),,
-    [enable_gtk_doc_html=yes])
-    AC_ARG_ENABLE([gtk-doc-pdf],
-      AS_HELP_STRING([--enable-gtk-doc-pdf],
-                     [build documentation in pdf format [[default=no]]]),,
-      [enable_gtk_doc_pdf=no])
-
-  if test -z "$GTKDOC_MKPDF"; then
-    enable_gtk_doc_pdf=no
-  fi
-
-
-  AM_CONDITIONAL([ENABLE_GTK_DOC], [test x$enable_gtk_doc = xyes])
-  AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [test x$enable_gtk_doc_html = xyes])
-  AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [test x$enable_gtk_doc_pdf = xyes])
-  AM_CONDITIONAL([GTK_DOC_USE_LIBTOOL], [test -n "$LIBTOOL"])
-  AM_CONDITIONAL([GTK_DOC_USE_REBASE], [test -n "$GTKDOC_REBASE"])
-])
-- 
1.7.10



