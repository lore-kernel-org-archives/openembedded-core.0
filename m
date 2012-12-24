Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iV-0003pg-MU
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440683"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:03 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:21 +0200
Message-Id: <88d5e0c0534e579598dbd3eda9fe757b49ea21bf.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 09/15] libsoup-2.4: upgrade to 2.40.2
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
 .../libsoup/{libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.38.1.bb => libsoup-2.4_2.40.2.bb} (81%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
similarity index 81%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
index 4a4d59a..9274f8c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r2"
+PR = "r0"
 
 SECTION = "x11/gnome/libs"
 
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d13fb4968acea24c26b83268a308f580"
-SRC_URI[sha256sum] = "71b8923fc7a5fef9abc5420f7f3d666fdb589f43a8c50892d584d58b3c513f9a"
+SRC_URI[md5sum] = "211ec6b733d4de33056b56838c88436e"
+SRC_URI[sha256sum] = "32e81220f53abb1f5bbe7d8b0717119df70667fc48e2342d82209ed1593e71dc"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.11.7



