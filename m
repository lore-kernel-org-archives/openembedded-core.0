Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzO8-0003b9-J8
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292554"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:55 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:44 -0800
Message-Id: <cebed07436b6579a9268337ed36083c7472da504.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 01/10] mutter: switch to clutter-1.8 to satisfy dependency
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:28 -0000

It's API and ABI compatible with 1.6 so just update the DEPENDS entry.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/mutter/mutter.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index d87c30e..4b73d97 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -1,7 +1,7 @@
 SECTION = "x11/wm"
 DESCRIPTION = "Metacity is the boring window manager for the adult in you. Mutter is metacity + clutter."
 LICENSE = "GPLv2"
-DEPENDS = "startup-notification gtk+ gconf clutter-1.6 gdk-pixbuf-native intltool glib-2.0-native"
+DEPENDS = "startup-notification gtk+ gconf clutter-1.8 gdk-pixbuf-native intltool glib-2.0-native"
 # gobject-introspection
 inherit gnome update-alternatives
 
-- 
1.7.7.3



