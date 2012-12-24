Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iX-0003rc-9A
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440716"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:10 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:27 +0200
Message-Id: <3f5842a6a115b5c6a06b3b0312e9733e5560a16b.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 15/15] shared-mime-info: upgrade to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 08:49:02 -0000

parallelmake.patch: adapt to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../shared-mime-info/shared-mime-info/parallelmake.patch      | 11 ++++++-----
 .../{shared-mime-info_0.91.bb => shared-mime-info_1.0.bb}     |  6 +++---
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_0.91.bb => shared-mime-info_1.0.bb} (41%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
index 8b6f9e5..82ab1d2 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
@@ -9,23 +9,24 @@ dependencies and stop itself racing itself.
 RP 10/10/2011
 
 Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: shared-mime-info-0.91/Makefile.am
+Index: shared-mime-info-1.0/Makefile.am
 ===================================================================
---- shared-mime-info-0.91.orig/Makefile.am	2011-10-10 21:47:19.834173921 +0100
-+++ shared-mime-info-0.91/Makefile.am	2011-10-10 21:45:57.000000000 +0100
+--- shared-mime-info-1.0.orig/Makefile.am
++++ shared-mime-info-1.0/Makefile.am
 @@ -1,5 +1,3 @@
 -SUBDIRS=. po
 -
  INCLUDES = $(ALL_CFLAGS)
  
  packagesdir = $(datadir)/mime/packages
-@@ -70,8 +68,7 @@
+@@ -72,8 +70,7 @@ uninstall-hook:
  
  all: check create-pot
  
 -create-pot:
--	$(MAKE) -C po shared-mime-info.pot
+-	$(AM_V_GEN) $(MAKE) -C po shared-mime-info.pot
 +create-pot: po
  
  check: create-pot freedesktop.org.xml update-mime-database check-translations
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb
similarity index 41%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb
index 910cb7f..d9b7b51 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb
@@ -1,8 +1,8 @@
 require shared-mime-info.inc
-PR = "r4"
+PR = "r0"
 
-SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
-SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
+SRC_URI[md5sum] = "901b7977dbb2b71d12d30d4d8fb97028"
+SRC_URI[sha256sum] = "d2e830e5aae213dd906e64495e9618cc4ef40d7b249e0971a190b04d5802ae8f"
 
 SRC_URI =+ "file://parallelmake.patch \
 	    file://install-data-hook.patch"
-- 
1.7.11.7



