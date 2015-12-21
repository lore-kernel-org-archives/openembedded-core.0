Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E52016FFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:58:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2015 08:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,460,1444719600"; d="scan'208";a="712146138"
Received: from lvargasv-mobl3.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.252.136.123])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2015 08:58:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 21 Dec 2015 08:58:18 -0800
Message-Id: <1450717098-13653-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] libdrm: Upgrade to 2.4.65
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
X-List-Received-Date: Mon, 21 Dec 2015 16:58:20 -0000

Rebased patch to reflect changes in Makefile

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-graphics/drm/libdrm/installtests.patch | 24 ++++++++++++----------
 .../drm/{libdrm_2.4.62.bb => libdrm_2.4.65.bb}     |  5 +++--
 2 files changed, 16 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.65.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index 1175dae..f460ef5 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -4,20 +4,22 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index bf1987f..d909e19 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -27,10 +27,11 @@ AM_CPPFLAGS = \
+Index: libdrm-2.4.65/tests/Makefile.am
+===================================================================
+--- libdrm-2.4.65.orig/tests/Makefile.am
++++ libdrm-2.4.65/tests/Makefile.am
+@@ -29,9 +29,11 @@ AM_CFLAGS = \
  
  LDADD = $(top_builddir)/libdrm.la
  
 -check_PROGRAMS = \
+-	dristat \
+-	drmstat
 +bin_PROGRAMS = \
- 	dristat \
- 	drmstat
- 
++        dristat \
++        drmstat
++ 
 +check_PROGRAMS =
- if HAVE_NOUVEAU
- SUBDIRS += nouveau
- endif
+ 
+ dristat_LDADD = -lm
+ 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb b/meta/recipes-graphics/drm/libdrm_2.4.65.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.62.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.65.bb
index ea6305e..8390fb0 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.65.bb
@@ -12,8 +12,9 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch "
-SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
-SRC_URI[sha256sum] = "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
+
+SRC_URI[md5sum] = "de49916e5f8aef4eba55223c79709b05"
+SRC_URI[sha256sum] = "71960ac8bde7d710992b1bc8879935e8300a870c36bd06f22412d0447e3d96c4"
 
 inherit autotools pkgconfig
 
-- 
2.5.0


