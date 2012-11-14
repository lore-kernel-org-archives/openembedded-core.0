Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlY2-0000MD-Qu
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:09 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490559"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:20:55 -0800
Message-Id: <92a1ee6882497ec5b814f76425715497ab6f1b18.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 02/10] mx: Update to 1.4.7
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
X-List-Received-Date: Wed, 14 Nov 2012 22:35:11 -0000

Source moved to GitHub

(From OE-Core rev: d0f9486a2c71999f3730b525769e703165b98bb8)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mx/{mx_1.4.6.bb => mx_1.4.7.bb}                |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/mx/{mx_1.4.6.bb => mx_1.4.7.bb} (66%)

diff --git a/meta/recipes-graphics/mx/mx_1.4.6.bb b/meta/recipes-graphics/mx/mx_1.4.7.bb
similarity index 66%
rename from meta/recipes-graphics/mx/mx_1.4.6.bb
rename to meta/recipes-graphics/mx/mx_1.4.7.bb
index 81bc5b9..fd9189b 100644
--- a/meta/recipes-graphics/mx/mx_1.4.6.bb
+++ b/meta/recipes-graphics/mx/mx_1.4.7.bb
@@ -1,19 +1,18 @@
 DESCRIPTION = "Clutter based widget library"
 LICENSE = "LGPLv2.1"
 
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
+                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
+
 PR = "r0"
 
 DEPENDS = "clutter-1.8 dbus-glib libxrandr gdk-pixbuf startup-notification"
 
 inherit autotools gettext
 
-SRC_URI = "http://source.clutter-project.org/sources/mx/1.4/mx-${PV}.tar.bz2"
+SRC_URI = "https://github.com/downloads/clutter-project/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "c7192ca7c43bb1a39adc2fafdc012f49"
-SRC_URI[sha256sum] = "a3c7ffaf29b282144c982757b450d145cd85867183dfafef4750a00a0d406672"
-
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
-                    file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
+SRC_URI[md5sum] = "19b1e4918a5ae6d014fc0dab2bb3d0a1"
+SRC_URI[sha256sum] = "1d2930d196717cacbee0ee101cf21d289b8200b5e938823d852b3b4a2f4a0e9d"
 
 EXTRA_OECONF = "--disable-introspection --disable-gtk-widgets --with-dbus"
-
-- 
1.7.7.6



