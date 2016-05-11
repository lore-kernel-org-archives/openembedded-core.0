Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 741BE731A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 03:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4B37Gt9000495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 20:07:16 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 20:07:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 20:07:10 -0700
Message-ID: <0ef7c0f30456cc242de331b273b92c1dfe835350.1462935990.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1462935990.git.liezhi.yang@windriver.com>
References: <cover.1462935990.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] glew: Correct version in autotooling patches
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
X-List-Received-Date: Wed, 11 May 2016 03:07:15 -0000
Content-Type: text/plain

From: Martyn Welch <martyn.welch@collabora.co.uk>

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
2.8.0


