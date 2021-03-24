Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.702.1616629634996761080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 16:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nBMbxHYW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616629633; i=@fujitsu.com;
	bh=3t+4VW4RXXX7Y3rLZKEc5e3iOrB7uHR+TCRQM3UNfso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nBMbxHYW6vAPhtANaAOcIGA7Avi4kYkL8lyIJ7WhjHbkeqv5iLgpQ9MEZVaVkuRXn
	 j79iaMhK2ckAnIJZ9BmJH0uVinhlMhWNq/9A8Bbri8kYK0LXz081gEgI/f0yA0UhbY
	 ZeEDKfQNArYp3vJMiuimkU2RyAaPyhHuD3a+amaO8NBw1WSzdtBiBENFjsBkgugSSs
	 NyUjUtFUbcANCjl5BpJIkiSYyXnIkFgZ93bvC8FFb11ar95KtEbeKxBlP6W7S7nJB5
	 aTf6JSYn7SXDjc0YNgYHF7MPoUhWH31MkHnzQxKm4FfJWC+SsYfQsm5fxf/EeBf7UA
	 VxaVkP1LveQrg==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id CF/B4-60958-18FCB506; Wed, 24 Mar 2021 23:47:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxVbfhfHS
  CwZX/RhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b38WNMBV9UKr4vq2hg3CzfxcjJISSwmUli
  whu+LkYuIPsEo8TaDUsZQRJsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAucWldCwtIWFjARqLnc
  BxImEVAVWL5wglsIDavgJPE6dsTmEBsCQEFiSkP3zOD2JwCzhKb7k9ngVjrJPG5fyYjRL2gxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7SmJNxzS2CYz8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6
  uoYGBrqGhka6hpZmukaGJXmKVbpJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgIKYUHLm2
  g/HA6w96hxglOZiURHmtN0QnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLg3XoWKCdYlJqeWpGWm
  QOMCpi0BAePkgjvcpA0b3FBYm5xZjpE6hSjopQ478ZzQAkBkERGaR5cGywSLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5nUEmcKTmVcCN/0V0GImoMUbf0SCLC5JREhJNTBZG3OkLqyoFZ+
  uclxxj1Gn84uSrm8urV9eywY8/3RR/hbr8lLRC2+qVDPFFuz6cvvpIdc/zvOV1dY676nNcNxb
  tqix8MmFvAceJirv/q39rjU7UzhM1HLRBhupGRaJPPtV3mkePmLSG20iaj5F5ev0e7rHcoS9t
  55tPiSe9bK8+2PsQ96XZ/Nzlr2QkDO/+b7HK+/9qkTTGyFf9npOsit46/BGZp92+eJPOzN1rY
  7MMO2YxMIXHqVZ6/1O6O0max472YwY/mPHmNSec1lWqMhPOfbhn0vhu4va2UudVXuvmM3x6lz
  n+Oz2B9cTCzrW5G1OTeqx/vf19yJB/4DniZeWN97PeL7rVuKD4O3b5s1VYinOSDTUYi4qTgQA
  OXF5iT8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-291.messagelabs.com!1616629632!283649!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30768 invoked from network); 24 Mar 2021 23:47:12 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-25.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 23:47:12 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ONl6nG015350
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 23:47:12 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 23:47:08 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libassuan: upgrade 2.5.4 -> 2.5.5
Date: Thu, 25 Mar 2021 07:46:53 +0800
Message-ID: <1616629614-44093-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com>
References: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

refresh libassuan-add-pkgconfig-support.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libassuan-add-pkgconfig-support.patch     | 42 ++++++++-----------
 ...{libassuan_2.5.4.bb => libassuan_2.5.5.bb} |  2 +-
 2 files changed, 19 insertions(+), 25 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.4.bb => libassuan_2.5.5.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index 0e81454c63..4a459e7662 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -8,17 +8,20 @@ Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
 forward ported to 2.4.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ src/libassuan.m4 | 77 ++----------------------------------------------
+ 1 file changed, 3 insertions(+), 74 deletions(-)
 
-Index: libassuan-2.5.2/src/libassuan.m4
-===================================================================
---- libassuan-2.5.2.orig/src/libassuan.m4
-+++ libassuan-2.5.2/src/libassuan.m4
-@@ -16,27 +16,6 @@ dnl Returns ok set to yes or no.
+diff --git a/src/libassuan.m4 b/src/libassuan.m4
+index df50484..0fa3766 100644
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
@@ -98,31 +102,21 @@ Index: libassuan-2.5.2/src/libassuan.m4
 -      else
 -        tmp=`$LIBASSUAN_CONFIG --variable=api_version 2>/dev/null || echo 0`
 -      fi
-+      tmp=`$PKG_CONFIG --variable=api_version libassuan`
++        tmp=`$PKG_CONFIG --variable=api_version libassuan`
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -114,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -115,9 +46,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
    if test $ok = yes; then
      if test x"$host" != x ; then
        if test -z "$use_gpgrt_config"; then
 -        libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
 -      else
 -        libassuan_config_host=`$LIBASSUAN_CONFIG --variable=host 2>/dev/null || echo none`
-+        libassuan_config_host=`$PKG_CONFIG --variable=host libassuan`
++	libassuan_config_host=`$PKG_CONFIG --variable=host libassuan`
        fi
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
-@@ -158,12 +88,8 @@ dnl
- AC_DEFUN([AM_PATH_LIBASSUAN],
- [ _AM_PATH_LIBASSUAN_COMMON($1)
-   if test $ok = yes; then
--    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
--    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
-     ifelse([$2], , :, [$2])
-   else
--    LIBASSUAN_CFLAGS=""
--    LIBASSUAN_LIBS=""
-     ifelse([$3], , :, [$3])
-   fi
-   AC_SUBST(LIBASSUAN_CFLAGS)
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

