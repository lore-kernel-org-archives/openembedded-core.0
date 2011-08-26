Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUo-0003nu-6G
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:06 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bH6T017774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0bHej008793
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bG7p001503
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:16 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFaw011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:23 -0500
Message-ID: <1314318504-9524-9-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Subject: [PATCH meta-oe 8/9] xsp: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:06 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-multimedia/xsp/xsp/xsp-fix-pc.patch    |   10 ++++++++++
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |   15 +++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
 create mode 100644 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb

diff --git a/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
new file mode 100644
index 0000000..18bc67c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
@@ -0,0 +1,10 @@
+--- Xsp/xsp.pc.in~	2009-01-07 13:06:07.000000000 +0100
++++ Xsp/xsp.pc.in	2009-01-07 13:06:07.000000000 +0100
+@@ -6,5 +6,5 @@
+ Name: Xsp
+ Description: X Sputnik Library
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${includedir}  @XSP_CFLAGS@ @X_CFLAGS@
+-Libs: -L${libdir} -lXsp @XSP_LIBS@ @X_LIBS@
++Cflags: -I${includedir}
++Libs: -L${libdir} -lXsp -lX11
diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
new file mode 100644
index 0000000..2bc3e83
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -0,0 +1,15 @@
+PR = "r2"
+LICENSE= "MIT"
+DESCRIPTION = "X Server Nokia 770 extensions library"
+SECTION = "x11/libs"
+PRIORITY = "optional"
+DEPENDS = "virtual/libx11 libxext xpext"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea2bda168c508c7cd8afa567b2fcc549"
+SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${PN}_${PV}.tar.gz \
+           file://xsp-fix-pc.patch"
+S = "${WORKDIR}/Xsp"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
+SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
-- 
1.7.0.4



