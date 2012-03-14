Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG4-000630-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93oDo024781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:50 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:36 +0800
Message-ID: <21ab78e018069c64f0ce142a617efc6ca5cee0ce.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 1/8] gobject-introspection: update to 1.31.20
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:36 -0000
Content-Type: text/plain

Add a new recipe file to update gobject-introspection to 1.31.20,
instead of git version.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../gnome/gobject-introspection_1.31.20.bb         |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb

diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
new file mode 100644
index 0000000..beb96a6
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gobject-introspection_1.31.20.bb
@@ -0,0 +1,28 @@
+# NOTE: WIP! This recipe does not cross-compile atm., only -native
+DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
+DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
+BBCLASSEXTEND = "native"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.31/gobject-introspection-1.31.20.tar.xz \
+  file://use-usr-bin-env-for-python.patch \
+"
+
+SRC_URI[md5sum] = "05d9ac99a5929d002867b86a2a69b8b5"
+SRC_URI[sha256sum] = "e1552884b642e7e5a56a175ae85bfdebfd16c29a7bbe4f6ca9cdf591e333f070"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+inherit autotools
+
+do_configure_prepend () {
+        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
+}
+
+EXTRA_OECONF = "\
+  --disable-gtk-doc \
+  --disable-gtk-doc-html \
+  --disable-gtk-doc-pdf \
+  --disable-tests \
+"
-- 
1.7.5.4



