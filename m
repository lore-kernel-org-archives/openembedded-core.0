Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNb-0006gF-LC
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:27 +0200
Received: by wwb17 with SMTP id 17so2008439wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:03 -0700 (PDT)
Received: by 10.216.62.130 with SMTP id y2mr2368282wec.20.1303409463171;
	Thu, 21 Apr 2011 11:11:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d54sm1082404wej.10.2011.04.21.11.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:44 +0200
Message-Id: <1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 02/10] wv: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/wv/wv-1.2.0/pkgconfig.patch      |   13 +++++++++++++
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb            |   14 ++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
 create mode 100644 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb

diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch b/meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
new file mode 100644
index 0000000..136d893
--- /dev/null
+++ b/meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
@@ -0,0 +1,13 @@
+Index: wv-1.2.0/wv-1.0.pc.in
+===================================================================
+--- wv-1.2.0.orig/wv-1.0.pc.in	2008-03-19 22:25:18.000000000 +0000
++++ wv-1.2.0/wv-1.0.pc.in	2008-03-19 22:26:32.000000000 +0000
+@@ -6,5 +6,6 @@
+ Name: wvWare
+ Description: Word Document Filter library and utilities
+ Version: @VERSION@
+-Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @GLIB_LIBS@ @GSF_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
+-Cflags: -I${includedir}/wv @GSF_CFLAGS@
++Requires: libgsf-1
++Libs: -L${libdir} -lwv @WMF_LIBS@ @XML_LIBS@ @PNG_LIBS@ @ZLIB_LIBS@ @LIBS@ -lm
++Cflags: -I${includedir}/wv
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
new file mode 100644
index 0000000..c4c115b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Programs for accessing Microsoft Word documents"
+HOMEPAGE = "http://wvware.sourceforge.net/"
+LICENSE = "GPLv2"
+DEPENDS = "libgsf glib-2.0"
+PR = "r3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
+           file://pkgconfig.patch;patch=1"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+EXTRA_OECONF = ""
-- 
1.6.6.1



