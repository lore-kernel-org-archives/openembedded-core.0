Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1F775029
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 00:42:39 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id az12-v6so5489079plb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 17:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lGtwIbjFGCmDjAuExz0XWq4R1TeRkmU0+moqITuQUns=;
	b=HJfpFYTUgepwne+9ikSYUgrO5WXWysj0BOA8eqnfLw0UoJ5L3BjP/WbS9OL8STn2nR
	ymTURGpTqiyZ77BTpIJc2qT6W0N1EFXYWQl/3vUFzL9tu3x/u5NeY0k2xZTNY+zIFdEk
	9Eyhd+2DiKxPvsLX96gizCGTgJLKfBaGng7kNsJ4bjZRwOwIgWeCbIuRO8u18+xC7BCI
	g+8EblTSaFUdXJBjsd76nvFn062f2EAHueN3I9YcYx4z8b8CZGh3jb8lt7qLzcTJuRjL
	5Q7FMrjaNM/IPiU1IzpaD1Fiur99HWfG5HiAkTPermVfrIUHaT9lyfmrBuDqB7j0YH7m
	O0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lGtwIbjFGCmDjAuExz0XWq4R1TeRkmU0+moqITuQUns=;
	b=CgOihnLU7cy2Zb3+/sUwljeVjC8aj9q7ql3M352WrI8o14AqRbzMExMoV2p2z/hWyl
	ztJNFD7IhTxzdYyk3M3i8q79v/QPCDfbug48oqZIlbu4kmPLDfila/UXjauBO8p1SX+4
	KXUym0YYchJPtqPd19J0ByaB/Ws0xO2BE68tSrlUjFX5K8jBhz5h09FwwFEZunsJ7C8Z
	CDxv44XbRztw7GsZbPVQtjHjVgoJzr8lKQMeAKyu8F8sWViI55B4NKvLaojT+XbCYFwz
	xoiftwTM2k4a3B29t/O0/2cOgZGXSzy8dWmq5xoWb9znAtIaknjgAoDuTccey/eCYGQ1
	S9Zw==
X-Gm-Message-State: ALKqPwd8JNZCTNuJtMMI9KqviuKX0FkoRWrrwddGVZbK0Vs5mEhXc11t
	Cqbw1qc0Sck4MEXT8NJKXH3x4w==
X-Google-Smtp-Source: AB8JxZp5YumQvwtQh+Z4dytHb4f44maS0GOiIxnvPvk4hXYPH+MBbKilSg5cihI5Cb3gvZf0VoF77w==
X-Received: by 2002:a17:902:7283:: with SMTP id
	d3-v6mr11764780pll.192.1526690560851; 
	Fri, 18 May 2018 17:42:40 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z127-v6sm11173019pgb.31.2018.05.18.17.42.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 17:42:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 17:42:34 -0700
Message-Id: <1526690554-23859-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: update 7.59.0 -> 7.60.0
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
X-List-Received-Date: Sat, 19 May 2018 00:42:40 -0000

  https://curl.haxx.se/changes.html#7_60_0

Also refresh 0001-replace-krb5-config-with-pkg-config.patch and drop
configure_ac.patch, which we've apparently been dragging along
unnecessarily for the past 5 years:

  https://github.com/curl/curl/commit/c277bd6ce7069819484eb3dc30b5858735fde377

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../curl/0001-replace-krb5-config-with-pkg-config.patch | 17 +++++++++--------
 meta/recipes-support/curl/curl/configure_ac.patch       | 13 -------------
 .../curl/{curl_7.59.0.bb => curl_7.60.0.bb}             | 15 ++++-----------
 3 files changed, 13 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/configure_ac.patch
 rename meta/recipes-support/curl/{curl_7.59.0.bb => curl_7.60.0.bb} (91%)

diff --git a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
index 74e5d99..a7db1b3 100644
--- a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
+++ b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
@@ -1,17 +1,21 @@
-[PATCH] replace krb5-config with pkg-config
+From ed70f0623708b8a6c1f58a5d243d87c5ff45b24d Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Tue, 26 Apr 2016 13:13:01 +0800
+Subject: [PATCH] replace krb5-config with pkg-config
 
 Upstream-Status:  Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  configure.ac | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e99b303..dc93f39 100644
+index 5569a26..56b0380 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1196,7 +1196,7 @@ AC_ARG_WITH(gssapi,
+@@ -1290,7 +1290,7 @@ AC_ARG_WITH(gssapi,
    fi
  ])
  
@@ -20,7 +24,7 @@ index e99b303..dc93f39 100644
  
  save_CPPFLAGS="$CPPFLAGS"
  AC_MSG_CHECKING([if GSS-API support is requested])
-@@ -1207,7 +1207,7 @@ if test x"$want_gss" = xyes; then
+@@ -1301,7 +1301,7 @@ if test x"$want_gss" = xyes; then
       if test -n "$host_alias" -a -f "$GSSAPI_ROOT/bin/$host_alias-krb5-config"; then
          GSSAPI_INCS=`$GSSAPI_ROOT/bin/$host_alias-krb5-config --cflags gssapi`
       elif test -f "$KRB5CONFIG"; then
@@ -29,7 +33,7 @@ index e99b303..dc93f39 100644
       elif test "$GSSAPI_ROOT" != "yes"; then
          GSSAPI_INCS="-I$GSSAPI_ROOT/include"
       fi
-@@ -1300,7 +1300,7 @@ if test x"$want_gss" = xyes; then
+@@ -1394,7 +1394,7 @@ if test x"$want_gss" = xyes; then
          elif test -f "$KRB5CONFIG"; then
             dnl krb5-config doesn't have --libs-only-L or similar, put everything
             dnl into LIBS
@@ -38,6 +42,3 @@ index e99b303..dc93f39 100644
             LIBS="$gss_libs $LIBS"
          else
             case $host in
--- 
-1.9.1
-
diff --git a/meta/recipes-support/curl/curl/configure_ac.patch b/meta/recipes-support/curl/curl/configure_ac.patch
deleted file mode 100644
index b8bd304..0000000
--- a/meta/recipes-support/curl/curl/configure_ac.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status:  Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -281,7 +281,7 @@ dnl ************************************
- 
- CURL_CHECK_COMPILER
- CURL_SET_COMPILER_BASIC_OPTS
--CURL_SET_COMPILER_DEBUG_OPTS
-+dnl CURL_SET_COMPILER_DEBUG_OPTS
- CURL_SET_COMPILER_OPTIMIZE_OPTS
- CURL_SET_COMPILER_WARNING_OPTS
- 
diff --git a/meta/recipes-support/curl/curl_7.59.0.bb b/meta/recipes-support/curl/curl_7.60.0.bb
similarity index 91%
rename from meta/recipes-support/curl/curl_7.59.0.bb
rename to meta/recipes-support/curl/curl_7.60.0.bb
index c244c60..fe04fa6 100644
--- a/meta/recipes-support/curl/curl_7.59.0.bb
+++ b/meta/recipes-support/curl/curl_7.60.0.bb
@@ -9,14 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-
-# curl likes to set -g0 in CFLAGS, so we stop it
-# from mucking around with debug options
-#
-SRC_URI += " file://configure_ac.patch"
-
-SRC_URI[md5sum] = "a2192804f7c2636a09320416afcf888e"
-SRC_URI[sha256sum] = "b5920ffd6a8c95585fb95070e0ced38322790cb335c39d0dab852d12e157b5a0"
+SRC_URI[md5sum] = "bd2aabf78ded6a9aec8a54532fd6b5d7"
+SRC_URI[sha256sum] = "897dfb2204bd99be328279f88f55b7c61592216b0542fcbe995c60aa92871e9b"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
@@ -32,10 +26,12 @@ PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
 PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
@@ -47,8 +43,6 @@ PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
-PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
 
 EXTRA_OECONF = " \
     --enable-crypto-auth \
@@ -57,7 +51,6 @@ EXTRA_OECONF = " \
     --without-libpsl \
 "
 
-
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
 	sed -i \
-- 
1.9.1


