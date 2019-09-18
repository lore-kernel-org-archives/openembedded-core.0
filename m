Return-Path: <daniel.ammann@bytesatwork.ch>
X-Greylist: delayed 556 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Sep 2019 11:21:44 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id D8DB8901C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:21:44 +0000 (UTC)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net
	[83.150.40.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: daniel)
	by bytesatwork.ch (Postfix) with ESMTPSA id 9AA59101C022B;
	Wed, 18 Sep 2019 13:12:26 +0200 (CEST)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 13:12:25 +0200
Message-Id: <20190918111225.29068-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dhex: Add new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 11:21:45 -0000

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/recipes-support/dhex/dhex_0.69.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/dhex/dhex_0.69.bb

diff --git a/meta/recipes-support/dhex/dhex_0.69.bb b/meta/recipes-support/dhex/dhex_0.69.bb
new file mode 100644
index 0000000000..cfbb2caaf6
--- /dev/null
+++ b/meta/recipes-support/dhex/dhex_0.69.bb
@@ -0,0 +1,24 @@
+SUMMARY = "dhex is a hex editor that includes a diff mode"
+SECTION = "console/utils"
+
+DEPENDS = "ncurses"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://README.txt;beginline=229;endline=241;md5=6f252a421b65bcecf624382ba3c899da"
+
+SRC_URI = "http://www.dettus.net/dhex/dhex_0.69.tar.gz"
+SRC_URI[md5sum] = "64d557437fe110c19f23ed3e9bbcdd54"
+SRC_URI[sha256sum] = "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0804eb8246ea6c41b"
+
+S = "${WORKDIR}/dhex_${PV}"
+
+EXTRA_OEMAKE += "'CC=${CC}' 'LDFLAGS=${LDFLAGS}' 'CPPFLAGS=${CPPFLAGS}'"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -m 0755 -d ${D}${bindir}
+	install -m 0755 ${S}/dhex ${D}${bindir}/
+}
-- 
2.11.0


