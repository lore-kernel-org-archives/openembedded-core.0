Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9J9g-0004IS-TE
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 19:12:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2012 10:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,375,1344236400"; d="scan'208";a="189168596"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.76])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2012 10:00:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 10:00:17 -0700
Message-Id: <1346864417-23511-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] python-pygtk: Upgrade to 2.24
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
X-List-Received-Date: Wed, 05 Sep 2012 17:12:45 -0000

This is needed for the build appliance and Hob also

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python-pygtk/fix-gtkunixprint.patch     |   14 ++++++++------
 ...thon-pygtk_2.17.0.bb => python-pygtk_2.24.0.bb} |    8 ++++----
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python-pygtk_2.17.0.bb => python-pygtk_2.24.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
index 6d2f64b..16c0e8e 100644
--- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
+++ b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
@@ -1,17 +1,19 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: pygtk-2.10.0/gtk/gtkunixprint.override
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: pygtk-2.24.0/gtk/gtkunixprint.override
 ===================================================================
---- pygtk-2.10.0.orig/gtk/gtkunixprint.override
-+++ pygtk-2.10.0/gtk/gtkunixprint.override
-@@ -105,11 +105,7 @@ _wrap_gtk_print_job_get_surface(PyGObjec
+--- pygtk-2.24.0.orig/gtk/gtkunixprint.override
++++ pygtk-2.24.0/gtk/gtkunixprint.override
+@@ -102,11 +102,6 @@ _wrap_gtk_print_job_get_surface(PyGObjec
      if (pyg_error_check(&error))
          return NULL;
  
 -#if PYCAIRO_VERSION_HEX >= 0x1010600
-     return PycairoSurface_FromSurface(surface, NULL);
+-    return PycairoSurface_FromSurface(cairo_surface_reference(surface), NULL);
 -#else
--    return PycairoSurface_FromSurface(surface, NULL, NULL);
+-    return PycairoSurface_FromSurface(cairo_surface_reference(surface), NULL, NULL);
 -#endif
  }
  %%
diff --git a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python-pygtk_2.17.0.bb
rename to meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 603ec5b..20d54a3 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.17.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -7,16 +7,16 @@ PROVIDES = "python-pygtk2"
 SRCNAME = "pygtk"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-PR = "ml10"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.17/${SRCNAME}-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2 \
            file://fix-gtkunixprint.patch \
            file://prevent_to_get_display_during_import.patch \
            file://nodocs.patch \
            file://acinclude.m4"
 
-SRC_URI[md5sum] = "43d704343d7ca04a6e4ddd4fa73a3c55"
-SRC_URI[sha256sum] = "6a61817a2e765c6209c72ecdf44389ec134c1ebed1d842408bf001c9321f1400"
+SRC_URI[md5sum] = "a1051d5794fd7696d3c1af6422d17a49"
+SRC_URI[sha256sum] = "cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e0f82c896e649f206912"
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
-- 
1.7.7.6



