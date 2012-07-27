Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suj8N-00030D-Be for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:55:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBhZVq005768
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:43:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04762-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:43:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RBhLGl005762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 12:43:26 +0100
Message-ID: <1343389394.9574.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 12:43:14 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gobject-introspection: Drop the recipe, it has never worked and if it does cross compile, we can add it back
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
X-List-Received-Date: Fri, 27 Jul 2012 11:55:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index f7c222e..ab0c2dc 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -1,5 +1,5 @@
 #
 # Exclude known broken packages
 #
-EXCLUDE_FROM_WORLD_pn-gobject-introspection = "1"
+
 
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 1200589..6a3fa54 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -198,7 +198,6 @@ BBCLASSEXTEND_append_pn-gnome-terminal = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnu-config = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnupg = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnutls = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-gobject-introspection = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gperf = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gpgme = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-grep = " ${MULTILIBS}"
diff --git a/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch b/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
deleted file mode 100644
index ea00157..0000000
--- a/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
+++ b/dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
-===================================================================
---- gobject-introspection-0.9.10.orig/tools/g-ir-annotation-tool.in
-+++ gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@
-+#!/usr/bin/env python
- # -*- Mode: Python -*-
- # GObject-Introspection - a framework for introspecting GObject libraries
- # Copyright (C) 2008  Johan Dahlin
-Index: gobject-introspection-0.9.10/tools/g-ir-scanner.in
-===================================================================
---- gobject-introspection-0.9.10.orig/tools/g-ir-scanner.in
-+++ gobject-introspection-0.9.10/tools/g-ir-scanner.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@
-+#!/usr/bin/env python
- # -*- Mode: Python -*-
- # GObject-Introspection - a framework for introspecting GObject libraries
- # Copyright (C) 2008  Johan Dahlin
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
deleted file mode 100644
index 8f5ca56..0000000
--- a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
+++ b/dev/null
@@ -1,28 +0,0 @@
-# NOTE: WIP! This recipe does not cross-compile atm., only -native
-DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
-DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
-BBCLASSEXTEND = "native"
-
-PR = "r1"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "\
-  ${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
-  file://use-usr-bin-env-for-python.patch \
-"
-
-SRC_URI[md5sum] = "7bbdb696c37bb98aef5af02c4b8975e3"
-SRC_URI[sha256sum] = "44f3fb933f76e4728818cc360cb5f9e2edcbdf9bc8a8f9aded99b3e3ef5cb858"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
-                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-inherit autotools gtk-doc pythonnative
-
-do_configure_prepend () {
-        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
-}
-
-EXTRA_OECONF = "--disable-tests"
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
deleted file mode 100644
index 8a9aa14..0000000
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/dev/null
@@ -1,28 +0,0 @@
-# NOTE: WIP! This recipe does not cross-compile atm., only -native
-DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
-DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
-BBCLASSEXTEND = "native"
-
-SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
-  file://use-usr-bin-env-for-python.patch \
-"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
-PV = "1.29.0+gitr${SRCPV}"
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/git"
-
-inherit autotools gtk-doc pythonnative
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "\
-  --disable-tests \
-"




