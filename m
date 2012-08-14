Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCH-0000Ym-FO
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181215"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:03 +0300
Message-Id: <62dbfc54cf1754094301323ef5dac2ba52ef9441.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 16/64] mutter: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/mutter/mutter.inc       |    5 ++---
 meta/recipes-graphics/mutter/mutter_2.29.1.bb |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index 4b73d97..27cf413 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -5,9 +5,8 @@ DEPENDS = "startup-notification gtk+ gconf clutter-1.8 gdk-pixbuf-native intltoo
 # gobject-introspection
 inherit gnome update-alternatives
 
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/mutter"
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/mutter"
 ALTERNATIVE_PRIORITY = "11"
 
 EXTRA_OECONF += "--disable-verbose	\
diff --git a/meta/recipes-graphics/mutter/mutter_2.29.1.bb b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
index 5d031f6..aefd2c7 100644
--- a/meta/recipes-graphics/mutter/mutter_2.29.1.bb
+++ b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
@@ -1,6 +1,6 @@
 require mutter.inc
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
1.7.7.6



