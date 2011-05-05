Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTp-0003KW-Uu
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2011 00:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="742664714"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2011 00:57:20 -0700
Message-Id: <e9657c6bea34cdd406957589c3ec5e94130f8f74.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 16:39:23 -0700
Date: Thu, 05 May 2011  0:57:20 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 15/26] clutter-gtk-1.4: Rebase patches
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
X-List-Received-Date: Thu, 05 May 2011 08:00:14 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-gtk/disable_deprecated.patch   |   22 ++++++++++----------
 .../clutter/clutter-gtk/enable_tests.patch         |   11 ++++-----
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
index df0c52c..d11c34e 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
@@ -6,14 +6,14 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: git/clutter-gtk/Makefile.am
 ===================================================================
---- git.orig/clutter-gtk/Makefile.am	2011-01-30 13:10:29.000000000 +0800
-+++ git/clutter-gtk/Makefile.am	2011-01-30 13:15:09.000000000 +0800
-@@ -15,8 +15,6 @@
- 	-DCLUTTER_GTK_COMPILATION	\
- 	-DG_DISABLE_DEPRECATED		\
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED	\
--	-DGDK_DISABLE_DEPRECATED	\
--	-DGTK_DISABLE_DEPRECATED	\
- 	-DCLUTTER_DISABLE_DEPRECATED	\
- 	$(CLUTTER_GTK_DEBUG_CFLAGS) 	\
- 	$(NULL)
+--- git.orig/clutter-gtk/Makefile.am	2011-05-04 14:07:20.000000000 -0700
++++ git/clutter-gtk/Makefile.am	2011-05-04 14:25:34.013984328 -0700
+@@ -8,8 +8,6 @@
+         -DCLUTTER_GTK_COMPILATION               \
+         -DG_DISABLE_DEPRECATED                  \
+         -DGDK_PIXBUF_DISABLE_DEPRECATED         \
+-        -DGDK_DISABLE_DEPRECATED                \
+-        -DGTK_DISABLE_DEPRECATED                \
+ 	-DCLUTTER_DISABLE_DEPRECATED
+ 
+ AM_CPPFLAGS = \
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
index c18ffec..8e3e552 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
@@ -4,14 +4,13 @@ Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
 Index: git/examples/Makefile.am
 ===================================================================
---- git.orig/examples/Makefile.am	2011-01-31 09:58:47.000000000 +0800
-+++ git/examples/Makefile.am	2011-01-31 09:59:02.000000000 +0800
-@@ -2,7 +2,7 @@
- 
+--- git.orig/examples/Makefile.am	2011-05-04 14:07:20.000000000 -0700
++++ git/examples/Makefile.am	2011-05-04 14:38:29.785984519 -0700
+@@ -1,6 +1,6 @@
  NULL =
  
 -noinst_PROGRAMS = \
 +bin_PROGRAMS = \
- 	animated-notebook \
- 	expose-test \
  	gtk-clutter-events \
+ 	gtk-clutter-multistage \
+ 	gtk-clutter-test \
-- 
1.7.1.1



