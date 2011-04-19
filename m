Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCHum-0003jh-BC
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 22:52:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 13:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,241,1301900400"; d="scan'208";a="911846019"
Received: from unknown (HELO localhost) ([10.255.12.208])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2011 13:50:29 -0700
Message-Id: <4d59efe89681c5f9805011fe268b9b758b5f8b7d.1303246083.git.josh@linux.intel.com>
In-Reply-To: <cover.1303246083.git.josh@linux.intel.com>
References: <cover.1303246083.git.josh@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:02:48 -0700
Date: Tue, 19 Apr 2011 13:50:28 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/2] json-glib: new recipe required by clutter
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
X-List-Received-Date: Tue, 19 Apr 2011 20:52:54 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib_0.12.2.bb

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.12.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.12.2.bb
new file mode 100644
index 0000000..58dcde9
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib_0.12.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "JSON-GLib implements a full JSON parser using GLib and GObject."
+DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
+ data structures, using a DOM-like API. JSON-GLib also offers GObject \
+integration, providing the ability to serialize and deserialize GObject \
+instances to and from JSON data types."
+HOMEPAGE = "http://live.gnome.org/JsonGlib"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI[archive.md5sum] = "71f911329c9f742543b378c3494490da"
+SRC_URI[archive.sha256sum] = "89fa9b870dfe2d8b7b00210be76cdbb2d46a8d2cc77ca7cbe5d081bdf8cad780"
+
+PR = "r0"
+
+inherit gnome
+
+EXTRA_OECONF = "--disable-introspection"
-- 
1.7.4.4



