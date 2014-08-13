Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id E1A9A70A51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:04:16 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id eM4C1o00W1mTNtu01M4HAQ; Wed, 13 Aug 2014 14:04:17 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 16:03:44 -0500
Message-Id: <1407963825-20257-5-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1407963825-20257-1-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 4/5] gcc: remove outdated configuration option
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
X-List-Received-Date: Wed, 13 Aug 2014 21:04:20 -0000

--enable-libunwind-exceptions was removed from gcc at release 3.4.3
about ten years ago.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 -
 meta/recipes-devtools/gcc/gcc-cross.inc          | 1 -
 meta/recipes-devtools/gcc/gcc-runtime.inc        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 7da5058..d8868bb 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -161,7 +161,6 @@ SYSTEMLIBS1 = "${target_libdir}/"
 EXTRA_OECONF += "--enable-poison-system-directories"
 
 EXTRA_OECONF += "\
-    --disable-libunwind-exceptions \
     --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
     --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 64d0652..4cdb55f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -20,7 +20,6 @@ EXTRA_OECONF_append_sh4 = " \
 "
 
 EXTRA_OECONF += "\
-    --disable-libunwind-exceptions \
     --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
     --with-system-zlib \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e7d938d..7ce84f1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -8,7 +8,6 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
-EXTRA_OECONF += "--disable-libunwind-exceptions"
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
-- 
1.8.5.5


