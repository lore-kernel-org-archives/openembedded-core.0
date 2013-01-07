Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Ts974-00085E-Pq
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 10:35:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 01:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,423,1355126400"; d="scan'208";a="188418910"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jan 2013 01:19:53 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:20:32 +0200
Message-Id: <1357550432-9072-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] libgdata: remove recipe
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
X-List-Received-Date: Mon, 07 Jan 2013 09:35:23 -0000

Part of the sato trimming process

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gnome/libgdata_0.7.1.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/libgdata_0.7.1.bb

diff --git a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb b/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
deleted file mode 100644
index c3f4047..0000000
--- a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "GLib-based library for accessing online service APIs using the GData protocol"
-HOMEPAGE = "http://live.gnome.org/libgdata"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
-                    file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
-
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
-
-inherit gnome pkgconfig autotools gettext
-
-SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
-SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-- 
1.7.11.7



