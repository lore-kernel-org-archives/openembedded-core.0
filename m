Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkzT-0004x6-5x
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 03:13:47 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q18wrx008212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:08:58 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q18wWL003206
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:08:58 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q18wLK004770
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 20:08:58 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 20:08:58 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q18v6t017576;	Thu, 25 Aug 2011 20:08:58 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:59:56 -0500
Message-ID: <1314320399-10801-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Jason Kridner <jdk@ti.com>, k-kooi@ti.com
Subject: [meta-ti PATCH 1/4] gedit: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 01:13:47 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
new file mode 100644
index 0000000..64ea644
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "GNOME editor"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2+"
+
+DEPENDS = "enchant gconf gnome-common gnome-doc-utils-native glib-2.0 gtk+ gtksourceview2 iso-codes virtual/gettext"
+RDEPENDS_${PN} += " gtksourceview2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PR = "r2"
+
+inherit gnome
+SRC_URI[archive.md5sum] = "aebd49797406fdde7b25624b71990860"
+SRC_URI[archive.sha256sum] = "37598473372aab217e46f19726cff616ff0ea4121bbdbb170b4e264a4ca76690"
+
+EXTRA_OECONF = "--disable-scrollkeeper"
+
+do_configure_prepend () {
+	cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
+}
+
+FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
+FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
+
-- 
1.7.0.4



