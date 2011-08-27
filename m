Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QxBdG-0004AC-AN
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 07:40:38 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7R5Zm1D013521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R5ZmHV022280
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7R5ZmY7002249
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:35:48 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sat, 27 Aug 2011 00:35:47 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7R5Zgom019032;	Sat, 27 Aug 2011 00:35:48 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Aug 2011 00:26:21 -0500
Message-ID: <1314422782-11863-4-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314422782-11863-1-git-send-email-joelagnel@ti.com>
References: <1314422782-11863-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: k-kooi@ti.com
Subject: [PATCH v3 meta-oe 3/4] libgnomecups: Imported from OE Classic
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
X-List-Received-Date: Sat, 27 Aug 2011 05:40:38 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
new file mode 100644
index 0000000..3f3ece1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION="Gnome Cups Manager"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PR ="r0"
+
+DEPENDS="glib-2.0 gtk+ pango cups intltool libgnomeui"
+
+inherit gnome pkgconfig
+
+do_compile_append () {
+	cp libgnomecups-1.0.pc libgnomecups-1.0.pc.old
+	sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
+}
+
+SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
+SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
-- 
1.7.0.4



