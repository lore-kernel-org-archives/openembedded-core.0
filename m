Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1Qx9ky-00071d-CC
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 05:40:31 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7R3ZXBS020642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:33 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7R3ZXEW014334
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:33 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R3ZWp2007180
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 22:35:33 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 26 Aug 2011 22:35:32 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7R3ZNoZ000410;	Fri, 26 Aug 2011 22:35:32 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Aug 2011 22:26:20 -0500
Message-ID: <1314415580-21925-5-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314415580-21925-1-git-send-email-joelagnel@ti.com>
References: <1314415580-21925-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: k-kooi@ti.com
Subject: [PATCH v2 meta-oe 4/4] libgnomeprint: Imported from OE classic
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
X-List-Received-Date: Sat, 27 Aug 2011 03:40:32 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
new file mode 100644
index 0000000..13864e6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
@@ -0,0 +1,17 @@
+LICENSE = "GPL"
+SECTION = "x11/gnome/libs"
+
+DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common"
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit pkgconfig gnome
+
+SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3"
+SRC_URI[archive.sha256sum] = "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
+
+FILES_${PN}-dbg += "${libdir}/libgnomeprint/${PV}/modules/transports/.debug \
+		    ${libdir}/libgnomeprint/${PV}/modules/.debug  ${libdir}/libgnomeprint/${PV}/modules/*/.debug"
+
-- 
1.7.0.4



