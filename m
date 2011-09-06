Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R13pu-0000W9-OE
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 00:09:43 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86M4eOU002294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4ehn003182
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4ead014728
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Tue, 6 Sep 2011
	17:04:40 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86M4cHJ013829;	Tue, 6 Sep 2011 17:04:40 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 16:54:08 -0500
Message-ID: <1315346049-8611-8-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
References: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v2 meta-oe 7/8] xsp: Imported from OE classic
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

Dropped PR=r* and PRIORITY=optional

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-multimedia/xsp/xsp/xsp-fix-pc.patch    |   10 ++++++++++
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |   13 +++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
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
index 0000000..35f3ce6
--- /dev/null
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -0,0 +1,13 @@
+LICENSE= "MIT"
+DESCRIPTION = "X Server Nokia 770 extensions library"
+SECTION = "x11/libs"
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



