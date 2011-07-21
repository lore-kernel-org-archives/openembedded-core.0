Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QjveW-0000KU-41
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 17:59:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 08:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="33030643"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 08:54:41 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 02:29:12 -0700
Message-Id: <3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311240498.git.nitin.a.kamble@intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311240498.git.nitin.a.kamble@intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Thu, 21 Jul 2011 15:59:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    1 -
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
index a2e609f..7d095c1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -19,4 +19,3 @@ SRC_URI[md5sum] = "789e7520f71c6a4bf08bc683ec764d24"
 SRC_URI[sha256sum] = "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
 
 BBCLASSEXTEND = "native"
-
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e25db3d..9768284 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,7 +25,7 @@ inherit autotools pkgconfig gettext
 
 S = "${WORKDIR}/glib-${PV}"
 
-EXTRA_OECONF = "--disable-debug --enable-included-printf=no"
+EXTRA_OECONF = "--disable-debug --enable-included-printf=no --enable-dtrace=no"
 EXTRA_OECONF_virtclass-native = ""
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no"
 
-- 
1.7.6



