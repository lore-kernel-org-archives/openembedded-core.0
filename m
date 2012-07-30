Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SvqWW-0004S0-Ge
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 16:00:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2012 06:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173155524"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 06:49:03 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 16:51:17 +0300
Message-Id: <1343656277-23686-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bison: updated to 2.5.1
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
X-List-Received-Date: Mon, 30 Jul 2012 14:00:40 -0000

The gets patch is not needed anymore in this version. The
manpage patch was updated for this version.
---
 .../bison/bison/fix_cross_manpage_building.patch   |   15 +++++++--------
 .../bison/{bison_2.5.bb => bison_2.5.1.bb}         |    7 ++-----
 2 files changed, 9 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/bison/{bison_2.5.bb => bison_2.5.1.bb} (86%)

diff --git a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch b/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
index 126cbaa..8b68379 100644
--- a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
+++ b/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
@@ -5,16 +5,15 @@ help2man is looking at the generated binary for help output. This does not work
 Date: 2010/06/28
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 
-Index: bison-2.4.2/doc/Makefile.am
-===================================================================
---- bison-2.4.2.orig/doc/Makefile.am
-+++ bison-2.4.2/doc/Makefile.am
-@@ -77,7 +77,7 @@ PREPATH = $(top_builddir)/src
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index c7f2755..af9453a 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -80,7 +80,6 @@ PREPATH = $(top_builddir)/src
+ 	  echo cd $$dir '&&' $(MAKE) $(AM_MAKEFLAGS) $$program &&	\
  	  (cd $$dir && $(MAKE) $(AM_MAKEFLAGS) $$program) || exit;	\
  	done
- 	@echo "Updating man page $@"
--	PATH="$(PREPATH)$(PATH_SEPARATOR)$$PATH";			     \
-+#	PATH="$(PREPATH)$(PATH_SEPARATOR)$$PATH";			     
+-	$(AM_V_at)PATH="$(PREPATH)$(PATH_SEPARATOR)$$PATH";		     \
  	export PATH;							     \
  	$(HELP2MAN)							     \
  	    --include=$*.x						     \
diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.1.bb
similarity index 86%
rename from meta/recipes-devtools/bison/bison_2.5.bb
rename to meta/recipes-devtools/bison/bison_2.5.1.bb
index 5028300..d53c1d6 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.1.bb
@@ -9,19 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-PR = "r3"
-
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
-           file://remove-gets.patch \
 	  "
 
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
           "
 
-SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
-SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
+SRC_URI[md5sum] = "8fedf916f1aa2c4a31441d8f8bbc603c"
+SRC_URI[sha256sum] = "48dc3649231b75ac160d73528000ec89b6cd8d3b87cb7d0713f72ef4610442d4"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_virtclass-native = "gettext-minimal-native"
-- 
1.7.9.5



