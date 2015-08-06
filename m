Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 821CC760E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 01:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995337"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:42:02 +0300
Message-Id: <36a4ecf6cdd614f4e12af293342284ebc483766e.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1438849692.git.jussi.kukkonen@intel.com>
References: <cover.1438849692.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] which: Upgrade 2.20 -> 2.21
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:42 -0000

* Drop one upstreamed patch, update the other one

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../which/which-2.20/remove-declaration.patch          | 18 ------------------
 .../which/{which-2.20 => which-2.21}/automake.patch    | 14 +++++++++-----
 .../which/{which_2.20.bb => which_2.21.bb}             |  6 +++---
 3 files changed, 12 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/which/which-2.20/remove-declaration.patch
 rename meta/recipes-extended/which/{which-2.20 => which-2.21}/automake.patch (56%)
 rename meta/recipes-extended/which/{which_2.20.bb => which_2.21.bb} (84%)

diff --git a/meta/recipes-extended/which/which-2.20/remove-declaration.patch b/meta/recipes-extended/which/which-2.20/remove-declaration.patch
deleted file mode 100644
index d3340a3..0000000
--- a/meta/recipes-extended/which/which-2.20/remove-declaration.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Remove the declaration of group_member since it has already been
-declared in unistd.h
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-diff -ruN which-2.20-orig/bash.c which-2.20/bash.c
---- which-2.20-orig/bash.c	2010-08-03 12:59:08.897088878 +0800
-+++ which-2.20/bash.c	2010-08-03 13:17:23.406097212 +0800
-@@ -46,7 +46,6 @@
-  * - changed all occurences of 'gid_t' into 'GID_T'.
-  * - exported functions needed in which.c
-  */
--static int group_member (GID_T gid);
- static char* extract_colon_unit (char const* string, int* p_index);
- 
- /*===========================================================================
diff --git a/meta/recipes-extended/which/which-2.20/automake.patch b/meta/recipes-extended/which/which-2.21/automake.patch
similarity index 56%
rename from meta/recipes-extended/which/which-2.20/automake.patch
rename to meta/recipes-extended/which/which-2.21/automake.patch
index ef00bc9..4d0f2e4 100644
--- a/meta/recipes-extended/which/which-2.20/automake.patch
+++ b/meta/recipes-extended/which/which-2.21/automake.patch
@@ -7,9 +7,13 @@ diff --git a/configure.ac b/configure.ac
 index d974461..a20dfa8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2,2 +2,3 @@ dnl Process this file with autoconf to produce a configure script.
--AC_INIT(which.c)
--AM_INIT_AUTOMAKE(which, 2.20)
-+AC_INIT([which],[2.20])
-+AC_CONFIG_SRCDIR(which.c)
+@@ -1,7 +1,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT([which], [2.21])
+ AC_CONFIG_SRCDIR(which.c)
+-AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ AM_MAINTAINER_MODE
+ 
+
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.21.bb
similarity index 84%
rename from meta/recipes-extended/which/which_2.20.bb
rename to meta/recipes-extended/which/which_2.21.bb
index 7483554..a7687f6 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -19,10 +19,10 @@ EXTRA_OECONF = "--disable-iberty"
 
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://automake.patch \
-           file://remove-declaration.patch"
+           "
 
-SRC_URI[md5sum] = "95be0501a466e515422cde4af46b2744"
-SRC_URI[sha256sum] = "d417b65c650d88ad26a208293c1c6e3eb60d4b6d847f01ff8f66aca63e2857f8"
+SRC_URI[md5sum] = "097ff1a324ae02e0a3b0369f07a7544a"
+SRC_URI[sha256sum] = "f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad"
 
 do_configure_prepend() {
 	sed -i -e 's%@ACLOCAL_CWFLAGS@%-I ${STAGING_DIR_NATIVE}/usr/share/cwautomacros/m4%g' ${S}/Makefile.am ${S}/tilde/Makefile.am
-- 
2.1.4


