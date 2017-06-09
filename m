Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id B44B478284
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:48:01 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 48f3_2666_1f97b920_489f_4c57_a2e0_843d6ca51495;
	Fri, 09 Jun 2017 15:47:58 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id E750EAC0092
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 15:47:57 +0900 (JST)
Received: from G01JPEXCHYT18.g01.fujitsu.local
	(G01JPEXCHYT18.g01.fujitsu.local [10.128.194.57])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D6CDF46E7A8 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 15:47:56 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT18.g01.fujitsu.local (10.128.194.57) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 9 Jun 2017 15:47:55 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jun 2017 15:49:18 +0900
Message-ID: <1496990958-8431-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] gnutls: Upgrade to 3.5.13
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
X-List-Received-Date: Fri, 09 Jun 2017 06:48:02 -0000
Content-Type: text/plain

1. Upgrade gnutls from 3.5.9 to 3.5.13

2. Rebase the following patch file.
   use-pkg-config-to-locate-zlib.patch

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../gnutls/use-pkg-config-to-locate-zlib.patch     | 28 ++++++++++++++--------
 .../gnutls/{gnutls_3.5.9.bb => gnutls_3.5.13.bb}   |  4 ++--
 2 files changed, 20 insertions(+), 12 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.5.9.bb => gnutls_3.5.13.bb} (66%)

diff --git a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
index 0e1b7c8..ae141a5 100644
--- a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
+++ b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
@@ -1,7 +1,9 @@
-From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 26 May 2015 21:41:24 -0700
-Subject: [PATCH] use pkg-config to locate zlib
+From 18081068a97c00015aabc5fa321664951458ea0d Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Fri, 9 Jun 2017 15:20:31 +0900
+Subject: [PATCH] From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17
+ 00:00:00 2001 From: Andre McCurdy <armccurdy@gmail.com> Date: Tue, 26 May
+ 2015 21:41:24 -0700 Subject: [PATCH] use pkg-config to locate zlib
 
 AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
 robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
@@ -18,15 +20,19 @@ Change based on ChromeOS gnutls 2.12.23 cross-compile fixes patch:
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Rebase on gnutls 3.5.13
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 ---
- configure.ac | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
+ configure.ac | 25 +++++++++----------------
+ 1 file changed, 9 insertions(+), 16 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1b561d5..0c787dc 100644
+index c65268e..f6a18aa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -508,25 +508,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
+@@ -735,28 +735,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
  AC_MSG_CHECKING([whether to include zlib compression support])
  if test x$ac_zlib != xno; then
   AC_MSG_RESULT(yes)
@@ -49,6 +55,7 @@ index 1b561d5..0c787dc 100644
 -    else
 -      GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
 -    fi
+-    LIBZ_PC=""
 +  PKG_CHECK_MODULES(ZLIB, zlib)
 +  HAVE_LIBZ=yes
 +  AC_DEFINE([HAVE_LIBZ], [1], [zlib is enabled])
@@ -57,11 +64,12 @@ index 1b561d5..0c787dc 100644
 +  AC_SUBST(LTLIBZ)
 +  if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
 +    GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
-+  else
+   else
+-    LIBZ_PC=$LIBZ
 +    GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
    fi
  fi
- AC_SUBST(GNUTLS_REQUIRES_PRIVATE)
+ AC_SUBST(LIBZ_PC)
 -- 
 1.9.1
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.5.9.bb b/meta/recipes-support/gnutls/gnutls_3.5.13.bb
similarity index 66%
rename from meta/recipes-support/gnutls/gnutls_3.5.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.13.bb
index 92e58b1..1115500 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.13.bb
@@ -5,7 +5,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://use-pkg-config-to-locate-zlib.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "0ab25eb6a1509345dd085bc21a387951"
-SRC_URI[sha256sum] = "82b10f0c4ef18f4e64ad8cef5dbaf14be732f5095a41cf366b4ecb4050382951"
+SRC_URI[md5sum] = "4fd41ad86572933c2379b4cc321a0959"
+SRC_URI[sha256sum] = "79f5480ad198dad5bc78e075f4a40c4a315a1b2072666919d2d05a08aec13096"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


