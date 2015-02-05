Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A6AD96AC35
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:24:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="647910865"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 10:24:59 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 20:24:52 +0200
Message-Id: <449c5d0171c0d494bc8a096b1b0f8d6b5c505e66.1423160658.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423160658.git.cristian.iorga@intel.com>
References: <cover.1423160658.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423160658.git.cristian.iorga@intel.com>
References: <cover.1423160658.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] flac: upgrade to 1.3.1
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
X-List-Received-Date: Thu, 05 Feb 2015 18:25:04 -0000

- 0001-Fix-Makefile.am-altivec-logic.patch patch removed,
included upstream.
- Copyright years updated, triggered new checksums for copyright files.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../0001-Fix-Makefile.am-altivec-logic.patch       | 35 ----------------------
 .../flac/{flac_1.3.0.bb => flac_1.3.1.bb}          | 18 +++++------
 2 files changed, 7 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
 rename meta/recipes-multimedia/flac/{flac_1.3.0.bb => flac_1.3.1.bb} (77%)

diff --git a/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch b/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
deleted file mode 100644
index d086cc9..0000000
--- a/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1b3597cdc7b5e604ea37db29b2a65aab91e263e6 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 4 Dec 2013 13:31:28 -0300
-Subject: [PATCH] Fix Makefile.am altivec logic
-
-Upstream-Status: Backport
-
-Besides SPE (FSL e500v? cores) there are other powerpc processors
-that don't support altivec instructions so only enable them when it's
-100% sure that the target has it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
-Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
----
- src/libFLAC/Makefile.am | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
-index 247e33c..258de40 100644
---- a/src/libFLAC/Makefile.am
-+++ b/src/libFLAC/Makefile.am
-@@ -47,8 +47,7 @@ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
- CPUCFLAGS =
--if FLaC__CPU_PPC_SPE
--else
-+if FLaC__USE_ALTIVEC
- CPUCFLAGS += -maltivec -mabi=altivec
- endif
- #@@@ PPC optimizations temporarily disabled
--- 
-1.8.3.2
-
diff --git a/meta/recipes-multimedia/flac/flac_1.3.0.bb b/meta/recipes-multimedia/flac/flac_1.3.1.bb
similarity index 77%
rename from meta/recipes-multimedia/flac/flac_1.3.0.bb
rename to meta/recipes-multimedia/flac/flac_1.3.1.bb
index ba9b628..f25271f 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.1.bb
@@ -5,23 +5,19 @@ BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=59575c1aa8f5f70d9361b776c2e2bdb5 \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=0a853b81d9d43d8aad3b53b05cfcc37e \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=d36a16abc38d5ffd346ac4ba1be1932b \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=d03a766558d233f9cc3ac5dfafd49deb \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=e33e281151e7f40db2d3d170d9b0c1bb \
-                    file://COPYING.Xiph;md5=755582d124a03e3001afea59fc02b61b \
+                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=7c8a3b9e1e66ed0aba765bc6f35da85d \
+                    file://COPYING.Xiph;md5=a2c4b71c0198682376d483eb5bcc9197 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
-           file://0001-Fix-Makefile.am-altivec-logic.patch \
-          "
+SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "13b5c214cee8373464d3d65dee362cdd"
-SRC_URI[sha256sum] = "fa2d64aac1f77e31dfbb270aeb08f5b32e27036a52ad15e69a77e309528010dc"
-
-PR = "r1"
+SRC_URI[md5sum] = "b9922c9a0378c88d3e901b234f852698"
+SRC_URI[sha256sum] = "4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c"
 
 inherit autotools gettext
 
-- 
2.1.0


