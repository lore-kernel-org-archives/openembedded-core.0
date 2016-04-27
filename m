Return-Path: <martyn.welch@collabora.co.uk>
X-Greylist: delayed 589 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Apr 2016 11:34:56 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 7852B6FF01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:34:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id EDC02260874
Received: by kratos.localdomain (Postfix, from userid 1000)
	id 283032018E966; Wed, 27 Apr 2016 12:25:05 +0100 (BST)
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 27 Apr 2016 12:25:00 +0100
Message-Id: <1461756300-15502-1-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 1.8.3.1
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][jethro] glew: Correct version in autotooling patches
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
X-List-Received-Date: Wed, 27 Apr 2016 11:34:57 -0000

The additional autotooling patched into glew claims the version is 1.9.0
whilst we are building 1.12.0. The version in the autotooling is used to
set the version number in the pkgconfig file, this results in the
configuration of packages which depend on glew > 1.9.0 failing.

This patch updates the version number used in the patches to match that of
the version being built.

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
 meta/recipes-graphics/glew/glew/autotools.patch           | 4 ++--
 meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/glew/glew/autotools.patch b/meta/recipes-graphics/glew/glew/autotools.patch
index 7dfe087..81a1343 100644
--- a/meta/recipes-graphics/glew/glew/autotools.patch
+++ b/meta/recipes-graphics/glew/glew/autotools.patch
@@ -20,7 +20,7 @@ Index: glew/configure.ac
 +# Process this file with autoconf to produce a configure script.
 +
 +AC_PREREQ([2.62])
-+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])
 +AC_CONFIG_SRCDIR([src/glew.c])
 +AC_CONFIG_HEADERS([config.h])
 +AM_INIT_AUTOMAKE([-Wall -Werror foreign])
@@ -77,7 +77,7 @@ Index: glew/configure.ac
 +# for now we use the same version as the package, but that should be avoided
 +# in the future
 +
-+AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
++AC_SUBST([LIBGLEW_SO_VERSION], [1:12:0])
 +
 +AC_CONFIG_FILES([Makefile
 +                 include/Makefile
diff --git a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
index 70a99ae..baab9ff 100644
--- a/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
+++ b/meta/recipes-graphics/glew/glew/fix-glew.pc-install.patch
@@ -20,7 +20,7 @@ Index: glew-1.11.0/configure.ac
 ===================================================================
 --- glew-1.11.0.orig/configure.ac
 +++ glew-1.11.0/configure.ac
-@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:9:0])
+@@ -66,5 +66,6 @@ AC_SUBST([LIBGLEW_SO_VERSION], [1:12:0])
  
  AC_CONFIG_FILES([Makefile
                   include/Makefile
-- 
1.8.3.1


