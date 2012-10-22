Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQFrK-0006Iv-Bd
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:07:51 +0200
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 03:54:23 -0700
Received: by mail-ea0-f197.google.com with SMTP id i1so1861879eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 03:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0s4vOgnlPVxRsufqcU0s796itBC+07g1Aa0XRysE0PM=;
	b=PNlqJw+c7hx++Pq4ChobqGRihnHI4UDN8j5mss8PncoXLjgeE98AADjBjFJ1UCGfs4
	Ff6dkh29f3WaLEjQXLz8c2/R557+v5guOuuPrufk4aW8sZCYV3xG2y81qUSDf8bpervr
	kwLx1zfA+5wK3MdY/t0u8UxhVuRIIF4d3JaXDhV9Ab0eNvuetkwhAruuRVbh39UowfBh
	36W82Dq9a2kTLL0640ibWqPdLC5I6T51GP/Jv03rrOQRfBXY2N6kwIJ2QB3ALaVY5KP0
	WnTI+g9pyH1nqH24ykIWp/ecqpXpSznpUtWOHK2C4Obb3U8hbRMgVzBNJqmtMoAEm32G
	CJfw==
Received: by 10.216.74.13 with SMTP id w13mr5613617wed.101.1350903262017;
	Mon, 22 Oct 2012 03:54:22 -0700 (PDT)
Received: by 10.216.74.13 with SMTP id w13mr5613607wed.101.1350903261648;
	Mon, 22 Oct 2012 03:54:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm50675173wiv.11.2012.10.22.03.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 03:54:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 11:53:05 +0100
Message-Id: <1350903186-20334-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
References: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmxeekp0DU03k0C/U5dbskEPbMXSE3zHcz2u9r7Xfkf2soaNHKnnhuzALteWEU0Ry1Bdn6TUqB5qV2+5HvhewhqrLBFcAJJdVTCQqpWT9Hol113ZK+x/iiF+x8csr3m1dWJ/NPjavtMqlMymPG8aYTyZElSZ9MaoqGcz5D1dOCKD7WBiVfTpF3vFaihFr6T8hfH1cCv
Subject: [PATCH 2/3] evolution-data-server: remove
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
X-List-Received-Date: Mon, 22 Oct 2012 11:07:51 -0000

Remove evolution-data-server, this is now maintained in meta-oe/meta-gnome and
is not needed by the GMAE SDK anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../avoid_automake_errors.patch                    |   83 --------
 .../eds/evolution-data-server/depbuildfix.patch    |   78 --------
 .../fix_for_automake-1.12.x.patch                  |   28 ---
 .../eds/evolution-data-server/iconv-detect.h       |    5 -
 .../evolution-data-server/new-contact-fix.patch    |   23 ---
 .../eds/evolution-data-server/nossl.patch          |   70 -------
 .../eds/evolution-data-server/oh-contact.patch     |  203 --------------------
 .../eds/evolution-data-server/old-gdk-api.patch    |   19 --
 .../optional_imapx_provider.patch                  |   64 ------
 meta/recipes-sato/eds/evolution-data-server_git.bb |  111 -----------
 10 files changed, 684 deletions(-)
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/nossl.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
 delete mode 100644 meta/recipes-sato/eds/evolution-data-server_git.bb

diff --git a/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch b/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
deleted file mode 100644
index ebf00c3..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Avoid these warning-errors
-
-automake: warnings are treated as errors
-Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
-Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-addressbook/backends/file/Makefile.am: installing './depcomp'
-addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX variable name
-addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
-addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-addressbook/libedata-book/Makefile.am:2: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:3: warning: subst -,_,$*: non-POSIX variable name
-addressbook/libedata-book/Makefile.am:3: (probably a GNU make extension)
-glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
-addressbook/libedata-book/Makefile.am:86: warning: '%'-style pattern rules are a GNU make extension
-addressbook/libedata-book/Makefile.am:101: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-calendar/backends/weather/Makefile.am:44: warning: '%'-style pattern rules are a GNU make extension
-calendar/libecal/Makefile.am:53: warning: '%'-style pattern rules are a GNU make extension
-calendar/libecal/Makefile.am:61: warning: '%'-style pattern rules are a GNU make extension
-calendar/libecal/Makefile.am:62: warning: subst -,_,$*: non-POSIX variable name
-calendar/libecal/Makefile.am:62: (probably a GNU make extension) calendar/libecal/Makefile.am:68: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-calendar/libedata-cal/Makefile.am:5: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:6: warning: subst -,_,$*: non-POSIX variable name
-calendar/libedata-cal/Makefile.am:6: (probably a GNU make extension)
-glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
-calendar/libedata-cal/Makefile.am:71: warning: '%'-style pattern rules are a GNU make extension
-calendar/libedata-cal/Makefile.am:86: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-camel/Makefile.am:17: warning: '%'-style pattern rules are a GNU make extension
-libebackend/Makefile.am:35: warning: '%'-style pattern rules are a GNU make extension
-libebackend/Makefile.am:41: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-libedataserver/Makefile.am:91: warning: '%'-style pattern rules are a GNU make extension
-libedataserver/Makefile.am:97: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-libedataserverui/Makefile.am:108: warning: '%'-style pattern rules are a GNU make extension
-libedataserverui/Makefile.am:118: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-servers/google/libgdata-google/Makefile.am:27: warning: '%'-style pattern rules are a GNU make extension
-servers/google/libgdata-google/Makefile.am:33: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-servers/google/libgdata/Makefile.am:31: warning: '%'-style pattern rules are a GNU make extension
-servers/google/libgdata/Makefile.am:37: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a GNU make extension
-servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
-autoreconf: automake failed with exit status: 1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
- dnl Autoconf / Automake Initialization
- AC_PREREQ(2.58)
- AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
--AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall -Werror foreign])
-+AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall foreign])
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_SRCDIR(README)
- AC_CONFIG_HEADERS(config.h)
diff --git a/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch b/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
deleted file mode 100644
index 0785a93..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/depbuildfix.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
-build failures. Also resolve other deprecation issues.
-
-RP 2011/10/12
-
-Upstream-Status: Pending
-
-Index: git/libedataserver/e-data-server-util.c
-===================================================================
---- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622045788 +0100
-+++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.732045664 +0100
-@@ -165,7 +165,8 @@
- static gunichar
- stripped_char (gunichar ch)
- {
--        gunichar *decomp, retval;
-+        gunichar decomp[4];
-+        gunichar retval;
-         GUnicodeType utype;
-         gsize dlen;
- 
-@@ -175,7 +176,7 @@
-         case G_UNICODE_CONTROL:
-         case G_UNICODE_FORMAT:
-         case G_UNICODE_UNASSIGNED:
--        case G_UNICODE_COMBINING_MARK:
-+        case G_UNICODE_SPACING_MARK:
-                 /* Ignore those */
-                 return 0;
-                break;
-@@ -183,7 +184,7 @@
-                 /* Convert to lowercase, fall through */
-                 ch = g_unichar_tolower (ch);
-         case G_UNICODE_LOWERCASE_LETTER:
--                if ((decomp = g_unicode_canonical_decomposition (ch, &dlen))) {
-+                if ((dlen = g_unichar_fully_decompose (ch, FALSE, decomp, 4))) {
-                         retval = decomp[0];
-                         g_free (decomp);
-                         return retval;
-Index: git/addressbook/libedata-book/e-data-book-factory.c
-===================================================================
---- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:52:25.692045500 +0100
-+++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53:31.862045707 +0100
-@@ -238,7 +238,7 @@
- 	return g_strdup_printf (
- 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
- 		getpid (),
--		g_atomic_int_exchange_and_add (&counter, 1));
-+		g_atomic_int_add (&counter, 1));
- }
- 
- static void
-Index: git/addressbook/libedata-book/e-data-book.c
-===================================================================
---- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40.752045465 +0100
-+++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.012045897 +0100
-@@ -553,7 +553,7 @@
- 
- 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/BookView/%d/%d",
- 				getpid (),
--				g_atomic_int_exchange_and_add ((int*)&counter, 1));
-+				g_atomic_int_add ((int*)&counter, 1));
- }
- 
- static void
-Index: git/calendar/libedata-cal/e-data-cal-factory.c
-===================================================================
---- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:56.612045081 +0100
-+++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.832045211 +0100
-@@ -227,7 +227,7 @@
- 	return g_strdup_printf (
- 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
- 		getpid (),
--		g_atomic_int_exchange_and_add (&counter, 1));
-+		g_atomic_int_add (&counter, 1));
- }
- 
- static void
diff --git a/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch b/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
deleted file mode 100644
index ac77a6d..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Fixed these kinds if warning-errors
-
-warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -17,6 +17,7 @@ dnl This number is meaningless, but we'r
- dnl library names for backward compatibility.
- m4_define([api_version], [1.2])
- 
-+
- dnl Autoconf / Automake Initialization
- AC_PREREQ(2.58)
- AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
-@@ -30,6 +31,7 @@ AC_LANG(C)
- 
- dnl Automake 1.11 - Silent Build Rules
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
- 
- dnl Required Package Versions
- m4_define([glib_minimum_version], [2.16.1])
diff --git a/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h b/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
deleted file mode 100644
index 46f476d..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/iconv-detect.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* This is an auto-generated header, DO NOT EDIT! */
-
-#define ICONV_ISO_D_FORMAT "iso-%d-%d"
-#define ICONV_ISO_S_FORMAT "iso-%d-%s"
-#define ICONV_10646 "iso-10646"
diff --git a/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch b/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
deleted file mode 100644
index 22c293d..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/new-contact-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-When contacts called for the 1st time, adding new contact always failed but
-worked after restart. The reason is e-addressbook-factory used to handle
-addressbook leads a segmentation fault. Root cause is that factory would create
-the data base if not exist, but use it without proper initialization.
-
-This patch fix it.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
-Index: git/addressbook/backends/file/e-book-backend-file.c
-===================================================================
---- git.orig/addressbook/backends/file/e-book-backend-file.c	2010-10-20 16:14:31.000000000 +0800
-+++ git/addressbook/backends/file/e-book-backend-file.c	2010-10-22 14:11:47.000000000 +0800
-@@ -1217,6 +1217,8 @@
- 				EContact *contact = NULL;
- 				EBookBackendSyncStatus status;
- 
-+				/* Initialize file_db, or else following do_create cause seg fault */
-+				bf->priv->file_db = db;
- 				status = do_create (bf, XIMIAN_VCARD, &contact);
- 				if (status != GNOME_Evolution_Addressbook_Success)
- 					g_warning ("Cannot create default contact: %d", status);
diff --git a/meta/recipes-sato/eds/evolution-data-server/nossl.patch b/meta/recipes-sato/eds/evolution-data-server/nossl.patch
deleted file mode 100644
index 67b6d07..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/nossl.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: git/camel/Makefile.am
-===================================================================
---- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
-+++ git/camel/Makefile.am	2010-02-05 15:25:20.000000000 +0000
-@@ -80,7 +80,6 @@
- 	camel-store-summary.c			\
- 	camel-store.c				\
- 	camel-tcp-stream-raw.c			\
--	camel-tcp-stream-ssl.c			\
- 	camel-tcp-stream.c			\
- 	camel-transport.c			\
- 	camel-uid-cache.c			\
-@@ -133,7 +132,6 @@
- 	camel-store-summary.h			\
- 	camel-store.h				\
- 	camel-tcp-stream-raw.h			\
--	camel-tcp-stream-ssl.h			\
- 	camel-tcp-stream.h			\
- 	camel-transport.h			\
- 	camel-uid-cache.h			\
-Index: git/camel/camel.h
-===================================================================
---- git.orig/camel/camel.h	2010-02-05 15:26:30.000000000 +0000
-+++ git/camel/camel.h	2010-02-05 15:26:52.000000000 +0000
-@@ -122,7 +122,6 @@
- #include <camel/camel-string-utils.h>
- #include <camel/camel-tcp-stream.h>
- #include <camel/camel-tcp-stream-raw.h>
--#include <camel/camel-tcp-stream-ssl.h>
- #include <camel/camel-text-index.h>
- #include <camel/camel-transport.h>
- #include <camel/camel-trie.h>
-Index: git/camel/providers/imap/camel-imap-store.c
-===================================================================
---- git.orig/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:19.000000000 +0000
-+++ git/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:38.000000000 +0000
-@@ -51,7 +51,6 @@
- #include "camel/camel-stream.h"
- #include "camel/camel-string-utils.h"
- #include "camel/camel-tcp-stream-raw.h"
--#include "camel/camel-tcp-stream-ssl.h"
- #include "camel/camel-url.h"
- #include "camel/camel-utf8.h"
- 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-02-05 15:31:59.000000000 +0000
-+++ git/configure.ac	2010-02-05 15:33:00.000000000 +0000
-@@ -1272,7 +1272,8 @@
- dnl We have fixed all our instances to use <libical/ical.h>. Until the .pc from
- dnl libical is fixed, we have to work-around the buggy CFlags.
- dnl *****
--	LIBICAL_EXTRA_CFLAGS=" -I`$PKG_CONFIG --variable=includedir libical` "
-+	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
-+	LIBICAL_EXTRA_CFLAGS=" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includedir libical` "
- 	LIBICAL_EXTRA_LIBS=""
- 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
- 	AC_SUBST(LIBICAL_EXTRA_LIBS)
-Index: git/calendar/libecal/libecal.pc.in
-===================================================================
---- git.orig/calendar/libecal/libecal.pc.in	2010-02-05 15:39:41.000000000 +0000
-+++ git/calendar/libecal/libecal.pc.in	2010-02-05 15:39:55.000000000 +0000
-@@ -12,4 +12,4 @@
- Version: @VERSION@
- Requires: libical >= @LIBICAL_REQUIRED@ libedataserver-1.2 dbus-glib-1
- Libs: -L${libdir} -lecal-1.2
--Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
-+Cflags: -I${privincludedir}
diff --git a/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch b/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
deleted file mode 100644
index b746044..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/oh-contact.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Replace the Novell sample contact with something more appropriate
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: addressbook/libedata-book/ximian-vcard.h
-===================================================================
---- addressbook/libedata-book/ximian-vcard.h.orig	2011-12-19 13:58:29.058859231 +0000
-+++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 14:41:48.678918549 +0000
-@@ -1,80 +1,105 @@
- #define XIMIAN_VCARD \
- "BEGIN:VCARD\n" \
--"X-EVOLUTION-FILE-AS:Novell Ximian Group\n" \
--"ADR;TYPE=WORK:;Suite 500;8 Cambridge Center;Cambridge;MA;02142;USA\n" \
--"LABEL;TYPE=WORK:8 Cambridge Center, Suite 500\\nCambridge\\, MA\\n02142\\nUSA\n" \
--"TEL;WORK;VOICE:(617) 613-2000\n" \
--"TEL;WORK;FAX:(617) 613-2001\n" \
--"EMAIL;INTERNET:hello@ximian.com\n" \
--"URL:http://www.ximian.com/\n" \
--"ORG:Novell;Ximian Group\n" \
--"PHOTO;ENCODING=b;TYPE=JPEG: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\n" \
-+"VERSION:3.0\n" \
-+"FN:Yocto Project\n" \
-+"URL:http://www.yoctoproject.org/\n" \
-+"EMAIL:yocto@yoctoproject.org\n" \
-+"TEL;TYPE=VOICE:+00 000 000 0000\n" \
-+"ADR;TYPE=HOME:;1720 Beaver Creek;Dam #4;Planet Earth\n" \
-+"LABEL:1720 Beaver Creek\\nDam #4\\nPlanet Earth\n" \
-+"PHOTO;ENCODING=b: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\n" \
- "END:VCARD"
-Index: addressbook/backends/file/Makefile.am
-===================================================================
---- addressbook/backends/file/Makefile.am.orig	2011-12-19 13:58:28.954859229 +0000
-+++ addressbook/backends/file/Makefile.am	2011-12-19 13:58:31.442859286 +0000
-@@ -2,6 +2,7 @@
- 
- libebookbackendfile_la_CPPFLAGS = \
- 	$(AM_CPPFLAGS)					\
-+	-DCREATE_DEFAULT_VCARD \
- 	-DG_LOG_DOMAIN=\"libebookbackend\"		\
- 	-I$(top_srcdir)					\
- 	-I$(top_builddir)				\
diff --git a/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch b/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
deleted file mode 100644
index 7ef2956..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/old-gdk-api.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Do not disable old API after upgrading gtk+.
-This avoid build error due to defination missing.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
-+++ git/configure.ac	2010-12-16 10:25:58.000000000 +0800
-@@ -147,7 +147,6 @@
- AS_COMPILER_FLAGS(WARNING_FLAGS,
- 	"-DG_DISABLE_DEPRECATED
- 	-DPANGO_DISABLE_DEPRECATED
--	-DGDK_DISABLE_DEPRECATED
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED
- 	-DG_DISABLE_SINGLE_INCLUDES
- 	-DGTK_DISABLE_SINGLE_INCLUDES
diff --git a/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch b/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
deleted file mode 100644
index d9b0940..0000000
--- a/meta/recipes-sato/eds/evolution-data-server/optional_imapx_provider.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: git/camel/providers/Makefile.am
-===================================================================
---- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +0800
-+++ git/camel/providers/Makefile.am	2010-07-08 17:23:56.000000000 +0800
-@@ -6,6 +6,10 @@
- IMAP4_DIR=imap4
- endif
- 
-+if ENABLE_IMAPX
-+IMAPX_DIR=imapx
-+endif
-+
- if ENABLE_HULA
- HULA_DIR=hula
- endif
-@@ -15,6 +19,6 @@
- SENDMAIL_DIR=sendmail
- endif
- 
--SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap imapx $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
-+SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap $(IMAPX_DIR) $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
- 
- -include $(top_srcdir)/git.mk
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-07-08 17:24:36.000000000 +0800
-+++ git/configure.ac	2010-07-08 17:32:06.000000000 +0800
-@@ -1002,6 +1002,26 @@
- AM_CONDITIONAL(ENABLE_IMAP4, [test x$enable_imap4 = xyes])
- 
- dnl ******************************
-+dnl IMAPX code support.
-+dnl ******************************
-+AC_ARG_ENABLE(imapx,
-+	AS_HELP_STRING([--enable-imapx=no/yes],
-+	[Attempt to compile yet another, incomplete, very unsupported IMAPv4r1 implementation]),
-+	[],[enable_imapx=no])
-+
-+if test "x$enable_imapx" = "xyes"; then
-+	AC_DEFINE(ENABLE_IMAPX,1,[Really don't try this at home])
-+	AC_PATH_PROG(GPERF, gperf)
-+	if test -z "$GPERF" ; then
-+	AC_MSG_ERROR([You need gperf to compile imapx provider])
-+	fi
-+	msg_imapx=yes
-+else
-+	msg_imapx=no
-+fi
-+AM_CONDITIONAL(ENABLE_IMAPX, [test x$enable_imapx = xyes])
-+
-+dnl ******************************
- dnl Hula support
- dnl ******************************
- AC_ARG_ENABLE([hula],
-@@ -1541,3 +1561,7 @@
- if test "x$msg_hula" = "xyes"; then
- 	echo "Hula support:	$msg_hula"
- fi
-+
-+if test "x$msg_imapx" = "xyes"; then
-+	echo "IMAPX support:	$msg_imapx"
-+fi
diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
deleted file mode 100644
index c114c0e..0000000
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ /dev/null
@@ -1,111 +0,0 @@
-DESCRIPTION = "Evolution database backend server"
-HOMEPAGE = "http://www.gnome.org/projects/evolution/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
-                    file://camel/camel.h;endline=24;md5=b02175c88f821224746b347a89731a2b \
-                    file://libedataserver/e-data-server-util.h;endline=23;md5=9df8127bd8cfdc5469e938fc710d1f40 \
-                    file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"
-
-DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
-
-SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
-
-PV = "2.30+git${SRCPV}"
-PR = "r2"
-
-SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
-           file://oh-contact.patch;striplevel=0 \
-           file://nossl.patch \
-           file://optional_imapx_provider.patch \
-           file://new-contact-fix.patch \
-           file://old-gdk-api.patch \
-           file://depbuildfix.patch \
-           file://fix_for_automake-1.12.x.patch \
-           file://avoid_automake_errors.patch \
-           file://iconv-detect.h"
-
-S = "${WORKDIR}/git"
-
-inherit autotools gtk-doc pkgconfig
-
-# -ldb needs this on some platforms
-LDFLAGS += "-lpthread"
-
-# Parallel make shows many issues with this source code.
-# Current problems seem to be duplicate execution of the calander/backends
-# directories by make resulting in truncated/corrupt .la files
-#PARALLEL_MAKE = ""
-
-do_configure_append () {
-        cp ${WORKDIR}/iconv-detect.h ${S}
-        sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
-}
-
-EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
-                --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-smime --disable-ssl --disable-nntp --without-weather"
-
-PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
-             libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
-             libedataserver libedataserver-dev \
-             libedataserverui libedataserverui-dev"
-
-FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
-FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
-FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
-                    ${libdir}/evolution-data-server*/extensions/.debug/"
-RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
-
-FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
-                  ${libdir}/libcamel-provider-*.so.* \
-                  ${libdir}/evolution-data-server-*/camel-providers/*.so \
-                  ${libdir}/evolution-data-server-*/camel-providers/*.urls"
-FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
-                      ${libdir}/pkgconfig/camel*pc \
-                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
-                      ${includedir}/evolution-data-server*/camel"
-
-FILES_libebook = "${libdir}/libebook-*.so.*"
-FILES_libebook-dev = "${libdir}/libebook-1.2.so \
-                      ${libdir}/pkgconfig/libebook-*.pc \
-                      ${includedir}/evolution-data-server*/libebook/*.h"
-RRECOMMENDS_libebook = "libedata-book"
-
-FILES_libecal = "${libdir}/libecal-*.so.* \
-                 ${datadir}/evolution-data-server-1.4/zoneinfo"
-FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
-                     ${includedir}/evolution-data-server*/libecal/*.h \
-                     ${includedir}/evolution-data-server*/libical/*.h"
-RRECOMMENDS_libecal = "libedata-cal tzdata"
-
-FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
-                       ${datadir}/dbus-1/services/*.AddressBook.service \
-                       ${libdir}/libedata-book-*.so.* \
-                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
-                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
-FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
-                           ${libdir}/pkgconfig/libedata-book-*.pc \
-                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
-                           ${includedir}/evolution-data-server-*/libedata-book"
-
-FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
-                      ${datadir}/dbus-1/services/*.Calendar.service \
-                      ${libdir}/libedata-cal-*.so.* \
-                      ${libdir}/evolution-data-server-*/extensions/libecal*.so"
-FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
-                          ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal \
-                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
-
-FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
-FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
-                            ${libdir}/pkgconfig/libedataserver-*.pc \
-                            ${includedir}/evolution-data-server-*/libedataserver/*.h"
-
-FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution-data-server-1.4/glade/*.glade"
-FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
-                              ${libdir}/pkgconfig/libedataserverui-*.pc \
-                              ${includedir}/evolution-data-server-*/libedataserverui/*.h"
-
-- 
1.7.10



