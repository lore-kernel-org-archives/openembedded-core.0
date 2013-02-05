Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U2noA-00043W-2w
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:03:54 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so523187obc.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 10:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=KAPJWZWNFBK6PCHjbvcn4mTlnutNnraslH07FP2T3xk=;
	b=lJTDgu45MHNt9KPmvHvvZOZSjL0OO6a0fYN4GvTvYR5BRutNojlDL/wEMLXVQ8izUf
	l6OHzLx37bvq4cY/cXkL6RelIMcplpWZ1GwlcjaXrEVx1X+luhMnF7T2qzKQ3Gh7jVVq
	0qQ9ZY33r7G4WGOREyOm7OyLSzlTi50vVdVJP0DnAW8cG796x9pZ1PX0XCODCcUhW1Io
	+Q6xvP2VlxJFI4nenBqLCdvWtTFI6pyrTpxtBuvZk8snOVYtiQ8JwTc0hVY6a0uF0RYH
	d/GFwlcVReOGYKJwB1QzE4POTz/37DYCFeqshspN0dg3WMMJw31NiMxxFd9+SNzsZGLm
	zp5A==
X-Received: by 10.60.13.65 with SMTP id f1mr4746304oec.87.1360090083739;
	Tue, 05 Feb 2013 10:48:03 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id 9sm1639976oeh.8.2013.02.05.10.48.02
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 10:48:02 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 10:49:14 -0800
Message-Id: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlvR/3zrnEZb7K/op4lbupxyEldmG3eAva7+Umt97fXUwnNjyR39vDaynIXjoeywtWz4Lex
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 05 Feb 2013 19:03:55 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This recipe provides the Qt library and QML plugins for connman.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 ...-to-disable-qml-plugin-and-test-program-t.patch |   35 ++++++++++
 .../connman/libconnman-qt_0.4.0.bb                 |   68 ++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
 create mode 100644 meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb

diff --git a/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch b/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
new file mode 100644
index 0000000..74c27e4
--- /dev/null
+++ b/meta/recipes-connectivity/connman/libconnman-qt/0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch
@@ -0,0 +1,35 @@
+From 3850acef7d914a22e3fc4130ad43b2cc47338d6f Mon Sep 17 00:00:00 2001
+From: "Felipe F. Tonello" <ftonello@cercacor.com>
+Date: Mon, 7 Jan 2013 17:13:22 -0800
+Subject: [PATCH] added flags to disable qml plugin and test program to
+ compile
+
+This is usefull when there is no need to compile test program and qml plugin.
+
+Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
+---
+ connman-qt.pro |   11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/connman-qt.pro b/connman-qt.pro
+index 7d9ec99..425c41f 100644
+--- a/connman-qt.pro
++++ b/connman-qt.pro
+@@ -1,4 +1,13 @@
+ TEMPLATE = subdirs
+-SUBDIRS += libconnman-qt test plugin
++SUBDIRS += libconnman-qt
+ CONFIG += ordered
+ 
++# CONFIG flag to disable test program
++!notest {
++    SUBDIRS += test
++}
++
++# CONFIG flag to disable qml plugin
++!noplugin {
++    SUBDIRS += plugin
++}
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb b/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb
new file mode 100644
index 0000000..60c11c3
--- /dev/null
+++ b/meta/recipes-connectivity/connman/libconnman-qt_0.4.0.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "Qt Library for ConnMan"
+HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
+
+SECTION = "qt/lib"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+RDEPENDS_${PN} = "connman"
+RDEPENDS_${PN}-plugin = "${PN}"
+
+PROVIDES += "${PN}-plugin"
+
+PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg"
+RRECOMMENDS_${PN} = "${PN}-plugin"
+
+BRANCH = "master"
+TAG = "${PV}"
+SRCREV = "${AUTOREV}"
+
+SRC_URI = " \
+  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
+  file://0001-added-flags-to-disable-qml-plugin-and-test-program-t.patch \
+"
+
+S = "${WORKDIR}/git"
+
+QT_IMPORTS_DIR = "${libdir}/qt4/imports"
+# the plugin target needs to be the same as 'target.path' and 'qmldir.path' in ${S}/plugin/plugin.pro
+PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/Connman"
+
+FILES_${PN} = " \
+  ${libdir}/libconnman-qt4${SOLIBS} \
+"
+
+FILES_${PN}-dev = " \
+  ${includedir}/connman-qt/* \
+  ${libdir}/libconnman-qt4${SOLIBSDEV} \
+  ${libdir}/libconnman-qt4.prl \
+  ${libdir}/pkgconfig/connman-qt4.pc \
+  ${libdir}/connman-qt4.pc \
+"
+
+FILES_${PN}-plugin = " \
+  ${PLUGINS_TARGET}/qmldir \
+  ${PLUGINS_TARGET}/lib*.so \
+"
+
+FILES_${PN}-plugin-dbg = " \
+  ${PLUGINS_TARGET}/.debug \
+  ${PLUGINS_TARGET}/.debug/* \
+"
+
+EXTRA_QMAKEVARS_PRE = " \
+  CONFIG+=notest \
+"
+
+do_configure_prepend() {
+  # Hack *.pro variables
+  find ${S}/plugin/*.pro -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
+}
+
+do_install() {
+  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+}
-- 
1.7.9.5



