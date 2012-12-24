Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iJ-0003rX-Q9
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440647"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:57 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:16 +0200
Message-Id: <19b7d9e3bb737534dd4de56bba8b7372aae56eb0.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 04/15] gsettings-desktop-schemas: add recipe
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:58 -0000
X-List-Received-Date: Mon, 24 Dec 2012 08:48:58 -0000

- this is needed by metacity 2.34.13

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../gnome/gsettings-desktop-schemas_3.7.3.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
new file mode 100644
index 0000000..720858a
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A collection of GSettings schemas for settings shared by various components of a desktop"
+HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "glib-2.0"
+
+inherit gnome pkgconfig autotools gettext
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "6dbede8f6112b7e0dd4864e979b91771"
+SRC_URI[archive.sha256sum] = "1da53e1b960f08ce4b0d472e6f339b7beaf19a7889c15911775abf4efe2ec760"
-- 
1.7.11.7



