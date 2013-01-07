Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TsEDK-0008IU-Nw
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:02:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 06:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="240866038"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 07 Jan 2013 06:46:57 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 16:47:35 +0200
Message-Id: <1357570055-1570-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v3] gsettings-desktop-schemas: add missing elements from meta-gnome
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
X-List-Received-Date: Mon, 07 Jan 2013 15:02:16 -0000

- add postinst using gsettings.bbclass
- modify the recipe according to the meta-gnome variant

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
index 720858a..874f9cb 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -4,10 +4,11 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PR = "r1"
 
 DEPENDS = "glib-2.0"
 
-inherit gnome pkgconfig autotools gettext
+inherit gnome gsettings gettext
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.7.11.7



