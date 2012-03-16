Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHl-0001Ui-JJ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139658537"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:36:00 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:22 +0800
Message-Id: <0886caed347e2f5e17086af7461eaf7c6ba3d4cf.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 25/60] avahi: upgrade to 0.6.31
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:49 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 .../avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb}     |    4 +-
 .../avahi/files/fix_for_automake_1.11.2.patch      |   24 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb} (80%)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 5e29b9c..a710f95 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r11"
+INC_PR = "r0"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
similarity index 80%
rename from meta/recipes-connectivity/avahi/avahi_0.6.30.bb
rename to meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index 692a5df..bfbe1ba 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -12,5 +12,5 @@ DEPENDS += "intltool-native"
 
 PACKAGES =+ "libavahi-gobject"
 
-SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
-SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
+SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
+SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
diff --git a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
index e7a1908..33938e3 100644
--- a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
+++ b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
@@ -2,7 +2,7 @@ Upstream-Status: Pending
 
 automake version 1.11.2 has made use of dir variables more strict.
 the use of pkglibdir with DATA var results in automake errors.
-  This commits uses pkgdatadir var instead of pkglibdir to avoid 
+  This commits uses pkgdatadir var instead of pkglibdir to avoid
 the strict check errors.
 
 Fixes this error:
@@ -12,32 +12,32 @@ ERROR: autoreconf execution failed.
 
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 2011/12/28
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+2012/03/14
 
-
-Index: avahi-0.6.30/service-type-database/Makefile.am
-===================================================================
---- avahi-0.6.30.orig/service-type-database/Makefile.am
-+++ avahi-0.6.30/service-type-database/Makefile.am
-@@ -18,13 +18,12 @@
- EXTRA_DIST=build-db.in service-types
+diff -r b88fdefa6104 service-type-database/Makefile.am
+--- a/service-type-database/Makefile.am	Wed Mar 14 17:16:44 2012 +0800
++++ b/service-type-database/Makefile.am	Wed Mar 14 17:19:20 2012 +0800
+@@ -20,13 +20,12 @@
+ pkglibdatadir=$(libdir)/avahi
  
  pkgdata_DATA=service-types
--pkglib_DATA=
+-pkglibdata_DATA=
  
  if HAVE_PYTHON
  if HAVE_GDBM
  
  noinst_SCRIPTS=build-db
--pkglib_DATA+=service-types.db
+-pkglibdata_DATA+=service-types.db
 +pkgdata_DATA+=service-types.db
  
  build-db: build-db.in
  	$(AM_V_GEN)sed -e 's,@PYTHON\@,$(PYTHON),g' \
-@@ -41,7 +40,7 @@ endif
+@@ -43,7 +42,7 @@
  if HAVE_DBM
  
  noinst_SCRIPTS=build-db
--pkglib_DATA+=service-types.db.pag service-types.db.dir
+-pkglibdata_DATA+=service-types.db.pag service-types.db.dir
 +pkgdata_DATA+=service-types.db.pag service-types.db.dir
  
  build-db: build-db.in
-- 
1.7.6



