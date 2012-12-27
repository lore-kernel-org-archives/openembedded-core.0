Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERV-0001tt-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466202"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:20 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:53 +0200
Message-Id: <c4cfa07ddb4f9d6556061c8a005e087c8ea0035c.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
Subject: [PATCH 2/6] vte: add missing unpackaged files
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
X-List-Received-Date: Thu, 27 Dec 2012 14:28:18 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/vte/vte.inc       | 3 ++-
 meta/recipes-support/vte/vte_0.28.2.bb | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 0766da7..2d4e9aa 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -10,5 +10,6 @@ EXTRA_OECONF = "--disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES_vte-dbg =+ "${libexecdir}/.debug"
+FILES_vte-dbg =+ "${libexecdir}/.debug ${prefix}/src ${bindir}/.debug \
+               ${libdir}/.debug"
 FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 1fe66e7..9ad4a96 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.11.7



