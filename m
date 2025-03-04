Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54294C282EC
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18203.1741079370396773802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d89n6NZu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079370; x=1772615370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lLG/9XkoDt9+erbtSGqQLP/fMF4gG+0OdrXyuNg8TbI=;
  b=d89n6NZugGyPnqHe49+jz9lAxiRz6zpg54oM8KCNwf9O2WBYxg7PvDuK
   JnuIJw39pwTY0O7PLGiqFb3CUxNwiW9k1kGgdzoIQCEyscYGxhzN4RJ9E
   yKIS9qDp3cCo4rlptgHaPCTEl5jh2KFQmkcG9ZYlIyFBIlY+62ySm212u
   CB0S++0TcqeRDTpN7kzM/29jlMQtx0EuM9SDll5tgoVeR16sj4tUPKaQC
   +EGVJW+7Dp7UkE3jD8KRvvsABC73kK3fGVPdng4AHmYkuPF45KYzLmJ3S
   bxZDtlibcKSHh3ZhK0ZmmGDWAFJhPIsJ0fPw/efrmAJRxr1EbmpqKM/Um
   A==;
X-CSE-ConnectionGUID: +XDUTPyCRYybV6SjRtPpsg==
X-CSE-MsgGUID: cVhAalFoT++h5WQA/xdWuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="192153162"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="192153162"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDDFCC2260
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85701D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B31D1A0071;
	Tue,  4 Mar 2025 17:09:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/31] libassuan: upgrade 3.0.1 -> 3.0.2
Date: Tue,  4 Mar 2025 17:08:52 +0800
Message-Id: <1741079356-13445-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212237

From: Wang Mingyu <wangmy@fujitsu.com>

libassuan-add-pkgconfig-support.patch
refreshed for 3.0.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libassuan-add-pkgconfig-support.patch     | 19 +++++++++----------
 ...{libassuan_3.0.1.bb => libassuan_3.0.2.bb} |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_3.0.1.bb => libassuan_3.0.2.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index d67087f4ac..20361e8a99 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -15,11 +15,11 @@ easier use.
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- src/libassuan.m4 | 82 ++----------------------------------------------
- 1 file changed, 3 insertions(+), 79 deletions(-)
+ src/libassuan.m4 | 81 ++----------------------------------------------
+ 1 file changed, 3 insertions(+), 78 deletions(-)
 
 diff --git a/src/libassuan.m4 b/src/libassuan.m4
-index 2e98b39..404796f 100644
+index 4d7da17..f4692ab 100644
 --- a/src/libassuan.m4
 +++ b/src/libassuan.m4
 @@ -103,27 +103,6 @@ dnl
@@ -50,11 +50,10 @@ index 2e98b39..404796f 100644
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -133,60 +112,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
-     req_libassuan_api=0
+@@ -134,59 +113,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
--
+ 
 -  AC_MSG_CHECKING(for LIBASSUAN - version >= $min_libassuan_version)
 -  ok=no
 -  if test "$LIBASSUAN_CONFIG" != "no"; then
@@ -96,7 +95,7 @@ index 2e98b39..404796f 100644
 -
 -  if test $ok = yes; then
 -    AC_MSG_RESULT([yes ($libassuan_config_version)])
--    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
+-    AC_DEFINE_UNQUOTED(LIBASSUAN_API_REQUESTED, $req_libassuan_api, [Requested API version for libassuan])
 -  else
 -    AC_MSG_RESULT(no)
 -  fi
@@ -113,7 +112,7 @@ index 2e98b39..404796f 100644
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -204,9 +134,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -204,9 +135,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
    if test $ok = yes; then
      if test x"$host" != x ; then
        if test -z "$use_gpgrt_config"; then
@@ -124,7 +123,7 @@ index 2e98b39..404796f 100644
        fi
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
-@@ -248,12 +176,8 @@ dnl
+@@ -248,12 +177,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
@@ -138,5 +137,5 @@ index 2e98b39..404796f 100644
    fi
    AC_SUBST(LIBASSUAN_CFLAGS)
 -- 
-2.39.2
+2.43.0
 
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.1.bb b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_3.0.1.bb
rename to meta/recipes-support/libassuan/libassuan_3.0.2.bb
index 0518ed75aa..f0b7746284 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "c8f0f42e6103dea4b1a6a483cb556654e97302c7465308f58363778f95f194b1"
+SRC_URI[sha256sum] = "d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.43.0


