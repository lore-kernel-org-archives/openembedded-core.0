Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.17615.1616997102137513971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 22:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xsMSyV1R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616997100; i=@fujitsu.com;
	bh=Tabvw1b10muPPtrDtxw0tDo+OnINj11/9FJw30Alx/c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xsMSyV1RxXE2DK3QJO00W6phVx8VQAzKWRXZixgCjbXamq6stfej262eMNS38Es/m
	 aw8bhfqdKi2UzzYFKBwrKzV1cpXv51LqU8XwjnI5iRIRD+AOTXXyeS9S36MzWEV2dF
	 NKXLE3S4zruz8PyFT8jlyyaySwxYQmIhCvnDn4jS2qoTAF47nLicK6H8MNDbSTobuo
	 D2NjkumYTQMd6VIqbsyGltH+LGfltJP2iliWQHBPtnk+X8gbplfst8nlYJkW3Ds1FU
	 jP3dqTI0KJrCv7obzu37J+JAKqSvnIR8DqzQFv5oTztHPHEsUGLrhDm0JR/3ChQ3wV
	 BEb0xUPcQhkNg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 99/BC-60958-BEA61606; Mon, 29 Mar 2021 05:51:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxVfd1VmK
  CwY1uRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePMtauMBQsVKi687mJpYLwi3cXIxSEkMItJ
  omnFdKYuRk4g5zijxNs3wiA2m4CaxPRbN1i7GDk4RAT0JK7+EwUJMwuoS1xa18ICYgsL2Eu0r
  j4EVsIioCqx6ZEHSJhXwEnixJktjCC2hICCxJSH75kh4oISJ2c+YYEYIyFx8MULZogaRYnZl5
  tZIOxKic71CxgnMPLOQtIyC0nLAkamVYzmSUWZ6RkluYmZObqGBga6hoZGuoaWZrpmJnqJVbp
  JeqmluuWpxSW6hnqJ5cV6xZW5yTkpenmpJZsYgYGVUnDEYQfj/dcf9A4xSnIwKYny7gpLSBDi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwbsgMzFBSLAoNT21Ii0zBxjkMGkJDh4lEd7gCKA0b3FBY
  m5xZjpE6hSjopQ4ryUwNoQEQBIZpXlwbbDIusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmL
  cNZApPZl4J3PRXQIuZgBa7vosFWVySiJCSamDqOqO89PenjevdKvd2zrfLmv27aRZj6m+T44t
  Fkq4uvzp/7t0rGs/vrozO9xNhOM6ZcUSmKphHIfRwwZ7TLjuPb/4nVzrptOFOlojfE64tv3I8
  +uGmmo7M9oXcE0Ued8XHZc+5eivf4WKzkDHvB7bWgtfHg/Z7dnLGXmYoUeN95OO+9uN3ndWJS
  7bJM61379v/4PPJpU4x2yvWLNbzXpdW8vWucqrpgaXpD6faBf8rEy1pfO5gd+zlgo07LZ792i
  Z6kUfw/BrZo0uPzt4X0xr+4PPKoHZW6ao/3TMnsq6Ufbn5vfI7ocYN9TIiX3/7/7/4YYbw21M
  3PPsffQirtKmw5nqYueGarCTn5P8xk/eXOCixFGckGmoxFxUnAgCdk0L7JwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-285.messagelabs.com!1616997099!541540!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29984 invoked from network); 29 Mar 2021 05:51:39 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Mar 2021 05:51:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12T5pXth026473
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 06:51:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Mar 2021 06:51:32 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] libassuan: upgrade 2.5.4 -> 2.5.5
Date: Mon, 29 Mar 2021 13:51:23 +0800
Message-ID: <1616997083-55474-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

refresh libassuan-add-pkgconfig-support.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libassuan-add-pkgconfig-support.patch     | 27 ++++++++++++-------
 ...{libassuan_2.5.4.bb => libassuan_2.5.5.bb} |  2 +-
 2 files changed, 18 insertions(+), 11 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.4.bb => libassuan_2.5.5.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index 0e81454c63..fe811254d3 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -8,17 +8,20 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 forward ported to 2.4.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ src/libassuan.m4 | 81 ++----------------------------------------------
+ 1 file changed, 3 insertions(+), 78 deletions(-)
 
-Index: libassuan-2.5.2/src/libassuan.m4
-===================================================================
---- libassuan-2.5.2.orig/src/libassuan.m4
-+++ libassuan-2.5.2/src/libassuan.m4
-@@ -16,27 +16,6 @@ dnl Returns ok set to yes or no.
+diff --git a/src/libassuan.m4 b/src/libassuan.m4
+index df50484..380a48a 100644
+--- a/src/libassuan.m4
++++ b/src/libassuan.m4
+@@ -17,27 +17,6 @@ dnl Returns ok set to yes or no.
  dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
 -  AC_ARG_WITH(libassuan-prefix,
--              AC_HELP_STRING([--with-libassuan-prefix=PFX],
+-              AS_HELP_STRING([--with-libassuan-prefix=PFX],
 -                             [prefix where LIBASSUAN is installed (optional)]),
 -     libassuan_config_prefix="$withval", libassuan_config_prefix="")
 -  if test x$libassuan_config_prefix != x ; then
@@ -41,10 +44,11 @@ Index: libassuan-2.5.2/src/libassuan.m4
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -47,58 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -47,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+     req_libassuan_api=0
      min_libassuan_version="$tmp"
    fi
- 
+-
 -  AC_MSG_CHECKING(for LIBASSUAN - version >= $min_libassuan_version)
 -  ok=no
 -  if test "$LIBASSUAN_CONFIG" != "no"; then
@@ -102,7 +106,7 @@ Index: libassuan-2.5.2/src/libassuan.m4
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -114,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -115,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
    if test $ok = yes; then
      if test x"$host" != x ; then
        if test -z "$use_gpgrt_config"; then
@@ -113,7 +117,7 @@ Index: libassuan-2.5.2/src/libassuan.m4
        fi
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
-@@ -158,12 +88,8 @@ dnl
+@@ -159,12 +88,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
@@ -126,3 +130,6 @@ Index: libassuan-2.5.2/src/libassuan.m4
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBASSUAN_CFLAGS)
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.4.bb b/meta/recipes-support/libassuan/libassuan_2.5.5.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.4.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.5.bb
index d44b95aa0f..3d12ea09e8 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.4.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "c080ee96b3bd519edd696cfcebdecf19a3952189178db9887be713ccbcb5fbf0"
+SRC_URI[sha256sum] = "8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.25.1

