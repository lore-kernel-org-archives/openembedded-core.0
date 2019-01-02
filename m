Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7B16BC15
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t13so14778250pgr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vGLt9mRjL9H5F39nybd9zseGJQi+T2mG1AVq4kqlRiw=;
	b=i9gMEuegXwBapbpqw+MlQE74MI8QSwezeo9pxgDv1lJS+Ltch3enAhAEt01CX9QZz6
	pcScuoxh7YVBi1kw7Od2xAywvkDMQse8i7tkkc1Za7XKfaFaWvp6ApAATRFgsWfNnrQ3
	Rj3Zq+/S9hI2LYsscMI1+WbEmqg4KgfJwEULaQ+QpLfCEuLdxXgzmtBtuqPE66UYHFhP
	6rtUjgZjxdwzM0DX9mxzHXjGrvu+coFVHiCeI3/OB5OYqX4pLnyuwY13ZAt2NsXOAzdX
	5RetALHJXO6Q1oixlxxHaau/umc+P2ilZPEALXYXDkk2ON5v3PvBBAaoBVsndgVcfzjM
	W0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vGLt9mRjL9H5F39nybd9zseGJQi+T2mG1AVq4kqlRiw=;
	b=LlgNqJp4iM6NWRPx3aVMx65uidetGopRp0/bJeXBpH/hk3SKX5128A1LE5o8QH6Rvg
	G5iGnIQVhFGesrFw/S27KFkKsyTvPuGcsZesCuCQI0wCQgZg3Sydlpi1ZGNazPnWSFzq
	5MGm8kgd5DhlKFb9EdAddwRJ2ekD3mjOlv2pvh7jeFDcLZrmALEYFgQJPG3CkJuo/q5N
	EOsq8knxf146IoF5Aut+ts16od8Qofda5YHuGRBojDC1Rq9cHALgUiw4dc6/MWV7ShBD
	jtCLx0L0YK44uKqa7KB2bjdjQV72I2NRLPtdaMK7rOUiZiinsyuQoDKdelNKeMRv4MDy
	Gmfg==
X-Gm-Message-State: AJcUukdqfpFY3rRyCPyQq1unNYt/jwVK1LT00jSQeHSFE0a+kiVRRGh7
	qocD6S4AD1U2vkWcJyYGmX6fcr9V
X-Google-Smtp-Source: ALg8bN5qw0g7BlNKb7u7S5mpPrSN8t0O+Lf6YP/PJVh7HzU3EwocHglE88SO9mw46/apcRH3g0ZcPQ==
X-Received: by 2002:a63:561b:: with SMTP id k27mr14070888pgb.271.1546446984456;
	Wed, 02 Jan 2019 08:36:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:16 -0800
Message-Id: <1546446977-27510-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 7/8] libassuan: update to 2.5.2
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:23 -0000

Refresh patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libassuan-add-pkgconfig-support.patch          | 105 ++++++++-------------
 .../{libassuan_2.5.1.bb => libassuan_2.5.2.bb}     |   4 +-
 2 files changed, 39 insertions(+), 70 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.1.bb => libassuan_2.5.2.bb} (88%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index 525b076..0e81454 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -9,60 +9,11 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 forward ported to 2.4.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
-Index: libassuan-2.4.4/libassuan.pc.in
+Index: libassuan-2.5.2/src/libassuan.m4
 ===================================================================
---- /dev/null
-+++ libassuan-2.4.4/libassuan.pc.in
-@@ -0,0 +1,13 @@
-+prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+api_version=@LIBASSUAN_CONFIG_API_VERSION@
-+host=@LIBASSUAN_CONFIG_HOST@
-+
-+Name: libassuan
-+Description: IPC library used by GnuPG and GPGME
-+Requires:
-+Version: @VERSION@
-+Libs: -L${libdir} -lassuan
-+Libs.private: -lgpg-error
-+Cflags: -I${includedir}
-Index: libassuan-2.4.4/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -25,10 +25,13 @@ DISTCHECK_CONFIGURE_FLAGS = --enable-doc
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
- GITLOG_TO_CHANGELOG=gitlog-to-changelog
- 
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = libassuan.pc
-+
- EXTRA_DIST = autogen.sh autogen.rc README.GIT VERSION                   \
-              ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
-              tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
--             build-aux/git-log-footer build-aux/git-log-fix
-+             build-aux/git-log-footer build-aux/git-log-fix libassuan.pc.in
- 
- if BUILD_DOC
- doc = doc
-Index: 2.4.4-r0/libassuan-2.4.4/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -485,6 +485,7 @@ AC_CONFIG_FILES([doc/Makefile])
- AC_CONFIG_FILES([tests/Makefile])
- AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
- AC_CONFIG_FILES([src/versioninfo.rc])
-+AC_CONFIG_FILES([libassuan.pc])
- 
- AC_OUTPUT
- 
-Index: libassuan-2.4.4/src/libassuan.m4
-===================================================================
---- a/src/libassuan.m4
-+++ b/src/libassuan.m4
-@@ -16,18 +16,6 @@ dnl Returns ok set to yes or no.
+--- libassuan-2.5.2.orig/src/libassuan.m4
++++ libassuan-2.5.2/src/libassuan.m4
+@@ -16,27 +16,6 @@ dnl Returns ok set to yes or no.
  dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -71,24 +22,32 @@ Index: libassuan-2.4.4/src/libassuan.m4
 -                             [prefix where LIBASSUAN is installed (optional)]),
 -     libassuan_config_prefix="$withval", libassuan_config_prefix="")
 -  if test x$libassuan_config_prefix != x ; then
--    libassuan_config_args="$libassuan_config_args --prefix=$libassuan_config_prefix"
 -    if test x${LIBASSUAN_CONFIG+set} != xset ; then
 -      LIBASSUAN_CONFIG=$libassuan_config_prefix/bin/libassuan-config
 -    fi
 -  fi
 -
--  AC_PATH_TOOL(LIBASSUAN_CONFIG, libassuan-config, no)
+-  use_gpgrt_config=""
+-  if test x"${LIBASSUAN_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG libassuan --exists; then
+-      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
+-      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    AC_PATH_PROG(LIBASSUAN_CONFIG, libassuan-config, no)
+-  fi
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -38,51 +26,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -47,58 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
 -  AC_MSG_CHECKING(for LIBASSUAN - version >= $min_libassuan_version)
 -  ok=no
--  if test "$LIBASSUAN_CONFIG" != "no" \
--     && test -f "$LIBASSUAN_CONFIG" ; then
+-  if test "$LIBASSUAN_CONFIG" != "no"; then
 -    req_major=`echo $min_libassuan_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
 -    req_minor=`echo $min_libassuan_version | \
@@ -96,7 +55,11 @@ Index: libassuan-2.4.4/src/libassuan.m4
 -    req_micro=`echo $min_libassuan_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
 -
--    libassuan_config_version=`$LIBASSUAN_CONFIG --version`
+-    if test -z "$use_gpgrt_config"; then
+-      libassuan_config_version=`$LIBASSUAN_CONFIG --version`
+-    else
+-      libassuan_config_version=`$LIBASSUAN_CONFIG --modversion`
+-    fi
 -    major=`echo $libassuan_config_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
 -    minor=`echo $libassuan_config_version | \
@@ -130,26 +93,32 @@ Index: libassuan-2.4.4/src/libassuan.m4
  
    if test $ok = yes; then
      if test "$req_libassuan_api" -gt 0 ; then
-       tmp=`$LIBASSUAN_CONFIG --api-version 2>/dev/null || echo 0`
+-      if test -z "$use_gpgrt_config"; then
+-        tmp=`$LIBASSUAN_CONFIG --api-version 2>/dev/null || echo 0`
+-      else
+-        tmp=`$LIBASSUAN_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-      fi
 +      tmp=`$PKG_CONFIG --variable=api_version libassuan`
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -97,7 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
- 
+@@ -114,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
    if test $ok = yes; then
      if test x"$host" != x ; then
--      libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
-+      libassuan_config_host=`$PKG_CONFIG --variable=host libassuan`
+       if test -z "$use_gpgrt_config"; then
+-        libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
+-      else
+-        libassuan_config_host=`$LIBASSUAN_CONFIG --variable=host 2>/dev/null || echo none`
++        libassuan_config_host=`$PKG_CONFIG --variable=host libassuan`
+       fi
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -138,12 +87,8 @@ dnl
+@@ -158,12 +88,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
--    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG $libassuan_config_args --cflags`
--    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG $libassuan_config_args --libs`
+-    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
+-    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
      ifelse([$2], , :, [$2])
    else
 -    LIBASSUAN_CFLAGS=""
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.1.bb b/meta/recipes-support/libassuan/libassuan_2.5.2.bb
similarity index 88%
rename from meta/recipes-support/libassuan/libassuan_2.5.1.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.2.bb
index 34d5f16..515d60f 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[md5sum] = "4354b7ae296894f232ada226a062d7d7"
-SRC_URI[sha256sum] = "47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449"
+SRC_URI[md5sum] = "4d0d5738936bd8f4f0287e1dd80432b6"
+SRC_URI[sha256sum] = "986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.7.4


