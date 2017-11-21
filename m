Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCA1787EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 20:01:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id l24so10609566pfj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E/34rIbrdC4aj8fR16g9RPeG49wPm9WSBCdusSnDFzQ=;
	b=sNntkaF6+5WAFq8fPIpZ5otGD3Ll/LyhFXXPRUq75WQaISd/mFufjyD0TTFDRL2hvq
	0Oa5zWj1iZ/O4DnvM3DLpCKNuY6uJuQZ/jGP16xSgZiZKRbx+ByKX7HJJUb56SR4GuVV
	9kO1xSbmyTeLPGfW411K7dFwPFwpqdV5MgmKtgj5w3vBtF/iEeUiXW9SL24Bk8ibpdDF
	YZbOgirzRECJe6B4E5+gFQ1iiC2kEfLfFqyEO0fU9CNyS//+6PQ5lsItD+T6OjbnUeBL
	9oy1deIvw7lBViYMNSu21IN5H7C4WcLuoBnNZIV7odYvslj2uAGwvU1axzq0gcBMGGAg
	kbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E/34rIbrdC4aj8fR16g9RPeG49wPm9WSBCdusSnDFzQ=;
	b=QwbZURH2R/pc76lXa9p9Z/TXC90CaurZYRtEuv6NK791+ZpPTjKf5vY0bVT0C8aILW
	bwxIuntT9r1T+u7ZAz38byzj+nlT5HCE3ZLHUZYoxs8i9DtGtotrUWScaej1F0uVxVdk
	mZUVLrPaxuaJwAA4K3tl9hVIb51lAT2BkwO6IIY9pF94Jtd7ANHYv5e3GXUGrzr9T+C4
	U2E2ychI/oR7cLuHZXyaehaCQXnFi9hP7k3rvzVsfCWa8sv3naqUWp1Ubyg23RLtIKiN
	bCW2JdcJx21U2FehWjCf+yjdyfJQxaUPdGMNfgG7Bc3Mv8ymBX3EMTsmZOblIDdmWOJ7
	O8xA==
X-Gm-Message-State: AJaThX42I3ZOfP6EVDEB9h8T3F4X/d0LmNB/OJRs3CYbk+kNmBqNnW3a
	RjeGeiYb1suE94T7Ux7w1hSMcg==
X-Google-Smtp-Source: AGs4zMZKQDVM9Gj0TKwIQoEF7ocJoFnvmyS4RNHXtXud/3YnM087EgnCaUJHdwaswUnTxBm9Da361w==
X-Received: by 10.159.216.152 with SMTP id s24mr13118430plp.46.1511294503309; 
	Tue, 21 Nov 2017 12:01:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	d28sm26770154pfb.105.2017.11.21.12.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Nov 2017 12:01:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 12:01:32 -0800
Message-Id: <68571a23c7230fd6bbd97d4ea9d52c3756839795.1511294278.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511294278.git.akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
Subject: [PATCH 1/5] gnutls: update to 3.6.1
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
X-List-Received-Date: Tue, 21 Nov 2017 20:01:42 -0000

zlib configure.ac support removed in  3.6.1
drop patch

v2: actually remove patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  3 +-
 .../gnutls/use-pkg-config-to-locate-zlib.patch     | 75 ----------------------
 .../gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb}   |  5 +-
 3 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} (45%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 29b5dd6..7bcb913 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -21,7 +21,7 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn zlib"
+PACKAGECONFIG ??= "libidn"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
@@ -32,7 +32,6 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
     --enable-doc \
diff --git a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
deleted file mode 100644
index ae141a5..0000000
--- a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 18081068a97c00015aabc5fa321664951458ea0d Mon Sep 17 00:00:00 2001
-From: Fan Xin <fan.xin@jp.fujitsu.com>
-Date: Fri, 9 Jun 2017 15:20:31 +0900
-Subject: [PATCH] From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17
- 00:00:00 2001 From: Andre McCurdy <armccurdy@gmail.com> Date: Tue, 26 May
- 2015 21:41:24 -0700 Subject: [PATCH] use pkg-config to locate zlib
-
-AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
-robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
-instead.
-
-Removing AC_LIB_HAVE_LINKFLAGS for zlib also removes the --with-libz-prefix
-configure option. If zlib support is enabled, then failure to find zlib via
-pkg-config is now treated as a fatal error.
-
-Change based on ChromeOS gnutls 2.12.23 cross-compile fixes patch:
-
-  https://chromium-review.googlesource.com/#/c/271661/
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Rebase on gnutls 3.5.13
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- configure.ac | 25 +++++++++----------------
- 1 file changed, 9 insertions(+), 16 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c65268e..f6a18aa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -735,28 +735,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
- AC_MSG_CHECKING([whether to include zlib compression support])
- if test x$ac_zlib != xno; then
-  AC_MSG_RESULT(yes)
-- AC_LIB_HAVE_LINKFLAGS(z,, [#include <zlib.h>], [compress (0, 0, 0, 0);])
-- if test x$ac_cv_libz != xyes; then
--   AC_MSG_WARN(
--*** 
--*** ZLIB was not found. You will not be able to use ZLIB compression.)
-- fi
- else
-  AC_MSG_RESULT(no)
- fi
- 
--PKG_CHECK_EXISTS(zlib, ZLIB_HAS_PKGCONFIG=y, ZLIB_HAS_PKGCONFIG=n)
--
- if test x$ac_zlib != xno; then
--  if test "$ZLIB_HAS_PKGCONFIG" = "y" ; then
--    if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
--      GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
--    else
--      GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
--    fi
--    LIBZ_PC=""
-+  PKG_CHECK_MODULES(ZLIB, zlib)
-+  HAVE_LIBZ=yes
-+  AC_DEFINE([HAVE_LIBZ], [1], [zlib is enabled])
-+  AC_SUBST(HAVE_LIBZ)
-+  LTLIBZ=$ZLIB_LIBS
-+  AC_SUBST(LTLIBZ)
-+  if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
-+    GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
-   else
--    LIBZ_PC=$LIBZ
-+    GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
-   fi
- fi
- AC_SUBST(LIBZ_PC)
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.16.bb b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
similarity index 45%
rename from meta/recipes-support/gnutls/gnutls_3.5.16.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.1.bb
index 635c519..7624a20 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.16.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
@@ -1,10 +1,9 @@
 require gnutls.inc
 
 SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
-            file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "4c39612f1ec3ef7ed79cfb8936fa8143"
-SRC_URI[sha256sum] = "0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25"
+SRC_URI[md5sum] = "4b65ae3ffef59f3eeed51a6166ff12b3"
+SRC_URI[sha256sum] = "20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


