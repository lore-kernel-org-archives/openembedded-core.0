Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7fb-0007V8-3w
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:56:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916486"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:10 -0700
Message-Id: <77c74429280c4f23bd59722b7d669a7a1f3b8c67.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 17/18] glib-networking: Update to 2.36
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
X-List-Received-Date: Wed, 24 Apr 2013 21:56:57 -0000

COPYING file: Address and Formating changes only

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{glib-networking_2.28.7.bb => glib-networking_2.36.0.bb}   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.28.7.bb => glib-networking_2.36.0.bb} (71%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
similarity index 71%
rename from meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
index 17f0102..2cc69ef 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
@@ -3,17 +3,15 @@ HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "libs"
 DEPENDS = "glib-2.0 gnutls intltool-native"
 
-PR = "r3"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/2.36/${BPN}-${PV}.tar.xz"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "c10e51571d03c10111a37bcd21fbf777"
-SRC_URI[sha256sum] = "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
+SRC_URI[md5sum] = "062dafdb939510e7b38eea3d3b367be0"
+SRC_URI[sha256sum] = "190d66fbaeb023ba4f43c315f23c5372c43be6cbe857596e00990211514650d9"
 
 EXTRA_OECONF = "--without-ca-certificates --without-gnome-proxy --without-libproxy"
 
-- 
1.8.0.2



