Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2jFy-0000ru-OJ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:07:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Feb 2012 04:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130942560"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.96])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2012 04:59:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 12:59:14 +0000
Message-Id: <9f75e5f43a30ed6e154f299ead955588c98de5c7.1330520324.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330520324.git.paul.eggleton@linux.intel.com>
References: <cover.1330520324.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330520324.git.paul.eggleton@linux.intel.com>
References: <cover.1330520324.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] More quoting fixes
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
X-List-Received-Date: Wed, 29 Feb 2012 13:07:46 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../opensync/libsyncml_0.5.4.bb                    |    2 +-
 meta/recipes-devtools/guile/guile_2.0.3.bb         |    2 +-
 meta/recipes-graphics/cairo/cairo.inc              |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb b/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
index c045698..e96463b 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
+++ b/meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb
@@ -14,4 +14,4 @@ PACKAGES += "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
 FILES_${PN} = "${libdir}/*.so.*"
 
-export VERBOSE=1
+export VERBOSE="1"
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index 729aed0..538ff46 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -39,7 +39,7 @@ do_configure_prepend() {
 	mkdir -p po
 }
 
-export GUILE_FOR_BUILD=${BUILD_SYS}-guile
+export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
 
 do_compile_append() {
 	# just for target recipe
diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 1d5d551..69984cb 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -27,4 +27,4 @@ EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr=no
+export ac_cv_lib_bfd_bfd_openr="no"
-- 
1.7.5.4



