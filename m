Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7O-00084I-QK
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453919"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:57 -0700
Message-Id: <43556a4125f18e94e6c1b1986ccdb3a3b9217e03.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/19] gobject-introspection: upgrade to 1.32.1
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:55 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* simplify SRC_URI
* add COPYING to LIC_FILES_CHKSUM

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ..._1.31.20.bb => gobject-introspection_1.32.1.bb} |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb => gobject-introspection_1.32.1.bb} (52%)

diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
similarity index 52%
rename from meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
rename to meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
index beb96a6..f51e83e 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
@@ -3,16 +3,19 @@ DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
 DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.31/gobject-introspection-1.31.20.tar.xz \
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "\
+  ${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
   file://use-usr-bin-env-for-python.patch \
 "
 
-SRC_URI[md5sum] = "05d9ac99a5929d002867b86a2a69b8b5"
-SRC_URI[sha256sum] = "e1552884b642e7e5a56a175ae85bfdebfd16c29a7bbe4f6ca9cdf591e333f070"
+SRC_URI[md5sum] = "7bbdb696c37bb98aef5af02c4b8975e3"
+SRC_URI[sha256sum] = "44f3fb933f76e4728818cc360cb5f9e2edcbdf9bc8a8f9aded99b3e3ef5cb858"
 
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
+                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit autotools
 
-- 
1.7.7.6



