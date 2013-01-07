Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TsBgL-0001Qz-US
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:20:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2013 04:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,423,1355126400"; d="scan'208";a="268608083"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2013 04:04:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:05:25 +0200
Message-Id: <1357560325-8260-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2] gsettings-desktop-schemas: add missing elements from meta-gnome
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
X-List-Received-Date: Mon, 07 Jan 2013 12:20:05 -0000

- add postinst using gsettings.bbclass
- modify the recipe according to the meta-gnome variant

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
index 720858a..1242741 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -4,10 +4,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PR = "r1"
 
-DEPENDS = "glib-2.0"
-
-inherit gnome pkgconfig autotools gettext
+inherit gnome gsettings
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.7.11.7



