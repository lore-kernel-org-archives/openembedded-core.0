Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11S-00028G-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520364"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:45 -0700
Message-Id: <89a4526ac1ef3be68e583bd6e6e87635345fdb4f.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 27/39] gtk-sato-engine: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index 8472ecb..f75a038 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -10,7 +10,7 @@ RDEPENDS_gtk-theme-sato = "gtk-sato-engine"
 
 PACKAGES += "gtk-theme-sato"
 FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
-FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*"
+FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*.la"
 FILES_${PN}-dbg += " ${libdir}/gtk-2.0/*/engines/.debug"
 FILES_gtk-theme-sato = "${datadir}/icons ${datadir}/themes"
 
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index d6685f5..467c40a 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 SRCREV = "e4a29fbb7648f12fb3aefd8ea0120c3f54ba392a"
 PV = "0.3.3+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
-- 
1.7.7.6



