Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R12gV-0006t4-F2
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 22:55:56 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86KosFr026321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:54 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p86Korg7010248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:53 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86Kortk006198
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 15:50:53 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Tue, 6 Sep 2011
	15:50:53 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86KoqMi031102;	Tue, 6 Sep 2011 15:50:53 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 15:40:31 -0500
Message-ID: <1315341632-32153-4-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1315341632-32153-1-git-send-email-joelagnel@ti.com>
References: <1315341632-32153-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v4 meta-oe 3/4] libgnomecups: Imported from OE Classic
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
X-List-Received-Date: Tue, 06 Sep 2011 20:55:56 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
new file mode 100644
index 0000000..c932ba0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -0,0 +1,15 @@
+DESCRIPTION="Gnome Cups Manager"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
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



