Return-Path: <marius.avram@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E25B6D2CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 12:13:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2013 05:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397282324"
Received: from mavram-vostro.rb.intel.com ([10.237.105.72])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2013 05:13:09 -0700
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2013 15:14:54 +0300
Message-Id: <1382530494-12798-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1382529900-12710-1-git-send-email-marius.avram@intel.com>
References: <1382529900-12710-1-git-send-email-marius.avram@intel.com>
Subject: [PATCH v2 2/2] pcmanfm: Upgrade from 1.1.0 to 1.1.2
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
X-List-Received-Date: Wed, 23 Oct 2013 12:13:08 -0000

-remove a patch for cross-compile because it is not needed anymore

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 .../pcmanfm/files/cross-compile-fix.patch          |   18 ------------------
 .../pcmanfm/{pcmanfm_1.1.0.bb => pcmanfm_1.1.2.bb} |    5 ++---
 2 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.1.0.bb => pcmanfm_1.1.2.bb} (85%)

diff --git a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch b/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
deleted file mode 100644
index 0118081..0000000
--- a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-pcmanfm need a binary xml-purge(from its own source code) to optimize size of
-data file, which cause build error on cross-compile environment. Simplely
-remove it to work aound this issue.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: pcmanfm-0.9.7/data/ui/Makefile.am
-===================================================================
---- pcmanfm-0.9.7.orig/data/ui/Makefile.am	2010-07-29 15:10:18.000000000 +0800
-+++ pcmanfm-0.9.7/data/ui/Makefile.am	2010-07-29 15:11:24.000000000 +0800
-@@ -21,4 +21,4 @@
- # Purge GtkBuilder UI files
- %.ui: %.glade
- 	cp $< $@
--	$(top_builddir)/src/xml-purge $@
-+#	$(top_builddir)/src/xml-purge $@
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
similarity index 85%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
index 9a038fe..2be4a56 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
@@ -20,11 +20,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
-	   file://cross-compile-fix.patch \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "af0cff78690e658f3c06ceabf27bc71a"
-SRC_URI[sha256sum] = "1f6301f330ad648f3322708ec6c0f680a8695a9453932fe19653bab6731e5582"
+SRC_URI[md5sum] = "41104699e653ff2b0a9a9e80a257d6a2"
+SRC_URI[sha256sum] = "23ee33b34066ac83ce9a98bc9930049e69839438fb60489bd453bec8c2068950"
 
 inherit autotools pkgconfig
 
-- 
1.7.9.5


