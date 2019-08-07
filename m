Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D697D7F3ED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:52:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x777qUHU016568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2019 00:52:30 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 7 Aug 2019 00:52:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liu.ming50@gmail.com>
Date: Wed, 7 Aug 2019 15:52:27 +0800
Message-ID: <1565164347-26104-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [PATCH] libx11-compose-data: upgrade 1.6.7 -> 1.6.8
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
X-List-Received-Date: Wed, 07 Aug 2019 07:52:31 -0000
Content-Type: text/plain

Refresh the patch to fix the do_patch QA warning.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libx11-compose-data/0001-Drop-x11-dependencies.patch     | 12 ++++++------
 ...11-compose-data_1.6.7.bb => libx11-compose-data_1.6.8.bb} |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-compose-data_1.6.7.bb => libx11-compose-data_1.6.8.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
index fbd9684..46a53a1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
@@ -1,4 +1,4 @@
-From a60f5058136aeadceebfccadf606d8210f8d3ca6 Mon Sep 17 00:00:00 2001
+From e1f9b0b531c6ddb11a85c0664051e2e4efc589fb Mon Sep 17 00:00:00 2001
 From: Ming Liu <ming.liu@toradex.com>
 Date: Sun, 5 May 2019 11:55:14 +0200
 Subject: [PATCH] Drop x11 dependencies
@@ -11,11 +11,11 @@ Signed-off-by: Ming Liu <ming.liu@toradex.com>
  1 file changed, 44 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3090845..d14063f 100644
+index a5fd706..b42488c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -66,27 +66,8 @@ fi
- AC_SUBST(LDFLAGS_FOR_BUILD)
+@@ -76,27 +76,8 @@ fi
+ AC_SUBST([EXEEXT_FOR_BUILD])
  
  # Checks for pkg-config packages
 -
@@ -42,7 +42,7 @@ index 3090845..d14063f 100644
  # Check for dlopen
  AC_MSG_CHECKING([if run-time linking is supported])
  AC_SEARCH_LIBS(dlopen,[dl svld])
-@@ -226,30 +207,6 @@ AC_SUBST(XTHREAD_CFLAGS)
+@@ -237,30 +218,6 @@ AC_SUBST(XTHREAD_CFLAGS)
  
  AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
  
@@ -73,7 +73,7 @@ index 3090845..d14063f 100644
  AC_ARG_ENABLE(xcms,
                AS_HELP_STRING([--disable-xcms],
                  [Disable Xlib support for CMS *EXPERIMENTAL*]),
-@@ -329,7 +286,6 @@ X11_LIBDIR="${libdir}/X11"
+@@ -340,7 +297,6 @@ X11_LIBDIR="${libdir}/X11"
  AX_DEFINE_DIR(X11_LIBDIR, X11_LIBDIR, [Location of libX11 library data])
  AC_SUBST(X11_LIBDIR)
  
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index 9dace70..cabb84e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -11,8 +11,8 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
+SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
 SRC_URI += "file://0001-Drop-x11-dependencies.patch"
 
-- 
2.7.4


