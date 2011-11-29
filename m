Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD0-0003Rr-Hg
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086458"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:49 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:15 +0800
Message-Id: <e19a8d0c111bc221f23042f8be670737649b0526.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 4/8] libsoup-2.4: Upgrade to 2.36.1
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:31 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...libsoup-2.4_2.34.2.bb => libsoup-2.4_2.36.1.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.34.2.bb => libsoup-2.4_2.36.1.bb} (53%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
similarity index 53%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
index 57af8f7..d8ee8d5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
@@ -3,17 +3,17 @@ HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
 PR = "r0"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.34/libsoup-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libsoup/2.36/libsoup-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "2454b38681a6e082b613a781a501e721"
-SRC_URI[sha256sum] = "1d70edc48c309528635012269733739f9cd22548913125864318a65d1b6f1261"
+SRC_URI[md5sum] = "9c03fc033da61deaf5b403e9e9c884b8"
+SRC_URI[sha256sum] = "c387eefd8214c458965b1d6e3490cea33b5bb6c81798cac90cde96136dc19401"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.1



