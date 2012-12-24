Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iU-0003pg-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440662"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:59 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:18 +0200
Message-Id: <c4300d93077c7ea95b42af918407c38c3f9e663a.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 06/15] json-glib: upgrade to 0.15.2
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:59 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../json-glib/{json-glib_0.14.2.bb => json-glib_0.15.2.bb}        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.14.2.bb => json-glib_0.15.2.bb} (74%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.15.2.bb
similarity index 74%
rename from meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_0.15.2.bb
index a4cbd51..2307f76 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.15.2.bb
@@ -8,12 +8,14 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r2"
+PR = "r0"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "5716a181a2b85268f53a1fb0c8024c4a"
-SRC_URI[archive.sha256sum] = "b62cb148ae49d30d8ad807912ba3c7cf189459e2d75233620aae411cf8ea6c04"
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "494332526f87956d05f32a9b12f3f286"
+SRC_URI[archive.sha256sum] = "f090cd94acc85989e033d72028fa70863d05092ae5bba6b454e70c132b24cdde"
 
 inherit gnome gettext
 
-- 
1.7.11.7



