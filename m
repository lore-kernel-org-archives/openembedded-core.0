Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rlqgo-0003oX-R8
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 00:37:43 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 884D12FF81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 18:30:01 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 15:29:50 -0800
Message-Id: <9fdc281debf282c095c276595340114332ea3cc3.1326480099.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 884D12FF81.C4747
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/3] e2fsprogs: upgrade to 1.42
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
X-List-Received-Date: Fri, 13 Jan 2012 23:37:43 -0000

Refactored quotefix.patch to apply cleanly.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../acinclude.m4                                   |    0
 .../mkdir.patch                                    |    0
 .../quotefix.patch                                 |   45 +++++++++----------
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    2 +-
 .../{e2fsprogs_1.41.14.bb => e2fsprogs_1.42.bb}    |    7 +--
 5 files changed, 25 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/quotefix.patch (40%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.41.14.bb => e2fsprogs_1.42.bb} (92%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/acinclude.m4 b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/acinclude.m4
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/acinclude.m4
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/mkdir.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
similarity index 100%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/mkdir.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/mkdir.patch
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
similarity index 40%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
index f260f03..e576f35 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.41.14/quotefix.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
@@ -1,45 +1,42 @@
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Mei Lei <lei.mei@intel.com>
-
+Upstream-Status: Pending
 
 These macros are underquoted and break with recent autoconf+automake
-combinations.
+combinations. - RP 2010-01-02
 
-RP 1/2/10
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-Index: e2fsprogs-1.41.5/configure.in
-===================================================================
---- e2fsprogs-1.41.5.orig/configure.in	2010-02-01 11:40:10.547790252 +0000
-+++ e2fsprogs-1.41.5/configure.in	2010-02-01 11:44:51.577876485 +0000
-@@ -397,11 +397,11 @@
+diff -urN e2fsprogs-1.42.orig//configure.in e2fsprogs-1.42/configure.in
+--- e2fsprogs-1.42.orig//configure.in	2011-11-28 09:28:22.000000000 -0800
++++ e2fsprogs-1.42/configure.in	2012-01-12 14:42:54.820531407 -0800
+@@ -439,11 +439,11 @@
  		AC_MSG_ERROR([pkg-config not installed; please install it.])
  	fi
  
--	AC_CHECK_LIB(blkid, blkid_get_cache,
-+	[AC_CHECK_LIB(blkid, blkid_get_cache,
- 		[LIBBLKID=`$PKG_CONFIG --libs blkid`;
- 		 STATIC_LIBBLKID=`$PKG_CONFIG --static --libs blkid`],
- 		[AC_MSG_ERROR([external blkid library not found])],
--		[$LIBBLKID])
-+		[$LIBBLKID])]
- 	BLKID_CMT=#
- 	AC_MSG_RESULT([Disabling private blkid library])
+-	AC_CHECK_LIB(uuid, uuid_generate,
++	[AC_CHECK_LIB(uuid, uuid_generate,
+ 		[LIBUUID=`$PKG_CONFIG --libs uuid`;
+ 		 STATIC_LIBUUID=`$PKG_CONFIG --static --libs uuid`],
+ 		[AC_MSG_ERROR([external uuid library not found])],
+-		[$LIBUUID])
++		[$LIBUUID])]
+ 	UUID_CMT=#
+ 	AC_MSG_RESULT([Disabling private uuid library])
  else
-@@ -786,15 +786,15 @@
- dnl
+@@ -939,15 +939,15 @@
+ AH_TEMPLATE([HAVE_SEM_INIT], [Define to 1 if sem_init() exists])
  SEM_INIT_LIB=''
  AC_CHECK_FUNC(sem_init, ,
 -  AC_CHECK_LIB(pthread, sem_init,
 +  [AC_CHECK_LIB(pthread, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
+   	AC_DEFINE(HAVE_SEM_INIT, 1)
    	SEM_INIT_LIB=-lpthread,
 -  AC_CHECK_LIB(rt, sem_init,
 +  [AC_CHECK_LIB(rt, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
+   	AC_DEFINE(HAVE_SEM_INIT, 1)
    	SEM_INIT_LIB=-lrt,
 -  AC_CHECK_LIB(posix4, sem_init,
 +  [AC_CHECK_LIB(posix4, sem_init,
-   	AC_DEFINE(HAVE_SEM_INIT)
+   	AC_DEFINE(HAVE_SEM_INIT, 1)
 -  	SEM_INIT_LIB=-lposix4))))dnl
 +  	SEM_INIT_LIB=-lposix4)])])])dnl
  AC_SUBST(SEM_INIT_LIB)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 1a1a7b8..527e701 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -21,7 +21,7 @@ SECTION = "base"
 DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
-           file://mkdir.patch;apply=yes"
+           file://mkdir.patch"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
similarity index 92%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index a956247..9ff85a2 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,13 +1,12 @@
 require e2fsprogs.inc
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI += "file://quotefix.patch \
             file://acinclude.m4"
 
-SRC_URI[md5sum] = "05f70470aea2ef7efbb0845b2b116720"
-SRC_URI[sha256sum] = "3f8ac1fedd7c4bec480afcbe4acabdd4ac59ec0446a0fd50c8975cd0aad7b176"
-#file://no-hardlinks.patch
+SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
+SRC_URI[sha256sum] = "55b46db0cec3e2eb0e5de14494a88b01ff6c0500edf8ca8927cad6da7b5e4a46"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.5.4



