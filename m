Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R13pu-0000WB-SD
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 00:09:43 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86M4eRC031147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4eFk003183
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4e8U014727
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Tue, 6 Sep 2011
	17:04:40 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86M4cHK013829;	Tue, 6 Sep 2011 17:04:40 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 16:54:09 -0500
Message-ID: <1315346049-8611-9-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
References: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v2 meta-oe 8/8] xpext: Imported from OE classic
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
X-List-Received-Date: Tue, 06 Sep 2011 22:09:44 -0000
Content-Type: text/plain

Dropped PR

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-multimedia/xpext/xpext/auxdir.patch    |   13 +++++++++++
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |   22 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
 create mode 100644 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb

diff --git a/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
new file mode 100644
index 0000000..da5841a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
@@ -0,0 +1,13 @@
+--- configure.ac.old	2005-06-03 12:53:28.000000000 +0200
++++ configure.ac	2005-06-03 12:54:29.000000000 +0200
+@@ -25,9 +25,9 @@
+ 
+ AC_PREREQ([2.57])
+ AC_INIT([spext], [1.0], [lauri.leukkunen@nokia.com], spext)
++AC_CONFIG_AUX_DIR(.)
+ AM_INIT_AUTOMAKE([dist-bzip2])
+ AM_MAINTAINER_MODE
+-AC_CONFIG_AUX_DIR(.)
+ 
+ dnl PKG_CHECK_MODULES(FIXESEXT, fixesext)
+ 
diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
new file mode 100644
index 0000000..c53f845
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -0,0 +1,22 @@
+LICENSE= "MIT"
+DESCRIPTION = "X Server Nokia 770 extensions library"
+SECTION = "x11/libs"
+PRIORITY = "optional"
+DEPENDS = "virtual/libx11 libxext"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=db043791349ba57ad1169e1c92477cb6"
+
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${PN}/${PN}_${PV}.tar.gz \
+           file://auxdir.patch;striplevel=0"
+S = "${WORKDIR}/xpext-1.0"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+  cd ${S}
+  chmod +x ./autogen.sh
+  ./autogen.sh
+}
+
+SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
+SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
-- 
1.7.0.4



